### A function that creates a "matrix" that catches its inverse

makeCacheMatrix <- function(x=matrix()){
  i <- NULL
  set <- function(y){ 
    x<<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i<<-inverse
  getinverse <- function() i
  list( set=set,
        get=get,
        setinverse=setinverse,
        getinverse=getinverse)
}
  

### A function that creates inverse of the computed "matrix"

cacheSolve <- function(x,...) {
        i<- x$getinverse ()
        if (!is.null(i)){
                message("Getting Cached Data")
                return(i)
                }
        data <- x$get()
        i<-solve(data,...)
        x$setinverse(i)
        i
        }

