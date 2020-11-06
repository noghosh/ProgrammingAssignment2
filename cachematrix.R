setwd('C:/Users/noghosh/Documents/Coursera-R')
##
## First set the input x as a matrix
## and then set the solved value "sv" as a null
## then change every reference to "mean" to "solve"
makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  sv <- NULL
  set <- function(y) {
    x <<- y
    sv <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) sv <<- solve
  getsolve <- function() sv
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
##
## Same here, changed "mean" to "solve" and "m" to "s"
cacheSolve <- function(x, ...) {
  sv <- x$getsolve()
  if(!is.null(sv)) {
    message("getting inversed matrix")
    return(sv)
  }
  data <- x$get()
  sv <- solve(data, ...)
  x$setsolve(sv)
  sv
}
