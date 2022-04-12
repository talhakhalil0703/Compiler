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
GLOBAL_VAR_i1: 
.word 0
GLOBAL_VAR_b1: 
.word 0
string_L0:
	.byte 10 40 105 116 39 115 32 111 107 32 105 102 32 116 104 101 32 102 111 108 108 111 119 105 110 103 32 97 114 101 110 39 116 32 48 47 102 97 108 115 101 41 10 0 # \n(it's ok if the following aren't 0/false)\n
	.align 2
string_L1:
	.byte 9 108 111 99 97 108 32 105 110 116 32 100 101 102 97 117 108 116 32 118 97 108 117 101 58 32 0 # \tlocal int default value: 
	.align 2
string_L2:
	.byte 10 0 # \n
	.align 2
string_L3:
	.byte 9 108 111 99 97 108 32 98 111 111 108 101 97 110 32 100 101 102 97 117 108 116 32 118 97 108 117 101 58 32 0 # \tlocal boolean default value: 
	.align 2
string_L4:
	.byte 10 0 # \n
	.align 2
string_L5:
	.byte 103 108 111 98 97 108 32 105 110 116 32 100 101 102 97 117 108 116 32 118 97 108 117 101 58 32 0 # global int default value: 
	.align 2
string_L6:
	.byte 10 0 # \n
	.align 2
string_L7:
	.byte 103 108 111 98 97 108 32 98 111 111 108 101 97 110 32 100 101 102 97 117 108 116 32 118 97 108 117 101 58 32 0 # global boolean default value: 
	.align 2
string_L8:
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

.globl FUNCTION_foo
FUNCTION_foo:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	la $a0, string_L0
	jal Lprints
	la $a0, string_L1
	jal Lprints
	move $a0, $t0
	jal Lprinti
	la $a0, string_L2
	jal Lprints
	la $a0, string_L3
	jal Lprints
	move $a0, $t1
	jal Lprintb
	la $a0, string_L4
	jal Lprints
	li $t2, 123
	move $t0, $t2
	li $t2, 1
	move $t1, $t2
	j return_label
.globl main
main:
	la $a0, string_L5
	jal Lprints
	lw $t0, GLOBAL_VAR_i1
	move $a0, $t0
	jal Lprinti
	la $a0, string_L6
	jal Lprints
	la $a0, string_L7
	jal Lprints
	lw $t0, GLOBAL_VAR_b1
	move $a0, $t0
	jal Lprintb
	la $a0, string_L8
	jal Lprints
# REGISTER DUMP
# REGISTER DUMP COMPLETE
	jal FUNCTION_foo
# REGISTER RECOVERY
# REGISTER RECOVERY COMPLETE
# REGISTER DUMP
# REGISTER DUMP COMPLETE
	jal FUNCTION_foo
# REGISTER RECOVERY
# REGISTER RECOVERY COMPLETE
	j Lhalt
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

