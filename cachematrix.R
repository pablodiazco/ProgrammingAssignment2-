## I have generated 2 funtions that firstly generates a matrix that 
## can cache its inverse and secondly will calculate the inverse if
##there has been any change. If no change has been made, the result
## will be the inverse from the cache.


## This function generates a matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
i <- NULL
set <- function(y) {
		x <<- y
		i <<- NULL
}
get <- function() x
setinverse <- function(inverse) i <<- inverse
getinverse <- function() i
list(set =set,
	get = get,
	setinverse = setinverse,
	getinverse = getinverse) 
}


## This function will calculte the inverse of the matrix which has been returned from makeCacheMatrix function.

cacheSolve <- function(x, ...) {
	i <- x$getinverse()
	if (!is.null(i))
	message("retrieving cache data")
	return(i)
	}
	data <- x$get()
	i <- solve(data, ...)
	x$setinverse(i)
	i
}
