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
# 4
#
# Which approved additional features have been implemented?
# (See the assignment handout for the list of additional features)
# 1. Game Over/ Retry
# 2. Increasing difficulty
# 3. Background/ sound effects
# ... (add more if necessary)
#
# Any additional information that the TA needs to know:
# - 
#
#####################################################################

.data 
	displayAddress: .word 0x10008000
	displayArray: .word 0xc9e5e3:4092
	yellow: .word 0xffef00
	blue: .word 0xc9e5e3
	brown: .word 0x5c271d
	darkBlue: .word 0x0e1667
	red: .word 0xe91e63
	platformNext: .word -100
	platformUp: .word 164
	platformMid: .word 565
	platformDown: .word 937
	platformDone: .word 0
	scoreCounter: .word 0
	loopCounter: .word 0
	bgPitch: .word 15
	bgLimitCount: .word 0
	doodler2UpCounter: .word 0
	doodler2Position: .word 651
	gameMode: .word -1
	buffer: .asciiz 
	firstChar: .word -1
	secondChar: .word -1
	thirdChar: .word -1
	alpha: .byte 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
	
.text 
	add $t0, $zero, $zero #init t0 = 0
nameEntry:
	bge $t0, 3, menu
	lw $s7, 0xffff0000
	beq $s7, 1, keyboardInput4
	j nameEntry
keyboardInput4:
	lw $t1, 0xffff0004
 	beq $t1, 0x61, inputA
 	beq $t1, 0x62, inputB
 	beq $t1, 0x63, inputC
 	beq $t1, 0x64, inputD
 	beq $t1, 0x65, inputE
 	beq $t1, 0x66, inputF
 	beq $t1, 0x67, inputG
 	beq $t1, 0x68, inputH
 	beq $t1, 0x69, inputI
 	beq $t1, 0x6A, inputJ
 	beq $t1, 0x6B, inputK
 	beq $t1, 0x6C, inputL
 	beq $t1, 0x6D, inputM
 	beq $t1, 0x6E, inputN
 	beq $t1, 0x6F, inputO
 	beq $t1, 0x70, inputP
 	beq $t1, 0x71, inputQ
 	beq $t1, 0x72, inputR
 	beq $t1, 0x73, inputS
 	beq $t1, 0x74, inputT
 	beq $t1, 0x75, inputU
 	beq $t1, 0x76, inputV
 	beq $t1, 0x77, inputW
 	beq $t1, 0x78, inputX
 	beq $t1, 0x79, inputY
 	beq $t1, 0x7A, inputZ
 	
###
inputA: 
	li $t4, 'A' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputB: 
	li $t4, 'B' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputC: 
	li $t4, 'C' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputD: 
	li $t4, 'D' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputE: 
	li $t4, 'E' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputF: 
	li $t4, 'F' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputG: 
	li $t4, 'G' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputH: 
	li $t4, 'H' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputI: 
	li $t4, 'I' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputJ: 
	li $t4, 'J' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputK: 
	li $t4, 'K' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputL: 
	li $t4, 'L' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputM: 
	li $t4, 'M' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputN: 
	li $t4, 'N' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputO: 
	li $t4, 'O' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputP: 
	li $t4, 'P' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputQ: 
	li $t4, 'Q' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputR: 
	li $t4, 'R' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputS: 
	li $t4, 'S' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputT: 
	li $t4, 'T' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputU: 
	li $t4, 'U' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputV: 
	li $t4, 'V' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputW: 
	li $t4, 'W' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputX: 
	li $t4, 'X' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputY: 
	li $t4, 'Y' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry
inputZ: 
	li $t4, 'Z' 
	sw $t4 0($sp)
	subi $sp, $sp, 4
	addi $t0, $t0, 1
	j nameEntry

###
menu:
	lw $t0, displayAddress # $t0 stores the base address for display
	li $s6, 5
	# init bitmap display with start screen (ignore next ~2000 lines; its the pixels for the start screen)
