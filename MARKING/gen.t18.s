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
GLOBAL_VAR__havechar: 
.word 0
GLOBAL_VAR__char: 
.word 0
GLOBAL_VAR__havetoken: 
.word 0
GLOBAL_VAR__token: 
.word 0
GLOBAL_VAR_attr: 
.word 0
GLOBAL_VAR_EOF: 
.word 0
GLOBAL_VAR_TK_EOF: 
.word 0
GLOBAL_VAR_TK_EOLN: 
.word 0
GLOBAL_VAR_TK_NUMBER: 
.word 0
GLOBAL_VAR_TK_ADD: 
.word 0
GLOBAL_VAR_TK_SUB: 
.word 0
GLOBAL_VAR_TK_MUL: 
.word 0
GLOBAL_VAR_TK_DIV: 
.word 0
GLOBAL_VAR_TK_LPAREN: 
.word 0
GLOBAL_VAR_TK_RPAREN: 
.word 0
GLOBAL_VAR_ASCII_0: 
.word 0
GLOBAL_VAR_ASCII_9: 
.word 0
GLOBAL_VAR_ASCII_PLUS: 
.word 0
GLOBAL_VAR_ASCII_MINUS: 
.word 0
GLOBAL_VAR_ASCII_STAR: 
.word 0
GLOBAL_VAR_ASCII_SLASH: 
.word 0
GLOBAL_VAR_ASCII_LPAREN: 
.word 0
GLOBAL_VAR_ASCII_RPAREN: 
.word 0
GLOBAL_VAR_ASCII_SPACE: 
.word 0
GLOBAL_VAR_ASCII_TAB: 
.word 0
GLOBAL_VAR_ASCII_CR: 
.word 0
GLOBAL_VAR_ASCII_NL: 
.word 0
string_L1:
	.byte 102 117 110 99 116 105 111 110 32 34 103 101 116 99 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "getc" must return a value
	.align 2
string_L3:
	.byte 73 110 116 101 114 110 97 108 32 101 114 114 111 114 58 32 116 111 111 32 109 97 110 121 32 117 110 103 101 116 115 33 10 0 # Internal error: too many ungets!\n
	.align 2
string_L5:
	.byte 102 117 110 99 116 105 111 110 32 34 112 101 101 107 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "peek" must return a value
	.align 2
string_L7:
	.byte 69 114 114 111 114 58 32 101 120 112 101 99 116 101 100 32 0 # Error: expected 
	.align 2
string_L8:
	.byte 10 0 # \n
	.align 2
string_L22:
	.byte 69 114 114 111 114 58 32 105 110 118 97 108 105 100 32 99 104 97 114 97 99 116 101 114 46 10 0 # Error: invalid character.\n
	.align 2
string_L23:
	.byte 102 117 110 99 116 105 111 110 32 34 115 99 97 110 110 101 114 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "scanner" must return a value
	.align 2
string_L26:
	.byte 102 117 110 99 116 105 111 110 32 34 105 115 100 105 103 105 116 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "isdigit" must return a value
	.align 2
string_L31:
	.byte 102 117 110 99 116 105 111 110 32 34 105 115 115 112 97 99 101 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "isspace" must return a value
	.align 2
string_L34:
	.byte 32 61 32 0 #  = 
	.align 2
string_L35:
	.byte 10 0 # \n
	.align 2
string_L42:
	.byte 102 117 110 99 116 105 111 110 32 34 69 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "E" must return a value
	.align 2
string_L50:
	.byte 102 117 110 99 116 105 111 110 32 34 84 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "T" must return a value
	.align 2
string_L57:
	.byte 69 114 114 111 114 58 32 101 120 112 101 99 116 101 100 32 102 97 99 116 111 114 46 10 0 # Error: expected factor.\n
	.align 2
string_L58:
	.byte 102 117 110 99 116 105 111 110 32 34 70 34 32 109 117 115 116 32 114 101 116 117 114 110 32 97 32 118 97 108 117 101 0 # function "F" must return a value
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
# REGISTER DUMP
# REGISTER DUMP COMPLETE
	jal FUNCTION_init
# REGISTER RECOVERY
# REGISTER RECOVERY COMPLETE
# REGISTER DUMP
# REGISTER DUMP COMPLETE
	jal FUNCTION_parser
# REGISTER RECOVERY
# REGISTER RECOVERY COMPLETE
	j Lhalt
