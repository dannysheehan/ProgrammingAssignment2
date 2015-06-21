## The following functions help with the caching of the inverse
## of a matrix. This is typically a slow operation for a large
## matrix. If the contents of the matrix are not changing it
## makes sence to cache the inverse, so that it can be used
## again if needed.

## creates a special "Matrix" object that stores the matrix and
## caches its inverse.
makeCacheMatrix <- function(x = matrix()) {
    i = NULL

    set <- function(y) {
        x <<- y
        m <<- NULL
    }

    get <- function(y) x

    setinverse <- function(inverse) i <<- inverse

    getinverse <- function() i

    list(set = set, get = get, 
         setinverse = setinverse, getinverse = getinverse)
}


## returns the inverse matrix of the special "Matrix" but 
## caches the result for subsequent calls.
cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    i
}