li $t1, 0xffffff
sw $t1, 0($t0)
li $t1, 0xffffff
sw $t1, 4($t0)
li $t1, 0xffffff
sw $t1, 8($t0)
li $t1, 0xffffff
sw $t1, 12($t0)
li $t1, 0xffffff
sw $t1, 16($t0)
li $t1, 0xffffff
sw $t1, 20($t0)
li $t1, 0xffffff
sw $t1, 24($t0)
li $t1, 0xffffff
sw $t1, 28($t0)
li $t1, 0xffffff
sw $t1, 32($t0)
li $t1, 0xffffff
sw $t1, 36($t0)
li $t1, 0xffffff
sw $t1, 40($t0)
li $t1, 0xffffff
sw $t1, 44($t0)
li $t1, 0xffffff
sw $t1, 48($t0)
li $t1, 0xffffff
sw $t1, 52($t0)
li $t1, 0xffffff
sw $t1, 56($t0)
li $t1, 0xffffff
sw $t1, 60($t0)
li $t1, 0xffffff
sw $t1, 64($t0)
li $t1, 0xffffff
sw $t1, 68($t0)
li $t1, 0xffffff
sw $t1, 72($t0)
li $t1, 0xffffff
sw $t1, 76($t0)
li $t1, 0xffffff
sw $t1, 80($t0)
li $t1, 0xffffff
sw $t1, 84($t0)
li $t1, 0xffffff
sw $t1, 88($t0)
li $t1, 0xffffff
sw $t1, 92($t0)
li $t1, 0xffffff
sw $t1, 96($t0)
li $t1, 0xffffff
sw $t1, 100($t0)
li $t1, 0xffffff
sw $t1, 104($t0)
li $t1, 0xffffff
sw $t1, 108($t0)
li $t1, 0xffffff
sw $t1, 112($t0)
li $t1, 0xffffff
sw $t1, 116($t0)
li $t1, 0xffffff
sw $t1, 120($t0)
li $t1, 0xffffff
sw $t1, 124($t0)
li $t1, 0xffffff
sw $t1, 128($t0)
li $t1, 0xffffff
sw $t1, 132($t0)
li $t1, 0xffffff
sw $t1, 136($t0)
li $t1, 0xffffff
sw $t1, 140($t0)
li $t1, 0xffffff
sw $t1, 144($t0)
li $t1, 0xffffff
sw $t1, 148($t0)
li $t1, 0xffffff
sw $t1, 152($t0)
li $t1, 0xffffff
sw $t1, 156($t0)
li $t1, 0xffffff
sw $t1, 160($t0)
li $t1, 0xffffff
sw $t1, 164($t0)
li $t1, 0xffffff
sw $t1, 168($t0)
li $t1, 0xffffff
sw $t1, 172($t0)
li $t1, 0xffffff
sw $t1, 176($t0)
li $t1, 0xffffff
sw $t1, 180($t0)
li $t1, 0xffffff
sw $t1, 184($t0)
li $t1, 0xffffff
sw $t1, 188($t0)
li $t1, 0xffffff
sw $t1, 192($t0)
li $t1, 0xffffff
sw $t1, 196($t0)
li $t1, 0xffffff
sw $t1, 200($t0)
li $t1, 0xffffff
sw $t1, 204($t0)
li $t1, 0xffffff
sw $t1, 208($t0)
li $t1, 0xffffff
sw $t1, 212($t0)
li $t1, 0xffffff
sw $t1, 216($t0)
li $t1, 0xffffff
sw $t1, 220($t0)
li $t1, 0xffffff
sw $t1, 224($t0)
li $t1, 0xffffff
sw $t1, 228($t0)
li $t1, 0xffffff
sw $t1, 232($t0)
li $t1, 0xffffff
sw $t1, 236($t0)
li $t1, 0xffffff
sw $t1, 240($t0)
li $t1, 0xffffff
sw $t1, 244($t0)
li $t1, 0xffffff
sw $t1, 248($t0)
li $t1, 0xffffff
sw $t1, 252($t0)
li $t1, 0xffffff
sw $t1, 256($t0)
li $t1, 0xffffff
sw $t1, 260($t0)
li $t1, 0xffffff
sw $t1, 264($t0)
li $t1, 0xffffff
sw $t1, 268($t0)
li $t1, 0xffffff
sw $t1, 272($t0)
li $t1, 0xffffff
sw $t1, 276($t0)
li $t1, 0xffffff
sw $t1, 280($t0)
li $t1, 0xffffff
sw $t1, 284($t0)
li $t1, 0xffffff
sw $t1, 288($t0)
li $t1, 0xffffff
sw $t1, 292($t0)
li $t1, 0xffffff
sw $t1, 296($t0)
li $t1, 0xffffff
sw $t1, 300($t0)
li $t1, 0xffffff
sw $t1, 304($t0)
li $t1, 0xffffff
sw $t1, 308($t0)
li $t1, 0xffffff
sw $t1, 312($t0)
li $t1, 0xffffff
sw $t1, 316($t0)
li $t1, 0xffffff
sw $t1, 320($t0)
li $t1, 0xffffff
sw $t1, 324($t0)
li $t1, 0xffffff
sw $t1, 328($t0)
li $t1, 0xffffff
sw $t1, 332($t0)
li $t1, 0xffffff
sw $t1, 336($t0)
li $t1, 0xffffff
sw $t1, 340($t0)
li $t1, 0xffffff
sw $t1, 344($t0)
li $t1, 0xffffff
sw $t1, 348($t0)
li $t1, 0xffffff
sw $t1, 352($t0)
li $t1, 0xffffff
sw $t1, 356($t0)
li $t1, 0xffffff
sw $t1, 360($t0)
li $t1, 0xffffff
sw $t1, 364($t0)
li $t1, 0xffffff
sw $t1, 368($t0)
li $t1, 0xffffff
sw $t1, 372($t0)
li $t1, 0xffffff
sw $t1, 376($t0)
li $t1, 0xffffff
sw $t1, 380($t0)
li $t1, 0xffffff
sw $t1, 384($t0)
li $t1, 0xffffff
sw $t1, 388($t0)
li $t1, 0xffffff
sw $t1, 392($t0)
li $t1, 0xffffff
sw $t1, 396($t0)
li $t1, 0xffffff
sw $t1, 400($t0)
li $t1, 0xffffff
sw $t1, 404($t0)
li $t1, 0xffffff
sw $t1, 408($t0)
li $t1, 0xffffff
sw $t1, 412($t0)
li $t1, 0xffffff
sw $t1, 416($t0)
li $t1, 0xffffff
sw $t1, 420($t0)
li $t1, 0xffffff
sw $t1, 424($t0)
li $t1, 0xffffff
sw $t1, 428($t0)
li $t1, 0xffffff
sw $t1, 432($t0)
li $t1, 0xffffff
sw $t1, 436($t0)
li $t1, 0xffffff
sw $t1, 440($t0)
li $t1, 0xffffff
sw $t1, 444($t0)
li $t1, 0xffffff
sw $t1, 448($t0)
li $t1, 0xffffff
sw $t1, 452($t0)
li $t1, 0xffffff
sw $t1, 456($t0)
li $t1, 0xffffff
sw $t1, 460($t0)
li $t1, 0xffffff
sw $t1, 464($t0)
li $t1, 0xffffff
sw $t1, 468($t0)
li $t1, 0xffffff
sw $t1, 472($t0)
li $t1, 0xffffff
sw $t1, 476($t0)
li $t1, 0xffffff
sw $t1, 480($t0)
li $t1, 0xffffff
sw $t1, 484($t0)
li $t1, 0xffffff
sw $t1, 488($t0)
li $t1, 0xffffff
sw $t1, 492($t0)
li $t1, 0xffffff
sw $t1, 496($t0)
li $t1, 0xffffff
sw $t1, 500($t0)
li $t1, 0xffffff
sw $t1, 504($t0)
li $t1, 0xffffff
sw $t1, 508($t0)
li $t1, 0xffffff
sw $t1, 512($t0)
li $t1, 0x000000
sw $t1, 516($t0)
li $t1, 0x000000
sw $t1, 520($t0)
li $t1, 0x000000
sw $t1, 524($t0)
li $t1, 0xffffff
sw $t1, 528($t0)
li $t1, 0xffffff
sw $t1, 532($t0)
li $t1, 0xffffff
sw $t1, 536($t0)
li $t1, 0x000000
sw $t1, 540($t0)
li $t1, 0x000000
sw $t1, 544($t0)
li $t1, 0xffffff
sw $t1, 548($t0)
li $t1, 0xffffff
sw $t1, 552($t0)
li $t1, 0xffffff
sw $t1, 556($t0)
li $t1, 0x000000
sw $t1, 560($t0)
li $t1, 0x000000
sw $t1, 564($t0)
li $t1, 0xffffff
sw $t1, 568($t0)
li $t1, 0xffffff
sw $t1, 572($t0)
li $t1, 0x000000
sw $t1, 576($t0)
li $t1, 0x000000
sw $t1, 580($t0)
li $t1, 0x000000
sw $t1, 584($t0)
li $t1, 0xffffff
sw $t1, 588($t0)
li $t1, 0xffffff
sw $t1, 592($t0)
li $t1, 0x000000
sw $t1, 596($t0)
li $t1, 0xffffff
sw $t1, 600($t0)
li $t1, 0xffffff
sw $t1, 604($t0)
li $t1, 0xffffff
sw $t1, 608($t0)
li $t1, 0xffffff
sw $t1, 612($t0)
li $t1, 0x000000
sw $t1, 616($t0)
li $t1, 0x000000
sw $t1, 620($t0)
li $t1, 0x000000
sw $t1, 624($t0)
li $t1, 0x000000
sw $t1, 628($t0)
li $t1, 0xffffff
sw $t1, 632($t0)
li $t1, 0xffffff
sw $t1, 636($t0)
li $t1, 0xffffff
sw $t1, 640($t0)
li $t1, 0x000000
sw $t1, 644($t0)
li $t1, 0xffffff
sw $t1, 648($t0)
li $t1, 0xffffff
sw $t1, 652($t0)
li $t1, 0x000000
sw $t1, 656($t0)
li $t1, 0xffffff
sw $t1, 660($t0)
li $t1, 0x000000
sw $t1, 664($t0)
li $t1, 0xffffff
sw $t1, 668($t0)
li $t1, 0xffffff
sw $t1, 672($t0)
li $t1, 0x000000
sw $t1, 676($t0)
li $t1, 0xffffff
sw $t1, 680($t0)
li $t1, 0x000000
sw $t1, 684($t0)
li $t1, 0xffffff
sw $t1, 688($t0)
li $t1, 0xffffff
sw $t1, 692($t0)
li $t1, 0x000000
sw $t1, 696($t0)
li $t1, 0xffffff
sw $t1, 700($t0)
li $t1, 0x000000
sw $t1, 704($t0)
li $t1, 0xffffff
sw $t1, 708($t0)
li $t1, 0xffffff
sw $t1, 712($t0)
li $t1, 0x000000
sw $t1, 716($t0)
li $t1, 0xffffff
sw $t1, 720($t0)
li $t1, 0x000000
sw $t1, 724($t0)
li $t1, 0xffffff
sw $t1, 728($t0)
li $t1, 0xffffff
sw $t1, 732($t0)
li $t1, 0xffffff
sw $t1, 736($t0)
li $t1, 0xffffff
sw $t1, 740($t0)
li $t1, 0x000000
sw $t1, 744($t0)
li $t1, 0xffffff
sw $t1, 748($t0)
li $t1, 0xffffff
sw $t1, 752($t0)
li $t1, 0xffffff
sw $t1, 756($t0)
li $t1, 0xffffff
sw $t1, 760($t0)
li $t1, 0xffffff
sw $t1, 764($t0)
li $t1, 0xffffff
sw $t1, 768($t0)
li $t1, 0x000000
sw $t1, 772($t0)
li $t1, 0xffffff
sw $t1, 776($t0)
li $t1, 0xffffff
sw $t1, 780($t0)
li $t1, 0x000000
sw $t1, 784($t0)
li $t1, 0xffffff
sw $t1, 788($t0)
li $t1, 0x000000
sw $t1, 792($t0)
li $t1, 0xffffff
sw $t1, 796($t0)
li $t1, 0xffffff
sw $t1, 800($t0)
li $t1, 0x000000
sw $t1, 804($t0)
li $t1, 0xffffff
sw $t1, 808($t0)
li $t1, 0x000000
sw $t1, 812($t0)
li $t1, 0xffffff
sw $t1, 816($t0)
li $t1, 0xffffff
sw $t1, 820($t0)
li $t1, 0x000000
sw $t1, 824($t0)
li $t1, 0xffffff
sw $t1, 828($t0)
li $t1, 0x000000
sw $t1, 832($t0)
li $t1, 0xffffff
sw $t1, 836($t0)
li $t1, 0xffffff
sw $t1, 840($t0)
li $t1, 0x000000
sw $t1, 844($t0)
li $t1, 0xffffff
sw $t1, 848($t0)
li $t1, 0x000000
sw $t1, 852($t0)
li $t1, 0xffffff
sw $t1, 856($t0)
li $t1, 0xffffff
sw $t1, 860($t0)
li $t1, 0xffffff
sw $t1, 864($t0)
li $t1, 0xffffff
sw $t1, 868($t0)
li $t1, 0x000000
sw $t1, 872($t0)
li $t1, 0x000000
sw $t1, 876($t0)
li $t1, 0x000000
sw $t1, 880($t0)
li $t1, 0xffffff
sw $t1, 884($t0)
li $t1, 0xffffff
sw $t1, 888($t0)
li $t1, 0xffffff
sw $t1, 892($t0)
li $t1, 0xffffff
sw $t1, 896($t0)
li $t1, 0x000000
sw $t1, 900($t0)
li $t1, 0xffffff
sw $t1, 904($t0)
li $t1, 0xffffff
sw $t1, 908($t0)
li $t1, 0x000000
sw $t1, 912($t0)
li $t1, 0xffffff
sw $t1, 916($t0)
li $t1, 0x000000
sw $t1, 920($t0)
li $t1, 0xffffff
sw $t1, 924($t0)
li $t1, 0xffffff
sw $t1, 928($t0)
li $t1, 0x000000
sw $t1, 932($t0)
li $t1, 0xffffff
sw $t1, 936($t0)
li $t1, 0x000000
sw $t1, 940($t0)
li $t1, 0xffffff
sw $t1, 944($t0)
li $t1, 0xffffff
sw $t1, 948($t0)
li $t1, 0x000000
sw $t1, 952($t0)
li $t1, 0xffffff
sw $t1, 956($t0)
li $t1, 0x000000
sw $t1, 960($t0)
li $t1, 0xffffff
sw $t1, 964($t0)
li $t1, 0xffffff
sw $t1, 968($t0)
li $t1, 0x000000
sw $t1, 972($t0)
li $t1, 0xffffff
sw $t1, 976($t0)
li $t1, 0x000000
sw $t1, 980($t0)
li $t1, 0xffffff
sw $t1, 984($t0)
li $t1, 0xffffff
sw $t1, 988($t0)
li $t1, 0xffffff
sw $t1, 992($t0)
li $t1, 0xffffff
sw $t1, 996($t0)
li $t1, 0x000000
sw $t1, 1000($t0)
li $t1, 0xffffff
sw $t1, 1004($t0)
li $t1, 0xffffff
sw $t1, 1008($t0)
li $t1, 0xffffff
sw $t1, 1012($t0)
li $t1, 0xffffff
sw $t1, 1016($t0)
li $t1, 0xffffff
sw $t1, 1020($t0)
li $t1, 0xffffff
sw $t1, 1024($t0)
li $t1, 0x000000
sw $t1, 1028($t0)
li $t1, 0x000000
sw $t1, 1032($t0)
li $t1, 0x000000
sw $t1, 1036($t0)
li $t1, 0xffffff
sw $t1, 1040($t0)
li $t1, 0xffffff
sw $t1, 1044($t0)
li $t1, 0xffffff
sw $t1, 1048($t0)
li $t1, 0x000000
sw $t1, 1052($t0)
li $t1, 0x000000
sw $t1, 1056($t0)
li $t1, 0xffffff
sw $t1, 1060($t0)
li $t1, 0xffffff
sw $t1, 1064($t0)
li $t1, 0xffffff
sw $t1, 1068($t0)
li $t1, 0x000000
sw $t1, 1072($t0)
li $t1, 0x000000
sw $t1, 1076($t0)
li $t1, 0xffffff
sw $t1, 1080($t0)
li $t1, 0xffffff
sw $t1, 1084($t0)
li $t1, 0x000000
sw $t1, 1088($t0)
li $t1, 0x000000
sw $t1, 1092($t0)
li $t1, 0x000000
sw $t1, 1096($t0)
li $t1, 0xffffff
sw $t1, 1100($t0)
li $t1, 0xffffff
sw $t1, 1104($t0)
li $t1, 0x000000
sw $t1, 1108($t0)
li $t1, 0x000000
sw $t1, 1112($t0)
li $t1, 0x000000
sw $t1, 1116($t0)
li $t1, 0x000000
sw $t1, 1120($t0)
li $t1, 0xffffff
sw $t1, 1124($t0)
li $t1, 0x000000
sw $t1, 1128($t0)
li $t1, 0x000000
sw $t1, 1132($t0)
li $t1, 0x000000
sw $t1, 1136($t0)
li $t1, 0x000000
sw $t1, 1140($t0)
li $t1, 0xffffff
sw $t1, 1144($t0)
li $t1, 0xffffff
sw $t1, 1148($t0)
li $t1, 0xffffff
sw $t1, 1152($t0)
li $t1, 0xffffff
sw $t1, 1156($t0)
li $t1, 0xffffff
sw $t1, 1160($t0)
li $t1, 0xffffff
sw $t1, 1164($t0)
li $t1, 0xffffff
sw $t1, 1168($t0)
li $t1, 0xffffff
sw $t1, 1172($t0)
li $t1, 0xffffff
sw $t1, 1176($t0)
li $t1, 0xffffff
sw $t1, 1180($t0)
li $t1, 0xffffff
sw $t1, 1184($t0)
li $t1, 0xffffff
sw $t1, 1188($t0)
li $t1, 0xffffff
sw $t1, 1192($t0)
li $t1, 0xffffff
sw $t1, 1196($t0)
li $t1, 0xffffff
sw $t1, 1200($t0)
li $t1, 0xffffff
sw $t1, 1204($t0)
li $t1, 0xffffff
sw $t1, 1208($t0)
li $t1, 0xffffff
sw $t1, 1212($t0)
li $t1, 0xffffff
sw $t1, 1216($t0)
li $t1, 0xffffff
sw $t1, 1220($t0)
li $t1, 0xffffff
sw $t1, 1224($t0)
li $t1, 0xffffff
sw $t1, 1228($t0)
li $t1, 0xffffff
sw $t1, 1232($t0)
li $t1, 0xffffff
sw $t1, 1236($t0)
li $t1, 0xffffff
sw $t1, 1240($t0)
li $t1, 0xffffff
sw $t1, 1244($t0)
li $t1, 0xffffff
sw $t1, 1248($t0)
li $t1, 0xffffff
sw $t1, 1252($t0)
li $t1, 0xffffff
sw $t1, 1256($t0)
li $t1, 0xffffff
sw $t1, 1260($t0)
li $t1, 0xffffff
sw $t1, 1264($t0)
li $t1, 0xffffff
sw $t1, 1268($t0)
li $t1, 0xffffff
sw $t1, 1272($t0)
li $t1, 0xffffff
sw $t1, 1276($t0)
li $t1, 0xffffff
sw $t1, 1280($t0)
li $t1, 0xffffff
sw $t1, 1284($t0)
li $t1, 0xffffff
sw $t1, 1288($t0)
li $t1, 0xffffff
sw $t1, 1292($t0)
li $t1, 0xffffff
sw $t1, 1296($t0)
li $t1, 0xffffff
sw $t1, 1300($t0)
li $t1, 0xffffff
sw $t1, 1304($t0)
li $t1, 0xffffff
sw $t1, 1308($t0)
li $t1, 0xffffff
sw $t1, 1312($t0)
li $t1, 0xffffff
sw $t1, 1316($t0)
li $t1, 0xffffff
sw $t1, 1320($t0)
li $t1, 0xffffff
sw $t1, 1324($t0)
li $t1, 0xffffff
sw $t1, 1328($t0)
li $t1, 0xffffff
sw $t1, 1332($t0)
li $t1, 0xffffff
sw $t1, 1336($t0)
li $t1, 0xffffff
sw $t1, 1340($t0)
li $t1, 0xffffff
sw $t1, 1344($t0)
li $t1, 0xffffff
sw $t1, 1348($t0)
li $t1, 0xffffff
sw $t1, 1352($t0)
li $t1, 0xffffff
sw $t1, 1356($t0)
li $t1, 0xffffff
sw $t1, 1360($t0)
li $t1, 0xffffff
sw $t1, 1364($t0)
li $t1, 0xffffff
sw $t1, 1368($t0)
li $t1, 0xffffff
sw $t1, 1372($t0)
li $t1, 0xffffff
sw $t1, 1376($t0)
li $t1, 0xffffff
sw $t1, 1380($t0)
li $t1, 0xffffff
sw $t1, 1384($t0)
li $t1, 0xffffff
sw $t1, 1388($t0)
li $t1, 0xffffff
sw $t1, 1392($t0)
li $t1, 0xffffff
sw $t1, 1396($t0)
li $t1, 0xffffff
sw $t1, 1400($t0)
li $t1, 0xffffff
sw $t1, 1404($t0)
li $t1, 0xffffff
sw $t1, 1408($t0)
li $t1, 0x000000
sw $t1, 1412($t0)
li $t1, 0x000000
sw $t1, 1416($t0)
li $t1, 0x000000
sw $t1, 1420($t0)
li $t1, 0x000000
sw $t1, 1424($t0)
li $t1, 0x000000
sw $t1, 1428($t0)
li $t1, 0x000000
sw $t1, 1432($t0)
li $t1, 0x000000
sw $t1, 1436($t0)
li $t1, 0x000000
sw $t1, 1440($t0)
li $t1, 0x000000
sw $t1, 1444($t0)
li $t1, 0x000000
sw $t1, 1448($t0)
li $t1, 0x000000
sw $t1, 1452($t0)
li $t1, 0x000000
sw $t1, 1456($t0)
li $t1, 0x000000
sw $t1, 1460($t0)
li $t1, 0x000000
sw $t1, 1464($t0)
li $t1, 0x000000
sw $t1, 1468($t0)
li $t1, 0x000000
sw $t1, 1472($t0)
li $t1, 0x000000
sw $t1, 1476($t0)
li $t1, 0x000000
sw $t1, 1480($t0)
li $t1, 0x000000
sw $t1, 1484($t0)
li $t1, 0x000000
sw $t1, 1488($t0)
li $t1, 0x000000
sw $t1, 1492($t0)
li $t1, 0x000000
sw $t1, 1496($t0)
li $t1, 0x000000
sw $t1, 1500($t0)
li $t1, 0x000000
sw $t1, 1504($t0)
li $t1, 0x000000
sw $t1, 1508($t0)
li $t1, 0x000000
sw $t1, 1512($t0)
li $t1, 0x000000
sw $t1, 1516($t0)
li $t1, 0x000000
sw $t1, 1520($t0)
li $t1, 0x000000
sw $t1, 1524($t0)
li $t1, 0x000000
sw $t1, 1528($t0)
li $t1, 0xffffff
sw $t1, 1532($t0)
li $t1, 0xffffff
sw $t1, 1536($t0)
li $t1, 0xffffff
sw $t1, 1540($t0)
li $t1, 0xffffff
sw $t1, 1544($t0)
li $t1, 0xffffff
sw $t1, 1548($t0)
li $t1, 0xffffff
sw $t1, 1552($t0)
li $t1, 0xffffff
sw $t1, 1556($t0)
li $t1, 0xffffff
sw $t1, 1560($t0)
li $t1, 0xffffff
sw $t1, 1564($t0)
li $t1, 0xffffff
sw $t1, 1568($t0)
li $t1, 0xffffff
sw $t1, 1572($t0)
li $t1, 0xffffff
sw $t1, 1576($t0)
li $t1, 0xffffff
sw $t1, 1580($t0)
li $t1, 0xffffff
sw $t1, 1584($t0)
li $t1, 0xffffff
sw $t1, 1588($t0)
li $t1, 0xffffff
sw $t1, 1592($t0)
li $t1, 0xffffff
sw $t1, 1596($t0)
li $t1, 0xffffff
sw $t1, 1600($t0)
li $t1, 0xffffff
sw $t1, 1604($t0)
li $t1, 0xffffff
sw $t1, 1608($t0)
li $t1, 0xffffff
sw $t1, 1612($t0)
li $t1, 0xffffff
sw $t1, 1616($t0)
li $t1, 0xffffff
sw $t1, 1620($t0)
li $t1, 0xffffff
sw $t1, 1624($t0)
li $t1, 0xffffff
sw $t1, 1628($t0)
li $t1, 0xffffff
sw $t1, 1632($t0)
li $t1, 0xffffff
sw $t1, 1636($t0)
li $t1, 0xffffff
sw $t1, 1640($t0)
li $t1, 0xffffff
sw $t1, 1644($t0)
li $t1, 0xffffff
sw $t1, 1648($t0)
li $t1, 0xffffff
sw $t1, 1652($t0)
li $t1, 0xffffff
sw $t1, 1656($t0)
li $t1, 0xffffff
sw $t1, 1660($t0)
li $t1, 0xffffff
sw $t1, 1664($t0)
li $t1, 0xffffff
sw $t1, 1668($t0)
li $t1, 0xffffff
sw $t1, 1672($t0)
li $t1, 0xffffff
sw $t1, 1676($t0)
li $t1, 0xffffff
sw $t1, 1680($t0)
li $t1, 0xffffff
sw $t1, 1684($t0)
li $t1, 0xffffff
sw $t1, 1688($t0)
li $t1, 0xffffff
sw $t1, 1692($t0)
li $t1, 0xffffff
sw $t1, 1696($t0)
li $t1, 0xffffff
sw $t1, 1700($t0)
li $t1, 0xffffff
sw $t1, 1704($t0)
li $t1, 0xffffff
sw $t1, 1708($t0)
li $t1, 0xffffff
sw $t1, 1712($t0)
li $t1, 0xffffff
sw $t1, 1716($t0)
li $t1, 0xffffff
sw $t1, 1720($t0)
li $t1, 0xffffff
sw $t1, 1724($t0)
li $t1, 0xffffff
sw $t1, 1728($t0)
li $t1, 0xffffff
sw $t1, 1732($t0)
li $t1, 0xffffff
sw $t1, 1736($t0)
li $t1, 0xffffff
sw $t1, 1740($t0)
li $t1, 0xffffff
sw $t1, 1744($t0)
li $t1, 0xffffff
sw $t1, 1748($t0)
li $t1, 0xffffff
sw $t1, 1752($t0)
li $t1, 0xffffff
sw $t1, 1756($t0)
li $t1, 0xffffff
sw $t1, 1760($t0)
li $t1, 0xffffff
sw $t1, 1764($t0)
li $t1, 0xffffff
sw $t1, 1768($t0)
li $t1, 0xffffff
sw $t1, 1772($t0)
li $t1, 0xffffff
sw $t1, 1776($t0)
li $t1, 0xffffff
sw $t1, 1780($t0)
li $t1, 0xffffff
sw $t1, 1784($t0)
li $t1, 0xffffff
sw $t1, 1788($t0)
li $t1, 0xffffff
sw $t1, 1792($t0)
li $t1, 0xffffff
sw $t1, 1796($t0)
li $t1, 0xffffff
sw $t1, 1800($t0)
li $t1, 0xffffff
sw $t1, 1804($t0)
li $t1, 0xffffff
sw $t1, 1808($t0)
li $t1, 0xffffff
sw $t1, 1812($t0)
li $t1, 0xffffff
sw $t1, 1816($t0)
li $t1, 0xffffff
sw $t1, 1820($t0)
li $t1, 0xffffff
sw $t1, 1824($t0)
li $t1, 0xffffff
sw $t1, 1828($t0)
li $t1, 0xffffff
sw $t1, 1832($t0)
li $t1, 0xffffff
sw $t1, 1836($t0)
li $t1, 0xffffff
sw $t1, 1840($t0)
li $t1, 0xffffff
sw $t1, 1844($t0)
li $t1, 0xffffff
sw $t1, 1848($t0)
li $t1, 0xffffff
sw $t1, 1852($t0)
li $t1, 0xffffff
sw $t1, 1856($t0)
li $t1, 0xffffff
sw $t1, 1860($t0)
li $t1, 0xffffff
sw $t1, 1864($t0)
li $t1, 0xffffff
sw $t1, 1868($t0)
li $t1, 0xffffff
sw $t1, 1872($t0)
li $t1, 0xffffff
sw $t1, 1876($t0)
li $t1, 0xffffff
sw $t1, 1880($t0)
li $t1, 0xffffff
sw $t1, 1884($t0)
li $t1, 0xffffff
sw $t1, 1888($t0)
li $t1, 0xffffff
sw $t1, 1892($t0)
li $t1, 0xffffff
sw $t1, 1896($t0)
li $t1, 0xffffff
sw $t1, 1900($t0)
li $t1, 0xffffff
sw $t1, 1904($t0)
li $t1, 0xffffff
sw $t1, 1908($t0)
li $t1, 0xffffff
sw $t1, 1912($t0)
li $t1, 0xffffff
sw $t1, 1916($t0)
li $t1, 0xffffff
sw $t1, 1920($t0)
li $t1, 0xffffff
sw $t1, 1924($t0)
li $t1, 0xffffff
sw $t1, 1928($t0)
li $t1, 0xffffff
sw $t1, 1932($t0)
li $t1, 0xffffff
sw $t1, 1936($t0)
li $t1, 0xffffff
sw $t1, 1940($t0)
li $t1, 0xffffff
sw $t1, 1944($t0)
li $t1, 0xffffff
sw $t1, 1948($t0)
li $t1, 0xffffff
sw $t1, 1952($t0)
li $t1, 0x000000
sw $t1, 1956($t0)
li $t1, 0xffffff
sw $t1, 1960($t0)
li $t1, 0x000000
sw $t1, 1964($t0)
li $t1, 0xffffff
sw $t1, 1968($t0)
li $t1, 0xffffff
sw $t1, 1972($t0)
li $t1, 0x000000
sw $t1, 1976($t0)
li $t1, 0xffffff
sw $t1, 1980($t0)
li $t1, 0x000000
sw $t1, 1984($t0)
li $t1, 0xffffff
sw $t1, 1988($t0)
li $t1, 0xffffff
sw $t1, 1992($t0)
li $t1, 0xffffff
sw $t1, 1996($t0)
li $t1, 0x000000
sw $t1, 2000($t0)
li $t1, 0xffffff
sw $t1, 2004($t0)
li $t1, 0x000000
sw $t1, 2008($t0)
li $t1, 0x000000
sw $t1, 2012($t0)
li $t1, 0x000000
sw $t1, 2016($t0)
li $t1, 0xffffff
sw $t1, 2020($t0)
li $t1, 0xffffff
sw $t1, 2024($t0)
li $t1, 0xffffff
sw $t1, 2028($t0)
li $t1, 0xffffff
sw $t1, 2032($t0)
li $t1, 0xffffff
sw $t1, 2036($t0)
li $t1, 0xffffff
sw $t1, 2040($t0)
li $t1, 0xffffff
sw $t1, 2044($t0)
li $t1, 0xffffff
sw $t1, 2048($t0)
li $t1, 0xffffff
sw $t1, 2052($t0)
li $t1, 0xffffff
sw $t1, 2056($t0)
li $t1, 0xffffff
sw $t1, 2060($t0)
li $t1, 0xffffff
sw $t1, 2064($t0)
li $t1, 0xffffff
sw $t1, 2068($t0)
li $t1, 0xffffff
sw $t1, 2072($t0)
li $t1, 0xffffff
sw $t1, 2076($t0)
li $t1, 0xffffff
sw $t1, 2080($t0)
li $t1, 0x000000
sw $t1, 2084($t0)
li $t1, 0xffffff
sw $t1, 2088($t0)
li $t1, 0x000000
sw $t1, 2092($t0)
li $t1, 0xffffff
sw $t1, 2096($t0)
li $t1, 0xffffff
sw $t1, 2100($t0)
li $t1, 0x000000
sw $t1, 2104($t0)
li $t1, 0xffffff
sw $t1, 2108($t0)
li $t1, 0x000000
sw $t1, 2112($t0)
li $t1, 0x000000
sw $t1, 2116($t0)
li $t1, 0xffffff
sw $t1, 2120($t0)
li $t1, 0x000000
sw $t1, 2124($t0)
li $t1, 0x000000
sw $t1, 2128($t0)
li $t1, 0xffffff
sw $t1, 2132($t0)
li $t1, 0x000000
sw $t1, 2136($t0)
li $t1, 0xffffff
sw $t1, 2140($t0)
li $t1, 0xffffff
sw $t1, 2144($t0)
li $t1, 0x000000
sw $t1, 2148($t0)
li $t1, 0xffffff
sw $t1, 2152($t0)
li $t1, 0xffffff
sw $t1, 2156($t0)
li $t1, 0xffffff
sw $t1, 2160($t0)
li $t1, 0xffffff
sw $t1, 2164($t0)
li $t1, 0xffffff
sw $t1, 2168($t0)
li $t1, 0xffffff
sw $t1, 2172($t0)
li $t1, 0xffffff
sw $t1, 2176($t0)
li $t1, 0xffffff
sw $t1, 2180($t0)
li $t1, 0xffffff
sw $t1, 2184($t0)
li $t1, 0xffffff
sw $t1, 2188($t0)
li $t1, 0xffffff
sw $t1, 2192($t0)
li $t1, 0xffffff
sw $t1, 2196($t0)
li $t1, 0xffffff
sw $t1, 2200($t0)
li $t1, 0xffffff
sw $t1, 2204($t0)
li $t1, 0xffffff
sw $t1, 2208($t0)
li $t1, 0x000000
sw $t1, 2212($t0)
li $t1, 0xffffff
sw $t1, 2216($t0)
li $t1, 0x000000
sw $t1, 2220($t0)
li $t1, 0xffffff
sw $t1, 2224($t0)
li $t1, 0xffffff
sw $t1, 2228($t0)
li $t1, 0x000000
sw $t1, 2232($t0)
li $t1, 0xffffff
sw $t1, 2236($t0)
li $t1, 0x000000
sw $t1, 2240($t0)
li $t1, 0xffffff
sw $t1, 2244($t0)
li $t1, 0x000000
sw $t1, 2248($t0)
li $t1, 0xffffff
sw $t1, 2252($t0)
li $t1, 0x000000
sw $t1, 2256($t0)
li $t1, 0xffffff
sw $t1, 2260($t0)
li $t1, 0x000000
sw $t1, 2264($t0)
li $t1, 0x000000
sw $t1, 2268($t0)
li $t1, 0x000000
sw $t1, 2272($t0)
li $t1, 0xffffff
sw $t1, 2276($t0)
li $t1, 0xffffff
sw $t1, 2280($t0)
li $t1, 0xffffff
sw $t1, 2284($t0)
li $t1, 0xffffff
sw $t1, 2288($t0)
li $t1, 0xffffff
sw $t1, 2292($t0)
li $t1, 0xffffff
sw $t1, 2296($t0)
li $t1, 0xffffff
sw $t1, 2300($t0)
li $t1, 0xffffff
sw $t1, 2304($t0)
li $t1, 0xffffff
sw $t1, 2308($t0)
li $t1, 0xffffff
sw $t1, 2312($t0)
li $t1, 0xffffff
sw $t1, 2316($t0)
li $t1, 0xffffff
sw $t1, 2320($t0)
li $t1, 0xffffff
sw $t1, 2324($t0)
li $t1, 0x000000
sw $t1, 2328($t0)
li $t1, 0xffffff
sw $t1, 2332($t0)
li $t1, 0xffffff
sw $t1, 2336($t0)
li $t1, 0x000000
sw $t1, 2340($t0)
li $t1, 0xffffff
sw $t1, 2344($t0)
li $t1, 0x000000
sw $t1, 2348($t0)
li $t1, 0xffffff
sw $t1, 2352($t0)
li $t1, 0xffffff
sw $t1, 2356($t0)
li $t1, 0x000000
sw $t1, 2360($t0)
li $t1, 0xffffff
sw $t1, 2364($t0)
li $t1, 0x000000
sw $t1, 2368($t0)
li $t1, 0xffffff
sw $t1, 2372($t0)
li $t1, 0xffffff
sw $t1, 2376($t0)
li $t1, 0xffffff
sw $t1, 2380($t0)
li $t1, 0x000000
sw $t1, 2384($t0)
li $t1, 0xffffff
sw $t1, 2388($t0)
li $t1, 0x000000
sw $t1, 2392($t0)
li $t1, 0xffffff
sw $t1, 2396($t0)
li $t1, 0xffffff
sw $t1, 2400($t0)
li $t1, 0xffffff
sw $t1, 2404($t0)
li $t1, 0xffffff
sw $t1, 2408($t0)
li $t1, 0xffffff
sw $t1, 2412($t0)
li $t1, 0xffffff
sw $t1, 2416($t0)
li $t1, 0xffffff
sw $t1, 2420($t0)
li $t1, 0xffffff
sw $t1, 2424($t0)
li $t1, 0xffffff
sw $t1, 2428($t0)
li $t1, 0xffffff
sw $t1, 2432($t0)
li $t1, 0xffffff
sw $t1, 2436($t0)
li $t1, 0xffffff
sw $t1, 2440($t0)
li $t1, 0xffffff
sw $t1, 2444($t0)
li $t1, 0xffffff
sw $t1, 2448($t0)
li $t1, 0xffffff
sw $t1, 2452($t0)
li $t1, 0xffffff
sw $t1, 2456($t0)
li $t1, 0x000000
sw $t1, 2460($t0)
li $t1, 0x000000
sw $t1, 2464($t0)
li $t1, 0xffffff
sw $t1, 2468($t0)
li $t1, 0xffffff
sw $t1, 2472($t0)
li $t1, 0xffffff
sw $t1, 2476($t0)
li $t1, 0x000000
sw $t1, 2480($t0)
li $t1, 0x000000
sw $t1, 2484($t0)
li $t1, 0xffffff
sw $t1, 2488($t0)
li $t1, 0xffffff
sw $t1, 2492($t0)
li $t1, 0x000000
sw $t1, 2496($t0)
li $t1, 0xffffff
sw $t1, 2500($t0)
li $t1, 0xffffff
sw $t1, 2504($t0)
li $t1, 0xffffff
sw $t1, 2508($t0)
li $t1, 0x000000
sw $t1, 2512($t0)
li $t1, 0xffffff
sw $t1, 2516($t0)
li $t1, 0x000000
sw $t1, 2520($t0)
li $t1, 0xffffff
sw $t1, 2524($t0)
li $t1, 0xffffff
sw $t1, 2528($t0)
li $t1, 0xffffff
sw $t1, 2532($t0)
li $t1, 0xffffff
sw $t1, 2536($t0)
li $t1, 0xffffff
sw $t1, 2540($t0)
li $t1, 0xffffff
sw $t1, 2544($t0)
li $t1, 0xffffff
sw $t1, 2548($t0)
li $t1, 0xffffff
sw $t1, 2552($t0)
li $t1, 0xffffff
sw $t1, 2556($t0)
li $t1, 0xffffff
sw $t1, 2560($t0)
li $t1, 0xffffff
sw $t1, 2564($t0)
li $t1, 0xffffff
sw $t1, 2568($t0)
li $t1, 0xffffff
sw $t1, 2572($t0)
li $t1, 0xffffff
sw $t1, 2576($t0)
li $t1, 0xffffff
sw $t1, 2580($t0)
li $t1, 0xffffff
sw $t1, 2584($t0)
li $t1, 0xffffff
sw $t1, 2588($t0)
li $t1, 0xffffff
sw $t1, 2592($t0)
li $t1, 0xffffff
sw $t1, 2596($t0)
li $t1, 0xffffff
sw $t1, 2600($t0)
li $t1, 0xffffff
sw $t1, 2604($t0)
li $t1, 0xffffff
sw $t1, 2608($t0)
li $t1, 0xffffff
sw $t1, 2612($t0)
li $t1, 0xffffff
sw $t1, 2616($t0)
li $t1, 0xffffff
sw $t1, 2620($t0)
li $t1, 0xffffff
sw $t1, 2624($t0)
li $t1, 0xffffff
sw $t1, 2628($t0)
li $t1, 0xffffff
sw $t1, 2632($t0)
li $t1, 0xffffff
sw $t1, 2636($t0)
li $t1, 0xffffff
sw $t1, 2640($t0)
li $t1, 0xffffff
sw $t1, 2644($t0)
li $t1, 0xffffff
sw $t1, 2648($t0)
li $t1, 0xffffff
sw $t1, 2652($t0)
li $t1, 0xffffff
sw $t1, 2656($t0)
li $t1, 0xffffff
sw $t1, 2660($t0)
li $t1, 0xffffff
sw $t1, 2664($t0)
li $t1, 0xffffff
sw $t1, 2668($t0)
li $t1, 0xffffff
sw $t1, 2672($t0)
li $t1, 0xffffff
sw $t1, 2676($t0)
li $t1, 0xffffff
sw $t1, 2680($t0)
li $t1, 0xffffff
sw $t1, 2684($t0)
li $t1, 0xffffff
sw $t1, 2688($t0)
li $t1, 0xffffff
sw $t1, 2692($t0)
li $t1, 0xffffff
sw $t1, 2696($t0)
li $t1, 0xffffff
sw $t1, 2700($t0)
li $t1, 0xffffff
sw $t1, 2704($t0)
li $t1, 0xffffff
sw $t1, 2708($t0)
li $t1, 0xffffff
sw $t1, 2712($t0)
li $t1, 0xffffff
sw $t1, 2716($t0)
li $t1, 0xffffff
sw $t1, 2720($t0)
li $t1, 0xffffff
sw $t1, 2724($t0)
li $t1, 0xffffff
sw $t1, 2728($t0)
li $t1, 0xffffff
sw $t1, 2732($t0)
li $t1, 0xffffff
sw $t1, 2736($t0)
li $t1, 0xffffff
sw $t1, 2740($t0)
li $t1, 0xffffff
sw $t1, 2744($t0)
li $t1, 0xffffff
sw $t1, 2748($t0)
li $t1, 0xffffff
sw $t1, 2752($t0)
li $t1, 0xffffff
sw $t1, 2756($t0)
li $t1, 0xffffff
sw $t1, 2760($t0)
li $t1, 0xffffff
sw $t1, 2764($t0)
li $t1, 0xffffff
sw $t1, 2768($t0)
li $t1, 0xffffff
sw $t1, 2772($t0)
li $t1, 0xffffff
sw $t1, 2776($t0)
li $t1, 0xffffff
sw $t1, 2780($t0)
li $t1, 0xffffff
sw $t1, 2784($t0)
li $t1, 0xffffff
sw $t1, 2788($t0)
li $t1, 0xffffff
sw $t1, 2792($t0)
li $t1, 0xffffff
sw $t1, 2796($t0)
li $t1, 0xffffff
sw $t1, 2800($t0)
li $t1, 0xffffff
sw $t1, 2804($t0)
li $t1, 0xffffff
sw $t1, 2808($t0)
li $t1, 0xffffff
sw $t1, 2812($t0)
li $t1, 0xffffff
sw $t1, 2816($t0)
li $t1, 0xffffff
sw $t1, 2820($t0)
li $t1, 0xffffff
sw $t1, 2824($t0)
li $t1, 0xffffff
sw $t1, 2828($t0)
li $t1, 0xffffff
sw $t1, 2832($t0)
li $t1, 0xffffff
sw $t1, 2836($t0)
li $t1, 0xffffff
sw $t1, 2840($t0)
li $t1, 0x000000
sw $t1, 2844($t0)
li $t1, 0x000000
sw $t1, 2848($t0)
li $t1, 0x000000
sw $t1, 2852($t0)
li $t1, 0x000000
sw $t1, 2856($t0)
li $t1, 0x000000
sw $t1, 2860($t0)
li $t1, 0x000000
sw $t1, 2864($t0)
li $t1, 0x000000
sw $t1, 2868($t0)
li $t1, 0x000000
sw $t1, 2872($t0)
li $t1, 0x000000
sw $t1, 2876($t0)
li $t1, 0x000000
sw $t1, 2880($t0)
li $t1, 0x000000
sw $t1, 2884($t0)
li $t1, 0x000000
sw $t1, 2888($t0)
li $t1, 0x000000
sw $t1, 2892($t0)
li $t1, 0x000000
sw $t1, 2896($t0)
li $t1, 0x000000
sw $t1, 2900($t0)
li $t1, 0x000000
sw $t1, 2904($t0)
li $t1, 0x000000
sw $t1, 2908($t0)
li $t1, 0x000000
sw $t1, 2912($t0)
li $t1, 0xffffff
sw $t1, 2916($t0)
li $t1, 0xffffff
sw $t1, 2920($t0)
li $t1, 0xffffff
sw $t1, 2924($t0)
li $t1, 0xffffff
sw $t1, 2928($t0)
li $t1, 0xffffff
sw $t1, 2932($t0)
li $t1, 0xffffff
sw $t1, 2936($t0)
li $t1, 0xffffff
sw $t1, 2940($t0)
li $t1, 0xffffff
sw $t1, 2944($t0)
li $t1, 0xffffff
sw $t1, 2948($t0)
li $t1, 0xffffff
sw $t1, 2952($t0)
li $t1, 0xffffff
sw $t1, 2956($t0)
li $t1, 0xffffff
sw $t1, 2960($t0)
li $t1, 0xffffff
sw $t1, 2964($t0)
li $t1, 0xffffff
sw $t1, 2968($t0)
li $t1, 0x000000
sw $t1, 2972($t0)
li $t1, 0xffffff
sw $t1, 2976($t0)
li $t1, 0xffffff
sw $t1, 2980($t0)
li $t1, 0xffffff
sw $t1, 2984($t0)
li $t1, 0xffffff
sw $t1, 2988($t0)
li $t1, 0xffffff
sw $t1, 2992($t0)
li $t1, 0xffffff
sw $t1, 2996($t0)
li $t1, 0xffffff
sw $t1, 3000($t0)
li $t1, 0xffffff
sw $t1, 3004($t0)
li $t1, 0xffffff
sw $t1, 3008($t0)
li $t1, 0xffffff
sw $t1, 3012($t0)
li $t1, 0xffffff
sw $t1, 3016($t0)
li $t1, 0xffffff
sw $t1, 3020($t0)
li $t1, 0xffffff
sw $t1, 3024($t0)
li $t1, 0xffffff
sw $t1, 3028($t0)
li $t1, 0xffffff
sw $t1, 3032($t0)
li $t1, 0xffffff
sw $t1, 3036($t0)
li $t1, 0x000000
sw $t1, 3040($t0)
li $t1, 0xffffff
sw $t1, 3044($t0)
li $t1, 0xffffff
sw $t1, 3048($t0)
li $t1, 0xffffff
sw $t1, 3052($t0)
li $t1, 0xffffff
sw $t1, 3056($t0)
li $t1, 0xffffff
sw $t1, 3060($t0)
li $t1, 0xffffff
sw $t1, 3064($t0)
li $t1, 0xffffff
sw $t1, 3068($t0)
li $t1, 0xffffff
sw $t1, 3072($t0)
li $t1, 0xffffff
sw $t1, 3076($t0)
li $t1, 0xffffff
sw $t1, 3080($t0)
li $t1, 0xffffff
sw $t1, 3084($t0)
li $t1, 0xffffff
sw $t1, 3088($t0)
li $t1, 0xffffff
sw $t1, 3092($t0)
li $t1, 0xffffff
sw $t1, 3096($t0)
li $t1, 0x000000
sw $t1, 3100($t0)
li $t1, 0xffffff
sw $t1, 3104($t0)
li $t1, 0x000000
sw $t1, 3108($t0)
li $t1, 0x000000
sw $t1, 3112($t0)
li $t1, 0x000000
sw $t1, 3116($t0)
li $t1, 0xffffff
sw $t1, 3120($t0)
li $t1, 0xffffff
sw $t1, 3124($t0)
li $t1, 0xffffff
sw $t1, 3128($t0)
li $t1, 0xffffff
sw $t1, 3132($t0)
li $t1, 0x000000
sw $t1, 3136($t0)
li $t1, 0x000000
sw $t1, 3140($t0)
li $t1, 0xffffff
sw $t1, 3144($t0)
li $t1, 0xffffff
sw $t1, 3148($t0)
li $t1, 0x000000
sw $t1, 3152($t0)
li $t1, 0x000000
sw $t1, 3156($t0)
li $t1, 0x000000
sw $t1, 3160($t0)
li $t1, 0xffffff
sw $t1, 3164($t0)
li $t1, 0x000000
sw $t1, 3168($t0)
li $t1, 0xffffff
sw $t1, 3172($t0)
li $t1, 0xffffff
sw $t1, 3176($t0)
li $t1, 0xffffff
sw $t1, 3180($t0)
li $t1, 0xffffff
sw $t1, 3184($t0)
li $t1, 0xffffff
sw $t1, 3188($t0)
li $t1, 0xffffff
sw $t1, 3192($t0)
li $t1, 0xffffff
sw $t1, 3196($t0)
li $t1, 0xffffff
sw $t1, 3200($t0)
li $t1, 0xffffff
sw $t1, 3204($t0)
li $t1, 0xffffff
sw $t1, 3208($t0)
li $t1, 0xffffff
sw $t1, 3212($t0)
li $t1, 0xffffff
sw $t1, 3216($t0)
li $t1, 0xffffff
sw $t1, 3220($t0)
li $t1, 0xffffff
sw $t1, 3224($t0)
li $t1, 0x000000
sw $t1, 3228($t0)
li $t1, 0xffffff
sw $t1, 3232($t0)
li $t1, 0x000000
sw $t1, 3236($t0)
li $t1, 0xffffff
sw $t1, 3240($t0)
li $t1, 0xffffff
sw $t1, 3244($t0)
li $t1, 0xffffff
sw $t1, 3248($t0)
li $t1, 0xffffff
sw $t1, 3252($t0)
li $t1, 0xffffff
sw $t1, 3256($t0)
li $t1, 0xffffff
sw $t1, 3260($t0)
li $t1, 0x000000
sw $t1, 3264($t0)
li $t1, 0xffffff
sw $t1, 3268($t0)
li $t1, 0xffffff
sw $t1, 3272($t0)
li $t1, 0xffffff
sw $t1, 3276($t0)
li $t1, 0xffffff
sw $t1, 3280($t0)
li $t1, 0x000000
sw $t1, 3284($t0)
li $t1, 0xffffff
sw $t1, 3288($t0)
li $t1, 0xffffff
sw $t1, 3292($t0)
li $t1, 0x000000
sw $t1, 3296($t0)
li $t1, 0xffffff
sw $t1, 3300($t0)
li $t1, 0xffffff
sw $t1, 3304($t0)
li $t1, 0xffffff
sw $t1, 3308($t0)
li $t1, 0xffffff
sw $t1, 3312($t0)
li $t1, 0xffffff
sw $t1, 3316($t0)
li $t1, 0xffffff
sw $t1, 3320($t0)
li $t1, 0xffffff
sw $t1, 3324($t0)
li $t1, 0xffffff
sw $t1, 3328($t0)
li $t1, 0xffffff
sw $t1, 3332($t0)
li $t1, 0xffffff
sw $t1, 3336($t0)
li $t1, 0xffffff
sw $t1, 3340($t0)
li $t1, 0xffffff
sw $t1, 3344($t0)
li $t1, 0xffffff
sw $t1, 3348($t0)
li $t1, 0xffffff
sw $t1, 3352($t0)
li $t1, 0x000000
sw $t1, 3356($t0)
li $t1, 0xffffff
sw $t1, 3360($t0)
li $t1, 0x000000
sw $t1, 3364($t0)
li $t1, 0x000000
sw $t1, 3368($t0)
li $t1, 0x000000
sw $t1, 3372($t0)
li $t1, 0xffffff
sw $t1, 3376($t0)
li $t1, 0xffffff
sw $t1, 3380($t0)
li $t1, 0xffffff
sw $t1, 3384($t0)
li $t1, 0x000000
sw $t1, 3388($t0)
li $t1, 0x000000
sw $t1, 3392($t0)
li $t1, 0xffffff
sw $t1, 3396($t0)
li $t1, 0xffffff
sw $t1, 3400($t0)
li $t1, 0xffffff
sw $t1, 3404($t0)
li $t1, 0xffffff
sw $t1, 3408($t0)
li $t1, 0x000000
sw $t1, 3412($t0)
li $t1, 0xffffff
sw $t1, 3416($t0)
li $t1, 0xffffff
sw $t1, 3420($t0)
li $t1, 0x000000
sw $t1, 3424($t0)
li $t1, 0xffffff
sw $t1, 3428($t0)
li $t1, 0xffffff
sw $t1, 3432($t0)
li $t1, 0xffffff
sw $t1, 3436($t0)
li $t1, 0xffffff
sw $t1, 3440($t0)
li $t1, 0xffffff
sw $t1, 3444($t0)
li $t1, 0xffffff
sw $t1, 3448($t0)
li $t1, 0xffffff
sw $t1, 3452($t0)
li $t1, 0xffffff
sw $t1, 3456($t0)
li $t1, 0xffffff
sw $t1, 3460($t0)
li $t1, 0xffffff
sw $t1, 3464($t0)
li $t1, 0xffffff
sw $t1, 3468($t0)
li $t1, 0xffffff
sw $t1, 3472($t0)
li $t1, 0xffffff
sw $t1, 3476($t0)
li $t1, 0xffffff
sw $t1, 3480($t0)
li $t1, 0x000000
sw $t1, 3484($t0)
li $t1, 0xffffff
sw $t1, 3488($t0)
li $t1, 0xffffff
sw $t1, 3492($t0)
li $t1, 0xffffff
sw $t1, 3496($t0)
li $t1, 0x000000
sw $t1, 3500($t0)
li $t1, 0xffffff
sw $t1, 3504($t0)
li $t1, 0xffffff
sw $t1, 3508($t0)
li $t1, 0xffffff
sw $t1, 3512($t0)
li $t1, 0x000000
sw $t1, 3516($t0)
li $t1, 0xffffff
sw $t1, 3520($t0)
li $t1, 0xffffff
sw $t1, 3524($t0)
li $t1, 0xffffff
sw $t1, 3528($t0)
li $t1, 0xffffff
sw $t1, 3532($t0)
li $t1, 0xffffff
sw $t1, 3536($t0)
li $t1, 0x000000
sw $t1, 3540($t0)
li $t1, 0xffffff
sw $t1, 3544($t0)
li $t1, 0xffffff
sw $t1, 3548($t0)
li $t1, 0x000000
sw $t1, 3552($t0)
li $t1, 0xffffff
sw $t1, 3556($t0)
li $t1, 0xffffff
sw $t1, 3560($t0)
li $t1, 0xffffff
sw $t1, 3564($t0)
li $t1, 0xffffff
sw $t1, 3568($t0)
li $t1, 0xffffff
sw $t1, 3572($t0)
li $t1, 0xffffff
sw $t1, 3576($t0)
li $t1, 0xffffff
sw $t1, 3580($t0)
li $t1, 0xffffff
sw $t1, 3584($t0)
li $t1, 0xffffff
sw $t1, 3588($t0)
li $t1, 0xffffff
sw $t1, 3592($t0)
li $t1, 0xffffff
sw $t1, 3596($t0)
li $t1, 0xffffff
sw $t1, 3600($t0)
li $t1, 0xffffff
sw $t1, 3604($t0)
li $t1, 0xffffff
sw $t1, 3608($t0)
li $t1, 0x000000
sw $t1, 3612($t0)
li $t1, 0xffffff
sw $t1, 3616($t0)
li $t1, 0x000000
sw $t1, 3620($t0)
li $t1, 0x000000
sw $t1, 3624($t0)
li $t1, 0x000000
sw $t1, 3628($t0)
li $t1, 0xffffff
sw $t1, 3632($t0)
li $t1, 0xffffff
sw $t1, 3636($t0)
li $t1, 0x000000
sw $t1, 3640($t0)
li $t1, 0x000000
sw $t1, 3644($t0)
li $t1, 0xffffff
sw $t1, 3648($t0)
li $t1, 0xffffff
sw $t1, 3652($t0)
li $t1, 0xffffff
sw $t1, 3656($t0)
li $t1, 0xffffff
sw $t1, 3660($t0)
li $t1, 0xffffff
sw $t1, 3664($t0)
li $t1, 0x000000
sw $t1, 3668($t0)
li $t1, 0xffffff
sw $t1, 3672($t0)
li $t1, 0xffffff
sw $t1, 3676($t0)
li $t1, 0x000000
sw $t1, 3680($t0)
li $t1, 0xffffff
sw $t1, 3684($t0)
li $t1, 0xffffff
sw $t1, 3688($t0)
li $t1, 0xffffff
sw $t1, 3692($t0)
li $t1, 0xffffff
sw $t1, 3696($t0)
li $t1, 0xffffff
sw $t1, 3700($t0)
li $t1, 0xffffff
sw $t1, 3704($t0)
li $t1, 0xffffff
sw $t1, 3708($t0)
li $t1, 0xffffff
sw $t1, 3712($t0)
li $t1, 0xffffff
sw $t1, 3716($t0)
li $t1, 0xffffff
sw $t1, 3720($t0)
li $t1, 0xffffff
sw $t1, 3724($t0)
li $t1, 0xffffff
sw $t1, 3728($t0)
li $t1, 0xffffff
sw $t1, 3732($t0)
li $t1, 0xffffff
sw $t1, 3736($t0)
li $t1, 0x000000
sw $t1, 3740($t0)
li $t1, 0xffffff
sw $t1, 3744($t0)
li $t1, 0xffffff
sw $t1, 3748($t0)
li $t1, 0xffffff
sw $t1, 3752($t0)
li $t1, 0xffffff
sw $t1, 3756($t0)
li $t1, 0xffffff
sw $t1, 3760($t0)
li $t1, 0xffffff
sw $t1, 3764($t0)
li $t1, 0xffffff
sw $t1, 3768($t0)
li $t1, 0xffffff
sw $t1, 3772($t0)
li $t1, 0xffffff
sw $t1, 3776($t0)
li $t1, 0xffffff
sw $t1, 3780($t0)
li $t1, 0xffffff
sw $t1, 3784($t0)
li $t1, 0xffffff
sw $t1, 3788($t0)
li $t1, 0xffffff
sw $t1, 3792($t0)
li $t1, 0xffffff
sw $t1, 3796($t0)
li $t1, 0xffffff
sw $t1, 3800($t0)
li $t1, 0xffffff
sw $t1, 3804($t0)
li $t1, 0x000000
sw $t1, 3808($t0)
li $t1, 0xffffff
sw $t1, 3812($t0)
li $t1, 0xffffff
sw $t1, 3816($t0)
li $t1, 0xffffff
sw $t1, 3820($t0)
li $t1, 0xffffff
sw $t1, 3824($t0)
li $t1, 0xffffff
sw $t1, 3828($t0)
li $t1, 0xffffff
sw $t1, 3832($t0)
li $t1, 0xffffff
sw $t1, 3836($t0)
li $t1, 0xffffff
sw $t1, 3840($t0)
li $t1, 0xffffff
sw $t1, 3844($t0)
li $t1, 0xffffff
sw $t1, 3848($t0)
li $t1, 0xffffff
sw $t1, 3852($t0)
li $t1, 0xffffff
sw $t1, 3856($t0)
li $t1, 0xffffff
sw $t1, 3860($t0)
li $t1, 0xffffff
sw $t1, 3864($t0)
li $t1, 0x000000
sw $t1, 3868($t0)
li $t1, 0x000000
sw $t1, 3872($t0)
li $t1, 0x000000
sw $t1, 3876($t0)
li $t1, 0x000000
sw $t1, 3880($t0)
li $t1, 0x000000
sw $t1, 3884($t0)
li $t1, 0x000000
sw $t1, 3888($t0)
li $t1, 0x000000
sw $t1, 3892($t0)
li $t1, 0x000000
sw $t1, 3896($t0)
li $t1, 0x000000
sw $t1, 3900($t0)
li $t1, 0x000000
sw $t1, 3904($t0)
li $t1, 0x000000
sw $t1, 3908($t0)
li $t1, 0x000000
sw $t1, 3912($t0)
li $t1, 0x000000
sw $t1, 3916($t0)
li $t1, 0x000000
sw $t1, 3920($t0)
li $t1, 0x000000
sw $t1, 3924($t0)
li $t1, 0x000000
sw $t1, 3928($t0)
li $t1, 0x000000
sw $t1, 3932($t0)
li $t1, 0x000000
sw $t1, 3936($t0)
li $t1, 0xffffff
sw $t1, 3940($t0)
li $t1, 0xffffff
sw $t1, 3944($t0)
li $t1, 0xffffff
sw $t1, 3948($t0)
li $t1, 0xffffff
sw $t1, 3952($t0)
li $t1, 0xffffff
sw $t1, 3956($t0)
li $t1, 0xffffff
sw $t1, 3960($t0)
li $t1, 0xffffff
sw $t1, 3964($t0)
li $t1, 0xffffff
sw $t1, 3968($t0)
li $t1, 0xffffff
sw $t1, 3972($t0)
li $t1, 0xffffff
sw $t1, 3976($t0)
li $t1, 0xffffff
sw $t1, 3980($t0)
li $t1, 0xffffff
sw $t1, 3984($t0)
li $t1, 0xffffff
sw $t1, 3988($t0)
li $t1, 0xffffff
sw $t1, 3992($t0)
li $t1, 0xffffff
sw $t1, 3996($t0)
li $t1, 0xffffff
sw $t1, 4000($t0)
li $t1, 0xffffff
sw $t1, 4004($t0)
li $t1, 0xffffff
sw $t1, 4008($t0)
li $t1, 0xffffff
sw $t1, 4012($t0)
li $t1, 0xffffff
sw $t1, 4016($t0)
li $t1, 0xffffff
sw $t1, 4020($t0)
li $t1, 0xffffff
sw $t1, 4024($t0)
li $t1, 0xffffff
sw $t1, 4028($t0)
li $t1, 0xffffff
sw $t1, 4032($t0)
li $t1, 0xffffff
sw $t1, 4036($t0)
li $t1, 0xffffff
sw $t1, 4040($t0)
li $t1, 0xffffff
sw $t1, 4044($t0)
li $t1, 0xffffff
sw $t1, 4048($t0)
li $t1, 0xffffff
sw $t1, 4052($t0)
li $t1, 0xffffff
sw $t1, 4056($t0)
li $t1, 0xffffff
sw $t1, 4060($t0)
li $t1, 0xffffff
sw $t1, 4064($t0)
li $t1, 0xffffff
sw $t1, 4068($t0)
li $t1, 0xffffff
sw $t1, 4072($t0)
li $t1, 0xffffff
sw $t1, 4076($t0)
li $t1, 0xffffff
sw $t1, 4080($t0)
li $t1, 0xffffff
sw $t1, 4084($t0)
li $t1, 0xffffff
sw $t1, 4088($t0)
li $t1, 0xffffff
sw $t1, 4092($t0)
	
	lw $s7, 0xffff0000
	beq $s7, 1, keyboardInput2
 	j menu
