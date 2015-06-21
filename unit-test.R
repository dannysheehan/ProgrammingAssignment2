#!/usr/bin/env Rscript
source("cachematrix.R")

print("")
print("TEST Matrix")
a <- matrix(c(1,0,5,2,1,6,3,4,0), 3, 3)
print(a)

print("")
print("expected INVERSE Matrix")
s <- matrix(c(-24,20,-5,18,-15,4,5,-4,1), 3, 3)
print(s)

print("")
print("TEST1: create special matrix")
sm <- makeCacheMatrix(a)
print(sm$get())

print("")
print("TEST2: solve the inverse of matrix")
cs = cacheSolve(sm)
print(cs)

print("")
print("TEST3: call 2nd time")
cs = cacheSolve(sm)
print(cs)

print("")
print("TEST4: call 3rd time")
cs = cacheSolve(sm)


print("TEST5: new matrix")
a <- matrix(c(1,0,5,2,1,6,3,4,0), 3, 3)
sm <- makeCacheMatrix(a)
print(sm$get())

print("")
print("TEST6: solve the inverse of matrix")
cs = cacheSolve(sm)
print(cs)
