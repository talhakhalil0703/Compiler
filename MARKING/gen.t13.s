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
GLOBAL_VAR_NL: 
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

.globl FUNCTION_reverse
FUNCTION_reverse:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	jal Lgetchar
	move $t1, $v0
	move $t0, $t1
	lw $t1, GLOBAL_VAR_NL
	sne $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, end_if_L0beqz
	j end_if_L0
end_if_L0beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_reverse
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $a0, $t0
	jal Lprintc
end_if_L0:
	j return_label
.globl main
main:
	li $t0, 10
	la $t1, GLOBAL_VAR_NL
	sw $t0, 0($t1)
# REGISTER DUMP
# REGISTER DUMP COMPLETE
	jal FUNCTION_reverse
# REGISTER RECOVERY
# REGISTER RECOVERY COMPLETE
	j Lhalt
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