keyboardInput2:
	lw $t1, 0xffff0004
 	beq $t1, 0x73, respondToS
 	beq $t1, 0x74, respondToT
	j menu
	
start:
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	sw $t0, thirdChar
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	sw $t0, secondChar
	addi $sp, $sp, 4
	lw $t0, 0($sp)
	sw $t0, firstChar
	subi $sp, $sp, 12
	la $t8, displayArray # $t8 holds address of displayArray
	jal clearScreen # Make sure screen is cleared
	addi $t1, $zero, -100
	sw $t1, platformNext
	addi $t1, $zero, 164
	sw $t1, platformUp
	addi $t1, $zero, 565
	sw $t1, platformMid
	addi $t1, $zero, 937
	sw $t1, platformDown
	addi $t1, $zero, 0
	sw $t1, platformDone
	addi $t1, $zero, 0
	sw $t1, scoreCounter
	addi $s1, $zero, 655 #tracks the position of the doodler
	add $a0, $zero, $s1 # drawing platform at location 655
	jal placeDoodler
	add $s0, $zero, $zero # Initialize $s0 = 0 where $s0 = 0 if falling and 1 if jumpimg
	add $s2, $zero, $zero # $s2 stores the number of times the doddler has gone up
	add $s3, $zero, $zero #  $s3 = 1 iff platforms are falling 0 otherwise
	add $s4, $zero, $zero # $s4 stores the number of times the platforms went down
	addi $a0, $zero, 164 # drawing platform at location 164
	addi $a1, $zero, 565 # drawing platform at location 565
	addi $a2, $zero, 937 # drawing platform at location 937
	addi $a3, $zero, -100 # drawing platform at location -100
	jal addPlatforms
	lw $t0, gameMode
	beq $t0, 1, main

