## cachematrix.R 
## The below is a pair of functions to cache and calculate the inverse of a matrix

## makeCacheMatrix: Create a matrix that can cache its inverse



makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(x) {
        x <<- y;
        inverse <<- NULL;
    }
    get <- function() return(x);
    setinv <- function(inv) inverse <<- inv;
    getinv <- function() return(inverse);
    return(list(set = set, get = get, setinv = setinv, getinv = getinv))
}




## cacheSolve: The following function computes the inverse of the special "matrix" returned by the function above. 
## If the inverse has already been calculated and no matrix has been changed,
## 'cacheSolve' should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
inverse <- x$getinv()
    if(!is.null(inverse)) {
        message("Getting cached data...")
        return(inverse)
    }
    data <- x$get()
    invserse <- solve(data, ...)
    x$setinv(inverse)
    return(inverse)
}
