## The following functions help with the caching of the inverse
## of a matrix. This is typically a slow operation for a large
## matrix. If the contents of the matrix are not changing it
## makes sence to cache the inverse, so that it can be used
## again if needed.

## creates a special "Matrix" object that stores the matrix and
## caches its inverse.
makeCacheMatrix <- function(x = matrix()) {
    set <- function(y) {
    }
    get <- function(y) {
    }
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i

    list(set = set, get = get, 
         getinverse = getinverse, getmean = getmean)
}


## returns the inverse matrix of the special "Matrix" but 
## caches the result for subsequent calls.
cacheSolve <- function(x, ...) {
    i <- x$getinvers()
    if(!is.null(i)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    i <- solve(x, ...)
    x$setinvers(i)
    i
}

# Test Case
#> a <- matrix(c(1,2,3,0,1,4,5,6,0), 3, 3)
#> a
#     [,1] [,2] [,3]
#[1,]    1    0    5
#[2,]    2    1    6
#[3,]    3    4    0
#> s <- solve(a)
#> s
#     [,1] [,2] [,3]
#[1,]  -24   20   -5
#[2,]   18  -15    4
#[3,]    5   -4    1
