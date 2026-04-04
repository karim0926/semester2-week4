// Compute z = x + y with overflow check.
// Input:  R0 = x, R1 = y
// Output: R2 = x + y
//         R3 = 1 if overflow, else 0
// R0 and R1 must not be modified.

@R3
M=0            // default: no overflow

// Compute sum first.
@R0
D=M
@R1
D=D+M
@R2
M=D

// Check sign of x
@R0
D=M
@X_NEG
D;JLT

// x >= 0
@R1
D=M
@END
D;JLT          // different signs => no overflow possible

// x >= 0 and y >= 0
@R2
D=M
@OVERFLOW
D;JLT          // positive + positive gave negative => overflow
@END
0;JMP

(X_NEG)
// x < 0
@R1
D=M
@END
D;JGE          // different signs => no overflow possible

// x < 0 and y < 0
@R2
D=M
@OVERFLOW
D;JGE          // negative + negative gave non-negative => overflow
@END
0;JMP

(OVERFLOW)
@R3
M=1

(END)
@END
0;JMP