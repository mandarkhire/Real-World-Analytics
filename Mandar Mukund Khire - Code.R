## SIT718 Real world Analytics
## Assessment Task 3 2022 T2
## Name: Mandar Khire
## Student ID: 

##### Solution for question 2 #####

library(lpSolveAPI)

lprec <- make.lp(16, 12) # 12 variables and 16 constraints

lp.control(lprec, sense= "maximize") #  can change sense to  "maximize/minimize"

set.objfn(lprec, c(2.396,	2.376,	2.416,	2.296,	1.892,	1.8772,	1.9172,	1.7972,	3.397,	3.377,	3.417,3.297)) # set objective function

set.row(lprec, 1, c(1,1,1), indices = c(1,5,9))
set.row(lprec, 2, c(1,1,1), indices = c(2,6,10))
set.row(lprec, 3, c(1,1,1), indices = c(3,7,11))
set.row(lprec, 4, c(1,1,1), indices =c(4,8,12))
set.row(lprec, 5, c(1, 1, 1, 1), indices =c(1,2,3,4))
set.row(lprec, 6, c(1, 1, 1, 1), indices =c(5,6,7,8))
set.row(lprec, 7, c(1, 1, 1, 1), indices =c(9,10,11, 12))
set.row(lprec, 8, c(1, -8), indices =c(1,2))
set.row(lprec, 9, c(1, -16), indices =c(1,3))
set.row(lprec, 10, c(1, -16), indices =c(1,4))
set.row(lprec, 11, c(1, -3.25), indices =c(5,6))
set.row(lprec, 12, c(1, -13), indices =c(5,7))
set.row(lprec, 13, c(1, -6.5), indices =c(5,8))
set.row(lprec, 14, c(1, -5), indices =c(9,10))
set.row(lprec, 15, c(1, -5), indices =c(9,11))
set.row(lprec, 16, c(1, -1.67), indices =c(9,12))


set.rhs (lprec,c(10000, 5000,2000,2000,1000, 700, 750,0,0,0,0,0,0,0,0,0))

set.type(lprec, c(1:12), "integer")

set.constr.type(lprec, c("<=","<=","<=","<=",">=",">=",">=","=","=","=","=","=","=","=","=","="))

set.bounds(lprec,lower = rep(0,12), upper = rep(Inf,12))

print (lprec)

solve(lprec)

objvalue<-get.objective(lprec)

print(objvalue)

solution<-get.variables(lprec)
solution<- matrix(solution, nrow = 3, ncol = 4,byrow = TRUE) # reshape the varible values

print (solution)