start2:
	lw $s5, doodler2Position
	addi $s5, $zero, 651 # $s5 tracks the position of the doodler2
	sw $s5, doodler2Position
	add $a0, $zero, $s5 # drawing platform at location 655
	jal placeDoodler2
	add $s6, $zero, $zero # Initialize $s6 = 0 where $s0 = 0 if falling and 1 if jumpimg
	lw $s7, doodler2UpCounter
	add $s7, $zero, $zero # $s7 stores the number of times the doddler has gone up
	sw $s7, doodler2UpCounter
	
main:
	lw $t1, loopCounter
	beq $t1, 3, playSound
	addi $t1, $t1, 1
	sw $t1, loopCounter
	j rest
playSound:
	lw $t4, bgPitch # load bgPitch
	lw $t5, bgLimitCount # load bgLimitCount
	ble $t5, 5, playUp # check if bgCount <= 5 then branch to reverse
	ble $t5, 10, playDown # else play down
	add $t5, $zero, $zero
	sw $t5, bgLimitCount
	j playSound
playUp:
	addi $t4, $t4, 1
	sw $t4, bgPitch
	addi $t5, $t5, 1
	sw $t5, bgLimitCount
	li $v0, 31
	add $a0, $zero, $t4
	addi $a1, $zero, 400
	addi $a2, $zero, 90
	syscall
	add $t1, $zero, $zero
	sw $t1, loopCounter
	j rest
