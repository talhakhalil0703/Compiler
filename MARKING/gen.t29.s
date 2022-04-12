.data
true_boolean:
	.byte 84 82 85 69 0
	.align 2
false_boolean:
	.byte 70 65 76 83 69 0
	.align 2
div_by_zero:
	.byte  100 105 118 105 115 105 111 110 32 98 121 32 122 101 114 111 0
	.align 2
char:
	.space 2
GLOBAL_VAR_a: 
.word 0
GLOBAL_VAR_b: 
.word 0
GLOBAL_VAR_c: 
.word 0
string_L0:
	.byte 101 118 97 108 117 97 116 101 100 32 65 10 0 # evaluated A\n
	.align 2
string_L1:
	.byte 102 117 110 99 116 105 111 110 32 34 65 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "A" must return a value
	.align 2
string_L2:
	.byte 101 118 97 108 117 97 116 101 100 32 66 10 0 # evaluated B\n
	.align 2
string_L3:
	.byte 102 117 110 99 116 105 111 110 32 34 66 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "B" must return a value
	.align 2
string_L4:
	.byte 101 118 97 108 117 97 116 101 100 32 67 10 0 # evaluated C\n
	.align 2
string_L5:
	.byte 102 117 110 99 116 105 111 110 32 34 67 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "C" must return a value
	.align 2
string_L6:
	.byte 105 102 32 40 40 65 32 38 38 32 66 41 32 124 124 32 67 41 32 123 46 46 46 125 32 101 108 115 101 32 123 46 46 46 125 44 32 119 105 116 104 32 65 61 0 # if ((A && B) || C) {...} else {...}, with A=
	.align 2
string_L7:
	.byte 32 66 61 0 #  B=
	.align 2
string_L8:
	.byte 32 67 61 0 #  C=
	.align 2
string_L9:
	.byte 10 0 # \n
	.align 2
string_L16:
	.byte 105 102 45 112 97 114 116 32 101 120 101 99 117 116 101 100 10 0 # if-part executed\n
	.align 2
string_L17:
	.byte 101 108 115 101 45 112 97 114 116 32 101 120 101 99 117 116 101 100 10 0 # else-part executed\n
	.align 2
string_L18:
	.byte 120 32 61 32 40 65 32 38 38 32 33 66 41 32 124 124 32 67 44 32 119 105 116 104 32 65 61 0 # x = (A && !B) || C, with A=
	.align 2
string_L19:
	.byte 32 66 61 0 #  B=
	.align 2
string_L20:
	.byte 32 67 61 0 #  C=
	.align 2
string_L21:
	.byte 10 0 # \n
	.align 2
string_L26:
	.byte 120 61 0 # x=
	.align 2
string_L27:
	.byte 10 0 # \n
	.align 2
string_L28:
	.byte 10 0 # \n
	.align 2
string_L29:
	.byte 10 0 # \n
	.align 2
string_L30:
	.byte 10 0 # \n
	.align 2
string_L31:
	.byte 10 0 # \n
	.align 2
string_L32:
	.byte 10 0 # \n
	.align 2
string_L33:
	.byte 10 0 # \n
	.align 2
string_L34:
	.byte 10 0 # \n
	.align 2
string_L35:
	.byte 10 0 # \n
	.align 2
string_L36:
	.byte 10 0 # \n
	.align 2
string_L37:
	.byte 10 0 # \n
	.align 2
string_L38:
	.byte 10 0 # \n
	.align 2
string_L39:
	.byte 10 0 # \n
	.align 2
string_L40:
	.byte 10 0 # \n
	.align 2
string_L41:
	.byte 10 0 # \n
	.align 2
string_L42:
	.byte 10 0 # \n
	.align 2

.text
Lprinti:
	li $v0, 1
	syscall
	jr $ra
Lgetchar:
	li $v0, 8
	la $a0, char
	li $a1, 2
	syscall
	lbu $a0, char
	beqz $a0, Leof
	move $v0, $a0
	jr $ra
