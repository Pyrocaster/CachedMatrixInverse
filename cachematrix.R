 ## Functions that create and enable a 'special' cached matrix - an object stored in the global environment,
 ## that wraps around a matrix and can be accessed via access methods.
 ## Inverse of matrix encapsulated in the 'special' cached matrix object, can be retrieved using the cache solve method
 
 
 ## Wrapper that stores matrix and it's inverse in the global environment
 ## returns a list of set, get, setInverse and getInverse
 makeCacheMatrix <- function(x = matrix()) { 
	inverse <- NULL

	set <- function(y){
		 x <<- y
		 inverse <<- NULL
	}
	get <- function() {
		x
	}
        setInverse <- function(m_inv){
		inverse <<- m_inv
	}
	getInverse <- function(){
		inverse
        }

       list(set, get, setInverse, getInverse)
 } 


 
 ## get the inverse of a 'cache matrix' from global env; if the inverse is not in global env, compute store and return value
 cacheSolve <- function(x, ...) { 
        ## Return a matrix that is the inverse of 'x' 
        storedInverse <- x$getInverse()
		if(!is.null(inverse)){
			print("getting cached matrix")
			return (storedInverse)
		}
			m <- x$get()
			m_inv <- ginv(m)
			x$setInverse(m)
			m_inv		
} 

