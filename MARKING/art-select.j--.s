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
GLOBAL_VAR_A_0: 
.word 0
GLOBAL_VAR_A_1: 
.word 0
GLOBAL_VAR_A_2: 
.word 0
GLOBAL_VAR_A_3: 
.word 0
GLOBAL_VAR_A_4: 
.word 0
GLOBAL_VAR_A_5: 
.word 0
GLOBAL_VAR_A_6: 
.word 0
GLOBAL_VAR_A_7: 
.word 0
GLOBAL_VAR_A_8: 
.word 0
GLOBAL_VAR_A_9: 
.word 0
GLOBAL_VAR_A_10: 
.word 0
GLOBAL_VAR_A_11: 
.word 0
GLOBAL_VAR_A_12: 
.word 0
GLOBAL_VAR_A_13: 
.word 0
GLOBAL_VAR_A_14: 
.word 0
GLOBAL_VAR_not_there: 
.word 0
GLOBAL_VAR_INTERNALX: 
.word 0
string_L1130:
	.byte 32 0 #  
	.align 2
string_L1133:
	.byte 32 0 #  
	.align 2
string_L1136:
	.byte 32 0 #  
	.align 2
string_L1139:
	.byte 32 0 #  
	.align 2
string_L1142:
	.byte 32 0 #  
	.align 2
string_L1145:
	.byte 32 0 #  
	.align 2
string_L1148:
	.byte 32 0 #  
	.align 2
string_L1151:
	.byte 32 0 #  
	.align 2
string_L1154:
	.byte 32 0 #  
	.align 2
string_L1157:
	.byte 32 0 #  
	.align 2
string_L1160:
	.byte 32 0 #  
	.align 2
string_L1163:
	.byte 32 0 #  
	.align 2
string_L1166:
	.byte 32 0 #  
	.align 2
string_L1169:
	.byte 32 0 #  
	.align 2
string_L1171:
	.byte 32 0 #  
	.align 2
string_L1172:
	.byte 10 0 # \n
	.align 2
string_L1174:
	.byte 102 117 110 99 116 105 111 110 32 34 73 78 84 69 82 78 65 76 114 97 110 100 111 109 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "INTERNALrandom" must return a value
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
	li $t4, 1
	move $a0, $t4
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALseed
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	li $t4, 0
	move $t0, $t4
while_L0:
	li $t4, 14
	sle $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, while_exit_L1beqz
	j while_exit_L1
while_exit_L1beqz:
	li $t5, 0
	seq $t4, $t0, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L2beqz
	j else_L2
else_L2beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t4, $v0
	li $t5, 100
	bnez $t5, L4
	la $a0, div_by_zero
	j error
L4:
	rem $t6, $t4, $t5
	la $t5, GLOBAL_VAR_A_0
	sw $t6, 0($t5)
	j end_ifL3
else_L2:
	li $t6, 1
	seq $t5, $t0, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L5beqz
	j else_L5
else_L5beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t5, $v0
	li $t6, 100
	bnez $t6, L7
	la $a0, div_by_zero
	j error
L7:
	rem $t4, $t5, $t6
	la $t6, GLOBAL_VAR_A_1
	sw $t4, 0($t6)
	j end_ifL6
else_L5:
	li $t4, 2
	seq $t6, $t0, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L8beqz
	j else_L8
else_L8beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t6, $v0
	li $t4, 100
	bnez $t4, L10
	la $a0, div_by_zero
	j error
L10:
	rem $t5, $t6, $t4
	la $t4, GLOBAL_VAR_A_2
	sw $t5, 0($t4)
	j end_ifL9
else_L8:
	li $t5, 3
	seq $t4, $t0, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L11beqz
	j else_L11
else_L11beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t4, $v0
	li $t5, 100
	bnez $t5, L13
	la $a0, div_by_zero
	j error
L13:
	rem $t6, $t4, $t5
	la $t5, GLOBAL_VAR_A_3
	sw $t6, 0($t5)
	j end_ifL12
else_L11:
	li $t6, 4
	seq $t5, $t0, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L14beqz
	j else_L14
else_L14beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t5, $v0
	li $t6, 100
	bnez $t6, L16
	la $a0, div_by_zero
	j error
L16:
	rem $t4, $t5, $t6
	la $t6, GLOBAL_VAR_A_4
	sw $t4, 0($t6)
	j end_ifL15
else_L14:
	li $t4, 5
	seq $t6, $t0, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L17beqz
	j else_L17
else_L17beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t6, $v0
	li $t4, 100
	bnez $t4, L19
	la $a0, div_by_zero
	j error
L19:
	rem $t5, $t6, $t4
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	j end_ifL18
else_L17:
	li $t5, 6
	seq $t4, $t0, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L20beqz
	j else_L20
else_L20beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t4, $v0
	li $t5, 100
	bnez $t5, L22
	la $a0, div_by_zero
	j error
L22:
	rem $t6, $t4, $t5
	la $t5, GLOBAL_VAR_A_6
	sw $t6, 0($t5)
	j end_ifL21
else_L20:
	li $t6, 7
	seq $t5, $t0, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L23beqz
	j else_L23
else_L23beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t5, $v0
	li $t6, 100
	bnez $t6, L25
	la $a0, div_by_zero
	j error
L25:
	rem $t4, $t5, $t6
	la $t6, GLOBAL_VAR_A_7
	sw $t4, 0($t6)
	j end_ifL24
else_L23:
	li $t4, 8
	seq $t6, $t0, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L26beqz
	j else_L26
else_L26beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t6, $v0
	li $t4, 100
	bnez $t4, L28
	la $a0, div_by_zero
	j error
L28:
	rem $t5, $t6, $t4
	la $t4, GLOBAL_VAR_A_8
	sw $t5, 0($t4)
	j end_ifL27
else_L26:
	li $t5, 9
	seq $t4, $t0, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L29beqz
	j else_L29
else_L29beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t4, $v0
	li $t5, 100
	bnez $t5, L31
	la $a0, div_by_zero
	j error
L31:
	rem $t6, $t4, $t5
	la $t5, GLOBAL_VAR_A_9
	sw $t6, 0($t5)
	j end_ifL30
else_L29:
	li $t6, 10
	seq $t5, $t0, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L32beqz
	j else_L32
else_L32beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t5, $v0
	li $t6, 100
	bnez $t6, L34
	la $a0, div_by_zero
	j error
L34:
	rem $t4, $t5, $t6
	la $t6, GLOBAL_VAR_A_10
	sw $t4, 0($t6)
	j end_ifL33
else_L32:
	li $t4, 11
	seq $t6, $t0, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L35beqz
	j else_L35
else_L35beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t6, $v0
	li $t4, 100
	bnez $t4, L37
	la $a0, div_by_zero
	j error
L37:
	rem $t5, $t6, $t4
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	j end_ifL36
else_L35:
	li $t5, 12
	seq $t4, $t0, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L38beqz
	j else_L38
else_L38beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t4, $v0
	li $t5, 100
	bnez $t5, L40
	la $a0, div_by_zero
	j error
L40:
	rem $t6, $t4, $t5
	la $t5, GLOBAL_VAR_A_12
	sw $t6, 0($t5)
	j end_ifL39
else_L38:
	li $t6, 13
	seq $t5, $t0, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L41beqz
	j else_L41
else_L41beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t5, $v0
	li $t6, 100
	bnez $t6, L43
	la $a0, div_by_zero
	j error
L43:
	rem $t4, $t5, $t6
	la $t6, GLOBAL_VAR_A_13
	sw $t4, 0($t6)
	j end_ifL42
else_L41:
	li $t4, 14
	seq $t6, $t0, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L44beqz
	j end_if_L44
end_if_L44beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_INTERNALrandom
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t6, $v0
	li $t4, 100
	bnez $t4, L45
	la $a0, div_by_zero
	j error
L45:
	rem $t5, $t6, $t4
	la $t4, GLOBAL_VAR_A_14
	sw $t5, 0($t4)
end_if_L44:
end_ifL42:
end_ifL39:
end_ifL36:
end_ifL33:
end_ifL30:
end_ifL27:
end_ifL24:
end_ifL21:
end_ifL18:
end_ifL15:
end_ifL12:
end_ifL9:
end_ifL6:
end_ifL3:
	li $t5, 1
	addu $t4, $t0, $t5
	move $t0, $t4
	j while_L0
while_exit_L1:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_printarray
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	li $t4, 0
	move $t0, $t4
while_L46:
	li $t4, 13
	sle $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, while_exit_L47beqz
	j while_exit_L47
while_exit_L47beqz:
	move $t3, $t0
	li $t5, 1
	addu $t4, $t0, $t5
	move $t1, $t4
while_L48:
	li $t4, 14
	sle $t5, $t1, $t4
	seq $t4, $t5, $0
	beqz $t4, while_exit_L49beqz
	j while_exit_L49
while_exit_L49beqz:
	li $t5, 1
	seq $t4, $t1, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L50beqz
	j else_L50
else_L50beqz:
	li $t4, 0
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L52beqz
	j else_L52
else_L52beqz:
	lw $t5, GLOBAL_VAR_A_1
	lw $t4, GLOBAL_VAR_A_0
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L54beqz
	j end_if_L54
end_if_L54beqz:
	li $t6, 1
	move $t3, $t6
end_if_L54:
	j end_ifL53
else_L52:
	li $t6, 1
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L55beqz
	j else_L55
else_L55beqz:
	lw $t4, GLOBAL_VAR_A_1
	lw $t6, GLOBAL_VAR_A_1
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L57beqz
	j end_if_L57
end_if_L57beqz:
	li $t5, 1
	move $t3, $t5
end_if_L57:
	j end_ifL56
else_L55:
	li $t5, 2
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L58beqz
	j else_L58
else_L58beqz:
	lw $t6, GLOBAL_VAR_A_1
	lw $t5, GLOBAL_VAR_A_2
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L60beqz
	j end_if_L60
end_if_L60beqz:
	li $t4, 1
	move $t3, $t4
end_if_L60:
	j end_ifL59
else_L58:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L61beqz
	j else_L61
else_L61beqz:
	lw $t5, GLOBAL_VAR_A_1
	lw $t4, GLOBAL_VAR_A_3
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L63beqz
	j end_if_L63
end_if_L63beqz:
	li $t6, 1
	move $t3, $t6
end_if_L63:
	j end_ifL62
else_L61:
	li $t6, 4
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L64beqz
	j else_L64
else_L64beqz:
	lw $t4, GLOBAL_VAR_A_1
	lw $t6, GLOBAL_VAR_A_4
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L66beqz
	j end_if_L66
end_if_L66beqz:
	li $t5, 1
	move $t3, $t5
end_if_L66:
	j end_ifL65
else_L64:
	li $t5, 5
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L67beqz
	j else_L67
else_L67beqz:
	lw $t6, GLOBAL_VAR_A_1
	lw $t5, GLOBAL_VAR_A_5
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L69beqz
	j end_if_L69
end_if_L69beqz:
	li $t4, 1
	move $t3, $t4
end_if_L69:
	j end_ifL68
else_L67:
	li $t4, 6
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L70beqz
	j else_L70
else_L70beqz:
	lw $t5, GLOBAL_VAR_A_1
	lw $t4, GLOBAL_VAR_A_6
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L72beqz
	j end_if_L72
end_if_L72beqz:
	li $t6, 1
	move $t3, $t6
end_if_L72:
	j end_ifL71
else_L70:
	li $t6, 7
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L73beqz
	j else_L73
else_L73beqz:
	lw $t4, GLOBAL_VAR_A_1
	lw $t6, GLOBAL_VAR_A_7
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L75beqz
	j end_if_L75
end_if_L75beqz:
	li $t5, 1
	move $t3, $t5
end_if_L75:
	j end_ifL74
else_L73:
	li $t5, 8
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L76beqz
	j else_L76
else_L76beqz:
	lw $t6, GLOBAL_VAR_A_1
	lw $t5, GLOBAL_VAR_A_8
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L78beqz
	j end_if_L78
end_if_L78beqz:
	li $t4, 1
	move $t3, $t4
end_if_L78:
	j end_ifL77
else_L76:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L79beqz
	j else_L79
else_L79beqz:
	lw $t5, GLOBAL_VAR_A_1
	lw $t4, GLOBAL_VAR_A_9
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L81beqz
	j end_if_L81
end_if_L81beqz:
	li $t6, 1
	move $t3, $t6
end_if_L81:
	j end_ifL80
else_L79:
	li $t6, 10
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L82beqz
	j else_L82
else_L82beqz:
	lw $t4, GLOBAL_VAR_A_1
	lw $t6, GLOBAL_VAR_A_10
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L84beqz
	j end_if_L84
end_if_L84beqz:
	li $t5, 1
	move $t3, $t5
end_if_L84:
	j end_ifL83
else_L82:
	li $t5, 11
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L85beqz
	j else_L85
else_L85beqz:
	lw $t6, GLOBAL_VAR_A_1
	lw $t5, GLOBAL_VAR_A_11
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L87beqz
	j end_if_L87
end_if_L87beqz:
	li $t4, 1
	move $t3, $t4
end_if_L87:
	j end_ifL86
else_L85:
	li $t4, 12
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L88beqz
	j else_L88
else_L88beqz:
	lw $t5, GLOBAL_VAR_A_1
	lw $t4, GLOBAL_VAR_A_12
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L90beqz
	j end_if_L90
end_if_L90beqz:
	li $t6, 1
	move $t3, $t6
end_if_L90:
	j end_ifL89
else_L88:
	li $t6, 13
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L91beqz
	j else_L91
else_L91beqz:
	lw $t4, GLOBAL_VAR_A_1
	lw $t6, GLOBAL_VAR_A_13
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L93beqz
	j end_if_L93
end_if_L93beqz:
	li $t5, 1
	move $t3, $t5
end_if_L93:
	j end_ifL92
else_L91:
	li $t5, 14
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L94beqz
	j end_if_L94
end_if_L94beqz:
	lw $t6, GLOBAL_VAR_A_1
	lw $t5, GLOBAL_VAR_A_14
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L95beqz
	j end_if_L95
end_if_L95beqz:
	li $t4, 1
	move $t3, $t4
end_if_L95:
end_if_L94:
end_ifL92:
end_ifL89:
end_ifL86:
end_ifL83:
end_ifL80:
end_ifL77:
end_ifL74:
end_ifL71:
end_ifL68:
end_ifL65:
end_ifL62:
end_ifL59:
end_ifL56:
end_ifL53:
	j end_ifL51
else_L50:
	li $t4, 2
	seq $t5, $t1, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L96beqz
	j else_L96
else_L96beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L98beqz
	j else_L98
else_L98beqz:
	lw $t4, GLOBAL_VAR_A_2
	lw $t5, GLOBAL_VAR_A_0
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L100beqz
	j end_if_L100
end_if_L100beqz:
	li $t6, 2
	move $t3, $t6
end_if_L100:
	j end_ifL99
else_L98:
	li $t6, 1
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L101beqz
	j else_L101
else_L101beqz:
	lw $t5, GLOBAL_VAR_A_2
	lw $t6, GLOBAL_VAR_A_1
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L103beqz
	j end_if_L103
end_if_L103beqz:
	li $t4, 2
	move $t3, $t4
end_if_L103:
	j end_ifL102
else_L101:
	li $t4, 2
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L104beqz
	j else_L104
else_L104beqz:
	lw $t6, GLOBAL_VAR_A_2
	lw $t4, GLOBAL_VAR_A_2
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L106beqz
	j end_if_L106
end_if_L106beqz:
	li $t5, 2
	move $t3, $t5
end_if_L106:
	j end_ifL105
else_L104:
	li $t5, 3
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L107beqz
	j else_L107
else_L107beqz:
	lw $t4, GLOBAL_VAR_A_2
	lw $t5, GLOBAL_VAR_A_3
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L109beqz
	j end_if_L109
end_if_L109beqz:
	li $t6, 2
	move $t3, $t6
end_if_L109:
	j end_ifL108
else_L107:
	li $t6, 4
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L110beqz
	j else_L110
else_L110beqz:
	lw $t5, GLOBAL_VAR_A_2
	lw $t6, GLOBAL_VAR_A_4
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L112beqz
	j end_if_L112
end_if_L112beqz:
	li $t4, 2
	move $t3, $t4
end_if_L112:
	j end_ifL111
else_L110:
	li $t4, 5
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L113beqz
	j else_L113
else_L113beqz:
	lw $t6, GLOBAL_VAR_A_2
	lw $t4, GLOBAL_VAR_A_5
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L115beqz
	j end_if_L115
end_if_L115beqz:
	li $t5, 2
	move $t3, $t5
