
##The first function, makeCacheMatrix creates a special "vector", which is really a list containing a function to

##set the value of the vector

##get the value of the vector

##set the value of the solve

##get the value of the solve


makeCacheMatrix <- function(x = matrix()) {
  i<-NULL
  set<- function(y){
    i<<-NULL
    x<<-y
  }
  get<- function() x
  setInverse<-function(solve) i<<-solve
  getInverse<-function() i
  list(set=set, get=get,
       setInverse=setInverse,
       getInverse=getInverse)
}


##This part makes a matrix of the vector and inverts it. 


cacheSolve <- function(x, ...) {
  i<-x$getInverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  data<-matrix(data, nrow=(length(data)^0.5), ncol=(length(data)^0.5))
  i<-solve(data, ...)
  x$setInverse(i)
  i
}