playDown:
	addi $t4, $t4, -1
	sw $t4, bgPitch
	addi $t5, $t5, 1
	sw $t5, bgLimitCount
	li $v0, 31
	add $a0, $zero, $t4
	addi $a1, $zero, 400
	addi $a2, $zero, 90
	syscall
	add $t1, $zero, $zero
	sw $t1, loopCounter	
rest:
	lw $s7, 0xffff0000
	beq $s7, 1, keyboardInput
 	j mainCont
keyboardInput:
	lw $t1, 0xffff0004
 	beq $t1, 0x6b, respondToK
 	beq $t1, 0x6a, respondToJ
 	beq $t1, 0x73, respondToS
 	beq $t1, 0x78, respondToX
 	beq $t1, 0x7A, respondToZ
 	beq $t1, 0x74, respondToT
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
 	j mainCont
respondToX:
 	lw $s5, doodler2Position
	addi $a0, $s5, 1 # drawing platform at location 
	addi $s5, $s5, 1
	sw $s5, doodler2Position
 	jal placeDoodler2
 	j mainCont
 respondToZ:
 	lw $s5, doodler2Position
	addi $a0, $s5, -1 # drawing platform at location 
	addi $s5, $s5, -1
	sw $s5, doodler2Position
 	jal placeDoodler2
 	j mainCont
