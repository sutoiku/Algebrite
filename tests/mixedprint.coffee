test_mixedprint = ->
	run_test [

		"1.0",
		"1.0",

		"print(\"hello\")",
		"\"hello\"",

		"-sqrt(2)/2",
		"-1/2*2^(1/2)",

		"printplain",
		"-1/2 2^(1/2)",

		"printfull",
		"-1/2*2^(1/2)",

		"printlatex",
		"-\\frac{1}{2}\\sqrt{2}",

		"printlist",
		"(multiply -1/2 (power 2 1/2))",

		"printlist(a+b)\nprintlist(c+d)",
		"(add a b)(add c d)",

		"print2dascii",
		"   1   1/2\n- --- 2\n   2",

		"last2dasciiprint",
		"\"   1   1/2\n- --- 2\n   2\"",

		# checks that no extra newlines are
		# inserted
		"x=0\ny=2\nfor(k,1,9,x=sqrt(2+x),y=2*y/x)\nfloat(y)",
		"3.14159",

		"x=0\ny=2\nfor(k,1,2,x=sqrt(2+x),y=2*y/x,printfull(y))",
		"2*2^(1/2)4*2^(1/2)/((2+2^(1/2))^(1/2))",

		"clearall",
		"",

		"print2dascii([[a,b],[c,d]])",
		"a   b\n\nc   d",

		"print2dascii(1/sqrt(-15))",
		"        1/2\n    (-1)\n- -----------\n    1/2  1/2\n   3    5",

		"print2dascii(x^(1/a))",
		" 1/a\nx",

		"print2dascii(x^(a/b))",
		" a/b\nx",

		"print2dascii(x^(a/2))",
		" 1/2 a\nx",

		"print2dascii(x^(1/(a+b)))",
		" 1/(a + b)\nx",

	]
