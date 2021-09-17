## The function makeCacheMatrix returns a matrix like object which can hold
## a cached value for its inverse. This value can be cached (if necessary) and
## returned by cacheSolve 

## Description:
## makeCacheMatrix takes a matrix as an input and returns a matrix-like object
## with a slot to store its inverse. Getters and setters for both the matrix
## value and its inverse are provided.
##
## Usage:
## makeCacheMatrix(x) returns a named list of functions:
## - set(y) sets the value of x to y
## - get() returns the value of x
## - set_inv(inv) sets value for the inverse of the matrix
## - get_inv() returns the (cached) value for the inverse or NULL if not
##   cached yet

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    get_inv <- function() inv
    set_inv <- function(val) inv <<- val
    list(set = set, get = get, set_inv = set_inv, get_inv = get_inv)
}


## Description:
## cacheSolve returns the inverse of a matrix from cache. If the value was not
## cached yet, it will calculate and save the inverse of the matrix to cache.
##
## Usage:
## cacheSolve(x), where x is a matrix like object as defined in makeCacheMatrix.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$get_inv()
    if (!is.null(inv)) {
        print("retrieving cached data")
        return(inv)
    }
    m <- x$get()
    inv <- solve(m)
    x$set_inv(inv, ...)
    inv
}
