## [makeCacheMatrix will define 4 functions: get, set, setinverse & getinverse]
+## Get and Set will allow you to retrieve and define values within makeCacheMatrix
  +## functions do
  +
  +## makeCacheMatrix will rely on a function where the only argument is a matrix called x
  
  makeCacheMatrix <- function(x = matrix()) {
    invert <- NULL
    set <- function(y) {
      x <<- y
      invert <<- NULL  
      # Defining invert here will default this value instead of the one defined in the parent env.
      
    }
    get <- function() x
    setinverse <- function(inverse) invert <<- inverse
    getinverse <- function() invert
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse) 
  }
  
  
  
  +## cacheSolve will rely on the makeCacheMatrix function to solve its final values
    +
    cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
      invert <- x$getinverse()
      if(!is.null(invert)) {
        message("getting cached data")
        return(invert)
      }
      matr <- x$get()
      invert <- solve(matr, ...)
      x$setinverse(invert)
      invert
    }


