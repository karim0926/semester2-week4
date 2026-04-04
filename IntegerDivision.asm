// Integer division with quotient and remainder.
// Input:  R0 = x, R1 = y
// Output: R2 = quotient m
//         R3 = remainder q
//         R4 = 1 if division invalid, else 0
// Conditions: x = y*m + q
//             q has same sign as x
//             |q| < |y|
// R0 and R1 must not be modified.
//
// Invalid only when y = 0.

@R4
M=0
@R2
M=0
@R3
M=0

// Check y == 0
@R1
D=M
@INVALID
D;JEQ

// Make XNEG flag
@R0
D=M
@X_IS_NEG
D;JLT

@XNEG
M=0
@R0
D=M
D=-D
@REMNEG
M=D            // REMNEG = -x if x >= 0
@X_DONE
0;JMP

(X_IS_NEG)
@XNEG
M=1
@R0
D=M
@REMNEG
M=D            // REMNEG = x if x < 0

(X_DONE)
// Make YNEG flag and negative divisor
@R1
D=M
@Y_IS_NEG
D;JLT

@YNEG
M=0
@R1
D=M
D=-D
@DIVNEG
M=D            // DIVNEG = -y if y >= 0
@Y_DONE
0;JMP

(Y_IS_NEG)
@YNEG
M=1
@R1
D=M
@DIVNEG
M=D            // DIVNEG = y if y < 0

(Y_DONE)
// QUO = 0
@QUO
M=0

(DIV_LOOP)
// while REMNEG <= DIVNEG
@REMNEG
D=M
@DIVNEG
D=D-M          // REMNEG - DIVNEG
@END_DIV
D;JGT

// REMNEG = REMNEG - DIVNEG
@REMNEG
D=M
@DIVNEG
D=D-M
@REMNEG
M=D

// QUO++
@QUO
M=M+1

@DIV_LOOP
0;JMP

(END_DIV)
// Set quotient sign.
// If XNEG == YNEG => quotient positive
// else quotient negative
@XNEG
D=M
@YNEG
D=D-M
@NEGATE_QUO
D;JNE

@QUO
D=M
@R2
M=D
@SET_REMAINDER
0;JMP

(NEGATE_QUO)
@QUO
D=M
D=-D
@R2
M=D

(SET_REMAINDER)
// Remainder has same sign as x.
// Current REMNEG is <= 0.
@XNEG
D=M
@X_WAS_NEG
D;JNE

// x was non-negative => remainder should be non-negative
@REMNEG
D=M
D=-D
@R3
M=D
@END
0;JMP

(X_WAS_NEG)
@REMNEG
D=M
@R3
M=D
@END
0;JMP

(INVALID)
@R4
M=1

(END)
@END
0;JMP