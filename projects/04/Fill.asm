// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(START)
	// screen = SCREEN (16384)
	@SCREEN
	D=A
	
	@screen
	M=D

(KEYBOARD)
	// Check status of Keyboard
	@KBD
	D=M

	// If (KBD == 0) jump to WHITE
	@WHITE
	D; JEQ

	// Else jump to BLACK
	@BLACK
	0; JMP

(INCSCREEN)
	// screen++
	@screen
	M=M+1
	D=M	

	// If ((KBD - screen == 0) jump to START
	@KBD
	D=A-D
	
	@START
	D; JEQ
	
	// Else, jump to KEYBOARD
	@KEYBOARD
	0; JMP

(BLACK)
	// Register[screen] = -1 
	@screen
	A=M
	M=-1

	// Jump to INCSCREEN
	@INCSCREEN
	0; JMP

(WHITE)
	// Register[screen] = 0
	@screen
	A=M
	M=0

	// Jump to INCSCREEN
	@INCSCREEN
	0; JMP