end_if_L115:
	j end_ifL114
else_L113:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L116beqz
	j else_L116
else_L116beqz:
	lw $t4, GLOBAL_VAR_A_2
	lw $t5, GLOBAL_VAR_A_6
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L118beqz
	j end_if_L118
end_if_L118beqz:
	li $t6, 2
	move $t3, $t6
end_if_L118:
	j end_ifL117
else_L116:
	li $t6, 7
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L119beqz
	j else_L119
else_L119beqz:
	lw $t5, GLOBAL_VAR_A_2
	lw $t6, GLOBAL_VAR_A_7
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L121beqz
	j end_if_L121
end_if_L121beqz:
	li $t4, 2
	move $t3, $t4
end_if_L121:
	j end_ifL120
else_L119:
	li $t4, 8
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L122beqz
	j else_L122
else_L122beqz:
	lw $t6, GLOBAL_VAR_A_2
	lw $t4, GLOBAL_VAR_A_8
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L124beqz
	j end_if_L124
end_if_L124beqz:
	li $t5, 2
	move $t3, $t5
end_if_L124:
	j end_ifL123
else_L122:
	li $t5, 9
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L125beqz
	j else_L125
else_L125beqz:
	lw $t4, GLOBAL_VAR_A_2
	lw $t5, GLOBAL_VAR_A_9
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L127beqz
	j end_if_L127
end_if_L127beqz:
	li $t6, 2
	move $t3, $t6
end_if_L127:
	j end_ifL126
else_L125:
	li $t6, 10
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L128beqz
	j else_L128
else_L128beqz:
	lw $t5, GLOBAL_VAR_A_2
	lw $t6, GLOBAL_VAR_A_10
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L130beqz
	j end_if_L130
end_if_L130beqz:
	li $t4, 2
	move $t3, $t4
end_if_L130:
	j end_ifL129
else_L128:
	li $t4, 11
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L131beqz
	j else_L131
else_L131beqz:
	lw $t6, GLOBAL_VAR_A_2
	lw $t4, GLOBAL_VAR_A_11
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L133beqz
	j end_if_L133
end_if_L133beqz:
	li $t5, 2
	move $t3, $t5
end_if_L133:
	j end_ifL132
else_L131:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L134beqz
	j else_L134
else_L134beqz:
	lw $t4, GLOBAL_VAR_A_2
	lw $t5, GLOBAL_VAR_A_12
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L136beqz
	j end_if_L136
end_if_L136beqz:
	li $t6, 2
	move $t3, $t6
end_if_L136:
	j end_ifL135
else_L134:
	li $t6, 13
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L137beqz
	j else_L137
else_L137beqz:
	lw $t5, GLOBAL_VAR_A_2
	lw $t6, GLOBAL_VAR_A_13
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L139beqz
	j end_if_L139
end_if_L139beqz:
	li $t4, 2
	move $t3, $t4
end_if_L139:
	j end_ifL138
else_L137:
	li $t4, 14
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L140beqz
	j end_if_L140
end_if_L140beqz:
	lw $t6, GLOBAL_VAR_A_2
	lw $t4, GLOBAL_VAR_A_14
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L141beqz
	j end_if_L141
end_if_L141beqz:
	li $t5, 2
	move $t3, $t5
end_if_L141:
end_if_L140:
end_ifL138:
end_ifL135:
end_ifL132:
end_ifL129:
end_ifL126:
end_ifL123:
end_ifL120:
end_ifL117:
end_ifL114:
end_ifL111:
end_ifL108:
end_ifL105:
end_ifL102:
end_ifL99:
	j end_ifL97
else_L96:
	li $t5, 3
	seq $t4, $t1, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L142beqz
	j else_L142
else_L142beqz:
	li $t4, 0
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L144beqz
	j else_L144
else_L144beqz:
	lw $t5, GLOBAL_VAR_A_3
	lw $t4, GLOBAL_VAR_A_0
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L146beqz
	j end_if_L146
end_if_L146beqz:
	li $t6, 3
	move $t3, $t6
end_if_L146:
	j end_ifL145
else_L144:
	li $t6, 1
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L147beqz
	j else_L147
else_L147beqz:
	lw $t4, GLOBAL_VAR_A_3
	lw $t6, GLOBAL_VAR_A_1
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L149beqz
	j end_if_L149
end_if_L149beqz:
	li $t5, 3
	move $t3, $t5
end_if_L149:
	j end_ifL148
else_L147:
	li $t5, 2
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L150beqz
	j else_L150
else_L150beqz:
	lw $t6, GLOBAL_VAR_A_3
	lw $t5, GLOBAL_VAR_A_2
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L152beqz
	j end_if_L152
end_if_L152beqz:
	li $t4, 3
	move $t3, $t4
end_if_L152:
	j end_ifL151
else_L150:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L153beqz
	j else_L153
else_L153beqz:
	lw $t5, GLOBAL_VAR_A_3
	lw $t4, GLOBAL_VAR_A_3
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L155beqz
	j end_if_L155
end_if_L155beqz:
	li $t6, 3
	move $t3, $t6
end_if_L155:
	j end_ifL154
else_L153:
	li $t6, 4
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L156beqz
	j else_L156
else_L156beqz:
	lw $t4, GLOBAL_VAR_A_3
	lw $t6, GLOBAL_VAR_A_4
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L158beqz
	j end_if_L158
end_if_L158beqz:
	li $t5, 3
	move $t3, $t5
end_if_L158:
	j end_ifL157
else_L156:
	li $t5, 5
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L159beqz
	j else_L159
else_L159beqz:
	lw $t6, GLOBAL_VAR_A_3
	lw $t5, GLOBAL_VAR_A_5
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L161beqz
	j end_if_L161
end_if_L161beqz:
	li $t4, 3
	move $t3, $t4
end_if_L161:
	j end_ifL160
else_L159:
	li $t4, 6
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L162beqz
	j else_L162
else_L162beqz:
	lw $t5, GLOBAL_VAR_A_3
	lw $t4, GLOBAL_VAR_A_6
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L164beqz
	j end_if_L164
end_if_L164beqz:
	li $t6, 3
	move $t3, $t6
end_if_L164:
	j end_ifL163
else_L162:
	li $t6, 7
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L165beqz
	j else_L165
else_L165beqz:
	lw $t4, GLOBAL_VAR_A_3
	lw $t6, GLOBAL_VAR_A_7
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L167beqz
	j end_if_L167
end_if_L167beqz:
	li $t5, 3
	move $t3, $t5
end_if_L167:
	j end_ifL166
else_L165:
	li $t5, 8
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L168beqz
	j else_L168
else_L168beqz:
	lw $t6, GLOBAL_VAR_A_3
	lw $t5, GLOBAL_VAR_A_8
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L170beqz
	j end_if_L170
end_if_L170beqz:
	li $t4, 3
	move $t3, $t4
end_if_L170:
	j end_ifL169
else_L168:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L171beqz
	j else_L171
else_L171beqz:
	lw $t5, GLOBAL_VAR_A_3
	lw $t4, GLOBAL_VAR_A_9
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L173beqz
	j end_if_L173
end_if_L173beqz:
	li $t6, 3
	move $t3, $t6
end_if_L173:
	j end_ifL172
else_L171:
	li $t6, 10
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L174beqz
	j else_L174
else_L174beqz:
	lw $t4, GLOBAL_VAR_A_3
	lw $t6, GLOBAL_VAR_A_10
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L176beqz
	j end_if_L176
end_if_L176beqz:
	li $t5, 3
	move $t3, $t5
end_if_L176:
	j end_ifL175
else_L174:
	li $t5, 11
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L177beqz
	j else_L177
else_L177beqz:
	lw $t6, GLOBAL_VAR_A_3
	lw $t5, GLOBAL_VAR_A_11
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L179beqz
	j end_if_L179
end_if_L179beqz:
	li $t4, 3
	move $t3, $t4
end_if_L179:
	j end_ifL178
else_L177:
	li $t4, 12
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L180beqz
	j else_L180
else_L180beqz:
	lw $t5, GLOBAL_VAR_A_3
	lw $t4, GLOBAL_VAR_A_12
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L182beqz
	j end_if_L182
end_if_L182beqz:
	li $t6, 3
	move $t3, $t6
end_if_L182:
	j end_ifL181
else_L180:
	li $t6, 13
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L183beqz
	j else_L183
else_L183beqz:
	lw $t4, GLOBAL_VAR_A_3
	lw $t6, GLOBAL_VAR_A_13
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L185beqz
	j end_if_L185
end_if_L185beqz:
	li $t5, 3
	move $t3, $t5
end_if_L185:
	j end_ifL184
else_L183:
	li $t5, 14
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L186beqz
	j end_if_L186
end_if_L186beqz:
	lw $t6, GLOBAL_VAR_A_3
	lw $t5, GLOBAL_VAR_A_14
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L187beqz
	j end_if_L187
end_if_L187beqz:
	li $t4, 3
	move $t3, $t4
end_if_L187:
end_if_L186:
end_ifL184:
end_ifL181:
end_ifL178:
end_ifL175:
end_ifL172:
end_ifL169:
end_ifL166:
end_ifL163:
end_ifL160:
end_ifL157:
end_ifL154:
end_ifL151:
end_ifL148:
end_ifL145:
	j end_ifL143
else_L142:
	li $t4, 4
	seq $t5, $t1, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L188beqz
	j else_L188
else_L188beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L190beqz
	j else_L190
else_L190beqz:
	lw $t4, GLOBAL_VAR_A_4
	lw $t5, GLOBAL_VAR_A_0
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L192beqz
	j end_if_L192
end_if_L192beqz:
	li $t6, 4
	move $t3, $t6
end_if_L192:
	j end_ifL191
else_L190:
	li $t6, 1
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L193beqz
	j else_L193
else_L193beqz:
	lw $t5, GLOBAL_VAR_A_4
	lw $t6, GLOBAL_VAR_A_1
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L195beqz
	j end_if_L195
end_if_L195beqz:
	li $t4, 4
	move $t3, $t4
end_if_L195:
	j end_ifL194
else_L193:
	li $t4, 2
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L196beqz
	j else_L196
else_L196beqz:
	lw $t6, GLOBAL_VAR_A_4
	lw $t4, GLOBAL_VAR_A_2
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L198beqz
	j end_if_L198
end_if_L198beqz:
	li $t5, 4
	move $t3, $t5
end_if_L198:
	j end_ifL197
else_L196:
	li $t5, 3
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L199beqz
	j else_L199
else_L199beqz:
	lw $t4, GLOBAL_VAR_A_4
	lw $t5, GLOBAL_VAR_A_3
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L201beqz
	j end_if_L201
end_if_L201beqz:
	li $t6, 4
	move $t3, $t6
end_if_L201:
	j end_ifL200
else_L199:
	li $t6, 4
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L202beqz
	j else_L202
else_L202beqz:
	lw $t5, GLOBAL_VAR_A_4
	lw $t6, GLOBAL_VAR_A_4
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L204beqz
	j end_if_L204
end_if_L204beqz:
	li $t4, 4
	move $t3, $t4
end_if_L204:
	j end_ifL203
else_L202:
	li $t4, 5
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L205beqz
	j else_L205
else_L205beqz:
	lw $t6, GLOBAL_VAR_A_4
	lw $t4, GLOBAL_VAR_A_5
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L207beqz
	j end_if_L207
end_if_L207beqz:
	li $t5, 4
	move $t3, $t5
end_if_L207:
	j end_ifL206
else_L205:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L208beqz
	j else_L208
else_L208beqz:
	lw $t4, GLOBAL_VAR_A_4
	lw $t5, GLOBAL_VAR_A_6
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L210beqz
	j end_if_L210
end_if_L210beqz:
	li $t6, 4
	move $t3, $t6
end_if_L210:
	j end_ifL209
else_L208:
	li $t6, 7
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L211beqz
	j else_L211
else_L211beqz:
	lw $t5, GLOBAL_VAR_A_4
	lw $t6, GLOBAL_VAR_A_7
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L213beqz
	j end_if_L213
end_if_L213beqz:
	li $t4, 4
	move $t3, $t4
end_if_L213:
	j end_ifL212
else_L211:
	li $t4, 8
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L214beqz
	j else_L214
else_L214beqz:
	lw $t6, GLOBAL_VAR_A_4
	lw $t4, GLOBAL_VAR_A_8
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L216beqz
	j end_if_L216
end_if_L216beqz:
	li $t5, 4
	move $t3, $t5
end_if_L216:
	j end_ifL215
else_L214:
	li $t5, 9
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L217beqz
	j else_L217
else_L217beqz:
	lw $t4, GLOBAL_VAR_A_4
	lw $t5, GLOBAL_VAR_A_9
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L219beqz
	j end_if_L219
end_if_L219beqz:
	li $t6, 4
	move $t3, $t6
end_if_L219:
	j end_ifL218
else_L217:
	li $t6, 10
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L220beqz
	j else_L220
else_L220beqz:
	lw $t5, GLOBAL_VAR_A_4
	lw $t6, GLOBAL_VAR_A_10
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L222beqz
	j end_if_L222
end_if_L222beqz:
	li $t4, 4
	move $t3, $t4
end_if_L222:
	j end_ifL221
else_L220:
	li $t4, 11
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L223beqz
	j else_L223
else_L223beqz:
	lw $t6, GLOBAL_VAR_A_4
	lw $t4, GLOBAL_VAR_A_11
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L225beqz
	j end_if_L225
end_if_L225beqz:
	li $t5, 4
	move $t3, $t5
end_if_L225:
	j end_ifL224
else_L223:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L226beqz
	j else_L226
else_L226beqz:
	lw $t4, GLOBAL_VAR_A_4
	lw $t5, GLOBAL_VAR_A_12
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L228beqz
	j end_if_L228
end_if_L228beqz:
	li $t6, 4
	move $t3, $t6
end_if_L228:
	j end_ifL227
else_L226:
	li $t6, 13
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L229beqz
	j else_L229
else_L229beqz:
	lw $t5, GLOBAL_VAR_A_4
	lw $t6, GLOBAL_VAR_A_13
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L231beqz
	j end_if_L231
end_if_L231beqz:
	li $t4, 4
	move $t3, $t4
end_if_L231:
	j end_ifL230
else_L229:
	li $t4, 14
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L232beqz
	j end_if_L232
end_if_L232beqz:
	lw $t6, GLOBAL_VAR_A_4
	lw $t4, GLOBAL_VAR_A_14
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L233beqz
	j end_if_L233
end_if_L233beqz:
	li $t5, 4
	move $t3, $t5
end_if_L233:
end_if_L232:
end_ifL230:
end_ifL227:
end_ifL224:
end_ifL221:
end_ifL218:
end_ifL215:
end_ifL212:
end_ifL209:
end_ifL206:
end_ifL203:
end_ifL200:
end_ifL197:
end_ifL194:
end_ifL191:
	j end_ifL189
else_L188:
	li $t5, 5
	seq $t4, $t1, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L234beqz
	j else_L234
else_L234beqz:
	li $t4, 0
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L236beqz
	j else_L236
else_L236beqz:
	lw $t5, GLOBAL_VAR_A_5
	lw $t4, GLOBAL_VAR_A_0
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L238beqz
	j end_if_L238
end_if_L238beqz:
	li $t6, 5
	move $t3, $t6
end_if_L238:
	j end_ifL237
else_L236:
	li $t6, 1
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L239beqz
	j else_L239
else_L239beqz:
	lw $t4, GLOBAL_VAR_A_5
	lw $t6, GLOBAL_VAR_A_1
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L241beqz
	j end_if_L241
end_if_L241beqz:
	li $t5, 5
	move $t3, $t5
end_if_L241:
	j end_ifL240
else_L239:
	li $t5, 2
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L242beqz
	j else_L242
else_L242beqz:
	lw $t6, GLOBAL_VAR_A_5
	lw $t5, GLOBAL_VAR_A_2
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L244beqz
	j end_if_L244
end_if_L244beqz:
	li $t4, 5
	move $t3, $t4
end_if_L244:
	j end_ifL243
else_L242:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L245beqz
	j else_L245
else_L245beqz:
	lw $t5, GLOBAL_VAR_A_5
	lw $t4, GLOBAL_VAR_A_3
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L247beqz
	j end_if_L247
end_if_L247beqz:
	li $t6, 5
	move $t3, $t6
end_if_L247:
	j end_ifL246
else_L245:
	li $t6, 4
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L248beqz
	j else_L248
else_L248beqz:
	lw $t4, GLOBAL_VAR_A_5
	lw $t6, GLOBAL_VAR_A_4
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L250beqz
	j end_if_L250
