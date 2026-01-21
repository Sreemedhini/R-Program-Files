#Division of two numbers using functions:
div_numbers<-function(a,b)
{
  return(a/b)
}
result1<-div_numbers(5,10)
result2<-div_numbers(-3,7)
result3<-div_numbers(0,0)
result4<-div_numbers(3.5,2.1)

#print results
cat("Result of dividing 10 and 5 is",result1,"\n")
cat("Result of dividing 7 and -3 is",result2,"\n")
cat("Result of dividing 0 and 0 is",result3,"\n")
cat("Result of dividing 3.5 and 2.1 is",result4,"\n")