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
	.byte 102 105 98 40 48 41 32 61 32 48 10 0 # fib(0) = 0\n
	.align 2
string_L1:
	.byte 102 105 98 40 49 41 32 61 32 49 10 0 # fib(1) = 1\n
	.align 2
string_L4:
	.byte 102 105 98 40 0 # fib(
	.align 2
string_L5:
	.byte 41 32 61 32 0 # ) = 
	.align 2
string_L6:
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

.globl main
main:
	li $t4, 2
	move $t0, $t4
	li $t4, 1
	move $t2, $t4
	li $t4, 0
	move $t3, $t4
	la $a0, string_L0
	jal Lprints
	la $a0, string_L1
	jal Lprints
while_L2:
	li $t4, 47
	slt $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, while_exit_L3beqz
	j while_exit_L3
while_exit_L3beqz:
	la $a0, string_L4
	jal Lprints
	move $a0, $t0
	jal Lprinti
	la $a0, string_L5
	jal Lprints
	addu $t5, $t2, $t3
	move $t1, $t5
	move $a0, $t1
	jal Lprinti
	move $t3, $t2
	move $t2, $t1
	la $a0, string_L6
	jal Lprints
	li $t5, 1
	addu $t4, $t0, $t5
	move $t0, $t4
	j while_L2
while_exit_L3:
	j Lhalt
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