end_if_L250beqz:
	li $t5, 5
	move $t3, $t5
end_if_L250:
	j end_ifL249
else_L248:
	li $t5, 5
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L251beqz
	j else_L251
else_L251beqz:
	lw $t6, GLOBAL_VAR_A_5
	lw $t5, GLOBAL_VAR_A_5
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L253beqz
	j end_if_L253
end_if_L253beqz:
	li $t4, 5
	move $t3, $t4
end_if_L253:
	j end_ifL252
else_L251:
	li $t4, 6
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L254beqz
	j else_L254
else_L254beqz:
	lw $t5, GLOBAL_VAR_A_5
	lw $t4, GLOBAL_VAR_A_6
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L256beqz
	j end_if_L256
end_if_L256beqz:
	li $t6, 5
	move $t3, $t6
end_if_L256:
	j end_ifL255
else_L254:
	li $t6, 7
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L257beqz
	j else_L257
else_L257beqz:
	lw $t4, GLOBAL_VAR_A_5
	lw $t6, GLOBAL_VAR_A_7
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L259beqz
	j end_if_L259
end_if_L259beqz:
	li $t5, 5
	move $t3, $t5
end_if_L259:
	j end_ifL258
else_L257:
	li $t5, 8
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L260beqz
	j else_L260
else_L260beqz:
	lw $t6, GLOBAL_VAR_A_5
	lw $t5, GLOBAL_VAR_A_8
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L262beqz
	j end_if_L262
end_if_L262beqz:
	li $t4, 5
	move $t3, $t4
end_if_L262:
	j end_ifL261
else_L260:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L263beqz
	j else_L263
else_L263beqz:
	lw $t5, GLOBAL_VAR_A_5
	lw $t4, GLOBAL_VAR_A_9
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L265beqz
	j end_if_L265
end_if_L265beqz:
	li $t6, 5
	move $t3, $t6
end_if_L265:
	j end_ifL264
else_L263:
	li $t6, 10
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L266beqz
	j else_L266
else_L266beqz:
	lw $t4, GLOBAL_VAR_A_5
	lw $t6, GLOBAL_VAR_A_10
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L268beqz
	j end_if_L268
end_if_L268beqz:
	li $t5, 5
	move $t3, $t5
end_if_L268:
	j end_ifL267
else_L266:
	li $t5, 11
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L269beqz
	j else_L269
else_L269beqz:
	lw $t6, GLOBAL_VAR_A_5
	lw $t5, GLOBAL_VAR_A_11
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L271beqz
	j end_if_L271
end_if_L271beqz:
	li $t4, 5
	move $t3, $t4
end_if_L271:
	j end_ifL270
else_L269:
	li $t4, 12
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L272beqz
	j else_L272
else_L272beqz:
	lw $t5, GLOBAL_VAR_A_5
	lw $t4, GLOBAL_VAR_A_12
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L274beqz
	j end_if_L274
end_if_L274beqz:
	li $t6, 5
	move $t3, $t6
end_if_L274:
	j end_ifL273
else_L272:
	li $t6, 13
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L275beqz
	j else_L275
else_L275beqz:
	lw $t4, GLOBAL_VAR_A_5
	lw $t6, GLOBAL_VAR_A_13
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L277beqz
	j end_if_L277
end_if_L277beqz:
	li $t5, 5
	move $t3, $t5
end_if_L277:
	j end_ifL276
else_L275:
	li $t5, 14
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L278beqz
	j end_if_L278
end_if_L278beqz:
	lw $t6, GLOBAL_VAR_A_5
	lw $t5, GLOBAL_VAR_A_14
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L279beqz
	j end_if_L279
end_if_L279beqz:
	li $t4, 5
	move $t3, $t4
end_if_L279:
end_if_L278:
end_ifL276:
end_ifL273:
end_ifL270:
end_ifL267:
end_ifL264:
end_ifL261:
end_ifL258:
end_ifL255:
end_ifL252:
end_ifL249:
end_ifL246:
end_ifL243:
end_ifL240:
end_ifL237:
	j end_ifL235
else_L234:
	li $t4, 6
	seq $t5, $t1, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L280beqz
	j else_L280
else_L280beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L282beqz
	j else_L282
else_L282beqz:
	lw $t4, GLOBAL_VAR_A_6
	lw $t5, GLOBAL_VAR_A_0
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L284beqz
	j end_if_L284
end_if_L284beqz:
	li $t6, 6
	move $t3, $t6
end_if_L284:
	j end_ifL283
else_L282:
	li $t6, 1
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L285beqz
	j else_L285
else_L285beqz:
	lw $t5, GLOBAL_VAR_A_6
	lw $t6, GLOBAL_VAR_A_1
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L287beqz
	j end_if_L287
end_if_L287beqz:
	li $t4, 6
	move $t3, $t4
end_if_L287:
	j end_ifL286
else_L285:
	li $t4, 2
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L288beqz
	j else_L288
else_L288beqz:
	lw $t6, GLOBAL_VAR_A_6
	lw $t4, GLOBAL_VAR_A_2
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L290beqz
	j end_if_L290
end_if_L290beqz:
	li $t5, 6
	move $t3, $t5
end_if_L290:
	j end_ifL289
else_L288:
	li $t5, 3
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L291beqz
	j else_L291
else_L291beqz:
	lw $t4, GLOBAL_VAR_A_6
	lw $t5, GLOBAL_VAR_A_3
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L293beqz
	j end_if_L293
end_if_L293beqz:
	li $t6, 6
	move $t3, $t6
end_if_L293:
	j end_ifL292
else_L291:
	li $t6, 4
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L294beqz
	j else_L294
else_L294beqz:
	lw $t5, GLOBAL_VAR_A_6
	lw $t6, GLOBAL_VAR_A_4
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L296beqz
	j end_if_L296
end_if_L296beqz:
	li $t4, 6
	move $t3, $t4
end_if_L296:
	j end_ifL295
else_L294:
	li $t4, 5
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L297beqz
	j else_L297
else_L297beqz:
	lw $t6, GLOBAL_VAR_A_6
	lw $t4, GLOBAL_VAR_A_5
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L299beqz
	j end_if_L299
end_if_L299beqz:
	li $t5, 6
	move $t3, $t5
end_if_L299:
	j end_ifL298
else_L297:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L300beqz
	j else_L300
else_L300beqz:
	lw $t4, GLOBAL_VAR_A_6
	lw $t5, GLOBAL_VAR_A_6
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L302beqz
	j end_if_L302
end_if_L302beqz:
	li $t6, 6
	move $t3, $t6
end_if_L302:
	j end_ifL301
else_L300:
	li $t6, 7
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L303beqz
	j else_L303
else_L303beqz:
	lw $t5, GLOBAL_VAR_A_6
	lw $t6, GLOBAL_VAR_A_7
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L305beqz
	j end_if_L305
end_if_L305beqz:
	li $t4, 6
	move $t3, $t4
end_if_L305:
	j end_ifL304
else_L303:
	li $t4, 8
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L306beqz
	j else_L306
else_L306beqz:
	lw $t6, GLOBAL_VAR_A_6
	lw $t4, GLOBAL_VAR_A_8
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L308beqz
	j end_if_L308
end_if_L308beqz:
	li $t5, 6
	move $t3, $t5
end_if_L308:
	j end_ifL307
else_L306:
	li $t5, 9
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L309beqz
	j else_L309
else_L309beqz:
	lw $t4, GLOBAL_VAR_A_6
	lw $t5, GLOBAL_VAR_A_9
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L311beqz
	j end_if_L311
end_if_L311beqz:
	li $t6, 6
	move $t3, $t6
end_if_L311:
	j end_ifL310
else_L309:
	li $t6, 10
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L312beqz
	j else_L312
else_L312beqz:
	lw $t5, GLOBAL_VAR_A_6
	lw $t6, GLOBAL_VAR_A_10
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L314beqz
	j end_if_L314
end_if_L314beqz:
	li $t4, 6
	move $t3, $t4
end_if_L314:
	j end_ifL313
else_L312:
	li $t4, 11
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L315beqz
	j else_L315
else_L315beqz:
	lw $t6, GLOBAL_VAR_A_6
	lw $t4, GLOBAL_VAR_A_11
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L317beqz
	j end_if_L317
end_if_L317beqz:
	li $t5, 6
	move $t3, $t5
end_if_L317:
	j end_ifL316
else_L315:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L318beqz
	j else_L318
else_L318beqz:
	lw $t4, GLOBAL_VAR_A_6
	lw $t5, GLOBAL_VAR_A_12
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L320beqz
	j end_if_L320
end_if_L320beqz:
	li $t6, 6
	move $t3, $t6
end_if_L320:
	j end_ifL319
else_L318:
	li $t6, 13
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L321beqz
	j else_L321
else_L321beqz:
	lw $t5, GLOBAL_VAR_A_6
	lw $t6, GLOBAL_VAR_A_13
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L323beqz
	j end_if_L323
end_if_L323beqz:
	li $t4, 6
	move $t3, $t4
end_if_L323:
	j end_ifL322
else_L321:
	li $t4, 14
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L324beqz
	j end_if_L324
end_if_L324beqz:
	lw $t6, GLOBAL_VAR_A_6
	lw $t4, GLOBAL_VAR_A_14
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L325beqz
	j end_if_L325
end_if_L325beqz:
	li $t5, 6
	move $t3, $t5
end_if_L325:
end_if_L324:
end_ifL322:
end_ifL319:
end_ifL316:
end_ifL313:
end_ifL310:
end_ifL307:
end_ifL304:
end_ifL301:
end_ifL298:
end_ifL295:
end_ifL292:
end_ifL289:
end_ifL286:
end_ifL283:
	j end_ifL281
else_L280:
	li $t5, 7
	seq $t4, $t1, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L326beqz
	j else_L326
else_L326beqz:
	li $t4, 0
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L328beqz
	j else_L328
else_L328beqz:
	lw $t5, GLOBAL_VAR_A_7
	lw $t4, GLOBAL_VAR_A_0
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L330beqz
	j end_if_L330
end_if_L330beqz:
	li $t6, 7
	move $t3, $t6
end_if_L330:
	j end_ifL329
else_L328:
	li $t6, 1
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L331beqz
	j else_L331
else_L331beqz:
	lw $t4, GLOBAL_VAR_A_7
	lw $t6, GLOBAL_VAR_A_1
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L333beqz
	j end_if_L333
end_if_L333beqz:
	li $t5, 7
	move $t3, $t5
end_if_L333:
	j end_ifL332
else_L331:
	li $t5, 2
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L334beqz
	j else_L334
else_L334beqz:
	lw $t6, GLOBAL_VAR_A_7
	lw $t5, GLOBAL_VAR_A_2
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L336beqz
	j end_if_L336
end_if_L336beqz:
	li $t4, 7
	move $t3, $t4
end_if_L336:
	j end_ifL335
else_L334:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L337beqz
	j else_L337
else_L337beqz:
	lw $t5, GLOBAL_VAR_A_7
	lw $t4, GLOBAL_VAR_A_3
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L339beqz
	j end_if_L339
end_if_L339beqz:
	li $t6, 7
	move $t3, $t6
end_if_L339:
	j end_ifL338
else_L337:
	li $t6, 4
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L340beqz
	j else_L340
else_L340beqz:
	lw $t4, GLOBAL_VAR_A_7
	lw $t6, GLOBAL_VAR_A_4
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L342beqz
	j end_if_L342
end_if_L342beqz:
	li $t5, 7
	move $t3, $t5
end_if_L342:
	j end_ifL341
else_L340:
	li $t5, 5
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L343beqz
	j else_L343
else_L343beqz:
	lw $t6, GLOBAL_VAR_A_7
	lw $t5, GLOBAL_VAR_A_5
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L345beqz
	j end_if_L345
end_if_L345beqz:
	li $t4, 7
	move $t3, $t4
end_if_L345:
	j end_ifL344
else_L343:
	li $t4, 6
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L346beqz
	j else_L346
else_L346beqz:
	lw $t5, GLOBAL_VAR_A_7
	lw $t4, GLOBAL_VAR_A_6
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L348beqz
	j end_if_L348
end_if_L348beqz:
	li $t6, 7
	move $t3, $t6
end_if_L348:
	j end_ifL347
else_L346:
	li $t6, 7
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L349beqz
	j else_L349
else_L349beqz:
	lw $t4, GLOBAL_VAR_A_7
	lw $t6, GLOBAL_VAR_A_7
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L351beqz
	j end_if_L351
end_if_L351beqz:
	li $t5, 7
	move $t3, $t5
end_if_L351:
	j end_ifL350
else_L349:
	li $t5, 8
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L352beqz
	j else_L352
else_L352beqz:
	lw $t6, GLOBAL_VAR_A_7
	lw $t5, GLOBAL_VAR_A_8
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L354beqz
	j end_if_L354
end_if_L354beqz:
	li $t4, 7
	move $t3, $t4
end_if_L354:
	j end_ifL353
else_L352:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L355beqz
	j else_L355
else_L355beqz:
	lw $t5, GLOBAL_VAR_A_7
	lw $t4, GLOBAL_VAR_A_9
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L357beqz
	j end_if_L357
end_if_L357beqz:
	li $t6, 7
	move $t3, $t6
end_if_L357:
	j end_ifL356
else_L355:
	li $t6, 10
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L358beqz
	j else_L358
else_L358beqz:
	lw $t4, GLOBAL_VAR_A_7
	lw $t6, GLOBAL_VAR_A_10
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L360beqz
	j end_if_L360
end_if_L360beqz:
	li $t5, 7
	move $t3, $t5
end_if_L360:
	j end_ifL359
else_L358:
	li $t5, 11
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L361beqz
	j else_L361
else_L361beqz:
	lw $t6, GLOBAL_VAR_A_7
	lw $t5, GLOBAL_VAR_A_11
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L363beqz
	j end_if_L363
end_if_L363beqz:
	li $t4, 7
	move $t3, $t4
end_if_L363:
	j end_ifL362
else_L361:
	li $t4, 12
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L364beqz
	j else_L364
else_L364beqz:
	lw $t5, GLOBAL_VAR_A_7
	lw $t4, GLOBAL_VAR_A_12
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L366beqz
	j end_if_L366
end_if_L366beqz:
	li $t6, 7
	move $t3, $t6
end_if_L366:
	j end_ifL365
else_L364:
	li $t6, 13
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L367beqz
	j else_L367
else_L367beqz:
	lw $t4, GLOBAL_VAR_A_7
	lw $t6, GLOBAL_VAR_A_13
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L369beqz
	j end_if_L369
end_if_L369beqz:
	li $t5, 7
	move $t3, $t5
end_if_L369:
	j end_ifL368
else_L367:
	li $t5, 14
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L370beqz
	j end_if_L370
end_if_L370beqz:
	lw $t6, GLOBAL_VAR_A_7
	lw $t5, GLOBAL_VAR_A_14
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L371beqz
	j end_if_L371
end_if_L371beqz:
	li $t4, 7
	move $t3, $t4
end_if_L371:
end_if_L370:
end_ifL368:
end_ifL365:
end_ifL362:
end_ifL359:
end_ifL356:
end_ifL353:
end_ifL350:
end_ifL347:
end_ifL344:
end_ifL341:
end_ifL338:
end_ifL335:
end_ifL332:
end_ifL329:
	j end_ifL327
else_L326:
	li $t4, 8
	seq $t5, $t1, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L372beqz
	j else_L372
else_L372beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L374beqz
	j else_L374
else_L374beqz:
	lw $t4, GLOBAL_VAR_A_8
	lw $t5, GLOBAL_VAR_A_0
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L376beqz
	j end_if_L376
end_if_L376beqz:
	li $t6, 8
	move $t3, $t6
end_if_L376:
	j end_ifL375
else_L374:
	li $t6, 1
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L377beqz
	j else_L377
else_L377beqz:
	lw $t5, GLOBAL_VAR_A_8
	lw $t6, GLOBAL_VAR_A_1
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L379beqz
	j end_if_L379
end_if_L379beqz:
	li $t4, 8
	move $t3, $t4
end_if_L379:
	j end_ifL378
else_L377:
	li $t4, 2
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L380beqz
	j else_L380
else_L380beqz:
	lw $t6, GLOBAL_VAR_A_8
	lw $t4, GLOBAL_VAR_A_2
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L382beqz
	j end_if_L382
end_if_L382beqz:
	li $t5, 8
	move $t3, $t5
end_if_L382:
	j end_ifL381
else_L380:
	li $t5, 3
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L383beqz
	j else_L383
