#####################################################################
#
# CSC258H5S Fall 2020 Assembly Final Project
# University of Toronto, St. George
#
# Student: Omar Shalash, 1005760909
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8
# - Unit height in pixels: 8
# - Display width in pixels: 256
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestone is reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 1/2/3/4/5 (choose the one the applies)
# 2 
#
# Which approved additional features have been implemented?
# (See the assignment handout for the list of additional features)
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any)
# 3. (fill in the feature, if any)
# ... (add more if necessary)
#
# Any additional information that the TA needs to know:
# - (Still working on milestone 2, so it's still bugging
#
#####################################################################

.data 
	displayAddress: .word 0x10008000
	displayArray: .word 0xc9e5e3:4092
	yellow: .word 0xffef00
	blue: .word 0xc9e5e3
	brown: .word 0x5c271d
	darkBlue: .word 0x0e1667
	platformNext: .word -100
	platformUp: .word 164
	platformMid: .word 565
	platformDown: .word 937
	platformDone: .word 0
.text 
	lw $t0, displayAddress # $t0 stores the base address for display
	li $t2, 0x5c271d # $t2 stores the brown colour code
	la $t8, displayArray # $t8 holds address of displayArray
	addi $s1, $zero, 655 #tracks the position of the doodler
	add $a0, $zero, $s1 # drawing platform at location 655
	jal placeDoodler
	add $s0, $zero, $zero # Initialize $s0 = 0 where $s0 = 0 if falling and 1 if jumpimg
	add $s2, $zero, $zero # $s2 stores the number of times the doddler has gone up
	add $s3, $zero, $zero #  $s3 = 1 iff platforms are falling 0 otherwise
	add $s4, $zero, $zero # $s4 stores the number of times the platforms went down
	addi $a0, $zero, 164 # drawing platform at location 129
	addi $a1, $zero, 565 # drawing platform at location 129
	addi $a2, $zero, 937 # drawing platform at location 129
	addi $a3, $zero, -100 # drawing platform at location 129
	jal addPlatforms
main:
	lw $s7, 0xffff0000
	beq $s7, 1, keyboardInput
 	j mainCont
keyboardInput:
	lw $t1, 0xffff0004
 	beq $t1, 0x6b, respondToK
 	beq $t1, 0x6a, respondToJ
 	j mainCont
respondToK:
	addi $a0, $s1, 1 # drawing platform at location 
	addi $s1, $s1, 1
 	jal placeDoodler
 	j mainCont
respondToJ:
	addi $a0, $s1, -1 # drawing platform at location 
	addi $s1, $s1, -1
 	jal placeDoodler
mainCont:
	jal paintBackground
	beq $s0, 0, fall
	beq $s0, 1, jump
mainCont2:
	beq $s3, 1, platformFall
	li $v0, 32 # Sleep
 	li $a0, 10
	syscall
	j main
	
	
fall:
	addi $a0, $s1, 32 
	addi $s1, $s1, 32
	jal placeDoodler
	j mainCont2

jump:
	beq $s2, 15, toggle
	addi $s2, $s2, 1
	addi $a0, $s1, -32 
	jal placeDoodler
	addi $s1, $s1, -32
	ble $s1, 161, flip2
	j mainCont

platformFall:
	beq $s4, 12, toggle2 # When done, toggle
	addi $s4, $s4, 1
	lw $s5, platformUp
	addi $a0, $s5, 32 
	addi $s5, $s5, 32
	sw $s5, platformUp
	lw $s5, platformMid
	addi $a1, $s5, 32 
	addi $s5, $s5, 32
	sw $s5, platformMid
	lw $s5, platformDown
	addi $a2, $s5, 32 
	addi $s5, $s5, 32
	sw $s5, platformDown
	lw $s5, platformNext
	addi $a3, $s5, 32 
	addi $s5, $s5, 32
	sw $s5, platformNext
	jal addPlatforms
	j main


	
draw2:
	
	add $t4, $zero, $zero # $t4 = 0
	addi $t5, $zero, 4092 # $t5 = 4092
drawLoop2:
	bge $t4, $t5, endPaintBackground
	sll $t6, $t4, 2
	add $t7, $t8, $t6 # $t7 = addr(displayArray[i])
	addi $t4, $t4, 1
	lw $t9, platformUp # Calculate the positions on the new platform
	addi $t9, $t9, 32 #Save them in their respective variable
	add $a0, $zero, $t9 
	jal addPlatform # Draw them 
	lw $t9, platformMid # Calculate the positions on the new platforms
	addi $t9, $t9, 32 #Save them in their respective variable
	add $a0, $zero, $t9 
	jal addPlatform # Draw them 
	lw $t9, platformDown # Calculate the positions on the new platforms
	addi $t9, $t9, 32 #Save them in their respective variable
	add $a0, $zero, $t9 
	jal addPlatform # Draw them 
	j drawLoop2
	

