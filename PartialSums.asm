// Compute partial sums of array x into array y.
// Input:  R0 = address of first element of x
//         R1 = address of first element of y
//         R2 = length n
// Output: y[i] = x[0] + x[1] + ... + x[i]
// Do not modify R0, R1, R2.
// If n <= 0, do nothing.

@R2
D=M
@END
D;JLE

@R0
D=M
@XPTR
M=D

@R1
D=M
@YPTR
M=D

@R2
D=M
@COUNT
M=D

@RUNSUM
M=0

(LOOP)
@COUNT
D=M
@END
D;JLE

// RUNSUM += *XPTR
@XPTR
A=M
D=M
@RUNSUM
M=D+M

// *YPTR = RUNSUM
@RUNSUM
D=M
@YPTR
A=M
M=D

// XPTR++
@XPTR
M=M+1

// YPTR++
@YPTR
M=M+1

// COUNT--
@COUNT
M=M-1

@LOOP
0;JMP

(END)
@END
0;JMP