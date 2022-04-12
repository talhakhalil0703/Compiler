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
string_L0:
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

.globl FUNCTION_nl
FUNCTION_nl:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	la $a0, string_L0
	jal Lprints
	j return_label
.globl main
main:
	li $t0, 123
	negu $t1, $t0
	move $a0, $t1
	jal Lprinti
# REGISTER DUMP
# REGISTER DUMP COMPLETE
	jal FUNCTION_nl
# REGISTER RECOVERY
# REGISTER RECOVERY COMPLETE
	li $t1, 2147483648
	negu $t0, $t1
	move $a0, $t0
	jal Lprinti
# REGISTER DUMP
# REGISTER DUMP COMPLETE
	jal FUNCTION_nl
# REGISTER RECOVERY
# REGISTER RECOVERY COMPLETE
	li $t0, 2147483648
	negu $t1, $t0
	negu $t0, $t1
	move $a0, $t0
	jal Lprinti
# REGISTER DUMP
# REGISTER DUMP COMPLETE
	jal FUNCTION_nl
# REGISTER RECOVERY
# REGISTER RECOVERY COMPLETE
	li $t0, 2147483648
	negu $t1, $t0
	negu $t0, $t1
	negu $t1, $t0
	move $a0, $t1
	jal Lprinti
# REGISTER DUMP
# REGISTER DUMP COMPLETE
	jal FUNCTION_nl
# REGISTER RECOVERY
# REGISTER RECOVERY COMPLETE
	j Lhalt
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

