// Compute y = x^2
// Input:  R0 = x
// Output: R1 = x^2
// R0 must not be modified.
//
// Uses repeated addition with |x|.

@R0
D=M
@ABS_READY
D;JGE

@R0
D=M
D=-D
@ABSX
M=D
@START
0;JMP

(ABS_READY)
@R0
D=M
@ABSX
M=D

(START)
@ABSX
D=M
@COUNT
M=D

@R1
M=0

(LOOP)
@COUNT
D=M
@END
D;JLE

@R1
D=M
@ABSX
D=D+M
@R1
M=D

@COUNT
M=M-1

@LOOP
0;JMP

(END)
@END
0;JMP