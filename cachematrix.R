## makeCacheMatrix is a function that stores a list of 
## functions

## function makeCacheMatrix stores some functions:
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y               # "super" assignment operator
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  
  #the following line stores the functions:
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
}

## cacheSolve verify the value m, stored previously 
## with getmean, If it exists in memory, it simply 
## returns a message and the value m, otherwise it
## calculates the inverse of 'x' created 

cacheSolve <- function(x, ...) {
    m <- x$getmean()
      if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
  data <- x$get()
  m <- solve(data, ...)
  x$setmean(m)
  m
}