respondToS:
	addi $t0, $zero, 1
	sw $t0, gameMode # gameMode = 1
	j start
respondToT:
	addi $t0, $zero, 2
	sw $t0, gameMode # gameMode = 2
	j start
mainCont:
	jal printName
	jal paintBackground
	beq $s0, 0, fall 
	beq $s0, 1, jump
	lw $t0, gameMode
	beq $t0, 1, mainCont3
mainCont2:
	beq $s6, 0, fall2
	beq $s6, 1 jump2
mainCont3:
	beq $s3, 1, platformFall
	li $v0, 32 # Sleep
 	li $a0, 0
	syscall
	j main
	
	
fall:
	addi $a0, $s1, 32 
	addi $s1, $s1, 32
	jal placeDoodler
	lw $t0, gameMode
	beq $t0, 1, mainCont3
	j mainCont2

jump:
	beq $s2, 14, toggle
	addi $s2, $s2, 1
	addi $a0, $s1, -32 
	jal placeDoodler
	addi $s1, $s1, -32
	ble $s1, 193, flip2
	lw $t0, gameMode
	beq $t0, 1, mainCont3
	j mainCont2
	
fall2:
	lw $s5, doodler2Position
	addi $a0, $s5, 32 
	addi $s5, $s5, 32
	sw $s5, doodler2Position
	jal placeDoodler2
	j mainCont3

