## Put comments here that give an overall description of what your
## functions do

## This function creates a special vector, which is 
## really a list containgin a function to
##1. set the value of the matrix
##2. get the value of the matrix
##3. set tje value of the inverse
##4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    m<-NULL
    set<- function(y){
      x<<-y
      m<<-NULL
    }
    get<- function()x
    setinverse <- function(inverse) m<<-inverse 
    getinverse <- function() m
    list(set=set,get,get,setinverse=setinverse,getinverse=getinverse)
}


## Calculates the inverse of the special vector created with the above funcrion

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        
        if(!is.null(m)){
          message("getting cached data")
          return(m)
          
          data<-x$get()
          m<- solve(data)
          x$setinverse(m)
          m
        }
}
