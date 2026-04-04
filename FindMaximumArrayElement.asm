// Find maximum element in an array.
// Input:  R0 = address of first element
//         R1 = number of elements
// Output: R2 = maximum element
// If R1 <= 0, set R2 = 0
// R0 and R1 must not be modified.

@R1
D=M
@ZERO_RESULT
D;JLE

// PTR = address of first element
@R0
D=M
@PTR
M=D

// MAX = array[0]
@PTR
A=M
D=M
@MAX
M=D

// COUNT = R1 - 1
@R1
D=M
D=D-1
@COUNT
M=D

(LOOP)
@COUNT
D=M
@END_MAX
D;JLE

// PTR++
@PTR
M=M+1

// if *PTR > MAX then MAX = *PTR
@PTR
A=M
D=M
@CURRENT
M=D

@CURRENT
D=M
@MAX
D=D-M
@SKIP_UPDATE
D;JLE

@CURRENT
D=M
@MAX
M=D

(SKIP_UPDATE)
@COUNT
M=M-1
@LOOP
0;JMP

(ZERO_RESULT)
@R2
M=0
@END
0;JMP

(END_MAX)
@MAX
D=M
@R2
M=D

(END)
@END
0;JMP