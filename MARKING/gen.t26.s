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
string_L3:
	.byte 32 61 32 10 0 #  = \n
	.align 2
string_L4:
	.byte 9 0 # \t
	.align 2
string_L5:
	.byte 32 40 98 97 115 101 32 50 41 10 0 #  (base 2)\n
	.align 2
string_L6:
	.byte 9 0 # \t
	.align 2
string_L7:
	.byte 32 40 98 97 115 101 32 56 41 10 0 #  (base 8)\n
	.align 2
string_L8:
	.byte 9 0 # \t
	.align 2
string_L9:
	.byte 32 40 98 97 115 101 32 49 48 41 10 0 #  (base 10)\n
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

.globl FUNCTION_convert
FUNCTION_convert:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
	move $t1, $a1
	li $t2, 0
	seq $t3, $t0, $t2
	seq $t2, $t3, $0
	beqz $t2, end_if_L0beqz
	j end_if_L0
end_if_L0beqz:
	li $t3, 0
	move $a0, $t3
	jal Lprinti
	j return_label
end_if_L0:
	bnez $t1, L1
	la $a0, div_by_zero
	j error
L1:
	div $t3, $t0, $t1
	move $a0, $t3
	move $a1, $t1
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_convert
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	bnez $t1, L2
	la $a0, div_by_zero
	j error
L2:
	rem $t3, $t0, $t1
	move $a0, $t3
	jal Lprinti
	j return_label
.globl FUNCTION_do
FUNCTION_do:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
	move $a0, $t0
	jal Lprinti
	la $a0, string_L3
	jal Lprints
	la $a0, string_L4
	jal Lprints
	li $t1, 2
	move $a0, $t0
	move $a1, $t1
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_convert
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L5
	jal Lprints
	la $a0, string_L6
	jal Lprints
	li $t1, 8
	move $a0, $t0
	move $a1, $t1
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_convert
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L7
	jal Lprints
	la $a0, string_L8
	jal Lprints
	li $t1, 10
	move $a0, $t0
	move $a1, $t1
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $a1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_convert
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $a1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L9
	jal Lprints
	j return_label
.globl main
main:
	li $t0, 0
	move $a0, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_do
# REGISTER RECOVERY
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	li $t0, 17
	move $a0, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_do
# REGISTER RECOVERY
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	li $t0, 42
	move $a0, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_do
# REGISTER RECOVERY
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	j Lhalt
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

