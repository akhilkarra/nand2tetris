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

// At the start, read the keyboard input
(START)
    // if KBD > 0: execute SCREEN-ON
    @KBD
    D=M
    
    @SCREEN-ON
    D; JGT

    // else: execute SCREEN-OFF
    @SCREEN-OFF
    0; JMP

// When SCREEN-ON called, turn on all pixels of display. Then, go back to start
(SCREEN-ON)
    // screen = SCREEN (base address of Screen Memory Map)
    @SCREEN
    D=A

    @screen
    M=D
    
    // counter = 8192
    @8192
    D=A

    @counter
    M=D

    // Loop through every memory register in the Screen Memory Map and set them to -1 (1111111111111111)
    (ON-LOOP)
        // screen = -1
        @screen
        A=M
        M=-1

        // screen = screen + 1
        @screen
        M=M+1

        // counter = counter - 1
        @counter
        M=M-1

        // Go back to ON-LOOP if counter is still greater than 0
        D=M

        @ON-LOOP
        D; JGT
    
    // Jump back to START after executing loop
    @START
    0; JMP

// When SCREEN-OFF called, turn off all pixels of display. Then, go back to start
(SCREEN-OFF)
    // screen = SCREEN (base address of Screen Memory Map)
    @SCREEN
    D=A

    @screen
    M=D
    
    // counter = 8192
    @8192
    D=A

    @counter
    M=D

    // Loop through every memory register in the Screen Memory Map and set them to 0 (0000000000000000)
    (OFF-LOOP)
        // screen = 0
        @screen
        A=M
        M=0

        // screen = screen + 1
        @screen
        M=M+1

        // counter = counter - 1
        @counter
        M=M-1

        // Go back to OFF-LOOP if counter is still greater than 0
        D=M

        @OFF-LOOP
        D; JGT
    
    // Jump back to START after executing loop
    @START
    0; JMP 
