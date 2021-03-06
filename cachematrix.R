## This file has two functions to cache inverse of a matrix

## Function to create a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
 inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Function to compute the inverse of the special "matrix".

cacheSolve <- function(x,...) {
        ## Return a matrix that is the inverse of 'x'
 inv <- x$getInverse()
	if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data,...)
  x$setInverse(inv)
  inv      
}