Leof:
	li $v0, -1
	jr $ra
Lprintc:
	li $v0, 11
	syscall
	jr $ra
Lprints:
	li $v0, 4
	syscall
	jr $ra
Lprintb:
	beqz $a0, Lfalse
	la $a0, true_boolean
	j Lprintb2
Lfalse:
	la $a0, false_boolean
Lprintb2:
	li $v0, 4
	syscall
	jr $ra
Lhalt:
	li $v0, 10
	syscall
error:
	jal Lprints
	j Lhalt

.globl FUNCTION_A
FUNCTION_A:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	la $a0, string_L0
	jal Lprints
	lw $t0, GLOBAL_VAR_a
	move $v0, $t0
	j return_label
	la $a0, string_L1
	j error
.globl FUNCTION_B
FUNCTION_B:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	la $a0, string_L2
	jal Lprints
	lw $t0, GLOBAL_VAR_b
	move $v0, $t0
	j return_label
	la $a0, string_L3
	j error
.globl FUNCTION_C
FUNCTION_C:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	la $a0, string_L4
	jal Lprints
	lw $t0, GLOBAL_VAR_c
	move $v0, $t0
	j return_label
	la $a0, string_L5
	j error
.globl FUNCTION_eval
FUNCTION_eval:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
	move $t1, $a1
	move $t2, $a2
	la $t3, GLOBAL_VAR_a
	sw $t0, 0($t3)
	la $t3, GLOBAL_VAR_b
	sw $t1, 0($t3)
	la $t3, GLOBAL_VAR_c
	sw $t2, 0($t3)
	la $a0, string_L6
	jal Lprints
	lw $t3, GLOBAL_VAR_a
	move $a0, $t3
	jal Lprintb
	la $a0, string_L7
	jal Lprints
	lw $t3, GLOBAL_VAR_b
	move $a0, $t3
	jal Lprintb
	la $a0, string_L8
	jal Lprints
	lw $t3, GLOBAL_VAR_c
	move $a0, $t3
	jal Lprintb
	la $a0, string_L9
	jal Lprints
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_A
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	seq $t4, $t3, $0
	beqz $t4, and_falseL15beqz
	j and_falseL15
and_falseL15beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_B
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	seq $t4, $t3, $0
	beqz $t4, and_falseL15beqz2
	j and_falseL15
and_falseL15beqz2:
	li $t3, 1
	j and_doneL14
and_falseL15:
	li $t3, 0
and_doneL14:
	sne $t4, $t3, $0
	beqz $t4, or_trueL13beqz
	j or_trueL13
or_trueL13beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_C
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	sne $t4, $t3, $0
	beqz $t4, or_trueL13beqz2
	j or_trueL13
or_trueL13beqz2:
	li $t3, 0
	j or_doneL12
or_trueL13:
	li $t3, 1
or_doneL12:
	seq $t4, $t3, $0
	beqz $t4, else_L10beqz
	j else_L10
else_L10beqz:
	la $a0, string_L16
	jal Lprints
	j end_ifL11
else_L10:
	la $a0, string_L17
	jal Lprints
end_ifL11:
	j return_label
.globl FUNCTION_assign
FUNCTION_assign:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
	move $t1, $a1
	move $t2, $a2
	la $t3, GLOBAL_VAR_a
	sw $t0, 0($t3)
	la $t3, GLOBAL_VAR_b
	sw $t1, 0($t3)
	la $t3, GLOBAL_VAR_c
	sw $t2, 0($t3)
	la $a0, string_L18
	jal Lprints
	lw $t3, GLOBAL_VAR_a
	move $a0, $t3
	jal Lprintb
	la $a0, string_L19
	jal Lprints
	lw $t3, GLOBAL_VAR_b
	move $a0, $t3
	jal Lprintb
	la $a0, string_L20
	jal Lprints
	lw $t3, GLOBAL_VAR_c
	move $a0, $t3
	jal Lprintb
	la $a0, string_L21
	jal Lprints
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_A
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t4, $v0
	seq $t5, $t4, $0
	beqz $t5, and_falseL25beqz
	j and_falseL25
