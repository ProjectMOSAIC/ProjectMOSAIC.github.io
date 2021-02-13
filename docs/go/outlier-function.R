# A simple outlier function

outlier <- function(x, data=NULL,multiplier=1.5){
  x <- if(is.null(data)) x else eval(substitute(x),data)
  stats <- qdata(c(.25,.75), x, data=data)
  iqr = diff(stats)
  return((x > (stats[2] + multiplier*iqr)) | 
           (x < (stats[1] -multiplier*iqr)))
}