.globl FUNCTION_getc
FUNCTION_getc:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	lw $t0, GLOBAL_VAR__havechar
	seq $t1, $t0, $0
	beqz $t1, end_if_L0beqz
	j end_if_L0
end_if_L0beqz:
	li $t0, 0
	la $t1, GLOBAL_VAR__havechar
	sw $t0, 0($t1)
	lw $t0, GLOBAL_VAR__char
	move $v0, $t0
	j return_label
end_if_L0:
	jal Lgetchar
	move $t0, $v0
	move $v0, $t0
	j return_label
	la $a0, string_L1
	j error
.globl FUNCTION_ungetc
FUNCTION_ungetc:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
	lw $t1, GLOBAL_VAR__havechar
	seq $t2, $t1, $0
	beqz $t2, end_if_L2beqz
	j end_if_L2
end_if_L2beqz:
	la $a0, string_L3
	jal Lprints
	jal Lhalt
end_if_L2:
	li $t1, 1
	la $t2, GLOBAL_VAR__havechar
	sw $t1, 0($t2)
	la $t1, GLOBAL_VAR__char
	sw $t0, 0($t1)
	j return_label
.globl FUNCTION_peek
FUNCTION_peek:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	lw $t0, GLOBAL_VAR__havetoken
	seq $t1, $t0, $0
	beqz $t1, end_if_L4beqz
	j end_if_L4
end_if_L4beqz:
	lw $t0, GLOBAL_VAR__token
	move $v0, $t0
	j return_label
end_if_L4:
	li $t0, 1
	la $t1, GLOBAL_VAR__havetoken
	sw $t0, 0($t1)
# REGISTER DUMP
# REGISTER DUMP COMPLETE
	jal FUNCTION_scanner
# REGISTER RECOVERY
# REGISTER RECOVERY COMPLETE
	move $t0, $v0
	la $t1, GLOBAL_VAR__token
	sw $t0, 0($t1)
	move $v0, $t0
	j return_label
	la $a0, string_L5
	j error
.globl FUNCTION_match
FUNCTION_match:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_peek
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t1, $v0
	sne $t2, $t1, $t0
	seq $t1, $t2, $0
	beqz $t1, end_if_L6beqz
	j end_if_L6
end_if_L6beqz:
	la $a0, string_L7
	jal Lprints
	move $a0, $t0
	jal Lprintc
	la $a0, string_L8
	jal Lprints
	jal Lhalt
end_if_L6:
	li $t2, 0
	la $t1, GLOBAL_VAR__havetoken
	sw $t2, 0($t1)
	j return_label
.globl FUNCTION_scanner
FUNCTION_scanner:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
while_L9:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_getc
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t1, $v0
	move $t0, $t1
	move $a0, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_isspace
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t1, $v0
	seq $t2, $t1, $0
	beqz $t2, while_exit_L10beqz
	j while_exit_L10
while_exit_L10beqz:
	j while_L9
while_exit_L10:
	lw $t1, GLOBAL_VAR_EOF
	seq $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, end_if_L11beqz
	j end_if_L11
end_if_L11beqz:
	lw $t2, GLOBAL_VAR_TK_EOF
	move $v0, $t2
	j return_label
end_if_L11:
	lw $t2, GLOBAL_VAR_ASCII_NL
	seq $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, end_if_L12beqz
	j end_if_L12
end_if_L12beqz:
	lw $t1, GLOBAL_VAR_TK_EOLN
	move $v0, $t1
	j return_label
end_if_L12:
	lw $t1, GLOBAL_VAR_ASCII_PLUS
	seq $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, end_if_L13beqz
	j end_if_L13
end_if_L13beqz:
	lw $t2, GLOBAL_VAR_TK_ADD
	move $v0, $t2
	j return_label
end_if_L13:
	lw $t2, GLOBAL_VAR_ASCII_MINUS
	seq $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, end_if_L14beqz
	j end_if_L14
end_if_L14beqz:
	lw $t1, GLOBAL_VAR_TK_SUB
	move $v0, $t1
	j return_label
end_if_L14:
	lw $t1, GLOBAL_VAR_ASCII_STAR
	seq $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, end_if_L15beqz
	j end_if_L15
end_if_L15beqz:
	lw $t2, GLOBAL_VAR_TK_MUL
	move $v0, $t2
	j return_label
end_if_L15:
	lw $t2, GLOBAL_VAR_ASCII_SLASH
	seq $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, end_if_L16beqz
	j end_if_L16
