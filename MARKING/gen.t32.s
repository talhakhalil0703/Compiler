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
	.byte 10 0 # \n
	.align 2
string_L5:
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
	li $t2, 0
	move $t0, $t2
while_L0:
	li $t2, 10
	slt $t3, $t0, $t2
	seq $t2, $t3, $0
	beqz $t2, while_exit_L1beqz
	j while_exit_L1
while_exit_L1beqz:
	move $a0, $t0
	jal Lprinti
	la $a0, string_L2
	jal Lprints
	li $t3, 100
	move $t1, $t3
while_L3:
	li $t3, 110
	slt $t2, $t1, $t3
	seq $t3, $t2, $0
	beqz $t3, while_exit_L4beqz
	j while_exit_L4
while_exit_L4beqz:
	move $a0, $t1
	jal Lprinti
	la $a0, string_L5
	jal Lprints
	li $t2, 105
	seq $t3, $t1, $t2
	seq $t2, $t3, $0
	beqz $t2, end_if_L6beqz
	j end_if_L6
end_if_L6beqz:
	j while_exit_L4
end_if_L6:
	li $t3, 1
	addu $t2, $t1, $t3
	move $t1, $t2
	j while_L3
while_exit_L4:
	li $t2, 5
	seq $t3, $t0, $t2
	seq $t2, $t3, $0
	beqz $t2, end_if_L7beqz
	j end_if_L7
end_if_L7beqz:
	j while_exit_L1
end_if_L7:
	li $t3, 1
	addu $t2, $t0, $t3
	move $t0, $t2
	j while_L0
while_exit_L1:
	j Lhalt
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

