// Compute z = sum_{i=0}^{n} 2*i
// Input:  R0 = n
// Output: R1 = z
// Special cases:
//   if n < 0  => R1 = -1
//   if overflow => R1 = -2
// R0 must not be modified.

@R0
D=M
@NEGATIVE_INPUT
D;JLT

@SUM
M=0
@I
M=0
@CURRENT_EVEN
M=0

(LOOP)
@I
D=M
@R0
D=D-M
@DO_ADD
D;JLE
@END_SUCCESS
0;JMP

(DO_ADD)
@SUM
D=M
@CURRENT_EVEN
D=D+M
@SUM
M=D

// Since all added values are non-negative, a negative sum means overflow.
@SUM
D=M
@OVERFLOW
D;JLT

@CURRENT_EVEN
M=M+1
M=M+1          // CURRENT_EVEN += 2

@I
M=M+1

@LOOP
0;JMP

(NEGATIVE_INPUT)
@1
D=A
D=-D
@R1
M=D
@END
0;JMP

(OVERFLOW)
@2
D=A
D=-D
@R1
M=D
@END
0;JMP

(END_SUCCESS)
@SUM
D=M
@R1
M=D

(END)
@END
0;JMP