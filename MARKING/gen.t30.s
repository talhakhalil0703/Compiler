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
string_L1:
	.byte 102 117 110 99 116 105 111 110 32 34 102 111 111 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "foo" must return a value
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
	mul $t1, $t0, $t0
	li $t2, 0
	slt $t3, $t1, $t2
	seq $t2, $t3, $0
	beqz $t2, end_if_L0beqz
	j end_if_L0
end_if_L0beqz:
	li $t3, 123
	move $v0, $t3
	j return_label
end_if_L0:
	la $a0, string_L1
	j error
.globl main
main:
	li $t0, 1
	negu $t1, $t0
	move $a0, $t1
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_foo
# REGISTER RECOVERY
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t1, $v0
	j Lhalt
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

