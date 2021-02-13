# open an Rmd or other template in an editor from the fetchData() site
fetchRmd <- function(name) {
  fetchAddress="http://www.mosaic-web.org/go/datasets/"
  fullname = paste(fetchAddress,name,sep="")
  tmpName = tempfile(pattern=paste(basename(name),"-",sep=""),fileext=".txt",tmpdir=getwd())
  download.file(fullname,tmpName)
  file.edit(tmpName)
  Sys.sleep(2)
  on.exit(file.remove(tmpName))
}