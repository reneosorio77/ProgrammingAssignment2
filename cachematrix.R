#The first function, makeVector creates a special "vector",
#which is really a list containing a function to
#1.set the value of the matrix
#2.get the value of the matrix
#3.set the value of the inverse
#4.get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
      m<-NULL
      set<-function(y){
            x<<-y
            m<<-NULL
      }
      get<-function()x
      setsolve<-function(solve)      m<<-solve
      getsolve<-function()m
      list(set=set,get=get,
           setSolve=setSolve,
           getSolve=getsolve)
      
}
#The following function calculates the inverse of the
#special "matrix" created with the above function.
#However, it first checks to see if the inverse has 
#already been calculated. If so, it gets the inverse
#from the cache and skips the computation.
#Otherwise, it calculates the inverse of the data
#and sets the value of the inverse in the cache via the setSolve function.



cacheSolve <- function(x, ...) {
        m<-x$getsolve()
        if(!is.null(m)){
              message("getting cached data")
              return(m)
        }
        data<-x$get()
        m<-solve(data,...)
        x$setSolve(m)
        m
        
        ## Return a matrix that is the inverse of 'x'
}