else_L383beqz:
	lw $t4, GLOBAL_VAR_A_8
	lw $t5, GLOBAL_VAR_A_3
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L385beqz
	j end_if_L385
end_if_L385beqz:
	li $t6, 8
	move $t3, $t6
end_if_L385:
	j end_ifL384
else_L383:
	li $t6, 4
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L386beqz
	j else_L386
else_L386beqz:
	lw $t5, GLOBAL_VAR_A_8
	lw $t6, GLOBAL_VAR_A_4
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L388beqz
	j end_if_L388
end_if_L388beqz:
	li $t4, 8
	move $t3, $t4
end_if_L388:
	j end_ifL387
else_L386:
	li $t4, 5
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L389beqz
	j else_L389
else_L389beqz:
	lw $t6, GLOBAL_VAR_A_8
	lw $t4, GLOBAL_VAR_A_5
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L391beqz
	j end_if_L391
end_if_L391beqz:
	li $t5, 8
	move $t3, $t5
end_if_L391:
	j end_ifL390
else_L389:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L392beqz
	j else_L392
else_L392beqz:
	lw $t4, GLOBAL_VAR_A_8
	lw $t5, GLOBAL_VAR_A_6
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L394beqz
	j end_if_L394
end_if_L394beqz:
	li $t6, 8
	move $t3, $t6
end_if_L394:
	j end_ifL393
else_L392:
	li $t6, 7
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L395beqz
	j else_L395
else_L395beqz:
	lw $t5, GLOBAL_VAR_A_8
	lw $t6, GLOBAL_VAR_A_7
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L397beqz
	j end_if_L397
end_if_L397beqz:
	li $t4, 8
	move $t3, $t4
end_if_L397:
	j end_ifL396
else_L395:
	li $t4, 8
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L398beqz
	j else_L398
else_L398beqz:
	lw $t6, GLOBAL_VAR_A_8
	lw $t4, GLOBAL_VAR_A_8
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L400beqz
	j end_if_L400
end_if_L400beqz:
	li $t5, 8
	move $t3, $t5
end_if_L400:
	j end_ifL399
else_L398:
	li $t5, 9
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L401beqz
	j else_L401
else_L401beqz:
	lw $t4, GLOBAL_VAR_A_8
	lw $t5, GLOBAL_VAR_A_9
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L403beqz
	j end_if_L403
end_if_L403beqz:
	li $t6, 8
	move $t3, $t6
end_if_L403:
	j end_ifL402
else_L401:
	li $t6, 10
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L404beqz
	j else_L404
else_L404beqz:
	lw $t5, GLOBAL_VAR_A_8
	lw $t6, GLOBAL_VAR_A_10
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L406beqz
	j end_if_L406
end_if_L406beqz:
	li $t4, 8
	move $t3, $t4
end_if_L406:
	j end_ifL405
else_L404:
	li $t4, 11
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L407beqz
	j else_L407
else_L407beqz:
	lw $t6, GLOBAL_VAR_A_8
	lw $t4, GLOBAL_VAR_A_11
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L409beqz
	j end_if_L409
end_if_L409beqz:
	li $t5, 8
	move $t3, $t5
end_if_L409:
	j end_ifL408
else_L407:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L410beqz
	j else_L410
else_L410beqz:
	lw $t4, GLOBAL_VAR_A_8
	lw $t5, GLOBAL_VAR_A_12
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L412beqz
	j end_if_L412
end_if_L412beqz:
	li $t6, 8
	move $t3, $t6
end_if_L412:
	j end_ifL411
else_L410:
	li $t6, 13
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L413beqz
	j else_L413
else_L413beqz:
	lw $t5, GLOBAL_VAR_A_8
	lw $t6, GLOBAL_VAR_A_13
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L415beqz
	j end_if_L415
end_if_L415beqz:
	li $t4, 8
	move $t3, $t4
end_if_L415:
	j end_ifL414
else_L413:
	li $t4, 14
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L416beqz
	j end_if_L416
end_if_L416beqz:
	lw $t6, GLOBAL_VAR_A_8
	lw $t4, GLOBAL_VAR_A_14
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L417beqz
	j end_if_L417
end_if_L417beqz:
	li $t5, 8
	move $t3, $t5
end_if_L417:
end_if_L416:
end_ifL414:
end_ifL411:
end_ifL408:
end_ifL405:
end_ifL402:
end_ifL399:
end_ifL396:
end_ifL393:
end_ifL390:
end_ifL387:
end_ifL384:
end_ifL381:
end_ifL378:
end_ifL375:
	j end_ifL373
else_L372:
	li $t5, 9
	seq $t4, $t1, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L418beqz
	j else_L418
else_L418beqz:
	li $t4, 0
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L420beqz
	j else_L420
else_L420beqz:
	lw $t5, GLOBAL_VAR_A_9
	lw $t4, GLOBAL_VAR_A_0
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L422beqz
	j end_if_L422
end_if_L422beqz:
	li $t6, 9
	move $t3, $t6
end_if_L422:
	j end_ifL421
else_L420:
	li $t6, 1
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L423beqz
	j else_L423
else_L423beqz:
	lw $t4, GLOBAL_VAR_A_9
	lw $t6, GLOBAL_VAR_A_1
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L425beqz
	j end_if_L425
end_if_L425beqz:
	li $t5, 9
	move $t3, $t5
end_if_L425:
	j end_ifL424
else_L423:
	li $t5, 2
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L426beqz
	j else_L426
else_L426beqz:
	lw $t6, GLOBAL_VAR_A_9
	lw $t5, GLOBAL_VAR_A_2
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L428beqz
	j end_if_L428
end_if_L428beqz:
	li $t4, 9
	move $t3, $t4
end_if_L428:
	j end_ifL427
else_L426:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L429beqz
	j else_L429
else_L429beqz:
	lw $t5, GLOBAL_VAR_A_9
	lw $t4, GLOBAL_VAR_A_3
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L431beqz
	j end_if_L431
end_if_L431beqz:
	li $t6, 9
	move $t3, $t6
end_if_L431:
	j end_ifL430
else_L429:
	li $t6, 4
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L432beqz
	j else_L432
else_L432beqz:
	lw $t4, GLOBAL_VAR_A_9
	lw $t6, GLOBAL_VAR_A_4
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L434beqz
	j end_if_L434
end_if_L434beqz:
	li $t5, 9
	move $t3, $t5
end_if_L434:
	j end_ifL433
else_L432:
	li $t5, 5
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L435beqz
	j else_L435
else_L435beqz:
	lw $t6, GLOBAL_VAR_A_9
	lw $t5, GLOBAL_VAR_A_5
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L437beqz
	j end_if_L437
end_if_L437beqz:
	li $t4, 9
	move $t3, $t4
end_if_L437:
	j end_ifL436
else_L435:
	li $t4, 6
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L438beqz
	j else_L438
else_L438beqz:
	lw $t5, GLOBAL_VAR_A_9
	lw $t4, GLOBAL_VAR_A_6
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L440beqz
	j end_if_L440
end_if_L440beqz:
	li $t6, 9
	move $t3, $t6
end_if_L440:
	j end_ifL439
else_L438:
	li $t6, 7
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L441beqz
	j else_L441
else_L441beqz:
	lw $t4, GLOBAL_VAR_A_9
	lw $t6, GLOBAL_VAR_A_7
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L443beqz
	j end_if_L443
end_if_L443beqz:
	li $t5, 9
	move $t3, $t5
end_if_L443:
	j end_ifL442
else_L441:
	li $t5, 8
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L444beqz
	j else_L444
else_L444beqz:
	lw $t6, GLOBAL_VAR_A_9
	lw $t5, GLOBAL_VAR_A_8
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L446beqz
	j end_if_L446
end_if_L446beqz:
	li $t4, 9
	move $t3, $t4
end_if_L446:
	j end_ifL445
else_L444:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L447beqz
	j else_L447
else_L447beqz:
	lw $t5, GLOBAL_VAR_A_9
	lw $t4, GLOBAL_VAR_A_9
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L449beqz
	j end_if_L449
end_if_L449beqz:
	li $t6, 9
	move $t3, $t6
end_if_L449:
	j end_ifL448
else_L447:
	li $t6, 10
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L450beqz
	j else_L450
else_L450beqz:
	lw $t4, GLOBAL_VAR_A_9
	lw $t6, GLOBAL_VAR_A_10
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L452beqz
	j end_if_L452
end_if_L452beqz:
	li $t5, 9
	move $t3, $t5
end_if_L452:
	j end_ifL451
else_L450:
	li $t5, 11
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L453beqz
	j else_L453
else_L453beqz:
	lw $t6, GLOBAL_VAR_A_9
	lw $t5, GLOBAL_VAR_A_11
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L455beqz
	j end_if_L455
end_if_L455beqz:
	li $t4, 9
	move $t3, $t4
end_if_L455:
	j end_ifL454
else_L453:
	li $t4, 12
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L456beqz
	j else_L456
else_L456beqz:
	lw $t5, GLOBAL_VAR_A_9
	lw $t4, GLOBAL_VAR_A_12
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L458beqz
	j end_if_L458
end_if_L458beqz:
	li $t6, 9
	move $t3, $t6
end_if_L458:
	j end_ifL457
else_L456:
	li $t6, 13
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L459beqz
	j else_L459
else_L459beqz:
	lw $t4, GLOBAL_VAR_A_9
	lw $t6, GLOBAL_VAR_A_13
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L461beqz
	j end_if_L461
end_if_L461beqz:
	li $t5, 9
	move $t3, $t5
end_if_L461:
	j end_ifL460
else_L459:
	li $t5, 14
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L462beqz
	j end_if_L462
end_if_L462beqz:
	lw $t6, GLOBAL_VAR_A_9
	lw $t5, GLOBAL_VAR_A_14
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L463beqz
	j end_if_L463
end_if_L463beqz:
	li $t4, 9
	move $t3, $t4
end_if_L463:
end_if_L462:
end_ifL460:
end_ifL457:
end_ifL454:
end_ifL451:
end_ifL448:
end_ifL445:
end_ifL442:
end_ifL439:
end_ifL436:
end_ifL433:
end_ifL430:
end_ifL427:
end_ifL424:
end_ifL421:
	j end_ifL419
else_L418:
	li $t4, 10
	seq $t5, $t1, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L464beqz
	j else_L464
else_L464beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L466beqz
	j else_L466
else_L466beqz:
	lw $t4, GLOBAL_VAR_A_10
	lw $t5, GLOBAL_VAR_A_0
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L468beqz
	j end_if_L468
end_if_L468beqz:
	li $t6, 10
	move $t3, $t6
end_if_L468:
	j end_ifL467
else_L466:
	li $t6, 1
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L469beqz
	j else_L469
else_L469beqz:
	lw $t5, GLOBAL_VAR_A_10
	lw $t6, GLOBAL_VAR_A_1
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L471beqz
	j end_if_L471
end_if_L471beqz:
	li $t4, 10
	move $t3, $t4
end_if_L471:
	j end_ifL470
else_L469:
	li $t4, 2
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L472beqz
	j else_L472
else_L472beqz:
	lw $t6, GLOBAL_VAR_A_10
	lw $t4, GLOBAL_VAR_A_2
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L474beqz
	j end_if_L474
end_if_L474beqz:
	li $t5, 10
	move $t3, $t5
end_if_L474:
	j end_ifL473
else_L472:
	li $t5, 3
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L475beqz
	j else_L475
else_L475beqz:
	lw $t4, GLOBAL_VAR_A_10
	lw $t5, GLOBAL_VAR_A_3
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L477beqz
	j end_if_L477
end_if_L477beqz:
	li $t6, 10
	move $t3, $t6
end_if_L477:
	j end_ifL476
else_L475:
	li $t6, 4
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L478beqz
	j else_L478
else_L478beqz:
	lw $t5, GLOBAL_VAR_A_10
	lw $t6, GLOBAL_VAR_A_4
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L480beqz
	j end_if_L480
end_if_L480beqz:
	li $t4, 10
	move $t3, $t4
end_if_L480:
	j end_ifL479
else_L478:
	li $t4, 5
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L481beqz
	j else_L481
else_L481beqz:
	lw $t6, GLOBAL_VAR_A_10
	lw $t4, GLOBAL_VAR_A_5
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L483beqz
	j end_if_L483
end_if_L483beqz:
	li $t5, 10
	move $t3, $t5
end_if_L483:
	j end_ifL482
else_L481:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L484beqz
	j else_L484
else_L484beqz:
	lw $t4, GLOBAL_VAR_A_10
	lw $t5, GLOBAL_VAR_A_6
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L486beqz
	j end_if_L486
end_if_L486beqz:
	li $t6, 10
	move $t3, $t6
end_if_L486:
	j end_ifL485
else_L484:
	li $t6, 7
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L487beqz
	j else_L487
else_L487beqz:
	lw $t5, GLOBAL_VAR_A_10
	lw $t6, GLOBAL_VAR_A_7
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L489beqz
	j end_if_L489
end_if_L489beqz:
	li $t4, 10
	move $t3, $t4
end_if_L489:
	j end_ifL488
else_L487:
	li $t4, 8
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L490beqz
	j else_L490
else_L490beqz:
	lw $t6, GLOBAL_VAR_A_10
	lw $t4, GLOBAL_VAR_A_8
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L492beqz
	j end_if_L492
end_if_L492beqz:
	li $t5, 10
	move $t3, $t5
end_if_L492:
	j end_ifL491
else_L490:
	li $t5, 9
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L493beqz
	j else_L493
else_L493beqz:
	lw $t4, GLOBAL_VAR_A_10
	lw $t5, GLOBAL_VAR_A_9
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L495beqz
	j end_if_L495
end_if_L495beqz:
	li $t6, 10
	move $t3, $t6
end_if_L495:
	j end_ifL494
else_L493:
	li $t6, 10
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L496beqz
	j else_L496
else_L496beqz:
	lw $t5, GLOBAL_VAR_A_10
	lw $t6, GLOBAL_VAR_A_10
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L498beqz
	j end_if_L498
end_if_L498beqz:
	li $t4, 10
	move $t3, $t4
end_if_L498:
	j end_ifL497
else_L496:
	li $t4, 11
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L499beqz
	j else_L499
else_L499beqz:
	lw $t6, GLOBAL_VAR_A_10
	lw $t4, GLOBAL_VAR_A_11
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L501beqz
	j end_if_L501
end_if_L501beqz:
	li $t5, 10
	move $t3, $t5
end_if_L501:
	j end_ifL500
else_L499:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L502beqz
	j else_L502
else_L502beqz:
	lw $t4, GLOBAL_VAR_A_10
	lw $t5, GLOBAL_VAR_A_12
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L504beqz
	j end_if_L504
end_if_L504beqz:
	li $t6, 10
	move $t3, $t6
end_if_L504:
	j end_ifL503
else_L502:
	li $t6, 13
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L505beqz
	j else_L505
else_L505beqz:
	lw $t5, GLOBAL_VAR_A_10
	lw $t6, GLOBAL_VAR_A_13
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L507beqz
	j end_if_L507
end_if_L507beqz:
	li $t4, 10
	move $t3, $t4
end_if_L507:
	j end_ifL506
else_L505:
	li $t4, 14
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L508beqz
	j end_if_L508
end_if_L508beqz:
	lw $t6, GLOBAL_VAR_A_10
	lw $t4, GLOBAL_VAR_A_14
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L509beqz
	j end_if_L509
end_if_L509beqz:
	li $t5, 10
	move $t3, $t5
end_if_L509:
end_if_L508:
end_ifL506:
end_ifL503:
end_ifL500:
end_ifL497:
end_ifL494:
end_ifL491:
end_ifL488:
end_ifL485:
end_ifL482:
end_ifL479:
end_ifL476:
end_ifL473:
end_ifL470:
end_ifL467:
	j end_ifL465
else_L464:
	li $t5, 11
	seq $t4, $t1, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L510beqz
	j else_L510
else_L510beqz:
	li $t4, 0
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L512beqz
	j else_L512
else_L512beqz:
	lw $t5, GLOBAL_VAR_A_11
	lw $t4, GLOBAL_VAR_A_0
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L514beqz
	j end_if_L514
end_if_L514beqz:
	li $t6, 11
	move $t3, $t6
end_if_L514:
	j end_ifL513
else_L512:
	li $t6, 1
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L515beqz
	j else_L515
else_L515beqz:
	lw $t4, GLOBAL_VAR_A_11
	lw $t6, GLOBAL_VAR_A_1
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L517beqz
	j end_if_L517
end_if_L517beqz:
	li $t5, 11
	move $t3, $t5
end_if_L517:
	j end_ifL516
else_L515:
	li $t5, 2
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L518beqz
	j else_L518
