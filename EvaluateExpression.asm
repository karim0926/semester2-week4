// Evaluate z = 17 + x - 3y
// Input:  R0 = x, R1 = y
// Output: R2 = z
// R0 and R1 must not be modified.

@R1
D=M
@Y
M=D

@Y
D=M
@Y2
M=D+M          // Y2 = 2y

@Y2
D=M
@Y
D=D+M          // D = 3y

@THREEY
M=D

@17
D=A

@R0
D=D+M          // D = 17 + x

@THREEY
D=D-M          // D = 17 + x - 3y

@R2
M=D

(END)
@END
0;JMP