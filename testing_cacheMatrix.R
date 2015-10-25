# Construct invertible matrix A. Code from solve help page.
hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
A <- hilbert(4)
A[] <- as.complex(A)
solve(A)

# Test our code.
setwd("~/dev/learning/coursera/ProgrammingAssignment2/")
source("cacheMatrix.R")
cacheM <- makeCacheMatrix(A)
print(cacheSolve(cacheM))  # calculate inverse
print(cacheSolve(cacheM))  # retrieve cache