else_L518beqz:
	lw $t6, GLOBAL_VAR_A_11
	lw $t5, GLOBAL_VAR_A_2
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L520beqz
	j end_if_L520
end_if_L520beqz:
	li $t4, 11
	move $t3, $t4
end_if_L520:
	j end_ifL519
else_L518:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L521beqz
	j else_L521
else_L521beqz:
	lw $t5, GLOBAL_VAR_A_11
	lw $t4, GLOBAL_VAR_A_3
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L523beqz
	j end_if_L523
end_if_L523beqz:
	li $t6, 11
	move $t3, $t6
end_if_L523:
	j end_ifL522
else_L521:
	li $t6, 4
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L524beqz
	j else_L524
else_L524beqz:
	lw $t4, GLOBAL_VAR_A_11
	lw $t6, GLOBAL_VAR_A_4
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L526beqz
	j end_if_L526
end_if_L526beqz:
	li $t5, 11
	move $t3, $t5
end_if_L526:
	j end_ifL525
else_L524:
	li $t5, 5
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L527beqz
	j else_L527
else_L527beqz:
	lw $t6, GLOBAL_VAR_A_11
	lw $t5, GLOBAL_VAR_A_5
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L529beqz
	j end_if_L529
end_if_L529beqz:
	li $t4, 11
	move $t3, $t4
end_if_L529:
	j end_ifL528
else_L527:
	li $t4, 6
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L530beqz
	j else_L530
else_L530beqz:
	lw $t5, GLOBAL_VAR_A_11
	lw $t4, GLOBAL_VAR_A_6
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L532beqz
	j end_if_L532
end_if_L532beqz:
	li $t6, 11
	move $t3, $t6
end_if_L532:
	j end_ifL531
else_L530:
	li $t6, 7
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L533beqz
	j else_L533
else_L533beqz:
	lw $t4, GLOBAL_VAR_A_11
	lw $t6, GLOBAL_VAR_A_7
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L535beqz
	j end_if_L535
end_if_L535beqz:
	li $t5, 11
	move $t3, $t5
end_if_L535:
	j end_ifL534
else_L533:
	li $t5, 8
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L536beqz
	j else_L536
else_L536beqz:
	lw $t6, GLOBAL_VAR_A_11
	lw $t5, GLOBAL_VAR_A_8
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L538beqz
	j end_if_L538
end_if_L538beqz:
	li $t4, 11
	move $t3, $t4
end_if_L538:
	j end_ifL537
else_L536:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L539beqz
	j else_L539
else_L539beqz:
	lw $t5, GLOBAL_VAR_A_11
	lw $t4, GLOBAL_VAR_A_9
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L541beqz
	j end_if_L541
end_if_L541beqz:
	li $t6, 11
	move $t3, $t6
end_if_L541:
	j end_ifL540
else_L539:
	li $t6, 10
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L542beqz
	j else_L542
else_L542beqz:
	lw $t4, GLOBAL_VAR_A_11
	lw $t6, GLOBAL_VAR_A_10
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L544beqz
	j end_if_L544
end_if_L544beqz:
	li $t5, 11
	move $t3, $t5
end_if_L544:
	j end_ifL543
else_L542:
	li $t5, 11
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L545beqz
	j else_L545
else_L545beqz:
	lw $t6, GLOBAL_VAR_A_11
	lw $t5, GLOBAL_VAR_A_11
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L547beqz
	j end_if_L547
end_if_L547beqz:
	li $t4, 11
	move $t3, $t4
end_if_L547:
	j end_ifL546
else_L545:
	li $t4, 12
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L548beqz
	j else_L548
else_L548beqz:
	lw $t5, GLOBAL_VAR_A_11
	lw $t4, GLOBAL_VAR_A_12
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L550beqz
	j end_if_L550
end_if_L550beqz:
	li $t6, 11
	move $t3, $t6
end_if_L550:
	j end_ifL549
else_L548:
	li $t6, 13
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L551beqz
	j else_L551
else_L551beqz:
	lw $t4, GLOBAL_VAR_A_11
	lw $t6, GLOBAL_VAR_A_13
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L553beqz
	j end_if_L553
end_if_L553beqz:
	li $t5, 11
	move $t3, $t5
end_if_L553:
	j end_ifL552
else_L551:
	li $t5, 14
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L554beqz
	j end_if_L554
end_if_L554beqz:
	lw $t6, GLOBAL_VAR_A_11
	lw $t5, GLOBAL_VAR_A_14
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L555beqz
	j end_if_L555
end_if_L555beqz:
	li $t4, 11
	move $t3, $t4
end_if_L555:
end_if_L554:
end_ifL552:
end_ifL549:
end_ifL546:
end_ifL543:
end_ifL540:
end_ifL537:
end_ifL534:
end_ifL531:
end_ifL528:
end_ifL525:
end_ifL522:
end_ifL519:
end_ifL516:
end_ifL513:
	j end_ifL511
else_L510:
	li $t4, 12
	seq $t5, $t1, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L556beqz
	j else_L556
else_L556beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L558beqz
	j else_L558
else_L558beqz:
	lw $t4, GLOBAL_VAR_A_12
	lw $t5, GLOBAL_VAR_A_0
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L560beqz
	j end_if_L560
end_if_L560beqz:
	li $t6, 12
	move $t3, $t6
end_if_L560:
	j end_ifL559
else_L558:
	li $t6, 1
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L561beqz
	j else_L561
else_L561beqz:
	lw $t5, GLOBAL_VAR_A_12
	lw $t6, GLOBAL_VAR_A_1
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L563beqz
	j end_if_L563
end_if_L563beqz:
	li $t4, 12
	move $t3, $t4
end_if_L563:
	j end_ifL562
else_L561:
	li $t4, 2
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L564beqz
	j else_L564
else_L564beqz:
	lw $t6, GLOBAL_VAR_A_12
	lw $t4, GLOBAL_VAR_A_2
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L566beqz
	j end_if_L566
end_if_L566beqz:
	li $t5, 12
	move $t3, $t5
end_if_L566:
	j end_ifL565
else_L564:
	li $t5, 3
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L567beqz
	j else_L567
else_L567beqz:
	lw $t4, GLOBAL_VAR_A_12
	lw $t5, GLOBAL_VAR_A_3
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L569beqz
	j end_if_L569
end_if_L569beqz:
	li $t6, 12
	move $t3, $t6
end_if_L569:
	j end_ifL568
else_L567:
	li $t6, 4
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L570beqz
	j else_L570
else_L570beqz:
	lw $t5, GLOBAL_VAR_A_12
	lw $t6, GLOBAL_VAR_A_4
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L572beqz
	j end_if_L572
end_if_L572beqz:
	li $t4, 12
	move $t3, $t4
end_if_L572:
	j end_ifL571
else_L570:
	li $t4, 5
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L573beqz
	j else_L573
else_L573beqz:
	lw $t6, GLOBAL_VAR_A_12
	lw $t4, GLOBAL_VAR_A_5
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L575beqz
	j end_if_L575
end_if_L575beqz:
	li $t5, 12
	move $t3, $t5
end_if_L575:
	j end_ifL574
else_L573:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L576beqz
	j else_L576
else_L576beqz:
	lw $t4, GLOBAL_VAR_A_12
	lw $t5, GLOBAL_VAR_A_6
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L578beqz
	j end_if_L578
end_if_L578beqz:
	li $t6, 12
	move $t3, $t6
end_if_L578:
	j end_ifL577
else_L576:
	li $t6, 7
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L579beqz
	j else_L579
else_L579beqz:
	lw $t5, GLOBAL_VAR_A_12
	lw $t6, GLOBAL_VAR_A_7
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L581beqz
	j end_if_L581
end_if_L581beqz:
	li $t4, 12
	move $t3, $t4
end_if_L581:
	j end_ifL580
else_L579:
	li $t4, 8
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L582beqz
	j else_L582
else_L582beqz:
	lw $t6, GLOBAL_VAR_A_12
	lw $t4, GLOBAL_VAR_A_8
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L584beqz
	j end_if_L584
end_if_L584beqz:
	li $t5, 12
	move $t3, $t5
end_if_L584:
	j end_ifL583
else_L582:
	li $t5, 9
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L585beqz
	j else_L585
else_L585beqz:
	lw $t4, GLOBAL_VAR_A_12
	lw $t5, GLOBAL_VAR_A_9
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L587beqz
	j end_if_L587
end_if_L587beqz:
	li $t6, 12
	move $t3, $t6
end_if_L587:
	j end_ifL586
else_L585:
	li $t6, 10
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L588beqz
	j else_L588
else_L588beqz:
	lw $t5, GLOBAL_VAR_A_12
	lw $t6, GLOBAL_VAR_A_10
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L590beqz
	j end_if_L590
end_if_L590beqz:
	li $t4, 12
	move $t3, $t4
end_if_L590:
	j end_ifL589
else_L588:
	li $t4, 11
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L591beqz
	j else_L591
else_L591beqz:
	lw $t6, GLOBAL_VAR_A_12
	lw $t4, GLOBAL_VAR_A_11
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L593beqz
	j end_if_L593
end_if_L593beqz:
	li $t5, 12
	move $t3, $t5
end_if_L593:
	j end_ifL592
else_L591:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L594beqz
	j else_L594
else_L594beqz:
	lw $t4, GLOBAL_VAR_A_12
	lw $t5, GLOBAL_VAR_A_12
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L596beqz
	j end_if_L596
end_if_L596beqz:
	li $t6, 12
	move $t3, $t6
end_if_L596:
	j end_ifL595
else_L594:
	li $t6, 13
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L597beqz
	j else_L597
else_L597beqz:
	lw $t5, GLOBAL_VAR_A_12
	lw $t6, GLOBAL_VAR_A_13
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L599beqz
	j end_if_L599
end_if_L599beqz:
	li $t4, 12
	move $t3, $t4
end_if_L599:
	j end_ifL598
else_L597:
	li $t4, 14
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L600beqz
	j end_if_L600
end_if_L600beqz:
	lw $t6, GLOBAL_VAR_A_12
	lw $t4, GLOBAL_VAR_A_14
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L601beqz
	j end_if_L601
end_if_L601beqz:
	li $t5, 12
	move $t3, $t5
end_if_L601:
end_if_L600:
end_ifL598:
end_ifL595:
end_ifL592:
end_ifL589:
end_ifL586:
end_ifL583:
end_ifL580:
end_ifL577:
end_ifL574:
end_ifL571:
end_ifL568:
end_ifL565:
end_ifL562:
end_ifL559:
	j end_ifL557
else_L556:
	li $t5, 13
	seq $t4, $t1, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L602beqz
	j else_L602
else_L602beqz:
	li $t4, 0
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L604beqz
	j else_L604
else_L604beqz:
	lw $t5, GLOBAL_VAR_A_13
	lw $t4, GLOBAL_VAR_A_0
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L606beqz
	j end_if_L606
end_if_L606beqz:
	li $t6, 13
	move $t3, $t6
end_if_L606:
	j end_ifL605
else_L604:
	li $t6, 1
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L607beqz
	j else_L607
else_L607beqz:
	lw $t4, GLOBAL_VAR_A_13
	lw $t6, GLOBAL_VAR_A_1
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L609beqz
	j end_if_L609
end_if_L609beqz:
	li $t5, 13
	move $t3, $t5
end_if_L609:
	j end_ifL608
else_L607:
	li $t5, 2
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L610beqz
	j else_L610
else_L610beqz:
	lw $t6, GLOBAL_VAR_A_13
	lw $t5, GLOBAL_VAR_A_2
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L612beqz
	j end_if_L612
end_if_L612beqz:
	li $t4, 13
	move $t3, $t4
end_if_L612:
	j end_ifL611
else_L610:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L613beqz
	j else_L613
else_L613beqz:
	lw $t5, GLOBAL_VAR_A_13
	lw $t4, GLOBAL_VAR_A_3
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L615beqz
	j end_if_L615
end_if_L615beqz:
	li $t6, 13
	move $t3, $t6
end_if_L615:
	j end_ifL614
else_L613:
	li $t6, 4
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L616beqz
	j else_L616
else_L616beqz:
	lw $t4, GLOBAL_VAR_A_13
	lw $t6, GLOBAL_VAR_A_4
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L618beqz
	j end_if_L618
end_if_L618beqz:
	li $t5, 13
	move $t3, $t5
end_if_L618:
	j end_ifL617
else_L616:
	li $t5, 5
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L619beqz
	j else_L619
else_L619beqz:
	lw $t6, GLOBAL_VAR_A_13
	lw $t5, GLOBAL_VAR_A_5
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L621beqz
	j end_if_L621
end_if_L621beqz:
	li $t4, 13
	move $t3, $t4
end_if_L621:
	j end_ifL620
else_L619:
	li $t4, 6
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L622beqz
	j else_L622
else_L622beqz:
	lw $t5, GLOBAL_VAR_A_13
	lw $t4, GLOBAL_VAR_A_6
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L624beqz
	j end_if_L624
end_if_L624beqz:
	li $t6, 13
	move $t3, $t6
end_if_L624:
	j end_ifL623
else_L622:
	li $t6, 7
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L625beqz
	j else_L625
else_L625beqz:
	lw $t4, GLOBAL_VAR_A_13
	lw $t6, GLOBAL_VAR_A_7
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L627beqz
	j end_if_L627
end_if_L627beqz:
	li $t5, 13
	move $t3, $t5
end_if_L627:
	j end_ifL626
else_L625:
	li $t5, 8
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L628beqz
	j else_L628
else_L628beqz:
	lw $t6, GLOBAL_VAR_A_13
	lw $t5, GLOBAL_VAR_A_8
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L630beqz
	j end_if_L630
end_if_L630beqz:
	li $t4, 13
	move $t3, $t4
end_if_L630:
	j end_ifL629
else_L628:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L631beqz
	j else_L631
else_L631beqz:
	lw $t5, GLOBAL_VAR_A_13
	lw $t4, GLOBAL_VAR_A_9
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L633beqz
	j end_if_L633
end_if_L633beqz:
	li $t6, 13
	move $t3, $t6
end_if_L633:
	j end_ifL632
else_L631:
	li $t6, 10
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L634beqz
	j else_L634
else_L634beqz:
	lw $t4, GLOBAL_VAR_A_13
	lw $t6, GLOBAL_VAR_A_10
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L636beqz
	j end_if_L636
end_if_L636beqz:
	li $t5, 13
	move $t3, $t5
end_if_L636:
	j end_ifL635
else_L634:
	li $t5, 11
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, else_L637beqz
	j else_L637
else_L637beqz:
	lw $t6, GLOBAL_VAR_A_13
	lw $t5, GLOBAL_VAR_A_11
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L639beqz
	j end_if_L639
end_if_L639beqz:
	li $t4, 13
	move $t3, $t4
end_if_L639:
	j end_ifL638
else_L637:
	li $t4, 12
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L640beqz
	j else_L640
else_L640beqz:
	lw $t5, GLOBAL_VAR_A_13
	lw $t4, GLOBAL_VAR_A_12
	slt $t6, $t5, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L642beqz
	j end_if_L642
end_if_L642beqz:
	li $t6, 13
	move $t3, $t6
end_if_L642:
	j end_ifL641
else_L640:
	li $t6, 13
	seq $t4, $t3, $t6
	seq $t6, $t4, $0
	beqz $t6, else_L643beqz
	j else_L643
else_L643beqz:
	lw $t4, GLOBAL_VAR_A_13
	lw $t6, GLOBAL_VAR_A_13
	slt $t5, $t4, $t6
	seq $t6, $t5, $0
	beqz $t6, end_if_L645beqz
	j end_if_L645
end_if_L645beqz:
	li $t5, 13
	move $t3, $t5
end_if_L645:
	j end_ifL644
else_L643:
	li $t5, 14
	seq $t6, $t3, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L646beqz
	j end_if_L646
end_if_L646beqz:
	lw $t6, GLOBAL_VAR_A_13
	lw $t5, GLOBAL_VAR_A_14
	slt $t4, $t6, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L647beqz
	j end_if_L647
end_if_L647beqz:
	li $t4, 13
	move $t3, $t4
end_if_L647:
end_if_L646:
end_ifL644:
end_ifL641:
end_ifL638:
end_ifL635:
end_ifL632:
end_ifL629:
end_ifL626:
end_ifL623:
end_ifL620:
end_ifL617:
end_ifL614:
end_ifL611:
end_ifL608:
end_ifL605:
	j end_ifL603
else_L602:
	li $t4, 14
	seq $t5, $t1, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L648beqz
	j end_if_L648
end_if_L648beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L649beqz
	j else_L649
