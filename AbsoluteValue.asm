// Compute z = |x|
// Input:  R0 = x
// Output: R1 = |x|
//         R2 = 1 if x is negative, else 0
//         R3 = 1 if |x| cannot be represented, else 0
// R0 must not be modified.
//
// In 16-bit 2's complement, only x = -32768 cannot be negated.

@R2
M=0            // default: x not negative
@R3
M=0            // default: no overflow

@R0
D=M
@NEGATIVE
D;JLT

// x >= 0
@R0
D=M
@R1
M=D
@END
0;JMP

(NEGATIVE)
@R2
M=1            // x is negative

// Check if x is the minimum representable value.
// For a negative x, x + x == 0 only when x = -32768.
@R0
D=M
D=D+M
@CANNOT_COMPUTE
D;JEQ

// Normal negative case: |x| = -x
@R0
D=M
D=-D
@R1
M=D
@END
0;JMP

(CANNOT_COMPUTE)
@R3
M=1
@R0
D=M
@R1
M=D

(END)
@END
0;JMP