end_if_L16beqz:
	lw $t1, GLOBAL_VAR_TK_DIV
	move $v0, $t1
	j return_label
end_if_L16:
	lw $t1, GLOBAL_VAR_ASCII_LPAREN
	seq $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, end_if_L17beqz
	j end_if_L17
end_if_L17beqz:
	lw $t2, GLOBAL_VAR_TK_LPAREN
	move $v0, $t2
	j return_label
end_if_L17:
	lw $t2, GLOBAL_VAR_ASCII_RPAREN
	seq $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, end_if_L18beqz
	j end_if_L18
end_if_L18beqz:
	lw $t1, GLOBAL_VAR_TK_RPAREN
	move $v0, $t1
	j return_label
end_if_L18:
	move $a0, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_isdigit
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t1, $v0
	seq $t2, $t1, $0
	beqz $t2, end_if_L19beqz
	j end_if_L19
end_if_L19beqz:
	li $t1, 0
	la $t2, GLOBAL_VAR_attr
	sw $t1, 0($t2)
while_L20:
	move $a0, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_isdigit
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t1, $v0
	seq $t2, $t1, $0
	beqz $t2, while_exit_L21beqz
	j while_exit_L21
while_exit_L21beqz:
	lw $t1, GLOBAL_VAR_attr
	li $t2, 10
	mul $t3, $t1, $t2
	lw $t2, GLOBAL_VAR_ASCII_0
	subu $t1, $t0, $t2
	addu $t2, $t3, $t1
	la $t1, GLOBAL_VAR_attr
	sw $t2, 0($t1)
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_getc
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t2, $v0
	move $t0, $t2
	j while_L20
while_exit_L21:
	move $a0, $t0
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_ungetc
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	lw $t2, GLOBAL_VAR_TK_NUMBER
	move $v0, $t2
	j return_label
end_if_L19:
	la $a0, string_L22
	jal Lprints
	jal Lhalt
	la $a0, string_L23
	j error
.globl FUNCTION_isdigit
FUNCTION_isdigit:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
	lw $t1, GLOBAL_VAR_ASCII_0
	sge $t2, $t0, $t1
	seq $t1, $t2, $0
	beqz $t1, and_falseL25beqz
	j and_falseL25
and_falseL25beqz:
	lw $t2, GLOBAL_VAR_ASCII_9
	sle $t1, $t0, $t2
	seq $t2, $t1, $0
	beqz $t2, and_falseL25beqz2
	j and_falseL25
and_falseL25beqz2:
	li $t1, 1
	j and_doneL24
and_falseL25:
	li $t1, 0
and_doneL24:
	move $v0, $t1
	j return_label
	la $a0, string_L26
	j error
.globl FUNCTION_isspace
FUNCTION_isspace:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	move $t0, $a0
	lw $t1, GLOBAL_VAR_ASCII_SPACE
	seq $t2, $t0, $t1
	sne $t1, $t2, $0
	beqz $t1, or_trueL28beqz
	j or_trueL28
or_trueL28beqz:
	lw $t2, GLOBAL_VAR_ASCII_TAB
	seq $t1, $t0, $t2
	sne $t2, $t1, $0
	beqz $t2, or_trueL30beqz
	j or_trueL30
or_trueL30beqz:
	lw $t1, GLOBAL_VAR_ASCII_CR
	seq $t2, $t0, $t1
	sne $t1, $t2, $0
	beqz $t1, or_trueL30beqz2
	j or_trueL30
or_trueL30beqz2:
	li $t2, 0
	j or_doneL29
or_trueL30:
	li $t2, 1
or_doneL29:
	sne $t1, $t2, $0
	beqz $t1, or_trueL28beqz2
	j or_trueL28
or_trueL28beqz2:
	li $t2, 0
	j or_doneL27
or_trueL28:
	li $t2, 1
or_doneL27:
	move $v0, $t2
	j return_label
	la $a0, string_L31
	j error
.globl FUNCTION_parser
FUNCTION_parser:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
while_L32:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_peek
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t1, $v0
	lw $t2, GLOBAL_VAR_TK_EOF
	sne $t3, $t1, $t2
	seq $t2, $t3, $0
	beqz $t2, while_exit_L33beqz
	j while_exit_L33