else_L649beqz:
	lw $t4, GLOBAL_VAR_A_14
	lw $t5, GLOBAL_VAR_A_0
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L651beqz
	j end_if_L651
end_if_L651beqz:
	li $t6, 14
	move $t3, $t6
end_if_L651:
	j end_ifL650
else_L649:
	li $t6, 1
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L652beqz
	j else_L652
else_L652beqz:
	lw $t5, GLOBAL_VAR_A_14
	lw $t6, GLOBAL_VAR_A_1
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L654beqz
	j end_if_L654
end_if_L654beqz:
	li $t4, 14
	move $t3, $t4
end_if_L654:
	j end_ifL653
else_L652:
	li $t4, 2
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L655beqz
	j else_L655
else_L655beqz:
	lw $t6, GLOBAL_VAR_A_14
	lw $t4, GLOBAL_VAR_A_2
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L657beqz
	j end_if_L657
end_if_L657beqz:
	li $t5, 14
	move $t3, $t5
end_if_L657:
	j end_ifL656
else_L655:
	li $t5, 3
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L658beqz
	j else_L658
else_L658beqz:
	lw $t4, GLOBAL_VAR_A_14
	lw $t5, GLOBAL_VAR_A_3
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L660beqz
	j end_if_L660
end_if_L660beqz:
	li $t6, 14
	move $t3, $t6
end_if_L660:
	j end_ifL659
else_L658:
	li $t6, 4
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L661beqz
	j else_L661
else_L661beqz:
	lw $t5, GLOBAL_VAR_A_14
	lw $t6, GLOBAL_VAR_A_4
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L663beqz
	j end_if_L663
end_if_L663beqz:
	li $t4, 14
	move $t3, $t4
end_if_L663:
	j end_ifL662
else_L661:
	li $t4, 5
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L664beqz
	j else_L664
else_L664beqz:
	lw $t6, GLOBAL_VAR_A_14
	lw $t4, GLOBAL_VAR_A_5
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L666beqz
	j end_if_L666
end_if_L666beqz:
	li $t5, 14
	move $t3, $t5
end_if_L666:
	j end_ifL665
else_L664:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L667beqz
	j else_L667
else_L667beqz:
	lw $t4, GLOBAL_VAR_A_14
	lw $t5, GLOBAL_VAR_A_6
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L669beqz
	j end_if_L669
end_if_L669beqz:
	li $t6, 14
	move $t3, $t6
end_if_L669:
	j end_ifL668
else_L667:
	li $t6, 7
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L670beqz
	j else_L670
else_L670beqz:
	lw $t5, GLOBAL_VAR_A_14
	lw $t6, GLOBAL_VAR_A_7
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L672beqz
	j end_if_L672
end_if_L672beqz:
	li $t4, 14
	move $t3, $t4
end_if_L672:
	j end_ifL671
else_L670:
	li $t4, 8
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L673beqz
	j else_L673
else_L673beqz:
	lw $t6, GLOBAL_VAR_A_14
	lw $t4, GLOBAL_VAR_A_8
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L675beqz
	j end_if_L675
end_if_L675beqz:
	li $t5, 14
	move $t3, $t5
end_if_L675:
	j end_ifL674
else_L673:
	li $t5, 9
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L676beqz
	j else_L676
else_L676beqz:
	lw $t4, GLOBAL_VAR_A_14
	lw $t5, GLOBAL_VAR_A_9
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L678beqz
	j end_if_L678
end_if_L678beqz:
	li $t6, 14
	move $t3, $t6
end_if_L678:
	j end_ifL677
else_L676:
	li $t6, 10
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L679beqz
	j else_L679
else_L679beqz:
	lw $t5, GLOBAL_VAR_A_14
	lw $t6, GLOBAL_VAR_A_10
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L681beqz
	j end_if_L681
end_if_L681beqz:
	li $t4, 14
	move $t3, $t4
end_if_L681:
	j end_ifL680
else_L679:
	li $t4, 11
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, else_L682beqz
	j else_L682
else_L682beqz:
	lw $t6, GLOBAL_VAR_A_14
	lw $t4, GLOBAL_VAR_A_11
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L684beqz
	j end_if_L684
end_if_L684beqz:
	li $t5, 14
	move $t3, $t5
end_if_L684:
	j end_ifL683
else_L682:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L685beqz
	j else_L685
else_L685beqz:
	lw $t4, GLOBAL_VAR_A_14
	lw $t5, GLOBAL_VAR_A_12
	slt $t6, $t4, $t5
	seq $t5, $t6, $0
	beqz $t5, end_if_L687beqz
	j end_if_L687
end_if_L687beqz:
	li $t6, 14
	move $t3, $t6
end_if_L687:
	j end_ifL686
else_L685:
	li $t6, 13
	seq $t5, $t3, $t6
	seq $t6, $t5, $0
	beqz $t6, else_L688beqz
	j else_L688
else_L688beqz:
	lw $t5, GLOBAL_VAR_A_14
	lw $t6, GLOBAL_VAR_A_13
	slt $t4, $t5, $t6
	seq $t6, $t4, $0
	beqz $t6, end_if_L690beqz
	j end_if_L690
end_if_L690beqz:
	li $t4, 14
	move $t3, $t4
end_if_L690:
	j end_ifL689
else_L688:
	li $t4, 14
	seq $t6, $t3, $t4
	seq $t4, $t6, $0
	beqz $t4, end_if_L691beqz
	j end_if_L691
end_if_L691beqz:
	lw $t6, GLOBAL_VAR_A_14
	lw $t4, GLOBAL_VAR_A_14
	slt $t5, $t6, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L692beqz
	j end_if_L692
end_if_L692beqz:
	li $t5, 14
	move $t3, $t5
end_if_L692:
end_if_L691:
end_ifL689:
end_ifL686:
end_ifL683:
end_ifL680:
end_ifL677:
end_ifL674:
end_ifL671:
end_ifL668:
end_ifL665:
end_ifL662:
end_ifL659:
end_ifL656:
end_ifL653:
end_ifL650:
end_if_L648:
end_ifL603:
end_ifL557:
end_ifL511:
end_ifL465:
end_ifL419:
end_ifL373:
end_ifL327:
end_ifL281:
end_ifL235:
end_ifL189:
end_ifL143:
end_ifL97:
end_ifL51:
	li $t5, 1
	addu $t4, $t1, $t5
	move $t1, $t4
	j while_L48
while_exit_L49:
	li $t4, 0
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L693beqz
	j else_L693
else_L693beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L695beqz
	j else_L695
else_L695beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_0
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_0
	sw $t2, 0($t4)
	j end_ifL696
else_L695:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L697beqz
	j else_L697
else_L697beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_0
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_0
	sw $t2, 0($t5)
	j end_ifL698
else_L697:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L699beqz
	j else_L699
else_L699beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_0
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_0
	sw $t2, 0($t4)
	j end_ifL700
else_L699:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L701beqz
	j else_L701
else_L701beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_0
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_0
	sw $t2, 0($t5)
	j end_ifL702
else_L701:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L703beqz
	j else_L703
else_L703beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_0
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_0
	sw $t2, 0($t4)
	j end_ifL704
else_L703:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L705beqz
	j else_L705
else_L705beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_0
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_0
	sw $t2, 0($t5)
	j end_ifL706
else_L705:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L707beqz
	j else_L707
else_L707beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_0
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_0
	sw $t2, 0($t4)
	j end_ifL708
else_L707:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L709beqz
	j else_L709
else_L709beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_0
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_0
	sw $t2, 0($t5)
	j end_ifL710
else_L709:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L711beqz
	j else_L711
else_L711beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_0
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_0
	sw $t2, 0($t4)
	j end_ifL712
else_L711:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L713beqz
	j else_L713
else_L713beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_0
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_0
	sw $t2, 0($t5)
	j end_ifL714
else_L713:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L715beqz
	j else_L715
else_L715beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_0
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_0
	sw $t2, 0($t4)
	j end_ifL716
else_L715:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L717beqz
	j else_L717
else_L717beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_0
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_0
	sw $t2, 0($t5)
	j end_ifL718
else_L717:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L719beqz
	j else_L719
else_L719beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_0
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_0
	sw $t2, 0($t4)
	j end_ifL720
else_L719:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L721beqz
	j else_L721
else_L721beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_0
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_0
	sw $t2, 0($t5)
	j end_ifL722
else_L721:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L723beqz
	j end_if_L723
end_if_L723beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_0
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_0
	sw $t2, 0($t4)
end_if_L723:
end_ifL722:
end_ifL720:
end_ifL718:
end_ifL716:
end_ifL714:
end_ifL712:
end_ifL710:
end_ifL708:
end_ifL706:
end_ifL704:
end_ifL702:
end_ifL700:
end_ifL698:
end_ifL696:
	j end_ifL694
else_L693:
	li $t4, 1
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L724beqz
	j else_L724
else_L724beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L726beqz
	j else_L726
else_L726beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_1
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_1
	sw $t2, 0($t4)
	j end_ifL727
else_L726:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L728beqz
	j else_L728
else_L728beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_1
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_1
	sw $t2, 0($t5)
	j end_ifL729
else_L728:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L730beqz
	j else_L730
else_L730beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_1
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_1
	sw $t2, 0($t4)
	j end_ifL731
else_L730:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L732beqz
	j else_L732
else_L732beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_1
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_1
	sw $t2, 0($t5)
	j end_ifL733
else_L732:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L734beqz
	j else_L734
else_L734beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_1
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_1
	sw $t2, 0($t4)
	j end_ifL735
else_L734:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L736beqz
	j else_L736
else_L736beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_1
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_1
	sw $t2, 0($t5)
	j end_ifL737
else_L736:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L738beqz
	j else_L738
else_L738beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_1
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_1
	sw $t2, 0($t4)
	j end_ifL739
else_L738:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L740beqz
	j else_L740
else_L740beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_1
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_1
	sw $t2, 0($t5)
	j end_ifL741
else_L740:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L742beqz
	j else_L742
else_L742beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_1
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_1
	sw $t2, 0($t4)
	j end_ifL743
else_L742:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L744beqz
	j else_L744
else_L744beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_1
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_1
	sw $t2, 0($t5)
	j end_ifL745
else_L744:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L746beqz
	j else_L746
else_L746beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_1
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_1
	sw $t2, 0($t4)
	j end_ifL747
else_L746:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L748beqz
	j else_L748
else_L748beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_1
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_1
	sw $t2, 0($t5)
	j end_ifL749
else_L748:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L750beqz
	j else_L750
else_L750beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_1
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_1
	sw $t2, 0($t4)
	j end_ifL751
else_L750:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L752beqz
	j else_L752
else_L752beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_1
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_1
	sw $t2, 0($t5)
	j end_ifL753
else_L752:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L754beqz
	j end_if_L754
end_if_L754beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_1
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_1
	sw $t2, 0($t4)
end_if_L754:
end_ifL753:
end_ifL751:
end_ifL749:
end_ifL747:
end_ifL745:
end_ifL743:
end_ifL741:
end_ifL739:
end_ifL737:
end_ifL735:
end_ifL733:
end_ifL731:
end_ifL729:
end_ifL727:
	j end_ifL725
else_L724:
	li $t4, 2
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L755beqz
	j else_L755
else_L755beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L757beqz
	j else_L757
else_L757beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_2
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_2
	sw $t2, 0($t4)
	j end_ifL758
else_L757:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L759beqz
	j else_L759
else_L759beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_2
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_2
	sw $t2, 0($t5)
	j end_ifL760
else_L759:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L761beqz
	j else_L761
else_L761beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_2
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_2
	sw $t2, 0($t4)
	j end_ifL762
else_L761:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L763beqz
	j else_L763
else_L763beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_2
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_2
	sw $t2, 0($t5)
	j end_ifL764
else_L763:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L765beqz
	j else_L765
else_L765beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_2
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_2
	sw $t2, 0($t4)
	j end_ifL766
else_L765:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L767beqz
	j else_L767
else_L767beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_2
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_2
	sw $t2, 0($t5)
	j end_ifL768
else_L767:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L769beqz
	j else_L769
else_L769beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_2
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_2
	sw $t2, 0($t4)
	j end_ifL770
else_L769:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L771beqz
	j else_L771
else_L771beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_2
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_2
	sw $t2, 0($t5)
	j end_ifL772
else_L771:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L773beqz
	j else_L773
else_L773beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_2
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_2
	sw $t2, 0($t4)
	j end_ifL774
else_L773:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L775beqz
	j else_L775
else_L775beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_2
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_2
	sw $t2, 0($t5)
	j end_ifL776
else_L775:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L777beqz
	j else_L777
else_L777beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_2
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_2
	sw $t2, 0($t4)
	j end_ifL778
else_L777:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L779beqz
	j else_L779
else_L779beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_2
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_2
	sw $t2, 0($t5)
	j end_ifL780
else_L779:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L781beqz
	j else_L781
else_L781beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_2
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_2
	sw $t2, 0($t4)
	j end_ifL782
else_L781:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L783beqz
	j else_L783
else_L783beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_2
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_2
	sw $t2, 0($t5)
	j end_ifL784
else_L783:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L785beqz
	j end_if_L785
end_if_L785beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_2
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_2
	sw $t2, 0($t4)
end_if_L785:
end_ifL784:
end_ifL782:
end_ifL780:
end_ifL778:
end_ifL776:
end_ifL774:
end_ifL772:
end_ifL770:
end_ifL768:
end_ifL766:
end_ifL764:
end_ifL762:
end_ifL760:
end_ifL758:
	j end_ifL756
else_L755:
	li $t4, 3
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L786beqz
	j else_L786
else_L786beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L788beqz
	j else_L788
else_L788beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_3
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_3
	sw $t2, 0($t4)
	j end_ifL789
else_L788:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L790beqz
	j else_L790
else_L790beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_3
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_3
	sw $t2, 0($t5)
	j end_ifL791
else_L790:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L792beqz
	j else_L792
else_L792beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_3
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_3
	sw $t2, 0($t4)
	j end_ifL793
else_L792:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L794beqz
	j else_L794
else_L794beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_3
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_3
	sw $t2, 0($t5)
	j end_ifL795
else_L794:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L796beqz
	j else_L796
else_L796beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_3
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_3
	sw $t2, 0($t4)
	j end_ifL797
else_L796:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L798beqz
	j else_L798
else_L798beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_3
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_3
	sw $t2, 0($t5)
	j end_ifL799
else_L798:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L800beqz
	j else_L800
else_L800beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_3
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_3
	sw $t2, 0($t4)
	j end_ifL801
else_L800:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L802beqz
	j else_L802
else_L802beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_3
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_3
	sw $t2, 0($t5)
	j end_ifL803
else_L802:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L804beqz
	j else_L804
else_L804beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_3
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_3
	sw $t2, 0($t4)
	j end_ifL805
else_L804:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L806beqz
	j else_L806
else_L806beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_3
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_3
	sw $t2, 0($t5)
	j end_ifL807
else_L806:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L808beqz
	j else_L808
else_L808beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_3
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_3
	sw $t2, 0($t4)
	j end_ifL809
else_L808:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L810beqz
	j else_L810
else_L810beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_3
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_3
	sw $t2, 0($t5)
	j end_ifL811
else_L810:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L812beqz
	j else_L812
else_L812beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_3
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_3
	sw $t2, 0($t4)
	j end_ifL813
else_L812:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L814beqz
	j else_L814
else_L814beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_3
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_3
	sw $t2, 0($t5)
	j end_ifL815
else_L814:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L816beqz
	j end_if_L816
end_if_L816beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_3
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_3
	sw $t2, 0($t4)
end_if_L816:
end_ifL815:
end_ifL813:
end_ifL811:
end_ifL809:
end_ifL807:
end_ifL805:
end_ifL803:
end_ifL801:
end_ifL799:
end_ifL797:
end_ifL795:
end_ifL793:
end_ifL791:
end_ifL789:
	j end_ifL787
else_L786:
	li $t4, 4
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L817beqz
	j else_L817
else_L817beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L819beqz
	j else_L819
else_L819beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_4
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_4
	sw $t2, 0($t4)
	j end_ifL820
else_L819:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L821beqz
	j else_L821
else_L821beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_4
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_4
	sw $t2, 0($t5)
	j end_ifL822
else_L821:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L823beqz
	j else_L823
else_L823beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_4
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_4
	sw $t2, 0($t4)
	j end_ifL824
else_L823:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L825beqz
	j else_L825
else_L825beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_4
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_4
	sw $t2, 0($t5)
	j end_ifL826
else_L825:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L827beqz
	j else_L827
else_L827beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_4
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_4
	sw $t2, 0($t4)
	j end_ifL828
