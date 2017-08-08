// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

	// a = R0
	@R0
	D=M
	@a
	M=D

	// b = R1
	@R1
	D=M
	@b
	M=D
	
	// product = 0
	@product
	M=0

(LOOP)
	// If b == 0, jump to PRODUCT
	@b
	D=M
	@PRODUCT
	D; JEQ

	// product = product + a
	@a
	D=M
	@product
	M=D+M

	// b = b - 1
	@b
	M=M-1

	// Go back to beginning of loop
	@LOOP
	0; JMP

(PRODUCT)
	// RAM[2] = product
	@product
	D=M
	@R2
	M=D

	// Jump to END
	@END
	0; JMP

(END)
	@END
	0; JMP
