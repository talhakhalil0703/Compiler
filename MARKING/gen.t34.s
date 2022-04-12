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
GLOBAL_VAR_d: 
.word 0
string_L0:
	.byte 102 117 110 99 116 105 111 110 32 34 102 111 111 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "foo" must return a value
	.align 2
string_L1:
	.byte 102 117 110 99 116 105 111 110 32 34 98 97 114 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "bar" must return a value
	.align 2
string_L2:
	.byte 102 117 110 99 116 105 111 110 32 34 98 97 122 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "baz" must return a value
	.align 2
string_L3:
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

.globl FUNCTION_foo
FUNCTION_foo:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
	move $t1, $a1
	move $t2, $a2
	move $t3, $a3
	mul $t4, $t2, $t3
	mul $t5, $t1, $t4
	mul $t4, $t0, $t5
	move $v0, $t4
	j return_label
	la $a0, string_L0
	j error
.globl FUNCTION_bar
FUNCTION_bar:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
	move $t1, $a1
	move $t2, $a2
	lw $t3, GLOBAL_VAR_d
	li $t4, 3
	subu $t5, $t3, $t4
	move $a0, $t0
	move $a1, $t1
	move $a2, $t2
	move $a3, $t5
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
	addi $sp, $sp, -4
	sw $a3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_foo
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $a3, 0($sp)
	addi $sp, $sp, 4
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t5, $v0
	move $v0, $t5
	j return_label
	la $a0, string_L1
	j error
.globl FUNCTION_baz
FUNCTION_baz:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
	lw $t1, GLOBAL_VAR_d
	li $t2, 1
	addu $t3, $t1, $t2
	la $t2, GLOBAL_VAR_d
	sw $t3, 0($t2)
	move $v0, $t0
	j return_label
	la $a0, string_L2
	j error
.globl main
main:
	li $t0, 10
	la $t1, GLOBAL_VAR_d
	sw $t0, 0($t1)
	li $t0, 1
	li $t1, 2
	li $t2, 3
	move $a0, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_baz
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t2, $v0
	li $t3, 4
	move $a0, $t1
	move $a1, $t2
	move $a2, $t3
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_bar
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	li $t2, 5
	li $t1, 6
	move $a0, $t1
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_baz
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t1, $v0
	li $t4, 7
	move $a0, $t2
	move $a1, $t1
	move $a2, $t4
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_bar
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t4, $v0
	li $t1, 8
	move $a0, $t1
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t4, 0($sp)
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_baz
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
	lw $t4, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t1, $v0
	move $a0, $t0
	move $a1, $t3
	move $a2, $t4
	move $a3, $t1
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $a2, 0($sp)
	addi $sp, $sp, -4
	sw $a3, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_foo
# REGISTER RECOVERY
	lw $a3, 0($sp)
	addi $sp, $sp, 4
	lw $a2, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t1, $v0
	move $a0, $t1
	jal Lprinti
	la $a0, string_L3
	jal Lprints
	j Lhalt
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

