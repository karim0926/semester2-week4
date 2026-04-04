// Compute z = 17 + x - 3y
// Input:  R0 = x, R1 = y
// Output: R2 = z
// R0 and R1 must not be modified.

@17
D=A
@R0
D=D+M
@R2
M=D

@R1
D=M
@R2
M=M-D

@R1
D=M
@R2
M=M-D

@R1
D=M
@R2
M=M-D

(END)
@END
0;JMP