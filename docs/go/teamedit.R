#' Support for Simultaneous Collaborative Editing
#' 
teamEdit <- function(group="mosaic-web",project,doc) {
  if( !require(RCurl) ) stop("Must install 'RCurl' package.")
  if (missing(doc)||missing(project))
    stop("Must specify both project and document name as 'project' and 'doc' arguments.")
  docURL <- paste('https://',group,
                  '.firebaseio.com/',project,'/',
                  doc,'/first/.json?pretty=TRUE',sep='')
  f = function(what=c("source","edit","clipboard"),local=FALSE,...) {
    # Read in the contents of the collaborative editor
    content <- getURL(docURL)
    # Get rid of the opening and closing quotes
    content <- substr(content,2,nchar(content)-1)
    content <- gsub("\\\\n", "\n", content) # Should be restricted to being outside of quotes
    what <- match.arg(what) # what to do
    switch(what,
           source = {if(local) eval(parse(text=content), ...)
             else eval(parse(text=content),envir=globalenv(),...) },
           clipboard = {cat(content)},
           edit = {  tmpName = tempfile(pattern="teamedit-buffer-",fileext=".Rmd")
                     cat(content,file=tmpName)
                     file.edit(tmpName)}
           )
  }
  return(f)
}

    