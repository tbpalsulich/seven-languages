fib := method(
  a := 0
  b := 1
  for(i, 1, doMessage(call message argAt(0)) - 1, c := a + b; a := b; b := c)
)
rfib := method(n,
	if(n == 1 or n == 2, return 1)
	return rfib(n - 1) + rfib(n - 2)
)
 
fib(10) println
rfib(10) println