else_L827:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L829beqz
	j else_L829
else_L829beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_4
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_4
	sw $t2, 0($t5)
	j end_ifL830
else_L829:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L831beqz
	j else_L831
else_L831beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_4
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_4
	sw $t2, 0($t4)
	j end_ifL832
else_L831:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L833beqz
	j else_L833
else_L833beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_4
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_4
	sw $t2, 0($t5)
	j end_ifL834
else_L833:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L835beqz
	j else_L835
else_L835beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_4
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_4
	sw $t2, 0($t4)
	j end_ifL836
else_L835:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L837beqz
	j else_L837
else_L837beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_4
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_4
	sw $t2, 0($t5)
	j end_ifL838
else_L837:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L839beqz
	j else_L839
else_L839beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_4
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_4
	sw $t2, 0($t4)
	j end_ifL840
else_L839:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L841beqz
	j else_L841
else_L841beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_4
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_4
	sw $t2, 0($t5)
	j end_ifL842
else_L841:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L843beqz
	j else_L843
else_L843beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_4
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_4
	sw $t2, 0($t4)
	j end_ifL844
else_L843:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L845beqz
	j else_L845
else_L845beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_4
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_4
	sw $t2, 0($t5)
	j end_ifL846
else_L845:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L847beqz
	j end_if_L847
end_if_L847beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_4
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_4
	sw $t2, 0($t4)
end_if_L847:
end_ifL846:
end_ifL844:
end_ifL842:
end_ifL840:
end_ifL838:
end_ifL836:
end_ifL834:
end_ifL832:
end_ifL830:
end_ifL828:
end_ifL826:
end_ifL824:
end_ifL822:
end_ifL820:
	j end_ifL818
else_L817:
	li $t4, 5
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L848beqz
	j else_L848
else_L848beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L850beqz
	j else_L850
else_L850beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_5
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_5
	sw $t2, 0($t4)
	j end_ifL851
else_L850:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L852beqz
	j else_L852
else_L852beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_5
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_5
	sw $t2, 0($t5)
	j end_ifL853
else_L852:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L854beqz
	j else_L854
else_L854beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_5
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_5
	sw $t2, 0($t4)
	j end_ifL855
else_L854:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L856beqz
	j else_L856
else_L856beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_5
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_5
	sw $t2, 0($t5)
	j end_ifL857
else_L856:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L858beqz
	j else_L858
else_L858beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_5
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_5
	sw $t2, 0($t4)
	j end_ifL859
else_L858:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L860beqz
	j else_L860
else_L860beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_5
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_5
	sw $t2, 0($t5)
	j end_ifL861
else_L860:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L862beqz
	j else_L862
else_L862beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_5
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_5
	sw $t2, 0($t4)
	j end_ifL863
else_L862:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L864beqz
	j else_L864
else_L864beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_5
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_5
	sw $t2, 0($t5)
	j end_ifL865
else_L864:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L866beqz
	j else_L866
else_L866beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_5
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_5
	sw $t2, 0($t4)
	j end_ifL867
else_L866:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L868beqz
	j else_L868
else_L868beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_5
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_5
	sw $t2, 0($t5)
	j end_ifL869
else_L868:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L870beqz
	j else_L870
else_L870beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_5
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_5
	sw $t2, 0($t4)
	j end_ifL871
else_L870:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L872beqz
	j else_L872
else_L872beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_5
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_5
	sw $t2, 0($t5)
	j end_ifL873
else_L872:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L874beqz
	j else_L874
else_L874beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_5
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_5
	sw $t2, 0($t4)
	j end_ifL875
else_L874:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L876beqz
	j else_L876
else_L876beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_5
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_5
	sw $t2, 0($t5)
	j end_ifL877
else_L876:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L878beqz
	j end_if_L878
end_if_L878beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_5
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_5
	sw $t2, 0($t4)
end_if_L878:
end_ifL877:
end_ifL875:
end_ifL873:
end_ifL871:
end_ifL869:
end_ifL867:
end_ifL865:
end_ifL863:
end_ifL861:
end_ifL859:
end_ifL857:
end_ifL855:
end_ifL853:
end_ifL851:
	j end_ifL849
else_L848:
	li $t4, 6
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L879beqz
	j else_L879
else_L879beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L881beqz
	j else_L881
else_L881beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_6
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_6
	sw $t2, 0($t4)
	j end_ifL882
else_L881:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L883beqz
	j else_L883
else_L883beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_6
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_6
	sw $t2, 0($t5)
	j end_ifL884
else_L883:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L885beqz
	j else_L885
else_L885beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_6
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_6
	sw $t2, 0($t4)
	j end_ifL886
else_L885:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L887beqz
	j else_L887
else_L887beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_6
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_6
	sw $t2, 0($t5)
	j end_ifL888
else_L887:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L889beqz
	j else_L889
else_L889beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_6
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_6
	sw $t2, 0($t4)
	j end_ifL890
else_L889:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L891beqz
	j else_L891
else_L891beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_6
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_6
	sw $t2, 0($t5)
	j end_ifL892
else_L891:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L893beqz
	j else_L893
else_L893beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_6
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_6
	sw $t2, 0($t4)
	j end_ifL894
else_L893:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L895beqz
	j else_L895
else_L895beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_6
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_6
	sw $t2, 0($t5)
	j end_ifL896
else_L895:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L897beqz
	j else_L897
else_L897beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_6
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_6
	sw $t2, 0($t4)
	j end_ifL898
else_L897:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L899beqz
	j else_L899
else_L899beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_6
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_6
	sw $t2, 0($t5)
	j end_ifL900
else_L899:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L901beqz
	j else_L901
else_L901beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_6
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_6
	sw $t2, 0($t4)
	j end_ifL902
else_L901:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L903beqz
	j else_L903
else_L903beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_6
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_6
	sw $t2, 0($t5)
	j end_ifL904
else_L903:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L905beqz
	j else_L905
else_L905beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_6
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_6
	sw $t2, 0($t4)
	j end_ifL906
else_L905:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L907beqz
	j else_L907
else_L907beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_6
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_6
	sw $t2, 0($t5)
	j end_ifL908
else_L907:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L909beqz
	j end_if_L909
end_if_L909beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_6
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_6
	sw $t2, 0($t4)
end_if_L909:
end_ifL908:
end_ifL906:
end_ifL904:
end_ifL902:
end_ifL900:
end_ifL898:
end_ifL896:
end_ifL894:
end_ifL892:
end_ifL890:
end_ifL888:
end_ifL886:
end_ifL884:
end_ifL882:
	j end_ifL880
else_L879:
	li $t4, 7
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L910beqz
	j else_L910
else_L910beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L912beqz
	j else_L912
else_L912beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_7
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_7
	sw $t2, 0($t4)
	j end_ifL913
else_L912:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L914beqz
	j else_L914
else_L914beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_7
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_7
	sw $t2, 0($t5)
	j end_ifL915
else_L914:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L916beqz
	j else_L916
else_L916beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_7
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_7
	sw $t2, 0($t4)
	j end_ifL917
else_L916:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L918beqz
	j else_L918
else_L918beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_7
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_7
	sw $t2, 0($t5)
	j end_ifL919
else_L918:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L920beqz
	j else_L920
else_L920beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_7
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_7
	sw $t2, 0($t4)
	j end_ifL921
else_L920:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L922beqz
	j else_L922
else_L922beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_7
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_7
	sw $t2, 0($t5)
	j end_ifL923
else_L922:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L924beqz
	j else_L924
else_L924beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_7
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_7
	sw $t2, 0($t4)
	j end_ifL925
else_L924:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L926beqz
	j else_L926
else_L926beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_7
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_7
	sw $t2, 0($t5)
	j end_ifL927
else_L926:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L928beqz
	j else_L928
else_L928beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_7
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_7
	sw $t2, 0($t4)
	j end_ifL929
else_L928:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L930beqz
	j else_L930
else_L930beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_7
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_7
	sw $t2, 0($t5)
	j end_ifL931
else_L930:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L932beqz
	j else_L932
else_L932beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_7
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_7
	sw $t2, 0($t4)
	j end_ifL933
else_L932:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L934beqz
	j else_L934
else_L934beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_7
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_7
	sw $t2, 0($t5)
	j end_ifL935
else_L934:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L936beqz
	j else_L936
else_L936beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_7
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_7
	sw $t2, 0($t4)
	j end_ifL937
else_L936:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L938beqz
	j else_L938
else_L938beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_7
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_7
	sw $t2, 0($t5)
	j end_ifL939
else_L938:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L940beqz
	j end_if_L940
end_if_L940beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_7
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_7
	sw $t2, 0($t4)
end_if_L940:
end_ifL939:
end_ifL937:
end_ifL935:
end_ifL933:
end_ifL931:
end_ifL929:
end_ifL927:
end_ifL925:
end_ifL923:
end_ifL921:
end_ifL919:
end_ifL917:
end_ifL915:
end_ifL913:
	j end_ifL911
else_L910:
	li $t4, 8
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L941beqz
	j else_L941
else_L941beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L943beqz
	j else_L943
else_L943beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_8
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_8
	sw $t2, 0($t4)
	j end_ifL944
else_L943:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L945beqz
	j else_L945
else_L945beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_8
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_8
	sw $t2, 0($t5)
	j end_ifL946
else_L945:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L947beqz
	j else_L947
else_L947beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_8
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_8
	sw $t2, 0($t4)
	j end_ifL948
else_L947:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L949beqz
	j else_L949
else_L949beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_8
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_8
	sw $t2, 0($t5)
	j end_ifL950
else_L949:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L951beqz
	j else_L951
else_L951beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_8
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_8
	sw $t2, 0($t4)
	j end_ifL952
else_L951:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L953beqz
	j else_L953
else_L953beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_8
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_8
	sw $t2, 0($t5)
	j end_ifL954
else_L953:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L955beqz
	j else_L955
else_L955beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_8
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_8
	sw $t2, 0($t4)
	j end_ifL956
else_L955:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L957beqz
	j else_L957
else_L957beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_8
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_8
	sw $t2, 0($t5)
	j end_ifL958
else_L957:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L959beqz
	j else_L959
else_L959beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_8
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_8
	sw $t2, 0($t4)
	j end_ifL960
else_L959:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L961beqz
	j else_L961
else_L961beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_8
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_8
	sw $t2, 0($t5)
	j end_ifL962
else_L961:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L963beqz
	j else_L963
else_L963beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_8
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_8
	sw $t2, 0($t4)
	j end_ifL964
else_L963:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L965beqz
	j else_L965
else_L965beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_8
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_8
	sw $t2, 0($t5)
	j end_ifL966
else_L965:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L967beqz
	j else_L967
else_L967beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_8
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_8
	sw $t2, 0($t4)
	j end_ifL968
else_L967:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L969beqz
	j else_L969
else_L969beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_8
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_8
	sw $t2, 0($t5)
	j end_ifL970
else_L969:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L971beqz
	j end_if_L971
end_if_L971beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_8
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_8
	sw $t2, 0($t4)
end_if_L971:
end_ifL970:
end_ifL968:
end_ifL966:
end_ifL964:
end_ifL962:
end_ifL960:
end_ifL958:
end_ifL956:
end_ifL954:
end_ifL952:
end_ifL950:
end_ifL948:
end_ifL946:
end_ifL944:
	j end_ifL942
else_L941:
	li $t4, 9
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L972beqz
	j else_L972
else_L972beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L974beqz
	j else_L974
else_L974beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_9
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_9
	sw $t2, 0($t4)
	j end_ifL975
else_L974:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L976beqz
	j else_L976
else_L976beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_9
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_9
	sw $t2, 0($t5)
	j end_ifL977
else_L976:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L978beqz
	j else_L978
else_L978beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_9
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_9
	sw $t2, 0($t4)
	j end_ifL979
else_L978:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L980beqz
	j else_L980
else_L980beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_9
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_9
	sw $t2, 0($t5)
	j end_ifL981
else_L980:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L982beqz
	j else_L982
else_L982beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_9
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_9
	sw $t2, 0($t4)
	j end_ifL983
else_L982:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L984beqz
	j else_L984
else_L984beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_9
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_9
	sw $t2, 0($t5)
	j end_ifL985
else_L984:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L986beqz
	j else_L986
else_L986beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_9
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_9
	sw $t2, 0($t4)
	j end_ifL987
else_L986:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L988beqz
	j else_L988
else_L988beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_9
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_9
	sw $t2, 0($t5)
	j end_ifL989
else_L988:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L990beqz
	j else_L990
else_L990beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_9
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_9
	sw $t2, 0($t4)
	j end_ifL991
else_L990:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L992beqz
	j else_L992
else_L992beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_9
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_9
	sw $t2, 0($t5)
	j end_ifL993
else_L992:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L994beqz
	j else_L994
else_L994beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_9
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_9
	sw $t2, 0($t4)
	j end_ifL995
else_L994:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L996beqz
	j else_L996
else_L996beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_9
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_9
	sw $t2, 0($t5)
	j end_ifL997
else_L996:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L998beqz
	j else_L998
else_L998beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_9
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_9
	sw $t2, 0($t4)
	j end_ifL999
else_L998:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1000beqz
	j else_L1000
else_L1000beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_9
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_9
	sw $t2, 0($t5)
	j end_ifL1001
else_L1000:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L1002beqz
	j end_if_L1002
end_if_L1002beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_9
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_9
	sw $t2, 0($t4)
end_if_L1002:
end_ifL1001:
end_ifL999:
end_ifL997:
end_ifL995:
end_ifL993:
end_ifL991:
end_ifL989:
end_ifL987:
end_ifL985:
end_ifL983:
end_ifL981:
end_ifL979:
end_ifL977:
end_ifL975:
	j end_ifL973
else_L972:
	li $t4, 10
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1003beqz
	j else_L1003
else_L1003beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1005beqz
	j else_L1005
else_L1005beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_10
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_10
	sw $t2, 0($t4)
	j end_ifL1006
else_L1005:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1007beqz
	j else_L1007
else_L1007beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_10
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_10
	sw $t2, 0($t5)
	j end_ifL1008
else_L1007:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1009beqz
	j else_L1009
else_L1009beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_10
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_10
	sw $t2, 0($t4)
	j end_ifL1010
else_L1009:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1011beqz
	j else_L1011
else_L1011beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_10
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_10
	sw $t2, 0($t5)
	j end_ifL1012
else_L1011:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1013beqz
	j else_L1013
else_L1013beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_10
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_10
	sw $t2, 0($t4)
	j end_ifL1014
else_L1013:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1015beqz
	j else_L1015
else_L1015beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_10
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_10
	sw $t2, 0($t5)
	j end_ifL1016
else_L1015:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1017beqz
	j else_L1017
else_L1017beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_10
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_10
	sw $t2, 0($t4)
	j end_ifL1018
else_L1017:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1019beqz
	j else_L1019
else_L1019beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_10
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_10
	sw $t2, 0($t5)
	j end_ifL1020
else_L1019:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1021beqz
	j else_L1021
else_L1021beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_10
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_10
	sw $t2, 0($t4)
	j end_ifL1022
else_L1021:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1023beqz
	j else_L1023
else_L1023beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_10
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_10
	sw $t2, 0($t5)
	j end_ifL1024
else_L1023:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1025beqz
	j else_L1025
else_L1025beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_10
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_10
	sw $t2, 0($t4)
	j end_ifL1026
else_L1025:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1027beqz
	j else_L1027
else_L1027beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_10
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_10
	sw $t2, 0($t5)
	j end_ifL1028
else_L1027:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1029beqz
	j else_L1029
else_L1029beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_10
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_10
	sw $t2, 0($t4)
	j end_ifL1030
else_L1029:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1031beqz
	j else_L1031
else_L1031beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_10
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_10
	sw $t2, 0($t5)
	j end_ifL1032
else_L1031:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L1033beqz
	j end_if_L1033
end_if_L1033beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_10
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_10
	sw $t2, 0($t4)
end_if_L1033:
end_ifL1032:
end_ifL1030:
end_ifL1028:
end_ifL1026:
end_ifL1024:
end_ifL1022:
end_ifL1020:
end_ifL1018:
end_ifL1016:
end_ifL1014:
end_ifL1012:
end_ifL1010:
end_ifL1008:
end_ifL1006:
	j end_ifL1004
else_L1003:
	li $t4, 11
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1034beqz
	j else_L1034
else_L1034beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1036beqz
	j else_L1036
else_L1036beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_11
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_11
	sw $t2, 0($t4)
	j end_ifL1037
else_L1036:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1038beqz
	j else_L1038