while_exit_L33beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_E
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	move $t0, $t3
	lw $t3, GLOBAL_VAR_TK_EOLN
	move $a0, $t3
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_match
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	la $a0, string_L34
	jal Lprints
	move $a0, $t0
	jal Lprinti
	la $a0, string_L35
	jal Lprints
	j while_L32
while_exit_L33:
	j return_label
.globl FUNCTION_E
FUNCTION_E:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_T
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	move $t0, $t3
while_L36:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_peek
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	lw $t4, GLOBAL_VAR_TK_ADD
	seq $t5, $t3, $t4
	sne $t4, $t5, $0
	beqz $t4, or_trueL39beqz
	j or_trueL39
or_trueL39beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_peek
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t5, $v0
	lw $t4, GLOBAL_VAR_TK_SUB
	seq $t3, $t5, $t4
	sne $t4, $t3, $0
	beqz $t4, or_trueL39beqz2
	j or_trueL39
or_trueL39beqz2:
	li $t3, 0
	j or_doneL38
or_trueL39:
	li $t3, 1
or_doneL38:
	seq $t4, $t3, $0
	beqz $t4, while_exit_L37beqz
	j while_exit_L37
while_exit_L37beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_peek
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	move $t2, $t3
	move $a0, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_match
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_T
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	move $t1, $t3
	lw $t3, GLOBAL_VAR_TK_ADD
	seq $t4, $t2, $t3
	seq $t3, $t4, $0
	beqz $t3, else_L40beqz
	j else_L40
else_L40beqz:
	addu $t4, $t0, $t1
	move $t0, $t4
	j end_ifL41
else_L40:
	subu $t4, $t0, $t1
	move $t0, $t4
end_ifL41:
	j while_L36
while_exit_L37:
	move $v0, $t0
	j return_label
	la $a0, string_L42
	j error
.globl FUNCTION_T
FUNCTION_T:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_F
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	move $t0, $t3
while_L43:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_peek
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	lw $t4, GLOBAL_VAR_TK_MUL
	seq $t5, $t3, $t4
	sne $t4, $t5, $0
	beqz $t4, or_trueL46beqz
	j or_trueL46
or_trueL46beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_peek
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t5, $v0
	lw $t4, GLOBAL_VAR_TK_DIV
	seq $t3, $t5, $t4
	sne $t4, $t3, $0
	beqz $t4, or_trueL46beqz2
	j or_trueL46
or_trueL46beqz2:
	li $t3, 0
	j or_doneL45
or_trueL46:
	li $t3, 1
or_doneL45:
	seq $t4, $t3, $0
	beqz $t4, while_exit_L44beqz
	j while_exit_L44
while_exit_L44beqz:
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_peek
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	move $t2, $t3
	move $a0, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_match
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_F
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $t2, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	move $t1, $t3
	lw $t3, GLOBAL_VAR_TK_MUL
	seq $t4, $t2, $t3
	seq $t3, $t4, $0
	beqz $t3, else_L47beqz
	j else_L47
else_L47beqz:
	mul $t4, $t0, $t1
	move $t0, $t4
	j end_ifL48
else_L47:
	bnez $t1, L49
	la $a0, div_by_zero
	j error
L49:
	div $t4, $t0, $t1
	move $t0, $t4
end_ifL48:
	j while_L43
while_exit_L44:
	move $v0, $t0
	j return_label
	la $a0, string_L50
	j error
.globl FUNCTION_F
FUNCTION_F:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_peek
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t2, $v0
	move $t1, $t2
	lw $t2, GLOBAL_VAR_TK_LPAREN
	seq $t3, $t1, $t2
	seq $t2, $t3, $0
	beqz $t2, else_L51beqz
	j else_L51
else_L51beqz:
	lw $t3, GLOBAL_VAR_TK_LPAREN
	move $a0, $t3
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_match
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_E
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t3, $v0
	move $t0, $t3
	lw $t3, GLOBAL_VAR_TK_RPAREN
	move $a0, $t3
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_match
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	j end_ifL52
else_L51:
	lw $t3, GLOBAL_VAR_TK_SUB
	seq $t2, $t1, $t3
	seq $t3, $t2, $0
	beqz $t3, else_L53beqz
	j else_L53
else_L53beqz:
	lw $t2, GLOBAL_VAR_TK_SUB
	move $a0, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_match
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_F
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	move $t2, $v0
	negu $t3, $t2
	move $t0, $t3
	j end_ifL54
