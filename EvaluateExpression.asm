// Compute z = 17 + x - 3y
// Input:  R0 = x, R1 = y
// Output: R2 = z
// R0 and R1 must not be modified.

@R1
D=M
@TEMP
M=D            // TEMP = y

@R1
D=M
D=D+M          // D = 2y
@TEMP
D=D+M          // D = 3y
@THREEY
M=D

@17
D=A            // D = 17
@R0
D=D+M          // D = 17 + x
@THREEY
D=D-M          // D = 17 + x - 3y

@R2
M=D

(END)
@END
0;JMP