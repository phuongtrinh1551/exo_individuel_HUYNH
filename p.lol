HAI 1.3
OBTW
procedure iterative fibonacci (n: nonnegative integer)
if n = 0 then
	return 0
else
	x := 0
	y:= 1
	for i:=1 to n 1
		z:=x+y
		x := y
		y:= z
return y
{output is the n_th Fibonacci number}
TLDR

HOW IZ I iterativeFibonacci YR n
	BOTH SAEM n AN "0", O RLY?
		YA RLY
			FOUND YR 0
		NO WAI
			I HAS A x ITZ 0
			I HAS A y ITZ 1
			IM IN YR loop UPPIN YR i WILE BOTH SAEM BIGGR OF i AN DIFF OF n AN 2 AN DIFF OF n AN 2
				I HAS A z ITZ SUM OF x AN y
				x R y
				y R z
			IM OUTTA YR loop
			FOUND YR y 
	OIC
IF U SAY SO

I HAS A n ITZ A NUMBR
GIMMEH n
VISIBLE I IZ iterativeFibonacci YR n MKAY
KTHXBYE
