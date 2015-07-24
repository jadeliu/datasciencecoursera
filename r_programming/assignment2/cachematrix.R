## These functions are used to create a special object that stores a matrix 
## and cache's its inverse.

## The first function, makeCacheMatrix creates a special "matrix" and cache
## its inverse. There are four functions contained in the "matrix":
## 1) set the value of the matrix
## 2) get the value of the matrix
## 3) set the value of the inverse
## 4) get the value of the inverse

makeCacheMatrix <- function(x = matrix()){
    inv <- NULL
    
    set <- fuction(a){
        x <<- a
        inv <<- NULL
    }
    
    get <- function() x

    setinv <- function(z) inv <<- z
    
    getinv <- function() inv
    
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

## The second function, cacheSolve computes the inverse of the special "matrix"
## returned by makeCacheMatrix. If the inverse has already been calculated (and
## the matrix has not changed), then the cacheSolve should retrieve the inverse
## from the cache.

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    
    # if the inverse has already been cached, return it
    if(!is.null(inv)) {
        message("getting cached inverse")
        return(inv)
    }
    
    # otherwise, calculate it and cache it, then return it
    matrix <- x$get()
    inv <- solve(matrix, ...)
    x$setinv(inv)
    inv
}