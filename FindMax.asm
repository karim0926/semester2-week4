// Compute the maximum of two numbers.
// Input:  R0, R1
// Output: R2 = max(R0, R1)
//         R3 = 0 if R0 >= R1, else 1
// R0 and R1 must not be modified.

@R0
D=M
@R1
D=D-M
@R1_IS_BIGGER
D;JLT

// R0 >= R1
@R0
D=M
@R2
M=D
@R3
M=0
@END
0;JMP

(R1_IS_BIGGER)
@R1
D=M
@R2
M=D
@R3
M=1

(END)
@END
0;JMP