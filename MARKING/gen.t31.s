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
GLOBAL_VAR_j: 
.word 0
GLOBAL_VAR_i: 
.word 0

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

.globl main
main:
	li $t0, 12
	la $t1, GLOBAL_VAR_j
	sw $t0, 0($t1)
# REGISTER DUMP
# REGISTER DUMP COMPLETE
	jal FUNCTION_foo
# REGISTER RECOVERY
# REGISTER RECOVERY COMPLETE
	lw $t0, GLOBAL_VAR_j
	lw $t1, GLOBAL_VAR_i
	li $t2, 2
	subu $t3, $t1, $t2
	bnez $t3, L0
	la $a0, div_by_zero
	j error
L0:
	div $t1, $t0, $t3
	move $a0, $t1
	jal Lprinti
	j Lhalt
.globl FUNCTION_foo
FUNCTION_foo:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	li $t0, 2
	la $t1, GLOBAL_VAR_i
	sw $t0, 0($t1)
	j return_label
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

