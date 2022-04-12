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
string_L2:
	.byte 102 105 98 40 0 # fib(
	.align 2
string_L3:
	.byte 41 32 61 32 0 # ) = 
	.align 2
string_L4:
	.byte 10 0 # \n
	.align 2
string_L7:
	.byte 102 117 110 99 116 105 111 110 32 34 102 105 98 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "fib" must return a value
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

.globl main
main:
	li $t1, 0
	move $t0, $t1
while_L0:
	li $t1, 46
	sle $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, while_exit_L1beqz
	j while_exit_L1
while_exit_L1beqz:
	la $a0, string_L2
	jal Lprints
	move $a0, $t0
	jal Lprinti
	la $a0, string_L3
	jal Lprints
	move $a0, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_fib
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t2, $v0
	move $a0, $t2
	jal Lprinti
	la $a0, string_L4
	jal Lprints
	li $t2, 1
	addu $t1, $t0, $t2
	move $t0, $t1
	j while_L0
while_exit_L1:
	j Lhalt
.globl FUNCTION_fib
FUNCTION_fib:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
	li $t1, 0
	seq $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, end_if_L5beqz
	j end_if_L5
end_if_L5beqz:
	li $t2, 0
	move $v0, $t2
	j return_label
end_if_L5:
	li $t2, 1
	seq $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, end_if_L6beqz
	j end_if_L6
end_if_L6beqz:
	li $t1, 1
	move $v0, $t1
	j return_label
end_if_L6:
	li $t1, 1
	subu $t2, $t0, $t1
	move $a0, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_fib
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t2, $v0
	li $t1, 2
	subu $t3, $t0, $t1
	move $a0, $t3
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_fib
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	addu $t1, $t2, $t3
	move $v0, $t1
	j return_label
	la $a0, string_L7
	j error
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

