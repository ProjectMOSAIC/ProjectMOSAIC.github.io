# replicate a categorical value 
# example: repLevels( a=1:3, b=1:5)

repLevels <- function(...) {
  vals <- list(...)
  nms <- names(vals)
  res <- data.frame(NULL)
  for (k in 1:length(vals)) {
    one = data.frame(val=vals[[k]],group=nms[k])
    res <- rbind(res, one)
  }
  return(res)
}

# create a function turning a factor into a value
factorFun <- function(...) {
  dots <- list(...,..=NA)
  nm <- names(dots)
  f <- function(x) {
    y <- x <- as.character(x)
    y[!(x %in% nm)] <- ".."
    r <- unlist(dots[y])
    names(r) <- x
    return(r)
  }
  return(f)
}