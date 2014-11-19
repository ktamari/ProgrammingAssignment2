## These functions give an inverse of a given matrix

## The first funtion stores a given matrix in a local environment, and an inverse of the matrix 
# that is initially set as NULL, but later store a caluculated inverse matrix via the second function in the parent environment.
makeCacheMatrix <- function(x = matrix()) {
        mat = NULL
        set <- function(y){
                x <<- y
                mat <<- NULL
        }        
        get <- function(){x}
        setinversematrix <- function(solve){mat <<- solve}
        getinversematrix <- function(){mat}
        
        list(get=get, set=set,
             setinversematrix=setinversematrix,
             getinversematrix=getinversematrix
             )
}


## The second function either calculates the inverse of the matrix defined in  
#  the makeCacheMatrix or read the cached inverse matrix in the parent environment.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        mat <- x$getinversematrix()
        if(!is.null(mat)){
                message("getting cached data")
                return(mat)
        }
        data <- x$get()
        mat <- solve(data,...)
        x$setinversematrix(mat)
        mat
}