else_L53:
	lw $t3, GLOBAL_VAR_TK_NUMBER
	seq $t2, $t1, $t3
	seq $t3, $t2, $0
	beqz $t3, else_L55beqz
	j else_L55
else_L55beqz:
	lw $t2, GLOBAL_VAR_TK_NUMBER
	move $a0, $t2
# REGISTER DUMP
	addi $sp, $sp, -4
	sw $a0, 0($sp)
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	addi $sp, $sp, -4
	sw $t0, 0($sp)
# REGISTER DUMP COMPLETE
	jal FUNCTION_match
# REGISTER RECOVERY
	lw $t0, 0($sp)
	addi $sp, $sp, 4
	lw $t1, 0($sp)
	addi $sp, $sp, 4
	lw $a0, 0($sp)
	addi $sp, $sp, 4
# REGISTER RECOVERY COMPLETE
	lw $t2, GLOBAL_VAR_attr
	move $t0, $t2
	j end_ifL56
else_L55:
	la $a0, string_L57
	jal Lprints
	jal Lhalt
end_ifL56:
end_ifL54:
end_ifL52:
	move $v0, $t0
	j return_label
	la $a0, string_L58
	j error
.globl FUNCTION_init
FUNCTION_init:
	subu $sp, $sp, 4
	sw $ra, 0($sp)
	li $t0, 1
	negu $t1, $t0
	la $t0, GLOBAL_VAR_EOF
	sw $t1, 0($t0)
	li $t1, 48
	la $t0, GLOBAL_VAR_ASCII_0
	sw $t1, 0($t0)
	li $t1, 57
	la $t0, GLOBAL_VAR_ASCII_9
	sw $t1, 0($t0)
	li $t1, 43
	la $t0, GLOBAL_VAR_ASCII_PLUS
	sw $t1, 0($t0)
	li $t1, 45
	la $t0, GLOBAL_VAR_ASCII_MINUS
	sw $t1, 0($t0)
	li $t1, 42
	la $t0, GLOBAL_VAR_ASCII_STAR
	sw $t1, 0($t0)
	li $t1, 47
	la $t0, GLOBAL_VAR_ASCII_SLASH
	sw $t1, 0($t0)
	li $t1, 40
	la $t0, GLOBAL_VAR_ASCII_LPAREN
	sw $t1, 0($t0)
	li $t1, 41
	la $t0, GLOBAL_VAR_ASCII_RPAREN
	sw $t1, 0($t0)
	li $t1, 32
	la $t0, GLOBAL_VAR_ASCII_SPACE
	sw $t1, 0($t0)
	li $t1, 9
	la $t0, GLOBAL_VAR_ASCII_TAB
	sw $t1, 0($t0)
	li $t1, 13
	la $t0, GLOBAL_VAR_ASCII_CR
	sw $t1, 0($t0)
	li $t1, 10
	la $t0, GLOBAL_VAR_ASCII_NL
	sw $t1, 0($t0)
	li $t1, 256
	la $t0, GLOBAL_VAR_TK_EOF
	sw $t1, 0($t0)
	li $t1, 257
	la $t0, GLOBAL_VAR_TK_NUMBER
	sw $t1, 0($t0)
	lw $t1, GLOBAL_VAR_ASCII_PLUS
	la $t0, GLOBAL_VAR_TK_ADD
	sw $t1, 0($t0)
	lw $t1, GLOBAL_VAR_ASCII_MINUS
	la $t0, GLOBAL_VAR_TK_SUB
	sw $t1, 0($t0)
	lw $t1, GLOBAL_VAR_ASCII_STAR
	la $t0, GLOBAL_VAR_TK_MUL
	sw $t1, 0($t0)
	lw $t1, GLOBAL_VAR_ASCII_SLASH
	la $t0, GLOBAL_VAR_TK_DIV
	sw $t1, 0($t0)
	lw $t1, GLOBAL_VAR_ASCII_LPAREN
	la $t0, GLOBAL_VAR_TK_LPAREN
	sw $t1, 0($t0)
	lw $t1, GLOBAL_VAR_ASCII_RPAREN
	la $t0, GLOBAL_VAR_TK_RPAREN
	sw $t1, 0($t0)
	lw $t1, GLOBAL_VAR_ASCII_NL
	la $t0, GLOBAL_VAR_TK_EOLN
	sw $t1, 0($t0)
	j return_label
return_label:
	lw $ra, 0($sp)
	addu $sp, $sp, 4
	jr $ra

