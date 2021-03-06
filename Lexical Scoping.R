## makeCasheMatrix function to make a matrix object with some function inside
makeCasheMatrix <- function(x = matrix())
{
    inv <- NULL
    set <- function(y)
    {
        x <<- y
        inv <<- NULL
    }
    get <- function(){x}
    setInverse <- function(inverse){inv <<- inverse}
    getInverse <- function(){inv}
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}
## casheSolve function to get inverse of matrix if stored or calculate if null
casheSolve <- function(x, ...)
{
    inv <- x$getInverse()
    if(!is.null(inv))
    {
        message("getting cashed data")
        return(inv)
    }
    mat <- x$get()
    inv <- solve(mat, ...)
    x$setInverse(inv)
    inv
}
