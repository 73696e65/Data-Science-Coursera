## The following two functions compute and cache the inverse of a matrix.

## Example:
## m <- matrix(c(4,7,2,6), nrow=2, ncol=2)
## mm <- makeCacheMatrix(m)
## 
## > mm$get()
## [,1] [,2]
## [1,]    4    2
## [2,]    7    6
## 
## > cacheSolve(mm)
## [,1] [,2]
## [1,]  0.6 -0.2
## [2,] -0.7  0.4
## 
## > cacheSolve(mm)
## getting cached data
## [,1] [,2]
## [1,]  0.6 -0.2
## [2,] -0.7  0.4

## The function creates a special "matrix" object that can cache its inverse.
## It returns the list of four functions for further matrix manipulation.
makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() { x }
        setinverse <- function(inverse) { i <<- inverse }
        getinverse <- function() { i }
        
        list(   set = set,
                get = get,
                setinverse = setinverse,
                getinverse = getinverse
        )
}


## The function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), the cacheSolve retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if (!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
        ## Return a matrix that is the inverse of 'x'
}