jump2:
	lw $s7, doodler2UpCounter
	beq $s7, 14, toggle3
	addi $s7, $s7, 1
	sw $s7, doodler2UpCounter
	lw $s5, doodler2Position
	addi $a0, $s5, -32 
	jal placeDoodler2
	addi $s5, $s5, -32
	sw $s5, doodler2Position
	ble $s5, 193, flip2
	j mainCont3
	

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

toggle3:
	add $s7, $zero, $zero # Reset counter
	sw $s7, doodler2UpCounter
	add $s6, $zero, $zero # Toggle $s6
	j main
	
toggle2:
	lw $t7, doodler2UpCounter
	addi $s0, $zero, 0
	addi $s6, $zero, 0
	addi $s2, $zero, 0
	addi $s7, $zero, 0
	sw $s7, doodler2UpCounter
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
	lw $t0, displayAddress
	add $t9, $t0, $t6 # t9 = addr(displayAddress + offset)
	lw $t3, 0($t7)
	sw $t3, 0($t9) # displayAddress + i = displayArray[i]
	addi $t4, $t4, 1
	j paintBackgroundLoop
endPaintBackground: 
	jr $ra

printName:
	add $t3, $zero, $zero
	la $t7, displayArray
printNameLoop:
	bge $t3, 3, endPaintBackground
	beq $t3, 0, handleFirstLetter
	beq $t3, 1, handleSecondLetter
	beq $t3, 2, handleThirdLetter
handleFirstLetter:
	lw $t4, firstChar
	add $a0, $t4, $zero
	li $v0, 11
	syscall
	beq $t4, 'A', A
	 beq $t4, 'B', B
	 beq $t4, 'C', C
	 beq $t4, 'D', D
	 beq $t4, 'E', E
	 beq $t4, 'F', F
	 beq $t4, 'G', G
	 beq $t4, 'H', H
	 beq $t4, 'I', I
	 beq $t4, 'J', J
	 beq $t4, 'K', K
	 beq $t4, 'L', L
	 beq $t4, 'M', M
	 beq $t4, 'N', N
	 beq $t4, 'O', O
	 beq $t4, 'P', P
	 beq $t4, 'Q', Q
	 beq $t4, 'R', R
	 beq $t4, 'S', S
	 beq $t4, 'T', T
	 beq $t4, 'U', U
	 beq $t4, 'V', V
	 beq $t4, 'W', W
	 beq $t4, 'X', X
	 beq $t4, 'Y', Y
	 beq $t4, 'Z', Z
	 addi $t3, $t3, 1
	 j printNameLoop
	
handleSecondLetter:
	lw $t4, secondChar
	addi $t7, $t7, 16
	beq $t4, 'A', A
	 beq $t4, 'B', B
	 beq $t4, 'C', C
	 beq $t4, 'D', D
	 beq $t4, 'E', E
	 beq $t4, 'F', F
	 beq $t4, 'G', G
	 beq $t4, 'H', H
	 beq $t4, 'I', I
	 beq $t4, 'J', J
	 beq $t4, 'K', K
	 beq $t4, 'L', L
	 beq $t4, 'M', M
	 beq $t4, 'N', N
	 beq $t4, 'O', O
	 beq $t4, 'P', P
	 beq $t4, 'Q', Q
	 beq $t4, 'R', R
	 beq $t4, 'S', S
	 beq $t4, 'T', T
	 beq $t4, 'U', U
	 beq $t4, 'V', V
	 beq $t4, 'W', W
	 beq $t4, 'X', X
	 beq $t4, 'Y', Y
	 beq $t4, 'Z', Z
	 addi $t3, $t3, 1
	 j printNameLoop

handleThirdLetter:
	lw $t4, thirdChar
	addi $t7, $t7, 16
	beq $t4, 'A', A
	 beq $t4, 'B', B
	 beq $t4, 'C', C
	 beq $t4, 'D', D
	 beq $t4, 'E', E
	 beq $t4, 'F', F
	 beq $t4, 'G', G
	 beq $t4, 'H', H
	 beq $t4, 'I', I
	 beq $t4, 'J', J
	 beq $t4, 'K', K
	 beq $t4, 'L', L
	 beq $t4, 'M', M
	 beq $t4, 'N', N
	 beq $t4, 'O', O
	 beq $t4, 'P', P
	 beq $t4, 'Q', Q
	 beq $t4, 'R', R
	 beq $t4, 'S', S
	 beq $t4, 'T', T
	 beq $t4, 'U', U
	 beq $t4, 'V', V
	 beq $t4, 'W', W
	 beq $t4, 'X', X
	 beq $t4, 'Y', Y
	 beq $t4, 'Z', Z
	 addi $t3, $t3, 1
	 j printNameLoop
A:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 4($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
B:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 516($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
C:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 4($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 516($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
D:
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 516($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
E:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 4($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 516($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
F:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 4($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 512($t7)
addi $t3, $t3, 1
j printNameLoop
G:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 4($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 516($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
H:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
I:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 4($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 132($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 388($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 516($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
J:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 4($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 516($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
K:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 132($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
L:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 516($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
M:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 132($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
N:
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
O:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 4($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 516($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
P:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 4($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 512($t7)
addi $t3, $t3, 1
j printNameLoop
Q:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 4($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
R:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 132($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 512($t7)
addi $t3, $t3, 1
j printNameLoop
S:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 4($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 516($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
T:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 4($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 132($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 388($t7)
li $t1, 0x000000
sw $t1, 516($t7)
addi $t3, $t3, 1
j printNameLoop
U:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 516($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
V:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 516($t7)
addi $t3, $t3, 1
j printNameLoop
W:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 388($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
X:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 392($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop
Y:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 128($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 388($t7)
li $t1, 0x000000
sw $t1, 516($t7)
addi $t3, $t3, 1
j printNameLoop
Z:
li $t1, 0x000000
sw $t1, 0($t7)
li $t1, 0x000000
sw $t1, 4($t7)
li $t1, 0x000000
sw $t1, 8($t7)
li $t1, 0x000000
sw $t1, 136($t7)
li $t1, 0x000000
sw $t1, 256($t7)
li $t1, 0x000000
sw $t1, 260($t7)
li $t1, 0x000000
sw $t1, 264($t7)
li $t1, 0x000000
sw $t1, 384($t7)
li $t1, 0x000000
sw $t1, 512($t7)
li $t1, 0x000000
sw $t1, 516($t7)
li $t1, 0x000000
sw $t1, 520($t7)
addi $t3, $t3, 1
j printNameLoop

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
	lw $t2, 0($t7) # load top pixel
	lw $t1, yellow
	beq $t4, $t6, flip
	beq $t5, $t6, flip
	beq $t2, $t6, redrawBrown
drawUnitCont:
	sw $t1, 0($t7)
	sw $t1, 124($t7)
	sw $t1, 128($t7)
	sw $t1, 132($t7)
	sw $t1, 252($t7)
	sw $t1, 260($t7)

	j endPaintBackground
	
redrawBrown:
	sw $t6, 0($t7)
	j drawUnitCont
	
placeDoodler2:
	add $t4, $zero, $zero # $t4 = 0
	addi $t5, $zero, 4092 # $t5 = 4092
placeLoop2:
	bge $t4, $t5, draw3
	sll $t6, $t4, 2
	add $t7, $t8, $t6 # $t7 = addr(displayArray[i])
	lw $t3, 0($t7)
	addi $t4, $t4, 1
	lw $t1, red
	beq $t3, $t1, clear3
	j placeLoop2
clear3:
	lw $t9, blue # load blue
	sw $t9, 0($t7) # store blue in old address
	j placeLoop2
draw3:
	add $t4, $zero, $zero # $t4 = 0
	addi $t5, $zero, 4092 # $t5 = 4092
drawLoop3:
	bge $t4, $t5, endPaintBackground
	bge $a0, 1025, gameOver
	beq $t4, $a0, drawUnit2
	sll $t6, $t4, 2
	add $t7, $t8, $t6 # $t7 = addr(displayArray[i])
	addi $t4, $t4, 1
	j drawLoop3
drawUnit2:
	lw $t6, brown
	lw $t4, 264($t7) # load bottom pixel
	lw $t5, 248($t7) # load bottom pixel
	lw $t2, 0($t7) # load top pixel
	lw $t1, red
	beq $t4, $t6, flip3
	beq $t5, $t6, flip3
drawUnitCont2:
	sw $t1, 0($t7)
	sw $t1, 124($t7)
	sw $t1, 128($t7)
	sw $t1, 132($t7)
	sw $t1, 248($t7)
	sw $t1, 264($t7)

	j endPaintBackground



flip:
	#PLAY SOUND EFFECT
	li $v0, 31
	addi $a0, $zero, 20
	addi $a1, $zero, 400
	addi $a2, $zero, 127
	syscall
	addi $s0, $zero, 1
	j endPaintBackground
	
flip3:
	#PLAY SOUND EFFECT
	li $v0, 31
	addi $a0, $zero, 20
	addi $a1, $zero, 400
	addi $a2, $zero, 127
	syscall
	addi $s6, $zero, 1
	j endPaintBackground
flip2:
	addi $s0, $zero, -1 #indicates doodle should remain in position
	addi $s6, $zero, -1 #indicates doodle2 should remain in position
	addi $s3, $zero, 1 #indicate platform falling
	lw $t1, scoreCounter
	addi $t1, $t1, 1
	sw $t1, scoreCounter
	# Create position of new platform
	li $v0, 42
	li $a0, 0
	li $a1, 23
	syscall
	addi $t1, $a0, -223
	sw $t1, platformNext # Store it 
	j main
addPlatform:
	lw $t1, scoreCounter
	add $t4, $zero, $zero # $t4 = 0
	ble $t1, 5, platform5
	ble $t1, 10, platform10
	ble $t1, 15, platform15
	ble $t1, 20, platform20
	addi $t5, $a0, 1 # $t5 = $a0 + 32
	j addPlatformLoop
platform5:
	addi $t5, $a0, 8 # $t5 = $a0 + 32
	j addPlatformLoop
platform10:
	addi $t5, $a0, 6 # $t5 = $a0 + 32
	j addPlatformLoop
platform15:
	addi $t5, $a0, 3 # $t5 = $a0 + 32
	j addPlatformLoop
platform20:
	addi $t5, $a0, 2 # $t5 = $a0 + 32
	j addPlatformLoop
addPlatformLoop:
	bge $t4, $a0, placePlatform
cont:	bge $t4, $t5, endPaintBackground
	sll $t6, $t4, 2
	addi $t4, $t4, 1
	j addPlatformLoop
placePlatform:
	add $t7, $t8, $t6 # $t7 = addr(displayArray[i])
	lw $t2, brown
	sw $t2, 0($t7)
	j cont

addPlatforms:
	# Clear previous 
	add $t4, $zero, $zero # $t4 = 0 
	addi $t5, $zero, 4092 # $t5 = 4092 
addPlatformsLoop:
	bge $t4, $t5, drawPlatforms
	lw $t2, brown
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
	addi $s6, $zero, 0
	lw $t1, darkBlue
	# G
	sw $t1, 1296($t8)
	sw $t1, 1300($t8)
	sw $t1, 1304($t8)
	sw $t1, 1424($t8)
	sw $t1, 1552($t8)
	sw $t1, 1680($t8)
 	sw $t1, 1808($t8)
 	sw $t1, 1936($t8)
 	sw $t1, 1940($t8)
 	sw $t1, 1944($t8)
 	sw $t1, 1948($t8)
 	sw $t1, 1820($t8)
 	sw $t1, 1692($t8)
 	sw $t1, 1688($t8)
 	# A
 	sw $t1, 1956($t8)
 	sw $t1, 1828($t8)
 	sw $t1, 1700($t8)
 	sw $t1, 1572($t8)
 	sw $t1, 1444($t8)
 	sw $t1, 1316($t8)
 	sw $t1, 1320($t8)
 	sw $t1, 1324($t8)
 	
 	sw $t1, 1968($t8)
 	sw $t1, 1840($t8)
 	sw $t1, 1712($t8)
 	sw $t1, 1584($t8)
 	sw $t1, 1456($t8)
 	sw $t1, 1328($t8)
 	sw $t1, 1704($t8)
 	sw $t1, 1708($t8)
 	
 	# M
 	sw $t1, 1976($t8)
 	sw $t1, 1848($t8)
 	sw $t1, 1720($t8)
 	sw $t1, 1592($t8)
 	sw $t1, 1464($t8)
 	sw $t1, 1336($t8)
 	sw $t1, 1328($t8)
 	
	sw $t1, 1468($t8)
	sw $t1, 1600($t8)
	sw $t1, 1476($t8)
	sw $t1, 1352($t8)
	
	sw $t1, 1480($t8)
	sw $t1, 1608($t8)
	sw $t1, 1736($t8)
	sw $t1, 1864($t8)
	sw $t1, 1992($t8)
	
	# E
	sw $t1, 1360($t8)
	sw $t1, 1488($t8)
	sw $t1, 1616($t8)
	sw $t1, 1744($t8)
	sw $t1, 1872($t8)
	sw $t1, 2000($t8)
	
	
	sw $t1, 1364($t8)
	sw $t1, 1368($t8)
	sw $t1, 1372($t8)
	sw $t1, 1620($t8)
	sw $t1, 1624($t8)
	sw $t1, 2004($t8)
	sw $t1, 2008($t8)
	sw $t1, 2012($t8)
	
	# O
	sw $t1, 2212($t8)
	sw $t1, 2340($t8)
	sw $t1, 2468($t8)
	sw $t1, 2596($t8)
	sw $t1, 2724($t8)
	sw $t1, 2852($t8)
	
	sw $t1, 2216($t8)
	sw $t1, 2220($t8)
	sw $t1, 2224($t8)
	
	sw $t1, 2856($t8)
	sw $t1, 2860($t8)
	sw $t1, 2864($t8)
	
	sw $t1, 2736($t8)
	sw $t1, 2608($t8)
	sw $t1, 2480($t8)
	sw $t1, 2352($t8)
	
	# V
	sw $t1, 2232($t8)
	sw $t1, 2360($t8)
	sw $t1, 2488($t8)
	sw $t1, 2616($t8)
	sw $t1, 2748($t8)
	sw $t1, 2880($t8)
	
	sw $t1, 2756($t8)
	sw $t1, 2632($t8)
	sw $t1, 2504($t8)
	sw $t1, 2376($t8)
	sw $t1, 2248($t8)
	
	# E
	sw $t1, 2256($t8)
	sw $t1, 2384($t8)
	sw $t1, 2512($t8)
	sw $t1, 2640($t8)
	sw $t1, 2768($t8)
	sw $t1, 2896($t8)

	sw $t1, 2260($t8)
	sw $t1, 2264($t8)
	sw $t1, 2268($t8)
	sw $t1, 2516($t8)
	sw $t1, 2520($t8)
	sw $t1, 2900($t8)
	sw $t1, 2904($t8)
	sw $t1, 2908($t8)	
	
	# R
	sw $t1, 2276($t8)
	sw $t1, 2404($t8)
	sw $t1, 2532($t8)
	sw $t1, 2660($t8)
	sw $t1, 2788($t8)
	sw $t1, 2916($t8)
	
	sw $t1, 2280($t8)
	sw $t1, 2284($t8)
	sw $t1, 2416($t8)
	sw $t1, 2540($t8)
	sw $t1, 2536($t8)
	sw $t1, 2668($t8)
	sw $t1, 2800($t8)
	sw $t1, 2932($t8)
	j endPaintBackground

clearScreen:
	add $t4, $zero, $zero # $t4 = 0
	addi $t5, $zero, 4092 # $t5 = 4092
clearScreenLoop:
	bge $t4, $t5, endPaintBackground
	sll $t6, $t4, 2
	add $t7, $t8, $t6 # $t7 = addr(displayArray[i])
	lw $t1, blue
	sw $t1, 0($t7)
	addi $t4, $t4, 1
	j clearScreenLoop
endgame:
	
	
