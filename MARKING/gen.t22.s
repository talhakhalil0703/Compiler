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
	.byte 97 115 100 102 0 # asdf
	.align 2
string_L1:
	.byte 8 9 10 12 13 34 39 92 0 # \b\t\n\f\r\"\'\\
	.align 2
string_L2:
	.byte 1 26 0 # 
	.align 2
string_L4:
	.byte 0 32 97 115 100 102 0 #   asdf
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
	la $a0, string_L0
	jal Lprints
	la $a0, string_L1
	jal Lprints
	la $a0, string_L2
	jal Lprints
	li $t0, 1
	seq $t1, $t0, $0
	beqz $t1, end_if_L3beqz
	j end_if_L3
end_if_L3beqz:
	la $a0, string_L4
	jal Lprints
end_if_L3:
	li $t0, 0
	move $a0, $t0
	jal Lprintc
	j Lhalt
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