toggle:
	add $s2, $zero, $zero # Reset counter
	add $s0, $zero, $zero # Toggle $s0
	j main
	
toggle2:
	add $s4, $zero, $zero # Reset counter
	add $s3, $zero, $zero # Toggle $s3
	lw $t1, platformMid #load mid
	sw $t1, platformDown #store it in down
	lw $t1, platformUp #load up
	sw $t1, platformMid #store it in mid
	lw $t1, platformNext #load next
	sw $t1, platformUp #store it in up
	j main
	
paintBackground:
	add $t4, $zero, $zero # $t4 = 0
	addi $t5, $zero, 4092 # $t5 = 4092
paintBackgroundLoop: 
	bge $t4, $t5, endPaintBackground # if counter reaches 4096, branch
	sll $t6, $t4, 2
	add $t7, $t8, $t6 # $t7 = addr(displayArray[i])
	add $t9, $t0, $t6 # t9 = addr(displayAddress + offset)
	lw $t3, 0($t7)
	sw $t3, 0($t9) # displayAddress + i = displayArray[i]
	addi $t4, $t4, 1
	j paintBackgroundLoop
endPaintBackground: 
	jr $ra

placeDoodler:
	add $t4, $zero, $zero # $t4 = 0
	addi $t5, $zero, 4092 # $t5 = 4092
placeLoop:
	bge $t4, $t5, draw
	sll $t6, $t4, 2
	add $t7, $t8, $t6 # $t7 = addr(displayArray[i])
	lw $t3, 0($t7)
	addi $t4, $t4, 1
	lw $t1, yellow
	beq $t3, $t1, clear
	j placeLoop
clear:
	lw $t9, blue # load blue
	sw $t9, 0($t7) # store blue in old address
	j placeLoop
draw:
	add $t4, $zero, $zero # $t4 = 0
	addi $t5, $zero, 4092 # $t5 = 4092
drawLoop:
	bge $t4, $t5, endPaintBackground
	bge $a0, 1025, gameOver
	beq $t4, $a0, drawUnit
	sll $t6, $t4, 2
	add $t7, $t8, $t6 # $t7 = addr(displayArray[i])
	addi $t4, $t4, 1
	j drawLoop
drawUnit:
	lw $t6, brown
	lw $t4, 260($t7) # load bottom pixel
	lw $t5, 252($t7) # load bottom pixel
	lw $t1, yellow
	beq $t4, $t6, flip
	beq $t5, $t6, flip
	sw $t1, 0($t7)
	sw $t1, 124($t7)
	sw $t1, 128($t7)
	sw $t1, 132($t7)
	sw $t1, 252($t7)
	sw $t1, 260($t7)
	j endPaintBackground
flip:
	addi $s0, $zero, 1
	j endPaintBackground
flip2:
	addi $s3, $zero, 1
	# Create position of new platform
	li $v0, 42
	li $a0, 0
	li $a1, 23
	syscall
	addi $t1, $a0, -223
	sw $t1, platformNext # Store it 
	j main
addPlatform:
	add $t4, $zero, $zero # $t4 = 0
	addi $t5, $a0, 8 # $t5 = $a0 + 32
addPlatformLoop:
	bge $t4, $a0, placePlatform
cont:	bge $t4, $t5, endPaintBackground
	sll $t6, $t4, 2
	addi $t4, $t4, 1
	j addPlatformLoop
placePlatform:
	add $t7, $t8, $t6 # $t7 = addr(displayArray[i])
	sw $t2, 0($t7)
	j cont

addPlatforms:
	# Clear previous 
	add $t4, $zero, $zero # $t4 = 0 
	addi $t5, $zero, 4092 # $t5 = 4092 
addPlatformsLoop:
	bge $t4, $t5, drawPlatforms
	sll $t6, $t4, 2
	add $t7, $t8, $t6 # $t7 = addr(displayArray[i])
	lw $t3, 0($t7) # $t3 is curr element
	addi $t4, $t4, 1
	beq $t3, $t2, clear2
	j addPlatformsLoop
drawPlatforms:
	# Add the platforms
	sw $ra, 0($sp) # push $ra onto stack
	jal addPlatform # call addPlatform 4 times
	add $a0, $zero, $a1
	jal addPlatform
	add $a0, $zero, $a2
	jal addPlatform
	add $a0, $zero, $a3
	jal addPlatform
	lw $ra, 0($sp) # pop $ra from stack
	jr $ra # return

clear2:
	lw $t9, blue # load blue
	sw $t9, 0($t7) # store blue in old address
	j addPlatformsLoop
gameOver:
	addi $s0, $zero, 0
	lw $t1, darkBlue
	sw $t1, 1280($t8)
	sw $t1, 1408($t8)
	sw $t1, 1536($t8)
	sw $t1, 1664($t8)
 	sw $t1, 1792($t8)
	j endPaintBackground
	
endgame:
	
	