and_falseL25beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_B
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t4, $v0
	xori $t5, $t4, 1
	seq $t4, $t5, $0
	beqz $t4, and_falseL25beqz2
	j and_falseL25
and_falseL25beqz2:
	li $t5, 1
	j and_doneL24
and_falseL25:
	li $t5, 0
and_doneL24:
	sne $t4, $t5, $0
	beqz $t4, or_trueL23beqz
	j or_trueL23
or_trueL23beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_C
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t5, $v0
	sne $t4, $t5, $0
	beqz $t4, or_trueL23beqz2
	j or_trueL23
or_trueL23beqz2:
	li $t5, 0
	j or_doneL22
or_trueL23:
	li $t5, 1
or_doneL22:
	move $t3, $t5
	la $a0, string_L26
	jal Lprints
	move $a0, $t3
	jal Lprintb
	la $a0, string_L27
	jal Lprints
	j return_label
.globl main
main:
	li $t0, 0
	li $t1, 0
	li $t2, 0
	move $a0, $t0
	move $a1, $t1
	move $a2, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_eval
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L28
	jal Lprints
	li $t2, 0
	li $t1, 0
	li $t0, 1
	move $a0, $t2
	move $a1, $t1
	move $a2, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_eval
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L29
	jal Lprints
	li $t0, 0
	li $t1, 1
	li $t2, 0
	move $a0, $t0
	move $a1, $t1
	move $a2, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_eval
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L30
	jal Lprints
	li $t2, 0
	li $t1, 1
	li $t0, 1
	move $a0, $t2
	move $a1, $t1
	move $a2, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_eval
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L31
	jal Lprints
	li $t0, 1
	li $t1, 0
	li $t2, 0
	move $a0, $t0
	move $a1, $t1
	move $a2, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_eval
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L32
	jal Lprints
	li $t2, 1
	li $t1, 0
	li $t0, 1
	move $a0, $t2
	move $a1, $t1
	move $a2, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_eval
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L33
	jal Lprints
	li $t0, 1
	li $t1, 1
	li $t2, 0
	move $a0, $t0
	move $a1, $t1
	move $a2, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_eval
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L34
	jal Lprints
	li $t2, 1
	li $t1, 1
	li $t0, 1
	move $a0, $t2
	move $a1, $t1
	move $a2, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_eval
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L35
	jal Lprints
	li $t0, 0
	li $t1, 0
	li $t2, 0
	move $a0, $t0
	move $a1, $t1
	move $a2, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_assign
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L36
	jal Lprints
	li $t2, 0
	li $t1, 0
	li $t0, 1
	move $a0, $t2
	move $a1, $t1
	move $a2, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_assign
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L37
	jal Lprints
	li $t0, 0
	li $t1, 1
	li $t2, 0
	move $a0, $t0
	move $a1, $t1
	move $a2, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_assign
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L38
	jal Lprints
	li $t2, 0
	li $t1, 1
	li $t0, 1
	move $a0, $t2
	move $a1, $t1
	move $a2, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_assign
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L39
	jal Lprints
	li $t0, 1
	li $t1, 0
	li $t2, 0
	move $a0, $t0
	move $a1, $t1
	move $a2, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_assign
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L40
	jal Lprints
	li $t2, 1
	li $t1, 0
	li $t0, 1
	move $a0, $t2
	move $a1, $t1
	move $a2, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_assign
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L41
	jal Lprints
	li $t0, 1
	li $t1, 1
	li $t2, 0
	move $a0, $t0
	move $a1, $t1
	move $a2, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_assign
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L42
	jal Lprints
	li $t2, 1
	li $t1, 1
	li $t0, 1
	move $a0, $t2
	move $a1, $t1
	move $a2, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_assign
# REGISTER RECOVERY
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	j Lhalt
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