else_L1038beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_11
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_11
	sw $t2, 0($t5)
	j end_ifL1039
else_L1038:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1040beqz
	j else_L1040
else_L1040beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_11
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_11
	sw $t2, 0($t4)
	j end_ifL1041
else_L1040:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1042beqz
	j else_L1042
else_L1042beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_11
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_11
	sw $t2, 0($t5)
	j end_ifL1043
else_L1042:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1044beqz
	j else_L1044
else_L1044beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_11
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_11
	sw $t2, 0($t4)
	j end_ifL1045
else_L1044:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1046beqz
	j else_L1046
else_L1046beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_11
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_11
	sw $t2, 0($t5)
	j end_ifL1047
else_L1046:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1048beqz
	j else_L1048
else_L1048beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_11
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_11
	sw $t2, 0($t4)
	j end_ifL1049
else_L1048:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1050beqz
	j else_L1050
else_L1050beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_11
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_11
	sw $t2, 0($t5)
	j end_ifL1051
else_L1050:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1052beqz
	j else_L1052
else_L1052beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_11
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_11
	sw $t2, 0($t4)
	j end_ifL1053
else_L1052:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1054beqz
	j else_L1054
else_L1054beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_11
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_11
	sw $t2, 0($t5)
	j end_ifL1055
else_L1054:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1056beqz
	j else_L1056
else_L1056beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_11
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_11
	sw $t2, 0($t4)
	j end_ifL1057
else_L1056:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1058beqz
	j else_L1058
else_L1058beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_11
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_11
	sw $t2, 0($t5)
	j end_ifL1059
else_L1058:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1060beqz
	j else_L1060
else_L1060beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_11
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_11
	sw $t2, 0($t4)
	j end_ifL1061
else_L1060:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1062beqz
	j else_L1062
else_L1062beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_11
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_11
	sw $t2, 0($t5)
	j end_ifL1063
else_L1062:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L1064beqz
	j end_if_L1064
end_if_L1064beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_11
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_11
	sw $t2, 0($t4)
end_if_L1064:
end_ifL1063:
end_ifL1061:
end_ifL1059:
end_ifL1057:
end_ifL1055:
end_ifL1053:
end_ifL1051:
end_ifL1049:
end_ifL1047:
end_ifL1045:
end_ifL1043:
end_ifL1041:
end_ifL1039:
end_ifL1037:
	j end_ifL1035
else_L1034:
	li $t4, 12
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1065beqz
	j else_L1065
else_L1065beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1067beqz
	j else_L1067
else_L1067beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_12
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_12
	sw $t2, 0($t4)
	j end_ifL1068
else_L1067:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1069beqz
	j else_L1069
else_L1069beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_12
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_12
	sw $t2, 0($t5)
	j end_ifL1070
else_L1069:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1071beqz
	j else_L1071
else_L1071beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_12
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_12
	sw $t2, 0($t4)
	j end_ifL1072
else_L1071:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1073beqz
	j else_L1073
else_L1073beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_12
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_12
	sw $t2, 0($t5)
	j end_ifL1074
else_L1073:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1075beqz
	j else_L1075
else_L1075beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_12
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_12
	sw $t2, 0($t4)
	j end_ifL1076
else_L1075:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1077beqz
	j else_L1077
else_L1077beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_12
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_12
	sw $t2, 0($t5)
	j end_ifL1078
else_L1077:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1079beqz
	j else_L1079
else_L1079beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_12
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_12
	sw $t2, 0($t4)
	j end_ifL1080
else_L1079:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1081beqz
	j else_L1081
else_L1081beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_12
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_12
	sw $t2, 0($t5)
	j end_ifL1082
else_L1081:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1083beqz
	j else_L1083
else_L1083beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_12
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_12
	sw $t2, 0($t4)
	j end_ifL1084
else_L1083:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1085beqz
	j else_L1085
else_L1085beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_12
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_12
	sw $t2, 0($t5)
	j end_ifL1086
else_L1085:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1087beqz
	j else_L1087
else_L1087beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_12
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_12
	sw $t2, 0($t4)
	j end_ifL1088
else_L1087:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1089beqz
	j else_L1089
else_L1089beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_12
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_12
	sw $t2, 0($t5)
	j end_ifL1090
else_L1089:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1091beqz
	j else_L1091
else_L1091beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_12
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_12
	sw $t2, 0($t4)
	j end_ifL1092
else_L1091:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1093beqz
	j else_L1093
else_L1093beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_12
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_12
	sw $t2, 0($t5)
	j end_ifL1094
else_L1093:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L1095beqz
	j end_if_L1095
end_if_L1095beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_12
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_12
	sw $t2, 0($t4)
end_if_L1095:
end_ifL1094:
end_ifL1092:
end_ifL1090:
end_ifL1088:
end_ifL1086:
end_ifL1084:
end_ifL1082:
end_ifL1080:
end_ifL1078:
end_ifL1076:
end_ifL1074:
end_ifL1072:
end_ifL1070:
end_ifL1068:
	j end_ifL1066
else_L1065:
	li $t4, 13
	seq $t5, $t0, $t4
	seq $t4, $t5, $0
	beqz $t4, end_if_L1096beqz
	j end_if_L1096
end_if_L1096beqz:
	li $t5, 0
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1097beqz
	j else_L1097
else_L1097beqz:
	lw $t4, GLOBAL_VAR_A_0
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_13
	la $t5, GLOBAL_VAR_A_0
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_13
	sw $t2, 0($t4)
	j end_ifL1098
else_L1097:
	li $t4, 1
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1099beqz
	j else_L1099
else_L1099beqz:
	lw $t5, GLOBAL_VAR_A_1
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_13
	la $t4, GLOBAL_VAR_A_1
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_13
	sw $t2, 0($t5)
	j end_ifL1100
else_L1099:
	li $t5, 2
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1101beqz
	j else_L1101
else_L1101beqz:
	lw $t4, GLOBAL_VAR_A_2
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_13
	la $t5, GLOBAL_VAR_A_2
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_13
	sw $t2, 0($t4)
	j end_ifL1102
else_L1101:
	li $t4, 3
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1103beqz
	j else_L1103
else_L1103beqz:
	lw $t5, GLOBAL_VAR_A_3
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_13
	la $t4, GLOBAL_VAR_A_3
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_13
	sw $t2, 0($t5)
	j end_ifL1104
else_L1103:
	li $t5, 4
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1105beqz
	j else_L1105
else_L1105beqz:
	lw $t4, GLOBAL_VAR_A_4
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_13
	la $t5, GLOBAL_VAR_A_4
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_13
	sw $t2, 0($t4)
	j end_ifL1106
else_L1105:
	li $t4, 5
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1107beqz
	j else_L1107
else_L1107beqz:
	lw $t5, GLOBAL_VAR_A_5
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_13
	la $t4, GLOBAL_VAR_A_5
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_13
	sw $t2, 0($t5)
	j end_ifL1108
else_L1107:
	li $t5, 6
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1109beqz
	j else_L1109
else_L1109beqz:
	lw $t4, GLOBAL_VAR_A_6
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_13
	la $t5, GLOBAL_VAR_A_6
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_13
	sw $t2, 0($t4)
	j end_ifL1110
else_L1109:
	li $t4, 7
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1111beqz
	j else_L1111
else_L1111beqz:
	lw $t5, GLOBAL_VAR_A_7
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_13
	la $t4, GLOBAL_VAR_A_7
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_13
	sw $t2, 0($t5)
	j end_ifL1112
else_L1111:
	li $t5, 8
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1113beqz
	j else_L1113
else_L1113beqz:
	lw $t4, GLOBAL_VAR_A_8
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_13
	la $t5, GLOBAL_VAR_A_8
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_13
	sw $t2, 0($t4)
	j end_ifL1114
else_L1113:
	li $t4, 9
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1115beqz
	j else_L1115
else_L1115beqz:
	lw $t5, GLOBAL_VAR_A_9
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_13
	la $t4, GLOBAL_VAR_A_9
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_13
	sw $t2, 0($t5)
	j end_ifL1116
else_L1115:
	li $t5, 10
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1117beqz
	j else_L1117
else_L1117beqz:
	lw $t4, GLOBAL_VAR_A_10
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_13
	la $t5, GLOBAL_VAR_A_10
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_13
	sw $t2, 0($t4)
	j end_ifL1118
else_L1117:
	li $t4, 11
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1119beqz
	j else_L1119
else_L1119beqz:
	lw $t5, GLOBAL_VAR_A_11
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_13
	la $t4, GLOBAL_VAR_A_11
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_13
	sw $t2, 0($t5)
	j end_ifL1120
else_L1119:
	li $t5, 12
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, else_L1121beqz
	j else_L1121
else_L1121beqz:
	lw $t4, GLOBAL_VAR_A_12
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_13
	la $t5, GLOBAL_VAR_A_12
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_13
	sw $t2, 0($t4)
	j end_ifL1122
else_L1121:
	li $t4, 13
	seq $t5, $t3, $t4
	seq $t4, $t5, $0
	beqz $t4, else_L1123beqz
	j else_L1123
else_L1123beqz:
	lw $t5, GLOBAL_VAR_A_13
	move $t2, $t5
	lw $t5, GLOBAL_VAR_A_13
	la $t4, GLOBAL_VAR_A_13
	sw $t5, 0($t4)
	la $t5, GLOBAL_VAR_A_13
	sw $t2, 0($t5)
	j end_ifL1124
else_L1123:
	li $t5, 14
	seq $t4, $t3, $t5
	seq $t5, $t4, $0
	beqz $t5, end_if_L1125beqz
	j end_if_L1125
end_if_L1125beqz:
	lw $t4, GLOBAL_VAR_A_14
	move $t2, $t4
	lw $t4, GLOBAL_VAR_A_13
	la $t5, GLOBAL_VAR_A_14
	sw $t4, 0($t5)
	la $t4, GLOBAL_VAR_A_13
	sw $t2, 0($t4)
end_if_L1125:
end_ifL1124:
end_ifL1122:
end_ifL1120:
end_ifL1118:
end_ifL1116:
end_ifL1114:
end_ifL1112:
end_ifL1110:
end_ifL1108:
end_ifL1106:
end_ifL1104:
end_ifL1102:
end_ifL1100:
end_ifL1098:
end_if_L1096:
end_ifL1066:
end_ifL1035:
end_ifL1004:
end_ifL973:
end_ifL942:
end_ifL911:
end_ifL880:
end_ifL849:
end_ifL818:
end_ifL787:
end_ifL756:
end_ifL725:
end_ifL694:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t3, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_printarray
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $t3, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	li $t4, 1
	addu $t5, $t0, $t4
	move $t0, $t5
	j while_L46
while_exit_L47:
	j Lhalt
.globl FUNCTION_printarray
FUNCTION_printarray:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	li $t1, 0
	move $t0, $t1
while_L1126:
	li $t1, 14
	sle $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, while_exit_L1127beqz
	j while_exit_L1127
while_exit_L1127beqz:
	li $t2, 0
	seq $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, else_L1128beqz
	j else_L1128
else_L1128beqz:
	lw $t1, GLOBAL_VAR_A_0
	move $a0, $t1
	jal Lprinti
	la $a0, string_L1130
	jal Lprints
	j end_ifL1129
else_L1128:
	li $t1, 1
	seq $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, else_L1131beqz
	j else_L1131
else_L1131beqz:
	lw $t2, GLOBAL_VAR_A_1
	move $a0, $t2
	jal Lprinti
	la $a0, string_L1133
	jal Lprints
	j end_ifL1132
else_L1131:
	li $t2, 2
	seq $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, else_L1134beqz
	j else_L1134
else_L1134beqz:
	lw $t1, GLOBAL_VAR_A_2
	move $a0, $t1
	jal Lprinti
	la $a0, string_L1136
	jal Lprints
	j end_ifL1135
else_L1134:
	li $t1, 3
	seq $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, else_L1137beqz
	j else_L1137
else_L1137beqz:
	lw $t2, GLOBAL_VAR_A_3
	move $a0, $t2
	jal Lprinti
	la $a0, string_L1139
	jal Lprints
	j end_ifL1138
else_L1137:
	li $t2, 4
	seq $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, else_L1140beqz
	j else_L1140
else_L1140beqz:
	lw $t1, GLOBAL_VAR_A_4
	move $a0, $t1
	jal Lprinti
	la $a0, string_L1142
	jal Lprints
	j end_ifL1141
else_L1140:
	li $t1, 5
	seq $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, else_L1143beqz
	j else_L1143
else_L1143beqz:
	lw $t2, GLOBAL_VAR_A_5
	move $a0, $t2
	jal Lprinti
	la $a0, string_L1145
	jal Lprints
	j end_ifL1144
else_L1143:
	li $t2, 6
	seq $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, else_L1146beqz
	j else_L1146
else_L1146beqz:
	lw $t1, GLOBAL_VAR_A_6
	move $a0, $t1
	jal Lprinti
	la $a0, string_L1148
	jal Lprints
	j end_ifL1147
else_L1146:
	li $t1, 7
	seq $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, else_L1149beqz
	j else_L1149
else_L1149beqz:
	lw $t2, GLOBAL_VAR_A_7
	move $a0, $t2
	jal Lprinti
	la $a0, string_L1151
	jal Lprints
	j end_ifL1150
else_L1149:
	li $t2, 8
	seq $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, else_L1152beqz
	j else_L1152
else_L1152beqz:
	lw $t1, GLOBAL_VAR_A_8
	move $a0, $t1
	jal Lprinti
	la $a0, string_L1154
	jal Lprints
	j end_ifL1153
else_L1152:
	li $t1, 9
	seq $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, else_L1155beqz
	j else_L1155
else_L1155beqz:
	lw $t2, GLOBAL_VAR_A_9
	move $a0, $t2
	jal Lprinti
	la $a0, string_L1157
	jal Lprints
	j end_ifL1156
else_L1155:
	li $t2, 10
	seq $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, else_L1158beqz
	j else_L1158
else_L1158beqz:
	lw $t1, GLOBAL_VAR_A_10
	move $a0, $t1
	jal Lprinti
	la $a0, string_L1160
	jal Lprints
	j end_ifL1159
else_L1158:
	li $t1, 11
	seq $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, else_L1161beqz
	j else_L1161
else_L1161beqz:
	lw $t2, GLOBAL_VAR_A_11
	move $a0, $t2
	jal Lprinti
	la $a0, string_L1163
	jal Lprints
	j end_ifL1162
else_L1161:
	li $t2, 12
	seq $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, else_L1164beqz
	j else_L1164
else_L1164beqz:
	lw $t1, GLOBAL_VAR_A_12
	move $a0, $t1
	jal Lprinti
	la $a0, string_L1166
	jal Lprints
	j end_ifL1165
else_L1164:
	li $t1, 13
	seq $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, else_L1167beqz
	j else_L1167
else_L1167beqz:
	lw $t2, GLOBAL_VAR_A_13
	move $a0, $t2
	jal Lprinti
	la $a0, string_L1169
	jal Lprints
	j end_ifL1168
else_L1167:
	li $t2, 14
	seq $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, end_if_L1170beqz
	j end_if_L1170
end_if_L1170beqz:
	lw $t1, GLOBAL_VAR_A_14
	move $a0, $t1
	jal Lprinti
	la $a0, string_L1171
	jal Lprints
end_if_L1170:
end_ifL1168:
end_ifL1165:
end_ifL1162:
end_ifL1159:
end_ifL1156:
end_ifL1153:
end_ifL1150:
end_ifL1147:
end_ifL1144:
end_ifL1141:
end_ifL1138:
end_ifL1135:
end_ifL1132:
end_ifL1129:
	li $t1, 1
	addu $t2, $t0, $t1
	move $t0, $t2
	j while_L1126
while_exit_L1127:
	la $a0, string_L1172
	jal Lprints
	j return_label
.globl FUNCTION_INTERNALseed
FUNCTION_INTERNALseed:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
	la $t1, GLOBAL_VAR_INTERNALX
	sw $t0, 0($t1)
	j return_label
.globl FUNCTION_INTERNALrandom
FUNCTION_INTERNALrandom:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	li $t0, 17
	lw $t1, GLOBAL_VAR_INTERNALX
	mul $t2, $t0, $t1
	li $t1, 13
	addu $t0, $t2, $t1
	li $t1, 32768
	bnez $t1, L1173
	la $a0, div_by_zero
	j error
L1173:
	rem $t2, $t0, $t1
	la $t1, GLOBAL_VAR_INTERNALX
	sw $t2, 0($t1)
	lw $t2, GLOBAL_VAR_INTERNALX
	move $v0, $t2
	j return_label
	la $a0, string_L1174
	j error
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

