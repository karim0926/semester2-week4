// Sum all elements of an array.
// Input:  R0 = address of first element
//         R1 = number of elements
// Output: R2 = sum of array elements
// If R1 <= 0, set R2 = 0
// R0 and R1 must not be modified.

@R1
D=M
@ZERO_RESULT
D;JLE

@R0
D=M
@PTR
M=D

@R1
D=M
@COUNT
M=D

@SUM
M=0

(LOOP)
@COUNT
D=M
@END_SUM
D;JLE

@PTR
A=M
D=M
@SUM
M=D+M

@PTR
M=M+1

@COUNT
M=M-1

@LOOP
0;JMP

(ZERO_RESULT)
@R2
M=0
@END
0;JMP

(END_SUM)
@SUM
D=M
@R2
M=D

(END)
@END
0;JMP