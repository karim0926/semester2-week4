// Compute element-wise XNOR of R0 and R1.
// Input:  R0 = x, R1 = y
// Output: R2 = x XNOR y
// R0 and R1 must not be modified.
//
// x XNOR y = (x & y) | (!x & !y)

@R0
D=M
@R1
D=D&M
@PART1
M=D            // PART1 = x & y

@R0
D=M
D=!D
@NOTX
M=D

@R1
D=M
D=!D
@NOTY
M=D

@NOTX
D=M
@NOTY
D=D&M
@PART2
M=D            // PART2 = !x & !y

@PART1
D=M
@PART2
D=D|M

@R2
M=D

(END)
@END
0;JMP