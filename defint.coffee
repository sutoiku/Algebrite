# definite integral



#define F p2
#define X p3
#define A p4
#define B p5

Eval_defint = ->
	push(cadr(p1))
	Eval()
	p2 = pop() # p2 is F

	p1 = cddr(p1)

	# defint can handle multiple
	# integrals, so we loop over the
	# multiple integrals here
	while (iscons(p1))

		push(car(p1))
		p1 = cdr(p1)
		Eval()
		p3 = pop() # p3 is X

		push(car(p1))
		p1 = cdr(p1)
		Eval()
		p4 = pop() # p4 is A

		push(car(p1))
		p1 = cdr(p1)
		Eval()
		p5 = pop() # p5 is B

		# obtain the primitive of F against the
		# specified variable X
		# note that the primitive changes over
		# the calculation of the multiple
		# integrals.
		push(p2)
		push(p3)
		integral()
		p2 = pop() # contains the antiderivative of F

		# evaluate the integral in A
		push(p2)
		push(p3)
		push(p5)
		subst()
		Eval()

		# evaluate the integral in B
		push(p2)
		push(p3)
		push(p4)
		subst()
		Eval()

		# integral between B and A is the
		# subtraction. Note that this could
		# be a number but also a function.
		# and we might have to integrate this
		# number/function again doing the while
		# loop again if this is a multiple
		# integral.
		subtract()
		p2 = pop()

	push(p2)


test_defint = ->
	run_test [
		"defint(x^2,y,0,sqrt(1-x^2),x,-1,1)",
		"1/8*pi",

		# from the eigenmath manual

		"z=2",
		"",

		"P=(x,y,z)",
		"",

		"a=abs(cross(d(P,x),d(P,y)))",
		"",

		"defint(a,y,-sqrt(1-x^2),sqrt(1-x^2),x,-1,1)",
		"pi",

		# from the eigenmath manual

		"z=x^2+2y",
		"",

		"P=(x,y,z)",
		"",

		"a=abs(cross(d(P,x),d(P,y)))",
		"",

		"defint(a,x,0,1,y,0,1)",
		"3/2+5/8*log(5)",

		# from the eigenmath manual

		"x=u*cos(v)",
		"",

		"y=u*sin(v)",
		"",

		"z=v",
		"",

		"S=(x,y,z)",
		"",

		"a=abs(cross(d(S,u),d(S,v)))",
		"",

		"defint(a,u,0,1,v,0,3pi)",
		"3/2*pi*log(1+2^(1/2))+3*pi/(2^(1/2))",
	]