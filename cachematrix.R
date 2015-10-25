makeCacheMatrix <- function(m = matrix()) {
  # Creates a "matrix" object that can cache its inverse.
  # Args:
  #   m: an invertible matrix
  # Returns:
  #   A list containing functions to set, get the matrix and to set, get the
  #   inverse of the matrix.
  i <- NULL
  set <- function(newM) {
    m <<- newM
    i <<- NULL
  }
  get <- function() m
  setInverse <- function(inverse) i <<- inverse
  getInverse <- function() i
  output <- list(set = set, get = get, setInverse = setInverse,
  							 getInverse = getInverse)
  return(output)
}


cacheSolve <- function(inputM, ...) {
  # Calculate the inverse of input matrix.
  # Args:
  #   inputM: an invertible cached matrix list object (see makeCacheMatrix)
  #   ...: arguments passed to the 'solve' function for matrix inversion
  # Returns:
  #   The inverse matrix.
  i <- inputM$getInverse()
  if(!is.null(i)) {  # inverse matrix has already been calculated
    message("getting cached data")
  } else {
	  data <- inputM$get()
	  i <- solve(data, ...)
	  inputM$setInverse(i)
	}
  return(i)
}
