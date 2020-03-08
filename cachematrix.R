makeCacheMatrix <- function( y = matrix() ) {

	## Initialize the inverse property
    a <- NULL

    ##  set the matrix
    set <- function( matrix ) {
            y <<- matrix
            a <<- NULL
    }

    ##  get the matrix
    get <- function() {
    	## Return the matrix
    	m
    }

    ##  set the inverse of the matrix
    setInverse <- function(inverse) {
        a <<- inverse
    }

    ## Method to get the inverse of the matrix
    getInverse <- function() {
        ## Return the inverse property
        a
    }

    ## Return a list of the methods
    list(set = set, 
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


##  computes the inverse of the special "matrix" returned by makeCacheMatrix above
cacheSolve <- function(x, ...) {

    y <- x$getInverse()
 
    if( !is.null(y) ) {
            message("getting cached data")
            return(y)
    }

    data <- x$get()

    ## Calculate the inverse using matrix multiplication
    y <- solve(data) %*% data

    x$setInverse(y)

    y
}
