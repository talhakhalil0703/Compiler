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
GLOBAL_VAR_i: 
.word 0
GLOBAL_VAR_k: 
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
	li $t1, 123
	la $t2, GLOBAL_VAR_i
	sw $t1, 0($t2)
	li $t1, 456
	move $t0, $t1
	li $t1, 789
	la $t2, GLOBAL_VAR_k
	sw $t1, 0($t2)
	li $t1, 42
	la $t2, GLOBAL_VAR_k
	sw $t1, 0($t2)
	move $t0, $t1
	la $t2, GLOBAL_VAR_i
	sw $t1, 0($t2)
	li $t2, 10
	move $t1, $t2
	lw $t2, GLOBAL_VAR_i
	move $a0, $t2
	jal Lprinti
	move $a0, $t1
	jal Lprintc
	move $a0, $t0
	jal Lprinti
	move $a0, $t1
	jal Lprintc
	lw $t2, GLOBAL_VAR_k
	move $a0, $t2
	jal Lprinti
	move $a0, $t1
	jal Lprintc
	j Lhalt
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

