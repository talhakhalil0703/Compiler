## TEST RESULT: 93/93

### 10_main_missing_lb.test
#### Mine
```
Parser error, probably missing { for block statement, at or near line: 1
```
#### Professors
```
error: syntax error, probably ")" at or near line 1
```

### 11_main_missing_rp.test
#### Mine
```
Parser error, probably missing ), for main function, at or near line: 1
```
#### Professors
```
error: syntax error, probably "{" at or near line 1
```

### 12_main_missing_lp.test
#### Mine
```
Parser error, probably missing (, for main function, at or near line: 1
```
#### Professors
```
error: syntax error, probably ")" at or near line 1
```

### 13_main_missing_p.test
#### Mine
```
Parser error, probably missing (, for main function, at or near line: 1
```
#### Professors
```
error: syntax error, probably "{" at or near line 1
```

### 14_main_missing_brackets.test
#### Mine
```
Parser error, probably missing { for block statement, at or near line: 1
```
#### Professors
```
error: syntax error, probably "(" at or near line 1
```

### 15_main_one_liner.test
#### Mine
```
program {'sym': <0x7333e8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x7334b8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7fe12242f820>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7fe12242f820>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}

```

### 16_main_with_assignment.test
#### Mine
```
error: unknown identifier' x' at or near line 2
```
#### Professors
```
error: unknown identifier 'x' at or near line 2
```

### 17_main_with_foo.test
#### Mine
```
error: no return statement in non-void function 'foo'
```
#### Professors
```
error: no return statement in non-void function 'foo'
```

### 18_hanging_if_statements.t18
#### Mine
```
program {'sym': <0x1df2ee8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x1df2fb8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			if {'lineno': 2, 'type': 'if'}
				true {'sig': 'boolean', 'lineno': 2, 'type': 'true'}
				if_else {'lineno': 3, 'type': 'if_else'}
					true {'sig': 'boolean', 'lineno': 3, 'type': 'true'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7fe39b4137d0>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7fe39b4137d0>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			if {'type': 'if', 'lineno': 2}
				true {'sig': 'boolean', 'type': 'true', 'lineno': 2, 'attr': None}
				ifElse {'type': 'ifElse', 'lineno': 3}
					true {'sig': 'boolean', 'type': 'true', 'lineno': 3, 'attr': None}
					nullStmt {'type': 'nullStmt', 'lineno': 4}
					nullStmt {'type': 'nullStmt', 'lineno': 6}

```

### 19_precedence.test
#### Mine
```
error: unknown identifier' x' at or near line 2
```
#### Professors
```
error: unknown identifier 'x' at or near line 2
```

### 1_reading_test.test
#### Mine
```
Parser error, probably missing (, for main function, at or near line: 1
```
#### Professors
```
error: syntax error, probably "is" at or near line 1
```

### 20_basic_if_statement.test
#### Mine
```
error: unknown identifier' x' at or near line 3
```
#### Professors
```
error: unknown identifier 'x' at or near line 3
```

### 21_if_else.test
#### Mine
```
error: unknown identifier' x' at or near line 3
```
#### Professors
```
error: unknown identifier 'x' at or near line 3
```

### 22_many_subtractions.test
#### Mine
```
error: unknown identifier' x' at or near line 2
```
#### Professors
```
error: unknown identifier 'x' at or near line 2
```

### 23_subtraction.test
#### Mine
```
error: unknown identifier' y' at or near line 2
```
#### Professors
```
error: unknown identifier 'y' at or near line 2
```

### 24_fib.test
#### Mine
```
program {'sym': <0x12e3758>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x12e3828>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'i', 'sym': <0x12e3a38>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			statement {'lineno': 3, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 3, 'type': '='}
					id {'attr': 'i', 'sym': <0x12e3a38>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 3, 'type': 'number'}
			while {'lineno': 7, 'type': 'while'}
				<= {'sig': 'boolean', 'lineno': 7, 'type': '<='}
					id {'attr': 'i', 'sym': <0x12e3a38>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
					number {'attr': '47', 'sig': 'int', 'lineno': 7, 'type': 'number'}
				block {'type': 'block'}
					statement {'lineno': 8, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 8, 'type': 'function_call'}
							id {'attr': 'prints', 'sym': <0x12e3508>, 'sig': 'f(string)', 'lineno': 8, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'attr': 'fib(', 'sig': 'string', 'lineno': 8, 'type': 'string'}
					statement {'lineno': 9, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 9, 'type': 'function_call'}
							id {'attr': 'printi', 'sym': <0x12e1c38>, 'sig': 'f(int)', 'lineno': 9, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'i', 'sym': <0x12e3a38>, 'sig': 'int', 'lineno': 9, 'type': 'id'}
					statement {'lineno': 10, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 10, 'type': 'function_call'}
							id {'attr': 'prints', 'sym': <0x12e3508>, 'sig': 'f(string)', 'lineno': 10, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'attr': ') = ', 'sig': 'string', 'lineno': 10, 'type': 'string'}
					statement {'lineno': 11, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 11, 'type': 'function_call'}
							id {'attr': 'printi', 'sym': <0x12e1c38>, 'sig': 'f(int)', 'lineno': 11, 'type': 'id'}
							actuals {'type': 'actuals'}
								function_call {'sig': 'int', 'lineno': 11, 'type': 'function_call'}
									id {'attr': 'fib', 'sym': <0x12e3948>, 'sig': 'f(int)', 'lineno': 11, 'type': 'id'}
									actuals {'type': 'actuals'}
										id {'attr': 'i', 'sym': <0x12e3a38>, 'sig': 'int', 'lineno': 11, 'type': 'id'}
					statement {'lineno': 12, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 12, 'type': 'function_call'}
							id {'attr': 'prints', 'sym': <0x12e3508>, 'sig': 'f(string)', 'lineno': 12, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'attr': '\n', 'sig': 'string', 'lineno': 12, 'type': 'string'}
					statement {'lineno': 13, 'type': 'statement'}
						= {'sig': 'int', 'lineno': 13, 'type': '='}
							id {'attr': 'i', 'sym': <0x12e3a38>, 'sig': 'int', 'lineno': 13, 'type': 'id'}
							+ {'sig': 'int', 'lineno': 13, 'type': '+'}
								id {'attr': 'i', 'sym': <0x12e3a38>, 'sig': 'int', 'lineno': 13, 'type': 'id'}
								number {'attr': '1', 'sig': 'int', 'lineno': 13, 'type': 'number'}
	function_declaration {'lineno': 17, 'type': 'function_declaration'}
		int {'sig': 'int', 'lineno': 17, 'type': 'int'}
		id {'attr': 'fib', 'sym': <0x12e3948>, 'sig': 'f(int)', 'lineno': 17, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal'}
				int {'sig': 'int', 'lineno': 17, 'type': 'int'}
				id {'attr': 'n', 'sym': <0x12e3b98>, 'sig': 'int', 'lineno': 17, 'type': 'id'}
		block {'type': 'block'}
			if {'lineno': 18, 'type': 'if'}
				== {'sig': 'boolean', 'lineno': 18, 'type': '=='}
					id {'attr': 'n', 'sym': <0x12e3b98>, 'sig': 'int', 'lineno': 18, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 18, 'type': 'number'}
				return {'lineno': 18, 'type': 'return'}
					number {'attr': '0', 'sig': 'int', 'lineno': 18, 'type': 'number'}
			if {'lineno': 19, 'type': 'if'}
				== {'sig': 'boolean', 'lineno': 19, 'type': '=='}
					id {'attr': 'n', 'sym': <0x12e3b98>, 'sig': 'int', 'lineno': 19, 'type': 'id'}
					number {'attr': '1', 'sig': 'int', 'lineno': 19, 'type': 'number'}
				return {'lineno': 19, 'type': 'return'}
					number {'attr': '1', 'sig': 'int', 'lineno': 19, 'type': 'number'}
			return {'lineno': 20, 'type': 'return'}
				+ {'sig': 'int', 'lineno': 20, 'type': '+'}
					function_call {'sig': 'int', 'lineno': 20, 'type': 'function_call'}
						id {'attr': 'fib', 'sym': <0x12e3948>, 'sig': 'f(int)', 'lineno': 20, 'type': 'id'}
						actuals {'type': 'actuals'}
							- {'sig': 'int', 'lineno': 20, 'type': '-'}
								id {'attr': 'n', 'sym': <0x12e3b98>, 'sig': 'int', 'lineno': 20, 'type': 'id'}
								number {'attr': '1', 'sig': 'int', 'lineno': 20, 'type': 'number'}
					function_call {'sig': 'int', 'lineno': 20, 'type': 'function_call'}
						id {'attr': 'fib', 'sym': <0x12e3948>, 'sig': 'f(int)', 'lineno': 20, 'type': 'id'}
						actuals {'type': 'actuals'}
							- {'sig': 'int', 'lineno': 20, 'type': '-'}
								id {'attr': 'n', 'sym': <0x12e3b98>, 'sig': 'int', 'lineno': 20, 'type': 'id'}
								number {'attr': '2', 'sig': 'int', 'lineno': 20, 'type': 'number'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f97f3dd4730>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f97f3dd4730>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'i', 'sym': <stab.Symbol instance at 0x7f97f3dd49b0>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 3}
				= {'sig': 'int', 'type': '=', 'lineno': 3}
					id {'attr': 'i', 'sym': <stab.Symbol instance at 0x7f97f3dd49b0>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 3, 'attr': '0'}
			while {'type': 'while', 'lineno': 7}
				<= {'sig': 'boolean', 'type': '<=', 'lineno': 7}
					id {'attr': 'i', 'sym': <stab.Symbol instance at 0x7f97f3dd49b0>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 7, 'attr': '47'}
				block {'type': 'block'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 8}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 8}
							id {'attr': 'prints', 'sym': <stab.Symbol instance at 0x7f97f3dd4190>, 'sig': 'f(string)', 'lineno': 8, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'sig': 'string', 'type': 'string', 'lineno': 8, 'attr': 'fib('}
					stmtExpr {'type': 'stmtExpr', 'lineno': 9}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 9}
							id {'attr': 'printi', 'sym': <stab.Symbol instance at 0x7f97f3dd41e0>, 'sig': 'f(int)', 'lineno': 9, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'i', 'sym': <stab.Symbol instance at 0x7f97f3dd49b0>, 'sig': 'int', 'lineno': 9, 'type': 'id'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 10}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 10}
							id {'attr': 'prints', 'sym': <stab.Symbol instance at 0x7f97f3dd4190>, 'sig': 'f(string)', 'lineno': 10, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'sig': 'string', 'type': 'string', 'lineno': 10, 'attr': ') = '}
					stmtExpr {'type': 'stmtExpr', 'lineno': 11}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 11}
							id {'attr': 'printi', 'sym': <stab.Symbol instance at 0x7f97f3dd41e0>, 'sig': 'f(int)', 'lineno': 11, 'type': 'id'}
							actuals {'type': 'actuals'}
								funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 11}
									id {'attr': 'fib', 'sym': <stab.Symbol instance at 0x7f97f3dd4870>, 'sig': 'f(int)', 'lineno': 11, 'type': 'id'}
									actuals {'type': 'actuals'}
										id {'attr': 'i', 'sym': <stab.Symbol instance at 0x7f97f3dd49b0>, 'sig': 'int', 'lineno': 11, 'type': 'id'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 12}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 12}
							id {'attr': 'prints', 'sym': <stab.Symbol instance at 0x7f97f3dd4190>, 'sig': 'f(string)', 'lineno': 12, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'sig': 'string', 'type': 'string', 'lineno': 12, 'attr': '\\n'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 13}
						= {'sig': 'int', 'type': '=', 'lineno': 13}
							id {'attr': 'i', 'sym': <stab.Symbol instance at 0x7f97f3dd49b0>, 'sig': 'int', 'lineno': 13, 'type': 'id'}
							+ {'sig': 'int', 'type': '+', 'lineno': 13}
								id {'attr': 'i', 'sym': <stab.Symbol instance at 0x7f97f3dd49b0>, 'sig': 'int', 'lineno': 13, 'type': 'id'}
								number {'sig': 'int', 'type': 'number', 'lineno': 13, 'attr': '1'}
	funcDecl {'type': 'funcDecl', 'lineno': 17}
		int {'sig': 'int', 'type': 'int', 'lineno': 17, 'attr': None}
		id {'attr': 'fib', 'sym': <stab.Symbol instance at 0x7f97f3dd4870>, 'sig': 'f(int)', 'lineno': 17, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal', 'lineno': 17}
				int {'sig': 'int', 'type': 'int', 'lineno': 17, 'attr': None}
				id {'attr': 'n', 'sym': <stab.Symbol instance at 0x7f97f3ddd0f0>, 'sig': 'int', 'lineno': 17, 'type': 'id'}
		block {'type': 'block'}
			if {'type': 'if', 'lineno': 18}
				== {'sig': 'boolean', 'type': '==', 'lineno': 18}
					id {'attr': 'n', 'sym': <stab.Symbol instance at 0x7f97f3ddd0f0>, 'sig': 'int', 'lineno': 18, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 18, 'attr': '0'}
				return {'type': 'return', 'lineno': 18}
					number {'sig': 'int', 'type': 'number', 'lineno': 18, 'attr': '0'}
			if {'type': 'if', 'lineno': 19}
				== {'sig': 'boolean', 'type': '==', 'lineno': 19}
					id {'attr': 'n', 'sym': <stab.Symbol instance at 0x7f97f3ddd0f0>, 'sig': 'int', 'lineno': 19, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 19, 'attr': '1'}
				return {'type': 'return', 'lineno': 19}
					number {'sig': 'int', 'type': 'number', 'lineno': 19, 'attr': '1'}
			return {'type': 'return', 'lineno': 20}
				+ {'sig': 'int', 'type': '+', 'lineno': 20}
					funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 20}
						id {'attr': 'fib', 'sym': <stab.Symbol instance at 0x7f97f3dd4870>, 'sig': 'f(int)', 'lineno': 20, 'type': 'id'}
						actuals {'type': 'actuals'}
							- {'sig': 'int', 'type': '-', 'lineno': 20}
								id {'attr': 'n', 'sym': <stab.Symbol instance at 0x7f97f3ddd0f0>, 'sig': 'int', 'lineno': 20, 'type': 'id'}
								number {'sig': 'int', 'type': 'number', 'lineno': 20, 'attr': '1'}
					funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 20}
						id {'attr': 'fib', 'sym': <stab.Symbol instance at 0x7f97f3dd4870>, 'sig': 'f(int)', 'lineno': 20, 'type': 'id'}
						actuals {'type': 'actuals'}
							- {'sig': 'int', 'type': '-', 'lineno': 20}
								id {'attr': 'n', 'sym': <stab.Symbol instance at 0x7f97f3ddd0f0>, 'sig': 'int', 'lineno': 20, 'type': 'id'}
								number {'sig': 'int', 'type': 'number', 'lineno': 20, 'attr': '2'}

```

### 25_basic_main_with_function_call_foo.test
#### Mine
```
program {'sym': <0xcff668>, 'type': 'program'}
	global_variable_declaration {'lineno': 1, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 1, 'type': 'int'}
		id {'attr': 'j', 'sym': <0xcff738>, 'sig': 'int', 'lineno': 1, 'type': 'id'}
	main_declaration {'lineno': 3, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0xcff858>, 'sig': 'f()', 'lineno': 3, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'boolean', 'lineno': 4, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 4, 'type': 'boolean'}
				id {'attr': 'x', 'sym': <0xcff9f8>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 5, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 5, 'type': 'int'}
				id {'attr': 'g', 'sym': <0xcffb18>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
			statement {'lineno': 6, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 6, 'type': '='}
					id {'attr': 'g', 'sym': <0xcffb18>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'attr': '6', 'sig': 'int', 'lineno': 6, 'type': 'number'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 7, 'type': '='}
					id {'attr': 'x', 'sym': <0xcff9f8>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					function_call {'sig': 'boolean', 'lineno': 7, 'type': 'function_call'}
						id {'attr': 'foo', 'sym': <0xcff908>, 'sig': 'f(int)', 'lineno': 7, 'type': 'id'}
						actuals {'type': 'actuals'}
							number {'attr': '6', 'sig': 'int', 'lineno': 7, 'type': 'number'}
	function_declaration {'lineno': 10, 'type': 'function_declaration'}
		boolean {'sig': 'boolean', 'lineno': 10, 'type': 'boolean'}
		id {'attr': 'foo', 'sym': <0xcff908>, 'sig': 'f(int)', 'lineno': 10, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal'}
				int {'sig': 'int', 'lineno': 10, 'type': 'int'}
				id {'attr': 'argument_foo', 'sym': <0xcffc08>, 'sig': 'int', 'lineno': 10, 'type': 'id'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 11, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 11, 'type': 'int'}
				id {'attr': 'x', 'sym': <0xcffd28>, 'sig': 'int', 'lineno': 11, 'type': 'id'}
			statement {'lineno': 12, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 12, 'type': '='}
					id {'attr': 'x', 'sym': <0xcffd28>, 'sig': 'int', 'lineno': 12, 'type': 'id'}
					+ {'sig': 'int', 'lineno': 12, 'type': '+'}
						number {'attr': '5', 'sig': 'int', 'lineno': 12, 'type': 'number'}
						id {'attr': 'argument_foo', 'sym': <0xcffc08>, 'sig': 'int', 'lineno': 12, 'type': 'id'}
			statement {'lineno': 13, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 13, 'type': '='}
					id {'attr': 'x', 'sym': <0xcffd28>, 'sig': 'int', 'lineno': 13, 'type': 'id'}
					+ {'sig': 'int', 'lineno': 13, 'type': '+'}
						id {'attr': 'x', 'sym': <0xcffd28>, 'sig': 'int', 'lineno': 13, 'type': 'id'}
						id {'attr': 'j', 'sym': <0xcff738>, 'sig': 'int', 'lineno': 13, 'type': 'id'}
			return {'lineno': 14, 'type': 'return'}
				false {'sig': 'boolean', 'lineno': 14, 'type': 'false'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7fa423acf8c0>, 'type': 'program'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 1}
		int {'sig': 'int', 'type': 'int', 'lineno': 1, 'attr': None}
		id {'attr': 'j', 'sym': <stab.Symbol instance at 0x7fa423acf780>, 'sig': 'int', 'lineno': 1, 'type': 'id'}
	mainDecl {'type': 'mainDecl', 'lineno': 3}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7fa423acf8c0>, 'sig': 'f()', 'lineno': 3, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 4}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 4, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fa423ad7140>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 5}
				int {'sig': 'int', 'type': 'int', 'lineno': 5, 'attr': None}
				id {'attr': 'g', 'sym': <stab.Symbol instance at 0x7fa423ad7230>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 6}
				= {'sig': 'int', 'type': '=', 'lineno': 6}
					id {'attr': 'g', 'sym': <stab.Symbol instance at 0x7fa423ad7230>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 6, 'attr': '6'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'boolean', 'type': '=', 'lineno': 7}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fa423ad7140>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					funcCall {'sig': 'boolean', 'type': 'funcCall', 'lineno': 7}
						id {'attr': 'foo', 'sym': <stab.Symbol instance at 0x7fa423acfa00>, 'sig': 'f(int)', 'lineno': 7, 'type': 'id'}
						actuals {'type': 'actuals'}
							number {'sig': 'int', 'type': 'number', 'lineno': 7, 'attr': '6'}
	funcDecl {'type': 'funcDecl', 'lineno': 10}
		boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 10, 'attr': None}
		id {'attr': 'foo', 'sym': <stab.Symbol instance at 0x7fa423acfa00>, 'sig': 'f(int)', 'lineno': 10, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal', 'lineno': 10}
				int {'sig': 'int', 'type': 'int', 'lineno': 10, 'attr': None}
				id {'attr': 'argument_foo', 'sym': <stab.Symbol instance at 0x7fa423ad75a0>, 'sig': 'int', 'lineno': 10, 'type': 'id'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 11}
				int {'sig': 'int', 'type': 'int', 'lineno': 11, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fa423ad7640>, 'sig': 'int', 'lineno': 11, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 12}
				= {'sig': 'int', 'type': '=', 'lineno': 12}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fa423ad7640>, 'sig': 'int', 'lineno': 12, 'type': 'id'}
					+ {'sig': 'int', 'type': '+', 'lineno': 12}
						number {'sig': 'int', 'type': 'number', 'lineno': 12, 'attr': '5'}
						id {'attr': 'argument_foo', 'sym': <stab.Symbol instance at 0x7fa423ad75a0>, 'sig': 'int', 'lineno': 12, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 13}
				= {'sig': 'int', 'type': '=', 'lineno': 13}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fa423ad7640>, 'sig': 'int', 'lineno': 13, 'type': 'id'}
					+ {'sig': 'int', 'type': '+', 'lineno': 13}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fa423ad7640>, 'sig': 'int', 'lineno': 13, 'type': 'id'}
						id {'attr': 'j', 'sym': <stab.Symbol instance at 0x7fa423acf780>, 'sig': 'int', 'lineno': 13, 'type': 'id'}
			return {'type': 'return', 'lineno': 14}
				false {'sig': 'boolean', 'type': 'false', 'lineno': 14, 'attr': None}

```

### 26_no_main.test
#### Mine
```
error: no main declaration found
```
#### Professors
```
error: no main declaration found
```

### 27_multiple_main.test
#### Mine
```
error: 'main' redefined at or near line 11
```
#### Professors
```
error: 'main' redefined at or near line 11
```

### 28_local_declaration_not_in_outter_block.test
#### Mine
```
error: local declaration not in outermost block at or near line 5
```
#### Professors
```
error: local declaration not in outermost block at or near line 5
```

### 29_mismatch_w_arguments_and_parameters.test
#### Mine
```
error: number/type of arguments doesn't match function declaration at or near line 7
```
#### Professors
```
error: number/type of arguments doesn't match function declaration at or near line 7
```

### 2_empty_file.test
#### Mine
```
error: no main declaration found
```
#### Professors
```
error: no main declaration found
```

### 30_calling_main.test
#### Mine
```
error: cannot call main at or near line 2
```
#### Professors
```
error: can't call the main function at or near line 2
```

### 31_break_statements_with_while.test
#### Mine
```
error: break must be inside 'while' at or near line 4
```
#### Professors
```
error: break must be inside 'while' at or near line 4
```

### 32_no_return_in_non_coid.test
#### Mine
```
error: no return statement in non-void function 'foo'
```
#### Professors
```
error: no return statement in non-void function 'foo'
```

### 33_void_function_cant_return_value.test
#### Mine
```
error: this function can't return a value at or near line 4
```
#### Professors
```
error: this function can't return a value at or near line 4
```

### 34_non_void_must_return_value.test
#### Mine
```
error: this function must return a value at or near line 4
```
#### Professors
```
error: this function must return a value at or near line 4
```

### 35_incorrect_return_from_function.test
#### Mine
```
error: returned value has the wrong type at or near line 4
```
#### Professors
```
error: returned value has the wrong type at or near line 4
```

### 36_identifier_redefined_in_same_scope.test
#### Mine
```
error: 'x' redefined at or near line 4
```
#### Professors
```
error: 'x' redefined at or near line 4
```

### 37_undeclared_id_used.test
#### Mine
```
error: unknown identifier' y' at or near line 3
```
#### Professors
```
error: unknown identifier 'y' at or near line 3
```

### 38a_type_mismatch_a_or_bool_bool_int.test
#### Mine
```
error: Type mismatch for '=' at or near line 7
```
#### Professors
```
error: type mismatch for '=' at or near line 7
```

### 38b_type_mistmatch_or_bool_int_bool.test
#### Mine
```
error: Type mismatch for 'OR' at or near line 7
```
#### Professors
```
error: type mismatch for '||' at or near line 7
```

### 39_type_match_or.test
#### Mine
```
program {'sym': <0x11654f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x11655a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'boolean', 'lineno': 2, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 2, 'type': 'boolean'}
				id {'attr': 'x', 'sym': <0x1165708>, 'sig': 'boolean', 'lineno': 2, 'type': 'id'}
			statement {'lineno': 3, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 3, 'type': '='}
					id {'attr': 'x', 'sym': <0x1165708>, 'sig': 'boolean', 'lineno': 3, 'type': 'id'}
					true {'sig': 'boolean', 'lineno': 3, 'type': 'true'}
			variable_declaration {'sig': 'boolean', 'lineno': 4, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 4, 'type': 'boolean'}
				id {'attr': 'y', 'sym': <0x1165828>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 5, 'type': '='}
					id {'attr': 'y', 'sym': <0x1165828>, 'sig': 'boolean', 'lineno': 5, 'type': 'id'}
					true {'sig': 'boolean', 'lineno': 5, 'type': 'true'}
			variable_declaration {'sig': 'boolean', 'lineno': 6, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 6, 'type': 'boolean'}
				id {'attr': 'f', 'sym': <0x11658d8>, 'sig': 'boolean', 'lineno': 6, 'type': 'id'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 7, 'type': '='}
					id {'attr': 'f', 'sym': <0x11658d8>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					OR {'sig': 'boolean', 'lineno': 7, 'type': 'OR'}
						id {'attr': 'x', 'sym': <0x1165708>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
						id {'attr': 'y', 'sym': <0x1165828>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f5433e88730>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f5433e88730>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 2}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f5433e88870>, 'sig': 'boolean', 'lineno': 2, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 3}
				= {'sig': 'boolean', 'type': '=', 'lineno': 3}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f5433e88870>, 'sig': 'boolean', 'lineno': 3, 'type': 'id'}
					true {'sig': 'boolean', 'type': 'true', 'lineno': 3, 'attr': None}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 4}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 4, 'attr': None}
				id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f5433e889b0>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'boolean', 'type': '=', 'lineno': 5}
					id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f5433e889b0>, 'sig': 'boolean', 'lineno': 5, 'type': 'id'}
					true {'sig': 'boolean', 'type': 'true', 'lineno': 5, 'attr': None}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 6}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 6, 'attr': None}
				id {'attr': 'f', 'sym': <stab.Symbol instance at 0x7f5433e8d140>, 'sig': 'boolean', 'lineno': 6, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'boolean', 'type': '=', 'lineno': 7}
					id {'attr': 'f', 'sym': <stab.Symbol instance at 0x7f5433e8d140>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					|| {'sig': 'boolean', 'type': '||', 'lineno': 7}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f5433e88870>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
						id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f5433e889b0>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}

```

### 3_comments.test
#### Mine
```
error: no main declaration found
```
#### Professors
```
error: syntax error, probably "/" at or near line 6
```

### 40a_type_mismatch_and_bool_bool_int.test
#### Mine
```
error: Type mismatch for '=' at or near line 7
```
#### Professors
```
error: type mismatch for '=' at or near line 7
```

### 40b_type_mismatch_and_bool_int_bool.test
#### Mine
```
error: Type mismatch for 'AND' at or near line 7
```
#### Professors
```
error: type mismatch for '&&' at or near line 7
```

### 41_type_match_bool_bool_bool.test
#### Mine
```
program {'sym': <0x1cfb4f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x1cfb5a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'boolean', 'lineno': 2, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 2, 'type': 'boolean'}
				id {'attr': 'x', 'sym': <0x1cfb708>, 'sig': 'boolean', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'boolean', 'lineno': 3, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 3, 'type': 'boolean'}
				id {'attr': 'y', 'sym': <0x1cfb828>, 'sig': 'boolean', 'lineno': 3, 'type': 'id'}
			statement {'lineno': 4, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 4, 'type': '='}
					id {'attr': 'x', 'sym': <0x1cfb708>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
					true {'sig': 'boolean', 'lineno': 4, 'type': 'true'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 5, 'type': '='}
					id {'attr': 'y', 'sym': <0x1cfb828>, 'sig': 'boolean', 'lineno': 5, 'type': 'id'}
					true {'sig': 'boolean', 'lineno': 5, 'type': 'true'}
			variable_declaration {'sig': 'boolean', 'lineno': 6, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 6, 'type': 'boolean'}
				id {'attr': 'f', 'sym': <0x1cfb8d8>, 'sig': 'boolean', 'lineno': 6, 'type': 'id'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 7, 'type': '='}
					id {'attr': 'f', 'sym': <0x1cfb8d8>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					AND {'sig': 'boolean', 'lineno': 7, 'type': 'AND'}
						id {'attr': 'x', 'sym': <0x1cfb708>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
						id {'attr': 'y', 'sym': <0x1cfb828>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f938d3457d0>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f938d3457d0>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 2}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f938d345910>, 'sig': 'boolean', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 3}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 3, 'attr': None}
				id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f938d345a50>, 'sig': 'boolean', 'lineno': 3, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 4}
				= {'sig': 'boolean', 'type': '=', 'lineno': 4}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f938d345910>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
					true {'sig': 'boolean', 'type': 'true', 'lineno': 4, 'attr': None}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'boolean', 'type': '=', 'lineno': 5}
					id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f938d345a50>, 'sig': 'boolean', 'lineno': 5, 'type': 'id'}
					true {'sig': 'boolean', 'type': 'true', 'lineno': 5, 'attr': None}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 6}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 6, 'attr': None}
				id {'attr': 'f', 'sym': <stab.Symbol instance at 0x7f938d3491e0>, 'sig': 'boolean', 'lineno': 6, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'boolean', 'type': '=', 'lineno': 7}
					id {'attr': 'f', 'sym': <stab.Symbol instance at 0x7f938d3491e0>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					&& {'sig': 'boolean', 'type': '&&', 'lineno': 7}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f938d345910>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
						id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f938d345a50>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}

```

### 42a_type_mismatch_equality_bool_int_bool.test
#### Mine
```
error: Type mismatch for '==' at or near line 7
```
#### Professors
```
error: type mismatch for '==' at or near line 7
```

### 42b_type_mismatch_equality_int_int_int.test
#### Mine
```
error: Type mismatch for '=' at or near line 7
```
#### Professors
```
error: type mismatch for '=' at or near line 7
```

### 43a_match_equality_bool_bool_bool.test
#### Mine
```
program {'sym': <0xc3f4f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0xc3f5a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'boolean', 'lineno': 2, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 2, 'type': 'boolean'}
				id {'attr': 'x', 'sym': <0xc3f708>, 'sig': 'boolean', 'lineno': 2, 'type': 'id'}
			statement {'lineno': 3, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 3, 'type': '='}
					id {'attr': 'x', 'sym': <0xc3f708>, 'sig': 'boolean', 'lineno': 3, 'type': 'id'}
					false {'sig': 'boolean', 'lineno': 3, 'type': 'false'}
			variable_declaration {'sig': 'boolean', 'lineno': 4, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 4, 'type': 'boolean'}
				id {'attr': 'f', 'sym': <0xc3f828>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 5, 'type': '='}
					id {'attr': 'f', 'sym': <0xc3f828>, 'sig': 'boolean', 'lineno': 5, 'type': 'id'}
					true {'sig': 'boolean', 'lineno': 5, 'type': 'true'}
			variable_declaration {'sig': 'boolean', 'lineno': 6, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 6, 'type': 'boolean'}
				id {'attr': 'g', 'sym': <0xc3f8d8>, 'sig': 'boolean', 'lineno': 6, 'type': 'id'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 7, 'type': '='}
					id {'attr': 'g', 'sym': <0xc3f8d8>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					== {'sig': 'boolean', 'lineno': 7, 'type': '=='}
						id {'attr': 'x', 'sym': <0xc3f708>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
						id {'attr': 'f', 'sym': <0xc3f828>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7ffb120b6780>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7ffb120b6780>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 2}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7ffb120b68c0>, 'sig': 'boolean', 'lineno': 2, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 3}
				= {'sig': 'boolean', 'type': '=', 'lineno': 3}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7ffb120b68c0>, 'sig': 'boolean', 'lineno': 3, 'type': 'id'}
					false {'sig': 'boolean', 'type': 'false', 'lineno': 3, 'attr': None}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 4}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 4, 'attr': None}
				id {'attr': 'f', 'sym': <stab.Symbol instance at 0x7ffb120b6a00>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'boolean', 'type': '=', 'lineno': 5}
					id {'attr': 'f', 'sym': <stab.Symbol instance at 0x7ffb120b6a00>, 'sig': 'boolean', 'lineno': 5, 'type': 'id'}
					true {'sig': 'boolean', 'type': 'true', 'lineno': 5, 'attr': None}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 6}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 6, 'attr': None}
				id {'attr': 'g', 'sym': <stab.Symbol instance at 0x7ffb120ba190>, 'sig': 'boolean', 'lineno': 6, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'boolean', 'type': '=', 'lineno': 7}
					id {'attr': 'g', 'sym': <stab.Symbol instance at 0x7ffb120ba190>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					== {'sig': 'boolean', 'type': '==', 'lineno': 7}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7ffb120b68c0>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
						id {'attr': 'f', 'sym': <stab.Symbol instance at 0x7ffb120b6a00>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}

```

### 43b_type_match_equality_int_int_bool.test
#### Mine
```
program {'sym': <0x9a84f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x9a85a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x9a8708>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			statement {'lineno': 3, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 3, 'type': '='}
					id {'attr': 'x', 'sym': <0x9a8708>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 3, 'type': 'number'}
			variable_declaration {'sig': 'int', 'lineno': 4, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 4, 'type': 'int'}
				id {'attr': 'f', 'sym': <0x9a8828>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 5, 'type': '='}
					id {'attr': 'f', 'sym': <0x9a8828>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 5, 'type': 'number'}
			variable_declaration {'sig': 'boolean', 'lineno': 6, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 6, 'type': 'boolean'}
				id {'attr': 'g', 'sym': <0x9a88d8>, 'sig': 'boolean', 'lineno': 6, 'type': 'id'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 7, 'type': '='}
					id {'attr': 'g', 'sym': <0x9a88d8>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					== {'sig': 'boolean', 'lineno': 7, 'type': '=='}
						id {'attr': 'x', 'sym': <0x9a8708>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'f', 'sym': <0x9a8828>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f4d3b12a780>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f4d3b12a780>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f4d3b12a8c0>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 3}
				= {'sig': 'int', 'type': '=', 'lineno': 3}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f4d3b12a8c0>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 3, 'attr': '0'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 4}
				int {'sig': 'int', 'type': 'int', 'lineno': 4, 'attr': None}
				id {'attr': 'f', 'sym': <stab.Symbol instance at 0x7f4d3b12aa00>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'int', 'type': '=', 'lineno': 5}
					id {'attr': 'f', 'sym': <stab.Symbol instance at 0x7f4d3b12aa00>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 5, 'attr': '0'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 6}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 6, 'attr': None}
				id {'attr': 'g', 'sym': <stab.Symbol instance at 0x7f4d3b12e190>, 'sig': 'boolean', 'lineno': 6, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'boolean', 'type': '=', 'lineno': 7}
					id {'attr': 'g', 'sym': <stab.Symbol instance at 0x7f4d3b12e190>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					== {'sig': 'boolean', 'type': '==', 'lineno': 7}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f4d3b12a8c0>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'f', 'sym': <stab.Symbol instance at 0x7f4d3b12aa00>, 'sig': 'int', 'lineno': 7, 'type': 'id'}

```

### 44a_type_mismatch_not_equal_int_bool_bool.test
#### Mine
```
error: Type mismatch for '!=' at or near line 7
```
#### Professors
```
error: type mismatch for '!=' at or near line 7
```

### 44b_type_mismatch_not_equal_int_int_int.test
#### Mine
```
error: Type mismatch for '=' at or near line 7
```
#### Professors
```
error: type mismatch for '=' at or near line 7
```

### 45a_type_match_not_equal_bool_bool_bool.test
#### Mine
```
program {'sym': <0x141c4f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x141c5a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'boolean', 'lineno': 2, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 2, 'type': 'boolean'}
				id {'attr': 'x', 'sym': <0x141c708>, 'sig': 'boolean', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'boolean', 'lineno': 3, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 3, 'type': 'boolean'}
				id {'attr': 'y', 'sym': <0x141c828>, 'sig': 'boolean', 'lineno': 3, 'type': 'id'}
			variable_declaration {'sig': 'boolean', 'lineno': 4, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 4, 'type': 'boolean'}
				id {'attr': 'r', 'sym': <0x141c8d8>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 5, 'type': '='}
					id {'attr': 'x', 'sym': <0x141c708>, 'sig': 'boolean', 'lineno': 5, 'type': 'id'}
					false {'sig': 'boolean', 'lineno': 5, 'type': 'false'}
			statement {'lineno': 6, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 6, 'type': '='}
					id {'attr': 'y', 'sym': <0x141c828>, 'sig': 'boolean', 'lineno': 6, 'type': 'id'}
					false {'sig': 'boolean', 'lineno': 6, 'type': 'false'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 7, 'type': '='}
					id {'attr': 'r', 'sym': <0x141c8d8>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					!= {'sig': 'boolean', 'lineno': 7, 'type': '!='}
						id {'attr': 'y', 'sym': <0x141c828>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <0x141c708>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7fe363d8d730>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7fe363d8d730>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 2}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fe363d8d870>, 'sig': 'boolean', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 3}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 3, 'attr': None}
				id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7fe363d8d9b0>, 'sig': 'boolean', 'lineno': 3, 'type': 'id'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 4}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 4, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7fe363d91140>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'boolean', 'type': '=', 'lineno': 5}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fe363d8d870>, 'sig': 'boolean', 'lineno': 5, 'type': 'id'}
					false {'sig': 'boolean', 'type': 'false', 'lineno': 5, 'attr': None}
			stmtExpr {'type': 'stmtExpr', 'lineno': 6}
				= {'sig': 'boolean', 'type': '=', 'lineno': 6}
					id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7fe363d8d9b0>, 'sig': 'boolean', 'lineno': 6, 'type': 'id'}
					false {'sig': 'boolean', 'type': 'false', 'lineno': 6, 'attr': None}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'boolean', 'type': '=', 'lineno': 7}
					id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7fe363d91140>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					!= {'sig': 'boolean', 'type': '!=', 'lineno': 7}
						id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7fe363d8d9b0>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fe363d8d870>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}

```

### 45b_type_match_not_equal_int_int_bool.test
#### Mine
```
program {'sym': <0xac24f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0xac25a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'x', 'sym': <0xac2708>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 3, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 3, 'type': 'int'}
				id {'attr': 'y', 'sym': <0xac2828>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			variable_declaration {'sig': 'boolean', 'lineno': 4, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 4, 'type': 'boolean'}
				id {'attr': 'r', 'sym': <0xac28d8>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 5, 'type': '='}
					id {'attr': 'x', 'sym': <0xac2708>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 5, 'type': 'number'}
			statement {'lineno': 6, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 6, 'type': '='}
					id {'attr': 'y', 'sym': <0xac2828>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 6, 'type': 'number'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 7, 'type': '='}
					id {'attr': 'r', 'sym': <0xac28d8>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					!= {'sig': 'boolean', 'lineno': 7, 'type': '!='}
						id {'attr': 'y', 'sym': <0xac2828>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <0xac2708>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f012ca63780>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f012ca63780>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f012ca638c0>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 3}
				int {'sig': 'int', 'type': 'int', 'lineno': 3, 'attr': None}
				id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f012ca63a00>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 4}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 4, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f012ca67190>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'int', 'type': '=', 'lineno': 5}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f012ca638c0>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 5, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 6}
				= {'sig': 'int', 'type': '=', 'lineno': 6}
					id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f012ca63a00>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 6, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'boolean', 'type': '=', 'lineno': 7}
					id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f012ca67190>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					!= {'sig': 'boolean', 'type': '!=', 'lineno': 7}
						id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f012ca63a00>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f012ca638c0>, 'sig': 'int', 'lineno': 7, 'type': 'id'}

```

### 48a_type_mismatch_less_bool_int_bool.test
#### Mine
```
error: Type mismatch for '<' at or near line 7
```
#### Professors
```
error: type mismatch for '<' at or near line 7
```

### 48b_type_mismatch_less_int_int_int.test
#### Mine
```
error: Type mismatch for '=' at or near line 7
```
#### Professors
```
error: type mismatch for '=' at or near line 7
```

### 49_type_match_less_int_int_bool.test
#### Mine
```
program {'sym': <0x5ee4f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x5ee5a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x5ee708>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 3, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 3, 'type': 'int'}
				id {'attr': 'y', 'sym': <0x5ee828>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			variable_declaration {'sig': 'boolean', 'lineno': 4, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 4, 'type': 'boolean'}
				id {'attr': 'r', 'sym': <0x5ee8d8>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 5, 'type': '='}
					id {'attr': 'x', 'sym': <0x5ee708>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 5, 'type': 'number'}
			statement {'lineno': 6, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 6, 'type': '='}
					id {'attr': 'y', 'sym': <0x5ee828>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 6, 'type': 'number'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 7, 'type': '='}
					id {'attr': 'r', 'sym': <0x5ee8d8>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					< {'sig': 'boolean', 'lineno': 7, 'type': '<'}
						id {'attr': 'y', 'sym': <0x5ee828>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <0x5ee708>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f4f2dfeb7d0>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f4f2dfeb7d0>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f4f2dfeb910>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 3}
				int {'sig': 'int', 'type': 'int', 'lineno': 3, 'attr': None}
				id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f4f2dfeba50>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 4}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 4, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f4f2dfef1e0>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'int', 'type': '=', 'lineno': 5}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f4f2dfeb910>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 5, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 6}
				= {'sig': 'int', 'type': '=', 'lineno': 6}
					id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f4f2dfeba50>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 6, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'boolean', 'type': '=', 'lineno': 7}
					id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f4f2dfef1e0>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					< {'sig': 'boolean', 'type': '<', 'lineno': 7}
						id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f4f2dfeba50>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f4f2dfeb910>, 'sig': 'int', 'lineno': 7, 'type': 'id'}

```

### 4_numbers.test
#### Mine
```
error: no main declaration found
```
#### Professors
```
error: syntax error, probably "1" at or near line 1
```

### 50a_type_mismatch_greater_bool_int_bool.test
#### Mine
```
error: Type mismatch for '>' at or near line 7
```
#### Professors
```
error: type mismatch for '>' at or near line 7
```

### 50b_type_mismatch_greater_int_int_int.test
#### Mine
```
error: Type mismatch for '=' at or near line 7
```
#### Professors
```
error: type mismatch for '=' at or near line 7
```

### 51_type_match_greater_int_int_bool.test
#### Mine
```
program {'sym': <0x93d4f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x93d5a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x93d708>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 3, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 3, 'type': 'int'}
				id {'attr': 'y', 'sym': <0x93d828>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			variable_declaration {'sig': 'boolean', 'lineno': 4, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 4, 'type': 'boolean'}
				id {'attr': 'r', 'sym': <0x93d8d8>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 5, 'type': '='}
					id {'attr': 'x', 'sym': <0x93d708>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 5, 'type': 'number'}
			statement {'lineno': 6, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 6, 'type': '='}
					id {'attr': 'y', 'sym': <0x93d828>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 6, 'type': 'number'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 7, 'type': '='}
					id {'attr': 'r', 'sym': <0x93d8d8>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					> {'sig': 'boolean', 'lineno': 7, 'type': '>'}
						id {'attr': 'y', 'sym': <0x93d828>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <0x93d708>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7efee21c9780>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7efee21c9780>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7efee21c98c0>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 3}
				int {'sig': 'int', 'type': 'int', 'lineno': 3, 'attr': None}
				id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7efee21c9a00>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 4}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 4, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7efee21cd190>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'int', 'type': '=', 'lineno': 5}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7efee21c98c0>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 5, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 6}
				= {'sig': 'int', 'type': '=', 'lineno': 6}
					id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7efee21c9a00>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 6, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'boolean', 'type': '=', 'lineno': 7}
					id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7efee21cd190>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					> {'sig': 'boolean', 'type': '>', 'lineno': 7}
						id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7efee21c9a00>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7efee21c98c0>, 'sig': 'int', 'lineno': 7, 'type': 'id'}

```

### 52a_type_mismatch_less_than_equal_int_bool_bool_.test
#### Mine
```
error: Type mismatch for '<=' at or near line 7
```
#### Professors
```
error: type mismatch for '<=' at or near line 7
```

### 52b_type_mismatch_less_than_equal_int_int_int.test
#### Mine
```
error: Type mismatch for '=' at or near line 7
```
#### Professors
```
error: type mismatch for '=' at or near line 7
```

### 53_type_match_int_int_bool.test
#### Mine
```
program {'sym': <0x12934f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x12935a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x1293708>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 3, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 3, 'type': 'int'}
				id {'attr': 'y', 'sym': <0x1293828>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			variable_declaration {'sig': 'boolean', 'lineno': 4, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 4, 'type': 'boolean'}
				id {'attr': 'r', 'sym': <0x12938d8>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 5, 'type': '='}
					id {'attr': 'x', 'sym': <0x1293708>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 5, 'type': 'number'}
			statement {'lineno': 6, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 6, 'type': '='}
					id {'attr': 'y', 'sym': <0x1293828>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 6, 'type': 'number'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 7, 'type': '='}
					id {'attr': 'r', 'sym': <0x12938d8>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					<= {'sig': 'boolean', 'lineno': 7, 'type': '<='}
						id {'attr': 'y', 'sym': <0x1293828>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <0x1293708>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7fd41b1ce7d0>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7fd41b1ce7d0>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fd41b1ce910>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 3}
				int {'sig': 'int', 'type': 'int', 'lineno': 3, 'attr': None}
				id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7fd41b1cea50>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 4}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 4, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7fd41b1d21e0>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'int', 'type': '=', 'lineno': 5}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fd41b1ce910>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 5, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 6}
				= {'sig': 'int', 'type': '=', 'lineno': 6}
					id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7fd41b1cea50>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 6, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'boolean', 'type': '=', 'lineno': 7}
					id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7fd41b1d21e0>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					<= {'sig': 'boolean', 'type': '<=', 'lineno': 7}
						id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7fd41b1cea50>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fd41b1ce910>, 'sig': 'int', 'lineno': 7, 'type': 'id'}

```

### 54a_type_mismatch_greater_than_equal_int_bool_bool.test
#### Mine
```
error: Type mismatch for '>=' at or near line 7
```
#### Professors
```
error: type mismatch for '>=' at or near line 7
```

### 54b_type_mismatch_greater_than_equal_int_int_int.test
#### Mine
```
error: Type mismatch for '=' at or near line 7
```
#### Professors
```
error: type mismatch for '=' at or near line 7
```

### 55_type_match_greater_than_equal_int_int_bool.test
#### Mine
```
program {'sym': <0x81b4f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x81b5a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x81b708>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 3, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 3, 'type': 'int'}
				id {'attr': 'y', 'sym': <0x81b828>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			variable_declaration {'sig': 'boolean', 'lineno': 4, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 4, 'type': 'boolean'}
				id {'attr': 'r', 'sym': <0x81b8d8>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 5, 'type': '='}
					id {'attr': 'x', 'sym': <0x81b708>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 5, 'type': 'number'}
			statement {'lineno': 6, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 6, 'type': '='}
					id {'attr': 'y', 'sym': <0x81b828>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 6, 'type': 'number'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 7, 'type': '='}
					id {'attr': 'r', 'sym': <0x81b8d8>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					>= {'sig': 'boolean', 'lineno': 7, 'type': '>='}
						id {'attr': 'y', 'sym': <0x81b828>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <0x81b708>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7fc7abf70730>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7fc7abf70730>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fc7abf70870>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 3}
				int {'sig': 'int', 'type': 'int', 'lineno': 3, 'attr': None}
				id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7fc7abf709b0>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 4}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 4, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7fc7abf74140>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'int', 'type': '=', 'lineno': 5}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fc7abf70870>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 5, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 6}
				= {'sig': 'int', 'type': '=', 'lineno': 6}
					id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7fc7abf709b0>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 6, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'boolean', 'type': '=', 'lineno': 7}
					id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7fc7abf74140>, 'sig': 'boolean', 'lineno': 7, 'type': 'id'}
					>= {'sig': 'boolean', 'type': '>=', 'lineno': 7}
						id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7fc7abf709b0>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fc7abf70870>, 'sig': 'int', 'lineno': 7, 'type': 'id'}

```

### 56a_type_mismatch_add_int_int_bool.test
#### Mine
```
error: Type mismatch for '=' at or near line 7
```
#### Professors
```
error: type mismatch for '=' at or near line 7
```

### 56b_type_mistmatch_add_int_bool_int.test
#### Mine
```
error: Type mismatch for '+' at or near line 7
```
#### Professors
```
error: type mismatch for '+' at or near line 7
```

### 57_type_match_add_int_int_int.test
#### Mine
```
program {'sym': <0x6e54f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x6e55a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x6e5708>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 3, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 3, 'type': 'int'}
				id {'attr': 'y', 'sym': <0x6e5828>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 4, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 4, 'type': 'int'}
				id {'attr': 'r', 'sym': <0x6e58d8>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 5, 'type': '='}
					id {'attr': 'x', 'sym': <0x6e5708>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 5, 'type': 'number'}
			statement {'lineno': 6, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 6, 'type': '='}
					id {'attr': 'y', 'sym': <0x6e5828>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 6, 'type': 'number'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 7, 'type': '='}
					id {'attr': 'r', 'sym': <0x6e58d8>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
					+ {'sig': 'int', 'lineno': 7, 'type': '+'}
						id {'attr': 'y', 'sym': <0x6e5828>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <0x6e5708>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7ff885b927d0>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7ff885b927d0>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7ff885b92910>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 3}
				int {'sig': 'int', 'type': 'int', 'lineno': 3, 'attr': None}
				id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7ff885b92a50>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 4}
				int {'sig': 'int', 'type': 'int', 'lineno': 4, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7ff885b961e0>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'int', 'type': '=', 'lineno': 5}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7ff885b92910>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 5, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 6}
				= {'sig': 'int', 'type': '=', 'lineno': 6}
					id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7ff885b92a50>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 6, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'int', 'type': '=', 'lineno': 7}
					id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7ff885b961e0>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
					+ {'sig': 'int', 'type': '+', 'lineno': 7}
						id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7ff885b92a50>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7ff885b92910>, 'sig': 'int', 'lineno': 7, 'type': 'id'}

```

### 58a_type_mistmatch_subtraction_int_bool_int.test
#### Mine
```
error: Type mismatch for '-' at or near line 7
```
#### Professors
```
error: type mismatch for '-' at or near line 7
```

### 58b_type_mismatch_subtraction_int_int_bool.test
#### Mine
```
error: Type mismatch for '=' at or near line 7
```
#### Professors
```
error: type mismatch for '=' at or near line 7
```

### 59a_type_match_subtraction_int_int_int.test
#### Mine
```
program {'sym': <0x22d94f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x22d95a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x22d9708>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 3, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 3, 'type': 'int'}
				id {'attr': 'y', 'sym': <0x22d9828>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 4, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 4, 'type': 'int'}
				id {'attr': 'r', 'sym': <0x22d98d8>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 5, 'type': '='}
					id {'attr': 'x', 'sym': <0x22d9708>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 5, 'type': 'number'}
			statement {'lineno': 6, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 6, 'type': '='}
					id {'attr': 'y', 'sym': <0x22d9828>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'attr': '0', 'sig': 'int', 'lineno': 6, 'type': 'number'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 7, 'type': '='}
					id {'attr': 'r', 'sym': <0x22d98d8>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
					- {'sig': 'int', 'lineno': 7, 'type': '-'}
						id {'attr': 'x', 'sym': <0x22d9708>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'y', 'sym': <0x22d9828>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f8c6aee9730>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f8c6aee9730>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f8c6aee9870>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 3}
				int {'sig': 'int', 'type': 'int', 'lineno': 3, 'attr': None}
				id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f8c6aee99b0>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 4}
				int {'sig': 'int', 'type': 'int', 'lineno': 4, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f8c6aeed140>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'int', 'type': '=', 'lineno': 5}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f8c6aee9870>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 5, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 6}
				= {'sig': 'int', 'type': '=', 'lineno': 6}
					id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f8c6aee99b0>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 6, 'attr': '0'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'int', 'type': '=', 'lineno': 7}
					id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f8c6aeed140>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
					- {'sig': 'int', 'type': '-', 'lineno': 7}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f8c6aee9870>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f8c6aee99b0>, 'sig': 'int', 'lineno': 7, 'type': 'id'}

```

### 59b_type_match_sub_int_int.test
#### Mine
```
program {'sym': <0x1e2ebb8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x1e2ec68>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x1e2edc8>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 3, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 3, 'type': 'int'}
				id {'attr': 'r', 'sym': <0x1e2eee8>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			statement {'lineno': 4, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 4, 'type': '='}
					id {'attr': 'x', 'sym': <0x1e2edc8>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
					number {'attr': '2', 'sig': 'int', 'lineno': 4, 'type': 'number'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 5, 'type': '='}
					id {'attr': 'r', 'sym': <0x1e2eee8>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					- {'sig': 'int', 'lineno': 5, 'type': '-'}
						id {'attr': 'x', 'sym': <0x1e2edc8>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f8c6e6517d0>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f8c6e6517d0>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f8c6e651910>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 3}
				int {'sig': 'int', 'type': 'int', 'lineno': 3, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f8c6e651a50>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 4}
				= {'sig': 'int', 'type': '=', 'lineno': 4}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f8c6e651910>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 4, 'attr': '2'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'int', 'type': '=', 'lineno': 5}
					id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f8c6e651a50>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					- {'sig': 'int', 'type': '-', 'lineno': 5}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f8c6e651910>, 'sig': 'int', 'lineno': 5, 'type': 'id'}

```

### 5_identifiers.test
#### Mine
```
Parser error, probably missing (, for main function, at or near line: 2
```
#### Professors
```
error: syntax error, probably "asd231" at or near line 2
```

### 5_reserved_words.test
#### Mine
```
error: no main declaration found
```
#### Professors
```
error: syntax error, probably "true" at or near line 1
```

### 60a_type_mismatch_multiplication_int_bool_int.test
#### Mine
```
error: Type mismatch for '*' at or near line 7
```
#### Professors
```
error: type mismatch for '*' at or near line 7
```

### 60b_type_mismatch_multiplication_int_int_bool.test
#### Mine
```
error: Type mismatch for '=' at or near line 7
```
#### Professors
```
error: type mismatch for '=' at or near line 7
```

### 61_type_match_multiplication_int_int_int.test
#### Mine
```
program {'sym': <0x64a4f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x64a5a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x64a708>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 3, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 3, 'type': 'int'}
				id {'attr': 'y', 'sym': <0x64a828>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 4, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 4, 'type': 'int'}
				id {'attr': 'r', 'sym': <0x64a8d8>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 5, 'type': '='}
					id {'attr': 'x', 'sym': <0x64a708>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'attr': '10', 'sig': 'int', 'lineno': 5, 'type': 'number'}
			statement {'lineno': 6, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 6, 'type': '='}
					id {'attr': 'y', 'sym': <0x64a828>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'attr': '10', 'sig': 'int', 'lineno': 6, 'type': 'number'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 7, 'type': '='}
					id {'attr': 'r', 'sym': <0x64a8d8>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
					* {'sig': 'int', 'lineno': 7, 'type': '*'}
						id {'attr': 'x', 'sym': <0x64a708>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'y', 'sym': <0x64a828>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f8d6952c730>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f8d6952c730>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f8d6952c870>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 3}
				int {'sig': 'int', 'type': 'int', 'lineno': 3, 'attr': None}
				id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f8d6952c9b0>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 4}
				int {'sig': 'int', 'type': 'int', 'lineno': 4, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f8d69530140>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'int', 'type': '=', 'lineno': 5}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f8d6952c870>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 5, 'attr': '10'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 6}
				= {'sig': 'int', 'type': '=', 'lineno': 6}
					id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f8d6952c9b0>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 6, 'attr': '10'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'int', 'type': '=', 'lineno': 7}
					id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f8d69530140>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
					* {'sig': 'int', 'type': '*', 'lineno': 7}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f8d6952c870>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f8d6952c9b0>, 'sig': 'int', 'lineno': 7, 'type': 'id'}

```

### 62a_type_mismatch_divide_int_bool_int.test
#### Mine
```
error: Type mismatch for '/' at or near line 7
```
#### Professors
```
error: type mismatch for '/' at or near line 7
```

### 62b_type_mismatch_divide_int_int_bool.test
#### Mine
```
error: Type mismatch for '=' at or near line 7
```
#### Professors
```
error: type mismatch for '=' at or near line 7
```

### 63_type_match_divide_int_int_int.test
#### Mine
```
program {'sym': <0x106e4f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x106e5a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x106e708>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 3, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 3, 'type': 'int'}
				id {'attr': 'y', 'sym': <0x106e828>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 4, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 4, 'type': 'int'}
				id {'attr': 'r', 'sym': <0x106e8d8>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 5, 'type': '='}
					id {'attr': 'x', 'sym': <0x106e708>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'attr': '10', 'sig': 'int', 'lineno': 5, 'type': 'number'}
			statement {'lineno': 6, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 6, 'type': '='}
					id {'attr': 'y', 'sym': <0x106e828>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'attr': '45', 'sig': 'int', 'lineno': 6, 'type': 'number'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 7, 'type': '='}
					id {'attr': 'r', 'sym': <0x106e8d8>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
					/ {'sig': 'int', 'lineno': 7, 'type': '/'}
						id {'attr': 'x', 'sym': <0x106e708>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'y', 'sym': <0x106e828>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f3100c8d7d0>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f3100c8d7d0>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f3100c8d910>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 3}
				int {'sig': 'int', 'type': 'int', 'lineno': 3, 'attr': None}
				id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f3100c8da50>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 4}
				int {'sig': 'int', 'type': 'int', 'lineno': 4, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f3100c911e0>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'int', 'type': '=', 'lineno': 5}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f3100c8d910>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 5, 'attr': '10'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 6}
				= {'sig': 'int', 'type': '=', 'lineno': 6}
					id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f3100c8da50>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 6, 'attr': '45'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'int', 'type': '=', 'lineno': 7}
					id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f3100c911e0>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
					/ {'sig': 'int', 'type': '/', 'lineno': 7}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f3100c8d910>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7f3100c8da50>, 'sig': 'int', 'lineno': 7, 'type': 'id'}

```

### 64a_type_mismatch_mod_int_bool_int.test
#### Mine
```
error: Type mismatch for '%' at or near line 7
```
#### Professors
```
error: type mismatch for '%' at or near line 7
```

### 64b_type_mismatch_mod_int_int_bool.test
#### Mine
```
error: Type mismatch for '=' at or near line 7
```
#### Professors
```
error: type mismatch for '=' at or near line 7
```

### 65_type_match_mod_int_int_int.test
#### Mine
```
program {'sym': <0x54e4f8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x54e5a8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x54e708>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 3, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 3, 'type': 'int'}
				id {'attr': 'y', 'sym': <0x54e828>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 4, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 4, 'type': 'int'}
				id {'attr': 'r', 'sym': <0x54e8d8>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 5, 'type': '='}
					id {'attr': 'x', 'sym': <0x54e708>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'attr': '123', 'sig': 'int', 'lineno': 5, 'type': 'number'}
			statement {'lineno': 6, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 6, 'type': '='}
					id {'attr': 'y', 'sym': <0x54e828>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'attr': '12', 'sig': 'int', 'lineno': 6, 'type': 'number'}
			statement {'lineno': 7, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 7, 'type': '='}
					id {'attr': 'r', 'sym': <0x54e8d8>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
					% {'sig': 'int', 'lineno': 7, 'type': '%'}
						id {'attr': 'x', 'sym': <0x54e708>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'y', 'sym': <0x54e828>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7fbe4bab67d0>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7fbe4bab67d0>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fbe4bab6910>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 3}
				int {'sig': 'int', 'type': 'int', 'lineno': 3, 'attr': None}
				id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7fbe4bab6a50>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 4}
				int {'sig': 'int', 'type': 'int', 'lineno': 4, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7fbe4baba1e0>, 'sig': 'int', 'lineno': 4, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'int', 'type': '=', 'lineno': 5}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fbe4bab6910>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 5, 'attr': '123'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 6}
				= {'sig': 'int', 'type': '=', 'lineno': 6}
					id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7fbe4bab6a50>, 'sig': 'int', 'lineno': 6, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 6, 'attr': '12'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				= {'sig': 'int', 'type': '=', 'lineno': 7}
					id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7fbe4baba1e0>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
					% {'sig': 'int', 'type': '%', 'lineno': 7}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7fbe4bab6910>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						id {'attr': 'y', 'sym': <stab.Symbol instance at 0x7fbe4bab6a50>, 'sig': 'int', 'lineno': 7, 'type': 'id'}

```

### 66a_type_mismatch_not_bool_int.test
#### Mine
```
error: Type mismatch for '=' at or near line 4
```
#### Professors
```
error: type mismatch for '=' at or near line 4
```

### 66b_type_mismatch_not_int_bool.test
#### Mine
```
error: Type mismatch for '!' at or near line 4
```
#### Professors
```
error: type mismatch for '!' at or near line 4
```

### 67_type_match_not_bool_bool.test
#### Mine
```
program {'sym': <0x1d04bb8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x1d04c68>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'boolean', 'lineno': 2, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 2, 'type': 'boolean'}
				id {'attr': 'x', 'sym': <0x1d04dc8>, 'sig': 'boolean', 'lineno': 2, 'type': 'id'}
			variable_declaration {'sig': 'boolean', 'lineno': 3, 'type': 'variable_declaration'}
				boolean {'sig': 'boolean', 'lineno': 3, 'type': 'boolean'}
				id {'attr': 'r', 'sym': <0x1d04ee8>, 'sig': 'boolean', 'lineno': 3, 'type': 'id'}
			statement {'lineno': 4, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 4, 'type': '='}
					id {'attr': 'x', 'sym': <0x1d04dc8>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
					false {'sig': 'boolean', 'lineno': 4, 'type': 'false'}
			statement {'lineno': 5, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 5, 'type': '='}
					id {'attr': 'r', 'sym': <0x1d04ee8>, 'sig': 'boolean', 'lineno': 5, 'type': 'id'}
					! {'sig': 'boolean', 'lineno': 5, 'type': '!'}
						id {'attr': 'x', 'sym': <0x1d04dc8>, 'sig': 'boolean', 'lineno': 5, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f4d7d1267d0>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f4d7d1267d0>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 2}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f4d7d126910>, 'sig': 'boolean', 'lineno': 2, 'type': 'id'}
			varDecl {'sig': 'boolean', 'type': 'varDecl', 'lineno': 3}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 3, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f4d7d126a50>, 'sig': 'boolean', 'lineno': 3, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 4}
				= {'sig': 'boolean', 'type': '=', 'lineno': 4}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f4d7d126910>, 'sig': 'boolean', 'lineno': 4, 'type': 'id'}
					false {'sig': 'boolean', 'type': 'false', 'lineno': 4, 'attr': None}
			stmtExpr {'type': 'stmtExpr', 'lineno': 5}
				= {'sig': 'boolean', 'type': '=', 'lineno': 5}
					id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f4d7d126a50>, 'sig': 'boolean', 'lineno': 5, 'type': 'id'}
					! {'sig': 'boolean', 'type': '!', 'lineno': 5}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f4d7d126910>, 'sig': 'boolean', 'lineno': 5, 'type': 'id'}

```

### 68_correct_break.test
#### Mine
```
program {'sym': <0xe42498>, 'type': 'program'}
	function_declaration {'lineno': 1, 'type': 'function_declaration'}
		void {'type': 'void'}
		id {'attr': 'foo', 'sym': <0xe42568>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			while {'lineno': 2, 'type': 'while'}
				true {'sig': 'boolean', 'lineno': 2, 'type': 'true'}
				block {'type': 'block'}
					break {'lineno': 3, 'type': 'break'}
	main_declaration {'lineno': 7, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0xe42688>, 'sig': 'f()', 'lineno': 7, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			statement {'lineno': 8, 'type': 'statement'}
				function_call {'sig': 'void', 'lineno': 8, 'type': 'function_call'}
					id {'attr': 'foo', 'sym': <0xe42568>, 'sig': 'f()', 'lineno': 8, 'type': 'id'}
					actuals {'type': 'actuals'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f0645adb870>, 'type': 'program'}
	funcDecl {'type': 'funcDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void', 'lineno': 1, 'attr': None}
		id {'attr': 'foo', 'sym': <stab.Symbol instance at 0x7f0645adb730>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			while {'type': 'while', 'lineno': 2}
				true {'sig': 'boolean', 'type': 'true', 'lineno': 2, 'attr': None}
				block {'type': 'block'}
					break {'type': 'break', 'lineno': 3}
	mainDecl {'type': 'mainDecl', 'lineno': 7}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f0645adb870>, 'sig': 'f()', 'lineno': 7, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 8}
				funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 8}
					id {'attr': 'foo', 'sym': <stab.Symbol instance at 0x7f0645adb730>, 'sig': 'f()', 'lineno': 8, 'type': 'id'}
					actuals {'type': 'actuals'}

```

### 69.test
#### Mine
```
program {'sym': <0x822858>, 'type': 'program'}
	function_declaration {'lineno': 1, 'type': 'function_declaration'}
		int {'sig': 'int', 'lineno': 1, 'type': 'int'}
		id {'attr': 'getchar', 'sym': <0x822928>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			return {'lineno': 2, 'type': 'return'}
				number {'attr': '0', 'sig': 'int', 'lineno': 2, 'type': 'number'}
	function_declaration {'lineno': 5, 'type': 'function_declaration'}
		void {'type': 'void'}
		id {'attr': 'halt', 'sym': <0x822a48>, 'sig': 'f()', 'lineno': 5, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
	function_declaration {'lineno': 9, 'type': 'function_declaration'}
		void {'type': 'void'}
		id {'attr': 'printb', 'sym': <0x822af8>, 'sig': 'f(boolean)', 'lineno': 9, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'boolean', 'type': 'formal'}
				boolean {'sig': 'boolean', 'lineno': 9, 'type': 'boolean'}
				id {'attr': 'b', 'sym': <0x822e78>, 'sig': 'boolean', 'lineno': 9, 'type': 'id'}
		block {'type': 'block'}
	function_declaration {'lineno': 13, 'type': 'function_declaration'}
		void {'type': 'void'}
		id {'attr': 'printc', 'sym': <0x822ba8>, 'sig': 'f(int)', 'lineno': 13, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal'}
				int {'sig': 'int', 'lineno': 13, 'type': 'int'}
				id {'attr': 'c', 'sym': <0x822fd8>, 'sig': 'int', 'lineno': 13, 'type': 'id'}
		block {'type': 'block'}
	function_declaration {'lineno': 17, 'type': 'function_declaration'}
		void {'type': 'void'}
		id {'attr': 'printi', 'sym': <0x822c58>, 'sig': 'f(int)', 'lineno': 17, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal'}
				int {'sig': 'int', 'lineno': 17, 'type': 'int'}
				id {'attr': 'i', 'sym': <0x823138>, 'sig': 'int', 'lineno': 17, 'type': 'id'}
		block {'type': 'block'}
	main_declaration {'lineno': 21, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x822d08>, 'sig': 'f()', 'lineno': 21, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f646c371550>, 'type': 'program'}
	funcDecl {'type': 'funcDecl', 'lineno': 1}
		int {'sig': 'int', 'type': 'int', 'lineno': 1, 'attr': None}
		id {'attr': 'getchar', 'sym': <stab.Symbol instance at 0x7f646c369730>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			return {'type': 'return', 'lineno': 2}
				number {'sig': 'int', 'type': 'number', 'lineno': 2, 'attr': '0'}
	funcDecl {'type': 'funcDecl', 'lineno': 5}
		void {'sig': 'void', 'type': 'void', 'lineno': 5, 'attr': None}
		id {'attr': 'halt', 'sym': <stab.Symbol instance at 0x7f646c369870>, 'sig': 'f()', 'lineno': 5, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
	funcDecl {'type': 'funcDecl', 'lineno': 9}
		void {'sig': 'void', 'type': 'void', 'lineno': 9, 'attr': None}
		id {'attr': 'printb', 'sym': <stab.Symbol instance at 0x7f646c3699b0>, 'sig': 'f(boolean)', 'lineno': 9, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'boolean', 'type': 'formal', 'lineno': 9}
				boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 9, 'attr': None}
				id {'attr': 'b', 'sym': <stab.Symbol instance at 0x7f646c3715f0>, 'sig': 'boolean', 'lineno': 9, 'type': 'id'}
		block {'type': 'block'}
	funcDecl {'type': 'funcDecl', 'lineno': 13}
		void {'sig': 'void', 'type': 'void', 'lineno': 13, 'attr': None}
		id {'attr': 'printc', 'sym': <stab.Symbol instance at 0x7f646c3710f0>, 'sig': 'f(int)', 'lineno': 13, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal', 'lineno': 13}
				int {'sig': 'int', 'type': 'int', 'lineno': 13, 'attr': None}
				id {'attr': 'c', 'sym': <stab.Symbol instance at 0x7f646c371a50>, 'sig': 'int', 'lineno': 13, 'type': 'id'}
		block {'type': 'block'}
	funcDecl {'type': 'funcDecl', 'lineno': 17}
		void {'sig': 'void', 'type': 'void', 'lineno': 17, 'attr': None}
		id {'attr': 'printi', 'sym': <stab.Symbol instance at 0x7f646c3711e0>, 'sig': 'f(int)', 'lineno': 17, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal', 'lineno': 17}
				int {'sig': 'int', 'type': 'int', 'lineno': 17, 'attr': None}
				id {'attr': 'i', 'sym': <stab.Symbol instance at 0x7f646c371730>, 'sig': 'int', 'lineno': 17, 'type': 'id'}
		block {'type': 'block'}
	mainDecl {'type': 'mainDecl', 'lineno': 21}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f646c371550>, 'sig': 'f()', 'lineno': 21, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}

```

### 69_return.test
#### Mine
```
program {'sym': <0x1c95988>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x1c95a58>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'z', 'sym': <0x1c95c68>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			statement {'lineno': 3, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 3, 'type': '='}
					id {'attr': 'z', 'sym': <0x1c95c68>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
					function_call {'sig': 'int', 'lineno': 3, 'type': 'function_call'}
						id {'attr': 'foo', 'sym': <0x1c95b78>, 'sig': 'f()', 'lineno': 3, 'type': 'id'}
						actuals {'type': 'actuals'}
	function_declaration {'lineno': 6, 'type': 'function_declaration'}
		int {'sig': 'int', 'lineno': 6, 'type': 'int'}
		id {'attr': 'foo', 'sym': <0x1c95b78>, 'sig': 'f()', 'lineno': 6, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 7, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 7, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x1c95dc8>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
			return {'lineno': 9, 'type': 'return'}
				id {'attr': 'x', 'sym': <0x1c95dc8>, 'sig': 'int', 'lineno': 9, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f145d57e730>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f145d57e730>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'z', 'sym': <stab.Symbol instance at 0x7f145d57e9b0>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 3}
				= {'sig': 'int', 'type': '=', 'lineno': 3}
					id {'attr': 'z', 'sym': <stab.Symbol instance at 0x7f145d57e9b0>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
					funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 3}
						id {'attr': 'foo', 'sym': <stab.Symbol instance at 0x7f145d57e870>, 'sig': 'f()', 'lineno': 3, 'type': 'id'}
						actuals {'type': 'actuals'}
	funcDecl {'type': 'funcDecl', 'lineno': 6}
		int {'sig': 'int', 'type': 'int', 'lineno': 6, 'attr': None}
		id {'attr': 'foo', 'sym': <stab.Symbol instance at 0x7f145d57e870>, 'sig': 'f()', 'lineno': 6, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 7}
				int {'sig': 'int', 'type': 'int', 'lineno': 7, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f145d583140>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
			return {'type': 'return', 'lineno': 9}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f145d583140>, 'sig': 'int', 'lineno': 9, 'type': 'id'}

```

### 6_operators.test
#### Mine
```
error: no main declaration found
```
#### Professors
```
error: syntax error, probably "+" at or near line 1
```

### 70_return_statement.test
#### Mine
```
program {'sym': <0x7eebc8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x7eec98>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'z', 'sym': <0x7eeea8>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			statement {'lineno': 3, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 3, 'type': '='}
					id {'attr': 'z', 'sym': <0x7eeea8>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
					function_call {'sig': 'int', 'lineno': 3, 'type': 'function_call'}
						id {'attr': 'foo', 'sym': <0x7eedb8>, 'sig': 'f()', 'lineno': 3, 'type': 'id'}
						actuals {'type': 'actuals'}
	function_declaration {'lineno': 6, 'type': 'function_declaration'}
		int {'sig': 'int', 'lineno': 6, 'type': 'int'}
		id {'attr': 'foo', 'sym': <0x7eedb8>, 'sig': 'f()', 'lineno': 6, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 7, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 7, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x7ef008>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
			return {'lineno': 9, 'type': 'return'}
				+ {'sig': 'int', 'lineno': 9, 'type': '+'}
					id {'attr': 'x', 'sym': <0x7ef008>, 'sig': 'int', 'lineno': 9, 'type': 'id'}
					number {'attr': '10', 'sig': 'int', 'lineno': 9, 'type': 'number'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f8f68708780>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f8f68708780>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'z', 'sym': <stab.Symbol instance at 0x7f8f68708a00>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 3}
				= {'sig': 'int', 'type': '=', 'lineno': 3}
					id {'attr': 'z', 'sym': <stab.Symbol instance at 0x7f8f68708a00>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
					funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 3}
						id {'attr': 'foo', 'sym': <stab.Symbol instance at 0x7f8f687088c0>, 'sig': 'f()', 'lineno': 3, 'type': 'id'}
						actuals {'type': 'actuals'}
	funcDecl {'type': 'funcDecl', 'lineno': 6}
		int {'sig': 'int', 'type': 'int', 'lineno': 6, 'attr': None}
		id {'attr': 'foo', 'sym': <stab.Symbol instance at 0x7f8f687088c0>, 'sig': 'f()', 'lineno': 6, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 7}
				int {'sig': 'int', 'type': 'int', 'lineno': 7, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f8f6870c190>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
			return {'type': 'return', 'lineno': 9}
				+ {'sig': 'int', 'type': '+', 'lineno': 9}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f8f6870c190>, 'sig': 'int', 'lineno': 9, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 9, 'attr': '10'}

```

### 71_return_statement_min.test
#### Mine
```
program {'sym': <0x138abc8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x138ac98>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'z', 'sym': <0x138aea8>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			statement {'lineno': 3, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 3, 'type': '='}
					id {'attr': 'z', 'sym': <0x138aea8>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
					function_call {'sig': 'int', 'lineno': 3, 'type': 'function_call'}
						id {'attr': 'foo', 'sym': <0x138adb8>, 'sig': 'f()', 'lineno': 3, 'type': 'id'}
						actuals {'type': 'actuals'}
	function_declaration {'lineno': 6, 'type': 'function_declaration'}
		int {'sig': 'int', 'lineno': 6, 'type': 'int'}
		id {'attr': 'foo', 'sym': <0x138adb8>, 'sig': 'f()', 'lineno': 6, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 7, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 7, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x138b008>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
			return {'lineno': 9, 'type': 'return'}
				- {'sig': 'int', 'lineno': 9, 'type': '-'}
					id {'attr': 'x', 'sym': <0x138b008>, 'sig': 'int', 'lineno': 9, 'type': 'id'}
					number {'attr': '10', 'sig': 'int', 'lineno': 9, 'type': 'number'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f7a146e87d0>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f7a146e87d0>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'z', 'sym': <stab.Symbol instance at 0x7f7a146e8a50>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 3}
				= {'sig': 'int', 'type': '=', 'lineno': 3}
					id {'attr': 'z', 'sym': <stab.Symbol instance at 0x7f7a146e8a50>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
					funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 3}
						id {'attr': 'foo', 'sym': <stab.Symbol instance at 0x7f7a146e8910>, 'sig': 'f()', 'lineno': 3, 'type': 'id'}
						actuals {'type': 'actuals'}
	funcDecl {'type': 'funcDecl', 'lineno': 6}
		int {'sig': 'int', 'type': 'int', 'lineno': 6, 'attr': None}
		id {'attr': 'foo', 'sym': <stab.Symbol instance at 0x7f7a146e8910>, 'sig': 'f()', 'lineno': 6, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 7}
				int {'sig': 'int', 'type': 'int', 'lineno': 7, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f7a146ec1e0>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
			return {'type': 'return', 'lineno': 9}
				- {'sig': 'int', 'type': '-', 'lineno': 9}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f7a146ec1e0>, 'sig': 'int', 'lineno': 9, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 9, 'attr': '10'}

```

### 72_return_assignment.test
#### Mine
```
program {'sym': <0x137abc8>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0x137ac98>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'z', 'sym': <0x137aea8>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			statement {'lineno': 3, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 3, 'type': '='}
					id {'attr': 'z', 'sym': <0x137aea8>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
					function_call {'sig': 'int', 'lineno': 3, 'type': 'function_call'}
						id {'attr': 'foo', 'sym': <0x137adb8>, 'sig': 'f()', 'lineno': 3, 'type': 'id'}
						actuals {'type': 'actuals'}
	function_declaration {'lineno': 6, 'type': 'function_declaration'}
		int {'sig': 'int', 'lineno': 6, 'type': 'int'}
		id {'attr': 'foo', 'sym': <0x137adb8>, 'sig': 'f()', 'lineno': 6, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 7, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 7, 'type': 'int'}
				id {'attr': 'x', 'sym': <0x137b008>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
			return {'lineno': 9, 'type': 'return'}
				= {'sig': 'int', 'lineno': 9, 'type': '='}
					id {'attr': 'x', 'sym': <0x137b008>, 'sig': 'int', 'lineno': 9, 'type': 'id'}
					number {'attr': '10', 'sig': 'int', 'lineno': 9, 'type': 'number'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f17573f3780>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f17573f3780>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'z', 'sym': <stab.Symbol instance at 0x7f17573f3a00>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 3}
				= {'sig': 'int', 'type': '=', 'lineno': 3}
					id {'attr': 'z', 'sym': <stab.Symbol instance at 0x7f17573f3a00>, 'sig': 'int', 'lineno': 3, 'type': 'id'}
					funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 3}
						id {'attr': 'foo', 'sym': <stab.Symbol instance at 0x7f17573f38c0>, 'sig': 'f()', 'lineno': 3, 'type': 'id'}
						actuals {'type': 'actuals'}
	funcDecl {'type': 'funcDecl', 'lineno': 6}
		int {'sig': 'int', 'type': 'int', 'lineno': 6, 'attr': None}
		id {'attr': 'foo', 'sym': <stab.Symbol instance at 0x7f17573f38c0>, 'sig': 'f()', 'lineno': 6, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 7}
				int {'sig': 'int', 'type': 'int', 'lineno': 7, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f17573f7190>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
			return {'type': 'return', 'lineno': 9}
				= {'sig': 'int', 'type': '=', 'lineno': 9}
					id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f17573f7190>, 'sig': 'int', 'lineno': 9, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 9, 'attr': '10'}

```

### 73_if_else_no_brackets.test
#### Mine
```
program {'sym': <0xcaf938>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0xcafa08>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 2, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 2, 'type': 'int'}
				id {'attr': 'x', 'sym': <0xcafb68>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			if_else {'lineno': 4, 'type': 'if_else'}
				true {'sig': 'boolean', 'lineno': 4, 'type': 'true'}
				statement {'lineno': 5, 'type': 'statement'}
					= {'sig': 'int', 'lineno': 5, 'type': '='}
						id {'attr': 'x', 'sym': <0xcafb68>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
						number {'attr': '5', 'sig': 'int', 'lineno': 5, 'type': 'number'}
				statement {'lineno': 7, 'type': 'statement'}
					= {'sig': 'int', 'lineno': 7, 'type': '='}
						id {'attr': 'x', 'sym': <0xcafb68>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						number {'attr': '7', 'sig': 'int', 'lineno': 7, 'type': 'number'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f792fb2f7d0>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f792fb2f7d0>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 2}
				int {'sig': 'int', 'type': 'int', 'lineno': 2, 'attr': None}
				id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f792fb2f910>, 'sig': 'int', 'lineno': 2, 'type': 'id'}
			ifElse {'type': 'ifElse', 'lineno': 4}
				true {'sig': 'boolean', 'type': 'true', 'lineno': 4, 'attr': None}
				stmtExpr {'type': 'stmtExpr', 'lineno': 5}
					= {'sig': 'int', 'type': '=', 'lineno': 5}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f792fb2f910>, 'sig': 'int', 'lineno': 5, 'type': 'id'}
						number {'sig': 'int', 'type': 'number', 'lineno': 5, 'attr': '5'}
				stmtExpr {'type': 'stmtExpr', 'lineno': 7}
					= {'sig': 'int', 'type': '=', 'lineno': 7}
						id {'attr': 'x', 'sym': <stab.Symbol instance at 0x7f792fb2f910>, 'sig': 'int', 'lineno': 7, 'type': 'id'}
						number {'sig': 'int', 'type': 'number', 'lineno': 7, 'attr': '7'}

```

### 74_argument_number_mismatch.test
#### Mine
```
error: number/type of arguments doesn't match function declaration at or near line 5
```
#### Professors
```
error: number/type of arguments doesn't match function declaration at or near line 5
```

### 75_if_not_boolean.test
#### Mine
```
error: need a boolean expression at or near line 4
```
#### Professors
```
error: need a boolean expression at or near line 4
```

### 7_strings.test
#### Mine
```
Unrecognized escape character in line at line 14
```
#### Professors
```
error: unsupported escape character at or near line 14
```

### 8_empty_main.test
#### Mine
```
program {'sym': <0xb5a508>, 'type': 'program'}
	main_declaration {'lineno': 1, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'main', 'sym': <0xb5a5d8>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			return {'lineno': 2, 'type': 'return'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f9bcb922550>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 1}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'main', 'sym': <stab.Symbol instance at 0x7f9bcb922550>, 'sig': 'f()', 'lineno': 1, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			return {'type': 'return', 'lineno': 2}

```

### 9_main_missing_rb.test
#### Mine
```
Parser error, probably missing } for block statement, at or near line: 1
```
#### Professors
```
error: syntax error, probably ")" at or near line 1
```

### gen.t18
#### Mine
```
program {'sym': <0x52d308>, 'type': 'program'}
	main_declaration {'lineno': 5, 'type': 'main_declaration'}
		void {'type': 'void'}
		id {'attr': 'calculator', 'sym': <0x52d3b8>, 'sig': 'f()', 'lineno': 5, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			statement {'lineno': 7, 'type': 'statement'}
				function_call {'sig': 'void', 'lineno': 7, 'type': 'function_call'}
					id {'attr': 'init', 'sym': <0x52fcf8>, 'sig': 'f()', 'lineno': 7, 'type': 'id'}
					actuals {'type': 'actuals'}
			statement {'lineno': 8, 'type': 'statement'}
				function_call {'sig': 'void', 'lineno': 8, 'type': 'function_call'}
					id {'attr': 'parser', 'sym': <0x52e848>, 'sig': 'f()', 'lineno': 8, 'type': 'id'}
					actuals {'type': 'actuals'}
	global_variable_declaration {'lineno': 15, 'type': 'global_variable_declaration'}
		boolean {'sig': 'boolean', 'lineno': 15, 'type': 'boolean'}
		id {'attr': '_havechar', 'sym': <0x52d4d8>, 'sig': 'boolean', 'lineno': 15, 'type': 'id'}
	global_variable_declaration {'lineno': 16, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 16, 'type': 'int'}
		id {'attr': '_char', 'sym': <0x52d588>, 'sig': 'int', 'lineno': 16, 'type': 'id'}
	function_declaration {'lineno': 18, 'type': 'function_declaration'}
		int {'sig': 'int', 'lineno': 18, 'type': 'int'}
		id {'attr': 'getc', 'sym': <0x52d638>, 'sig': 'f()', 'lineno': 18, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			if {'lineno': 20, 'type': 'if'}
				id {'attr': '_havechar', 'sym': <0x52d4d8>, 'sig': 'boolean', 'lineno': 20, 'type': 'id'}
				block {'type': 'block'}
					statement {'lineno': 21, 'type': 'statement'}
						= {'sig': 'boolean', 'lineno': 21, 'type': '='}
							id {'attr': '_havechar', 'sym': <0x52d4d8>, 'sig': 'boolean', 'lineno': 21, 'type': 'id'}
							false {'sig': 'boolean', 'lineno': 21, 'type': 'false'}
					return {'lineno': 22, 'type': 'return'}
						id {'attr': '_char', 'sym': <0x52d588>, 'sig': 'int', 'lineno': 22, 'type': 'id'}
			return {'lineno': 24, 'type': 'return'}
				function_call {'sig': 'int', 'lineno': 24, 'type': 'function_call'}
					id {'attr': 'getchar', 'sym': <0x52d218>, 'sig': 'f()', 'lineno': 24, 'type': 'id'}
					actuals {'type': 'actuals'}
	function_declaration {'lineno': 27, 'type': 'function_declaration'}
		void {'type': 'void'}
		id {'attr': 'ungetc', 'sym': <0x52d6e8>, 'sig': 'f(int)', 'lineno': 27, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal'}
				int {'sig': 'int', 'lineno': 27, 'type': 'int'}
				id {'attr': 'ch', 'sym': <0x52fda8>, 'sig': 'int', 'lineno': 27, 'type': 'id'}
		block {'type': 'block'}
			if {'lineno': 29, 'type': 'if'}
				id {'attr': '_havechar', 'sym': <0x52d4d8>, 'sig': 'boolean', 'lineno': 29, 'type': 'id'}
				block {'type': 'block'}
					statement {'lineno': 30, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 30, 'type': 'function_call'}
							id {'attr': 'prints', 'sym': <0x52d0b8>, 'sig': 'f(string)', 'lineno': 30, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'attr': 'Internal error: too many ungets!\n', 'sig': 'string', 'lineno': 30, 'type': 'string'}
					statement {'lineno': 31, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 31, 'type': 'function_call'}
							id {'attr': 'halt', 'sym': <0x52d168>, 'sig': 'f()', 'lineno': 31, 'type': 'id'}
							actuals {'type': 'actuals'}
			statement {'lineno': 33, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 33, 'type': '='}
					id {'attr': '_havechar', 'sym': <0x52d4d8>, 'sig': 'boolean', 'lineno': 33, 'type': 'id'}
					true {'sig': 'boolean', 'lineno': 33, 'type': 'true'}
			statement {'lineno': 34, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 34, 'type': '='}
					id {'attr': '_char', 'sym': <0x52d588>, 'sig': 'int', 'lineno': 34, 'type': 'id'}
					id {'attr': 'ch', 'sym': <0x52fda8>, 'sig': 'int', 'lineno': 34, 'type': 'id'}
	global_variable_declaration {'lineno': 41, 'type': 'global_variable_declaration'}
		boolean {'sig': 'boolean', 'lineno': 41, 'type': 'boolean'}
		id {'attr': '_havetoken', 'sym': <0x52d798>, 'sig': 'boolean', 'lineno': 41, 'type': 'id'}
	global_variable_declaration {'lineno': 42, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 42, 'type': 'int'}
		id {'attr': '_token', 'sym': <0x52d848>, 'sig': 'int', 'lineno': 42, 'type': 'id'}
	global_variable_declaration {'lineno': 43, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 43, 'type': 'int'}
		id {'attr': 'attr', 'sym': <0x52d8f8>, 'sig': 'int', 'lineno': 43, 'type': 'id'}
	function_declaration {'lineno': 45, 'type': 'function_declaration'}
		int {'sig': 'int', 'lineno': 45, 'type': 'int'}
		id {'attr': 'peek', 'sym': <0x52e4d8>, 'sig': 'f()', 'lineno': 45, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			if {'lineno': 47, 'type': 'if'}
				id {'attr': '_havetoken', 'sym': <0x52d798>, 'sig': 'boolean', 'lineno': 47, 'type': 'id'}
				return {'lineno': 48, 'type': 'return'}
					id {'attr': '_token', 'sym': <0x52d848>, 'sig': 'int', 'lineno': 48, 'type': 'id'}
			statement {'lineno': 50, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 50, 'type': '='}
					id {'attr': '_havetoken', 'sym': <0x52d798>, 'sig': 'boolean', 'lineno': 50, 'type': 'id'}
					true {'sig': 'boolean', 'lineno': 50, 'type': 'true'}
			return {'lineno': 51, 'type': 'return'}
				= {'sig': 'int', 'lineno': 51, 'type': '='}
					id {'attr': '_token', 'sym': <0x52d848>, 'sig': 'int', 'lineno': 51, 'type': 'id'}
					function_call {'sig': 'int', 'lineno': 51, 'type': 'function_call'}
						id {'attr': 'scanner', 'sym': <0x52e638>, 'sig': 'f()', 'lineno': 51, 'type': 'id'}
						actuals {'type': 'actuals'}
	function_declaration {'lineno': 54, 'type': 'function_declaration'}
		void {'type': 'void'}
		id {'attr': 'match', 'sym': <0x52e588>, 'sig': 'f(int)', 'lineno': 54, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal'}
				int {'sig': 'int', 'lineno': 54, 'type': 'int'}
				id {'attr': 'expect', 'sym': <0x52fe58>, 'sig': 'int', 'lineno': 54, 'type': 'id'}
		block {'type': 'block'}
			if {'lineno': 56, 'type': 'if'}
				!= {'sig': 'boolean', 'lineno': 56, 'type': '!='}
					function_call {'sig': 'int', 'lineno': 56, 'type': 'function_call'}
						id {'attr': 'peek', 'sym': <0x52e4d8>, 'sig': 'f()', 'lineno': 56, 'type': 'id'}
						actuals {'type': 'actuals'}
					id {'attr': 'expect', 'sym': <0x52fe58>, 'sig': 'int', 'lineno': 56, 'type': 'id'}
				block {'type': 'block'}
					statement {'lineno': 57, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 57, 'type': 'function_call'}
							id {'attr': 'prints', 'sym': <0x52d0b8>, 'sig': 'f(string)', 'lineno': 57, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'attr': 'Error: expected ', 'sig': 'string', 'lineno': 57, 'type': 'string'}
					statement {'lineno': 58, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 58, 'type': 'function_call'}
							id {'attr': 'printc', 'sym': <0x52cc98>, 'sig': 'f(int)', 'lineno': 58, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'expect', 'sym': <0x52fe58>, 'sig': 'int', 'lineno': 58, 'type': 'id'}
					statement {'lineno': 59, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 59, 'type': 'function_call'}
							id {'attr': 'prints', 'sym': <0x52d0b8>, 'sig': 'f(string)', 'lineno': 59, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'attr': '\n', 'sig': 'string', 'lineno': 59, 'type': 'string'}
					statement {'lineno': 60, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 60, 'type': 'function_call'}
							id {'attr': 'halt', 'sym': <0x52d168>, 'sig': 'f()', 'lineno': 60, 'type': 'id'}
							actuals {'type': 'actuals'}
			statement {'lineno': 62, 'type': 'statement'}
				= {'sig': 'boolean', 'lineno': 62, 'type': '='}
					id {'attr': '_havetoken', 'sym': <0x52d798>, 'sig': 'boolean', 'lineno': 62, 'type': 'id'}
					false {'sig': 'boolean', 'lineno': 62, 'type': 'false'}
	function_declaration {'lineno': 65, 'type': 'function_declaration'}
		int {'sig': 'int', 'lineno': 65, 'type': 'int'}
		id {'attr': 'scanner', 'sym': <0x52e638>, 'sig': 'f()', 'lineno': 65, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 67, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 67, 'type': 'int'}
				id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 67, 'type': 'id'}
			while {'lineno': 69, 'type': 'while'}
				function_call {'sig': 'boolean', 'lineno': 69, 'type': 'function_call'}
					id {'attr': 'isspace', 'sym': <0x52e798>, 'sig': 'f(int)', 'lineno': 69, 'type': 'id'}
					actuals {'type': 'actuals'}
						= {'sig': 'int', 'lineno': 69, 'type': '='}
							id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 69, 'type': 'id'}
							function_call {'sig': 'int', 'lineno': 69, 'type': 'function_call'}
								id {'attr': 'getc', 'sym': <0x52d638>, 'sig': 'f()', 'lineno': 69, 'type': 'id'}
								actuals {'type': 'actuals'}
			if {'lineno': 72, 'type': 'if'}
				== {'sig': 'boolean', 'lineno': 72, 'type': '=='}
					id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 72, 'type': 'id'}
					id {'attr': 'EOF', 'sym': <0x52ebf8>, 'sig': 'int', 'lineno': 72, 'type': 'id'}
				return {'lineno': 72, 'type': 'return'}
					id {'attr': 'TK_EOF', 'sym': <0x52eca8>, 'sig': 'int', 'lineno': 72, 'type': 'id'}
			if {'lineno': 73, 'type': 'if'}
				== {'sig': 'boolean', 'lineno': 73, 'type': '=='}
					id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 73, 'type': 'id'}
					id {'attr': 'ASCII_NL', 'sym': <0x52fc48>, 'sig': 'int', 'lineno': 73, 'type': 'id'}
				return {'lineno': 73, 'type': 'return'}
					id {'attr': 'TK_EOLN', 'sym': <0x52ed58>, 'sig': 'int', 'lineno': 73, 'type': 'id'}
			if {'lineno': 74, 'type': 'if'}
				== {'sig': 'boolean', 'lineno': 74, 'type': '=='}
					id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 74, 'type': 'id'}
					id {'attr': 'ASCII_PLUS', 'sym': <0x52f438>, 'sig': 'int', 'lineno': 74, 'type': 'id'}
				return {'lineno': 74, 'type': 'return'}
					id {'attr': 'TK_ADD', 'sym': <0x52eeb8>, 'sig': 'int', 'lineno': 74, 'type': 'id'}
			if {'lineno': 75, 'type': 'if'}
				== {'sig': 'boolean', 'lineno': 75, 'type': '=='}
					id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 75, 'type': 'id'}
					id {'attr': 'ASCII_MINUS', 'sym': <0x52f6c8>, 'sig': 'int', 'lineno': 75, 'type': 'id'}
				return {'lineno': 75, 'type': 'return'}
					id {'attr': 'TK_SUB', 'sym': <0x52ef68>, 'sig': 'int', 'lineno': 75, 'type': 'id'}
			if {'lineno': 76, 'type': 'if'}
				== {'sig': 'boolean', 'lineno': 76, 'type': '=='}
					id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 76, 'type': 'id'}
					id {'attr': 'ASCII_STAR', 'sym': <0x52f778>, 'sig': 'int', 'lineno': 76, 'type': 'id'}
				return {'lineno': 76, 'type': 'return'}
					id {'attr': 'TK_MUL', 'sym': <0x52f018>, 'sig': 'int', 'lineno': 76, 'type': 'id'}
			if {'lineno': 77, 'type': 'if'}
				== {'sig': 'boolean', 'lineno': 77, 'type': '=='}
					id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 77, 'type': 'id'}
					id {'attr': 'ASCII_SLASH', 'sym': <0x52f828>, 'sig': 'int', 'lineno': 77, 'type': 'id'}
				return {'lineno': 77, 'type': 'return'}
					id {'attr': 'TK_DIV', 'sym': <0x52f0c8>, 'sig': 'int', 'lineno': 77, 'type': 'id'}
			if {'lineno': 78, 'type': 'if'}
				== {'sig': 'boolean', 'lineno': 78, 'type': '=='}
					id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 78, 'type': 'id'}
					id {'attr': 'ASCII_LPAREN', 'sym': <0x52f8d8>, 'sig': 'int', 'lineno': 78, 'type': 'id'}
				return {'lineno': 78, 'type': 'return'}
					id {'attr': 'TK_LPAREN', 'sym': <0x52f178>, 'sig': 'int', 'lineno': 78, 'type': 'id'}
			if {'lineno': 79, 'type': 'if'}
				== {'sig': 'boolean', 'lineno': 79, 'type': '=='}
					id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 79, 'type': 'id'}
					id {'attr': 'ASCII_RPAREN', 'sym': <0x52f988>, 'sig': 'int', 'lineno': 79, 'type': 'id'}
				return {'lineno': 79, 'type': 'return'}
					id {'attr': 'TK_RPAREN', 'sym': <0x52f228>, 'sig': 'int', 'lineno': 79, 'type': 'id'}
			if {'lineno': 81, 'type': 'if'}
				function_call {'sig': 'boolean', 'lineno': 81, 'type': 'function_call'}
					id {'attr': 'isdigit', 'sym': <0x52e6e8>, 'sig': 'f(int)', 'lineno': 81, 'type': 'id'}
					actuals {'type': 'actuals'}
						id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 81, 'type': 'id'}
				block {'type': 'block'}
					statement {'lineno': 82, 'type': 'statement'}
						= {'sig': 'int', 'lineno': 82, 'type': '='}
							id {'attr': 'attr', 'sym': <0x52d8f8>, 'sig': 'int', 'lineno': 82, 'type': 'id'}
							number {'attr': '0', 'sig': 'int', 'lineno': 82, 'type': 'number'}
					while {'lineno': 83, 'type': 'while'}
						function_call {'sig': 'boolean', 'lineno': 83, 'type': 'function_call'}
							id {'attr': 'isdigit', 'sym': <0x52e6e8>, 'sig': 'f(int)', 'lineno': 83, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 83, 'type': 'id'}
						block {'type': 'block'}
							statement {'lineno': 84, 'type': 'statement'}
								= {'sig': 'int', 'lineno': 84, 'type': '='}
									id {'attr': 'attr', 'sym': <0x52d8f8>, 'sig': 'int', 'lineno': 84, 'type': 'id'}
									+ {'sig': 'int', 'lineno': 84, 'type': '+'}
										* {'sig': 'int', 'lineno': 84, 'type': '*'}
											id {'attr': 'attr', 'sym': <0x52d8f8>, 'sig': 'int', 'lineno': 84, 'type': 'id'}
											number {'attr': '10', 'sig': 'int', 'lineno': 84, 'type': 'number'}
										- {'sig': 'int', 'lineno': 84, 'type': '-'}
											id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 84, 'type': 'id'}
											id {'attr': 'ASCII_0', 'sym': <0x52f2d8>, 'sig': 'int', 'lineno': 84, 'type': 'id'}
							statement {'lineno': 85, 'type': 'statement'}
								= {'sig': 'int', 'lineno': 85, 'type': '='}
									id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 85, 'type': 'id'}
									function_call {'sig': 'int', 'lineno': 85, 'type': 'function_call'}
										id {'attr': 'getc', 'sym': <0x52d638>, 'sig': 'f()', 'lineno': 85, 'type': 'id'}
										actuals {'type': 'actuals'}
					statement {'lineno': 87, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 87, 'type': 'function_call'}
							id {'attr': 'ungetc', 'sym': <0x52d6e8>, 'sig': 'f(int)', 'lineno': 87, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'ch', 'sym': <0x52ff08>, 'sig': 'int', 'lineno': 87, 'type': 'id'}
					return {'lineno': 88, 'type': 'return'}
						id {'attr': 'TK_NUMBER', 'sym': <0x52ee08>, 'sig': 'int', 'lineno': 88, 'type': 'id'}
			statement {'lineno': 91, 'type': 'statement'}
				function_call {'sig': 'void', 'lineno': 91, 'type': 'function_call'}
					id {'attr': 'prints', 'sym': <0x52d0b8>, 'sig': 'f(string)', 'lineno': 91, 'type': 'id'}
					actuals {'type': 'actuals'}
						string {'attr': 'Error: invalid character.\n', 'sig': 'string', 'lineno': 91, 'type': 'string'}
			statement {'lineno': 92, 'type': 'statement'}
				function_call {'sig': 'void', 'lineno': 92, 'type': 'function_call'}
					id {'attr': 'halt', 'sym': <0x52d168>, 'sig': 'f()', 'lineno': 92, 'type': 'id'}
					actuals {'type': 'actuals'}
	function_declaration {'lineno': 95, 'type': 'function_declaration'}
		boolean {'sig': 'boolean', 'lineno': 95, 'type': 'boolean'}
		id {'attr': 'isdigit', 'sym': <0x52e6e8>, 'sig': 'f(int)', 'lineno': 95, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal'}
				int {'sig': 'int', 'lineno': 95, 'type': 'int'}
				id {'attr': 'ch', 'sym': <0x530028>, 'sig': 'int', 'lineno': 95, 'type': 'id'}
		block {'type': 'block'}
			return {'lineno': 97, 'type': 'return'}
				AND {'sig': 'boolean', 'lineno': 97, 'type': 'AND'}
					>= {'sig': 'boolean', 'lineno': 97, 'type': '>='}
						id {'attr': 'ch', 'sym': <0x530028>, 'sig': 'int', 'lineno': 97, 'type': 'id'}
						id {'attr': 'ASCII_0', 'sym': <0x52f2d8>, 'sig': 'int', 'lineno': 97, 'type': 'id'}
					<= {'sig': 'boolean', 'lineno': 97, 'type': '<='}
						id {'attr': 'ch', 'sym': <0x530028>, 'sig': 'int', 'lineno': 97, 'type': 'id'}
						id {'attr': 'ASCII_9', 'sym': <0x52f388>, 'sig': 'int', 'lineno': 97, 'type': 'id'}
	function_declaration {'lineno': 100, 'type': 'function_declaration'}
		boolean {'sig': 'boolean', 'lineno': 100, 'type': 'boolean'}
		id {'attr': 'isspace', 'sym': <0x52e798>, 'sig': 'f(int)', 'lineno': 100, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal'}
				int {'sig': 'int', 'lineno': 100, 'type': 'int'}
				id {'attr': 'ch', 'sym': <0x530188>, 'sig': 'int', 'lineno': 100, 'type': 'id'}
		block {'type': 'block'}
			return {'lineno': 102, 'type': 'return'}
				OR {'sig': 'boolean', 'lineno': 102, 'type': 'OR'}
					== {'sig': 'boolean', 'lineno': 102, 'type': '=='}
						id {'attr': 'ch', 'sym': <0x530188>, 'sig': 'int', 'lineno': 102, 'type': 'id'}
						id {'attr': 'ASCII_SPACE', 'sym': <0x52fa38>, 'sig': 'int', 'lineno': 102, 'type': 'id'}
					OR {'sig': 'boolean', 'lineno': 103, 'type': 'OR'}
						== {'sig': 'boolean', 'lineno': 103, 'type': '=='}
							id {'attr': 'ch', 'sym': <0x530188>, 'sig': 'int', 'lineno': 103, 'type': 'id'}
							id {'attr': 'ASCII_TAB', 'sym': <0x52fae8>, 'sig': 'int', 'lineno': 103, 'type': 'id'}
						== {'sig': 'boolean', 'lineno': 104, 'type': '=='}
							id {'attr': 'ch', 'sym': <0x530188>, 'sig': 'int', 'lineno': 104, 'type': 'id'}
							id {'attr': 'ASCII_CR', 'sym': <0x52fb98>, 'sig': 'int', 'lineno': 104, 'type': 'id'}
	function_declaration {'lineno': 111, 'type': 'function_declaration'}
		void {'type': 'void'}
		id {'attr': 'parser', 'sym': <0x52e848>, 'sig': 'f()', 'lineno': 111, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 113, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 113, 'type': 'int'}
				id {'attr': 'result', 'sym': <0x5302e8>, 'sig': 'int', 'lineno': 113, 'type': 'id'}
			while {'lineno': 115, 'type': 'while'}
				!= {'sig': 'boolean', 'lineno': 115, 'type': '!='}
					function_call {'sig': 'int', 'lineno': 115, 'type': 'function_call'}
						id {'attr': 'peek', 'sym': <0x52e4d8>, 'sig': 'f()', 'lineno': 115, 'type': 'id'}
						actuals {'type': 'actuals'}
					id {'attr': 'TK_EOF', 'sym': <0x52eca8>, 'sig': 'int', 'lineno': 115, 'type': 'id'}
				block {'type': 'block'}
					statement {'lineno': 116, 'type': 'statement'}
						= {'sig': 'int', 'lineno': 116, 'type': '='}
							id {'attr': 'result', 'sym': <0x5302e8>, 'sig': 'int', 'lineno': 116, 'type': 'id'}
							function_call {'sig': 'int', 'lineno': 116, 'type': 'function_call'}
								id {'attr': 'E', 'sym': <0x52e9e8>, 'sig': 'f()', 'lineno': 116, 'type': 'id'}
								actuals {'type': 'actuals'}
					statement {'lineno': 117, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 117, 'type': 'function_call'}
							id {'attr': 'match', 'sym': <0x52e588>, 'sig': 'f(int)', 'lineno': 117, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'TK_EOLN', 'sym': <0x52ed58>, 'sig': 'int', 'lineno': 117, 'type': 'id'}
					statement {'lineno': 119, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 119, 'type': 'function_call'}
							id {'attr': 'prints', 'sym': <0x52d0b8>, 'sig': 'f(string)', 'lineno': 119, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'attr': ' = ', 'sig': 'string', 'lineno': 119, 'type': 'string'}
					statement {'lineno': 120, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 120, 'type': 'function_call'}
							id {'attr': 'printi', 'sym': <0x52ca18>, 'sig': 'f(int)', 'lineno': 120, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'result', 'sym': <0x5302e8>, 'sig': 'int', 'lineno': 120, 'type': 'id'}
					statement {'lineno': 121, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 121, 'type': 'function_call'}
							id {'attr': 'prints', 'sym': <0x52d0b8>, 'sig': 'f(string)', 'lineno': 121, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'attr': '\n', 'sig': 'string', 'lineno': 121, 'type': 'string'}
	function_declaration {'lineno': 125, 'type': 'function_declaration'}
		int {'sig': 'int', 'lineno': 125, 'type': 'int'}
		id {'attr': 'E', 'sym': <0x52e9e8>, 'sig': 'f()', 'lineno': 125, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 127, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 127, 'type': 'int'}
				id {'attr': 'l', 'sym': <0x530448>, 'sig': 'int', 'lineno': 127, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 128, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 128, 'type': 'int'}
				id {'attr': 'r', 'sym': <0x530568>, 'sig': 'int', 'lineno': 128, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 129, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 129, 'type': 'int'}
				id {'attr': 'token', 'sym': <0x530618>, 'sig': 'int', 'lineno': 129, 'type': 'id'}
			statement {'lineno': 131, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 131, 'type': '='}
					id {'attr': 'l', 'sym': <0x530448>, 'sig': 'int', 'lineno': 131, 'type': 'id'}
					function_call {'sig': 'int', 'lineno': 131, 'type': 'function_call'}
						id {'attr': 'T', 'sym': <0x52ea98>, 'sig': 'f()', 'lineno': 131, 'type': 'id'}
						actuals {'type': 'actuals'}
			while {'lineno': 132, 'type': 'while'}
				OR {'sig': 'boolean', 'lineno': 132, 'type': 'OR'}
					== {'sig': 'boolean', 'lineno': 132, 'type': '=='}
						function_call {'sig': 'int', 'lineno': 132, 'type': 'function_call'}
							id {'attr': 'peek', 'sym': <0x52e4d8>, 'sig': 'f()', 'lineno': 132, 'type': 'id'}
							actuals {'type': 'actuals'}
						id {'attr': 'TK_ADD', 'sym': <0x52eeb8>, 'sig': 'int', 'lineno': 132, 'type': 'id'}
					== {'sig': 'boolean', 'lineno': 132, 'type': '=='}
						function_call {'sig': 'int', 'lineno': 132, 'type': 'function_call'}
							id {'attr': 'peek', 'sym': <0x52e4d8>, 'sig': 'f()', 'lineno': 132, 'type': 'id'}
							actuals {'type': 'actuals'}
						id {'attr': 'TK_SUB', 'sym': <0x52ef68>, 'sig': 'int', 'lineno': 132, 'type': 'id'}
				block {'type': 'block'}
					statement {'lineno': 133, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 133, 'type': 'function_call'}
							id {'attr': 'match', 'sym': <0x52e588>, 'sig': 'f(int)', 'lineno': 133, 'type': 'id'}
							actuals {'type': 'actuals'}
								= {'sig': 'int', 'lineno': 133, 'type': '='}
									id {'attr': 'token', 'sym': <0x530618>, 'sig': 'int', 'lineno': 133, 'type': 'id'}
									function_call {'sig': 'int', 'lineno': 133, 'type': 'function_call'}
										id {'attr': 'peek', 'sym': <0x52e4d8>, 'sig': 'f()', 'lineno': 133, 'type': 'id'}
										actuals {'type': 'actuals'}
					statement {'lineno': 134, 'type': 'statement'}
						= {'sig': 'int', 'lineno': 134, 'type': '='}
							id {'attr': 'r', 'sym': <0x530568>, 'sig': 'int', 'lineno': 134, 'type': 'id'}
							function_call {'sig': 'int', 'lineno': 134, 'type': 'function_call'}
								id {'attr': 'T', 'sym': <0x52ea98>, 'sig': 'f()', 'lineno': 134, 'type': 'id'}
								actuals {'type': 'actuals'}
					if_else {'lineno': 136, 'type': 'if_else'}
						== {'sig': 'boolean', 'lineno': 136, 'type': '=='}
							id {'attr': 'token', 'sym': <0x530618>, 'sig': 'int', 'lineno': 136, 'type': 'id'}
							id {'attr': 'TK_ADD', 'sym': <0x52eeb8>, 'sig': 'int', 'lineno': 136, 'type': 'id'}
						statement {'lineno': 137, 'type': 'statement'}
							= {'sig': 'int', 'lineno': 137, 'type': '='}
								id {'attr': 'l', 'sym': <0x530448>, 'sig': 'int', 'lineno': 137, 'type': 'id'}
								+ {'sig': 'int', 'lineno': 137, 'type': '+'}
									id {'attr': 'l', 'sym': <0x530448>, 'sig': 'int', 'lineno': 137, 'type': 'id'}
									id {'attr': 'r', 'sym': <0x530568>, 'sig': 'int', 'lineno': 137, 'type': 'id'}
						statement {'lineno': 139, 'type': 'statement'}
							= {'sig': 'int', 'lineno': 139, 'type': '='}
								id {'attr': 'l', 'sym': <0x530448>, 'sig': 'int', 'lineno': 139, 'type': 'id'}
								- {'sig': 'int', 'lineno': 139, 'type': '-'}
									id {'attr': 'l', 'sym': <0x530448>, 'sig': 'int', 'lineno': 139, 'type': 'id'}
									id {'attr': 'r', 'sym': <0x530568>, 'sig': 'int', 'lineno': 139, 'type': 'id'}
			return {'lineno': 141, 'type': 'return'}
				id {'attr': 'l', 'sym': <0x530448>, 'sig': 'int', 'lineno': 141, 'type': 'id'}
	function_declaration {'lineno': 144, 'type': 'function_declaration'}
		int {'sig': 'int', 'lineno': 144, 'type': 'int'}
		id {'attr': 'T', 'sym': <0x52ea98>, 'sig': 'f()', 'lineno': 144, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 146, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 146, 'type': 'int'}
				id {'attr': 'l', 'sym': <0x530708>, 'sig': 'int', 'lineno': 146, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 147, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 147, 'type': 'int'}
				id {'attr': 'r', 'sym': <0x530828>, 'sig': 'int', 'lineno': 147, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 148, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 148, 'type': 'int'}
				id {'attr': 'token', 'sym': <0x5308d8>, 'sig': 'int', 'lineno': 148, 'type': 'id'}
			statement {'lineno': 150, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 150, 'type': '='}
					id {'attr': 'l', 'sym': <0x530708>, 'sig': 'int', 'lineno': 150, 'type': 'id'}
					function_call {'sig': 'int', 'lineno': 150, 'type': 'function_call'}
						id {'attr': 'F', 'sym': <0x52eb48>, 'sig': 'f()', 'lineno': 150, 'type': 'id'}
						actuals {'type': 'actuals'}
			while {'lineno': 151, 'type': 'while'}
				OR {'sig': 'boolean', 'lineno': 151, 'type': 'OR'}
					== {'sig': 'boolean', 'lineno': 151, 'type': '=='}
						function_call {'sig': 'int', 'lineno': 151, 'type': 'function_call'}
							id {'attr': 'peek', 'sym': <0x52e4d8>, 'sig': 'f()', 'lineno': 151, 'type': 'id'}
							actuals {'type': 'actuals'}
						id {'attr': 'TK_MUL', 'sym': <0x52f018>, 'sig': 'int', 'lineno': 151, 'type': 'id'}
					== {'sig': 'boolean', 'lineno': 151, 'type': '=='}
						function_call {'sig': 'int', 'lineno': 151, 'type': 'function_call'}
							id {'attr': 'peek', 'sym': <0x52e4d8>, 'sig': 'f()', 'lineno': 151, 'type': 'id'}
							actuals {'type': 'actuals'}
						id {'attr': 'TK_DIV', 'sym': <0x52f0c8>, 'sig': 'int', 'lineno': 151, 'type': 'id'}
				block {'type': 'block'}
					statement {'lineno': 152, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 152, 'type': 'function_call'}
							id {'attr': 'match', 'sym': <0x52e588>, 'sig': 'f(int)', 'lineno': 152, 'type': 'id'}
							actuals {'type': 'actuals'}
								= {'sig': 'int', 'lineno': 152, 'type': '='}
									id {'attr': 'token', 'sym': <0x5308d8>, 'sig': 'int', 'lineno': 152, 'type': 'id'}
									function_call {'sig': 'int', 'lineno': 152, 'type': 'function_call'}
										id {'attr': 'peek', 'sym': <0x52e4d8>, 'sig': 'f()', 'lineno': 152, 'type': 'id'}
										actuals {'type': 'actuals'}
					statement {'lineno': 153, 'type': 'statement'}
						= {'sig': 'int', 'lineno': 153, 'type': '='}
							id {'attr': 'r', 'sym': <0x530828>, 'sig': 'int', 'lineno': 153, 'type': 'id'}
							function_call {'sig': 'int', 'lineno': 153, 'type': 'function_call'}
								id {'attr': 'F', 'sym': <0x52eb48>, 'sig': 'f()', 'lineno': 153, 'type': 'id'}
								actuals {'type': 'actuals'}
					if_else {'lineno': 155, 'type': 'if_else'}
						== {'sig': 'boolean', 'lineno': 155, 'type': '=='}
							id {'attr': 'token', 'sym': <0x5308d8>, 'sig': 'int', 'lineno': 155, 'type': 'id'}
							id {'attr': 'TK_MUL', 'sym': <0x52f018>, 'sig': 'int', 'lineno': 155, 'type': 'id'}
						statement {'lineno': 156, 'type': 'statement'}
							= {'sig': 'int', 'lineno': 156, 'type': '='}
								id {'attr': 'l', 'sym': <0x530708>, 'sig': 'int', 'lineno': 156, 'type': 'id'}
								* {'sig': 'int', 'lineno': 156, 'type': '*'}
									id {'attr': 'l', 'sym': <0x530708>, 'sig': 'int', 'lineno': 156, 'type': 'id'}
									id {'attr': 'r', 'sym': <0x530828>, 'sig': 'int', 'lineno': 156, 'type': 'id'}
						statement {'lineno': 158, 'type': 'statement'}
							= {'sig': 'int', 'lineno': 158, 'type': '='}
								id {'attr': 'l', 'sym': <0x530708>, 'sig': 'int', 'lineno': 158, 'type': 'id'}
								/ {'sig': 'int', 'lineno': 158, 'type': '/'}
									id {'attr': 'l', 'sym': <0x530708>, 'sig': 'int', 'lineno': 158, 'type': 'id'}
									id {'attr': 'r', 'sym': <0x530828>, 'sig': 'int', 'lineno': 158, 'type': 'id'}
			return {'lineno': 160, 'type': 'return'}
				id {'attr': 'l', 'sym': <0x530708>, 'sig': 'int', 'lineno': 160, 'type': 'id'}
	function_declaration {'lineno': 163, 'type': 'function_declaration'}
		int {'sig': 'int', 'lineno': 163, 'type': 'int'}
		id {'attr': 'F', 'sym': <0x52eb48>, 'sig': 'f()', 'lineno': 163, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			variable_declaration {'sig': 'int', 'lineno': 165, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 165, 'type': 'int'}
				id {'attr': 'result', 'sym': <0x5309c8>, 'sig': 'int', 'lineno': 165, 'type': 'id'}
			variable_declaration {'sig': 'int', 'lineno': 167, 'type': 'variable_declaration'}
				int {'sig': 'int', 'lineno': 167, 'type': 'int'}
				id {'attr': 'token', 'sym': <0x530ae8>, 'sig': 'int', 'lineno': 167, 'type': 'id'}
			statement {'lineno': 168, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 168, 'type': '='}
					id {'attr': 'token', 'sym': <0x530ae8>, 'sig': 'int', 'lineno': 168, 'type': 'id'}
					function_call {'sig': 'int', 'lineno': 168, 'type': 'function_call'}
						id {'attr': 'peek', 'sym': <0x52e4d8>, 'sig': 'f()', 'lineno': 168, 'type': 'id'}
						actuals {'type': 'actuals'}
			if_else {'lineno': 170, 'type': 'if_else'}
				== {'sig': 'boolean', 'lineno': 170, 'type': '=='}
					id {'attr': 'token', 'sym': <0x530ae8>, 'sig': 'int', 'lineno': 170, 'type': 'id'}
					id {'attr': 'TK_LPAREN', 'sym': <0x52f178>, 'sig': 'int', 'lineno': 170, 'type': 'id'}
				block {'type': 'block'}
					statement {'lineno': 171, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 171, 'type': 'function_call'}
							id {'attr': 'match', 'sym': <0x52e588>, 'sig': 'f(int)', 'lineno': 171, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'TK_LPAREN', 'sym': <0x52f178>, 'sig': 'int', 'lineno': 171, 'type': 'id'}
					statement {'lineno': 172, 'type': 'statement'}
						= {'sig': 'int', 'lineno': 172, 'type': '='}
							id {'attr': 'result', 'sym': <0x5309c8>, 'sig': 'int', 'lineno': 172, 'type': 'id'}
							function_call {'sig': 'int', 'lineno': 172, 'type': 'function_call'}
								id {'attr': 'E', 'sym': <0x52e9e8>, 'sig': 'f()', 'lineno': 172, 'type': 'id'}
								actuals {'type': 'actuals'}
					statement {'lineno': 173, 'type': 'statement'}
						function_call {'sig': 'void', 'lineno': 173, 'type': 'function_call'}
							id {'attr': 'match', 'sym': <0x52e588>, 'sig': 'f(int)', 'lineno': 173, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'TK_RPAREN', 'sym': <0x52f228>, 'sig': 'int', 'lineno': 173, 'type': 'id'}
				if_else {'lineno': 175, 'type': 'if_else'}
					== {'sig': 'boolean', 'lineno': 175, 'type': '=='}
						id {'attr': 'token', 'sym': <0x530ae8>, 'sig': 'int', 'lineno': 175, 'type': 'id'}
						id {'attr': 'TK_SUB', 'sym': <0x52ef68>, 'sig': 'int', 'lineno': 175, 'type': 'id'}
					block {'type': 'block'}
						statement {'lineno': 176, 'type': 'statement'}
							function_call {'sig': 'void', 'lineno': 176, 'type': 'function_call'}
								id {'attr': 'match', 'sym': <0x52e588>, 'sig': 'f(int)', 'lineno': 176, 'type': 'id'}
								actuals {'type': 'actuals'}
									id {'attr': 'TK_SUB', 'sym': <0x52ef68>, 'sig': 'int', 'lineno': 176, 'type': 'id'}
						statement {'lineno': 177, 'type': 'statement'}
							= {'sig': 'int', 'lineno': 177, 'type': '='}
								id {'attr': 'result', 'sym': <0x5309c8>, 'sig': 'int', 'lineno': 177, 'type': 'id'}
								- {'sig': 'int', 'lineno': 177, 'type': '-'}
									function_call {'sig': 'int', 'lineno': 177, 'type': 'function_call'}
										id {'attr': 'F', 'sym': <0x52eb48>, 'sig': 'f()', 'lineno': 177, 'type': 'id'}
										actuals {'type': 'actuals'}
					if_else {'lineno': 179, 'type': 'if_else'}
						== {'sig': 'boolean', 'lineno': 179, 'type': '=='}
							id {'attr': 'token', 'sym': <0x530ae8>, 'sig': 'int', 'lineno': 179, 'type': 'id'}
							id {'attr': 'TK_NUMBER', 'sym': <0x52ee08>, 'sig': 'int', 'lineno': 179, 'type': 'id'}
						block {'type': 'block'}
							statement {'lineno': 180, 'type': 'statement'}
								function_call {'sig': 'void', 'lineno': 180, 'type': 'function_call'}
									id {'attr': 'match', 'sym': <0x52e588>, 'sig': 'f(int)', 'lineno': 180, 'type': 'id'}
									actuals {'type': 'actuals'}
										id {'attr': 'TK_NUMBER', 'sym': <0x52ee08>, 'sig': 'int', 'lineno': 180, 'type': 'id'}
							statement {'lineno': 181, 'type': 'statement'}
								= {'sig': 'int', 'lineno': 181, 'type': '='}
									id {'attr': 'result', 'sym': <0x5309c8>, 'sig': 'int', 'lineno': 181, 'type': 'id'}
									id {'attr': 'attr', 'sym': <0x52d8f8>, 'sig': 'int', 'lineno': 181, 'type': 'id'}
						block {'type': 'block'}
							statement {'lineno': 184, 'type': 'statement'}
								function_call {'sig': 'void', 'lineno': 184, 'type': 'function_call'}
									id {'attr': 'prints', 'sym': <0x52d0b8>, 'sig': 'f(string)', 'lineno': 184, 'type': 'id'}
									actuals {'type': 'actuals'}
										string {'attr': 'Error: expected factor.\n', 'sig': 'string', 'lineno': 184, 'type': 'string'}
							statement {'lineno': 185, 'type': 'statement'}
								function_call {'sig': 'void', 'lineno': 185, 'type': 'function_call'}
									id {'attr': 'halt', 'sym': <0x52d168>, 'sig': 'f()', 'lineno': 185, 'type': 'id'}
									actuals {'type': 'actuals'}
			return {'lineno': 187, 'type': 'return'}
				id {'attr': 'result', 'sym': <0x5309c8>, 'sig': 'int', 'lineno': 187, 'type': 'id'}
	global_variable_declaration {'lineno': 194, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 194, 'type': 'int'}
		id {'attr': 'EOF', 'sym': <0x52ebf8>, 'sig': 'int', 'lineno': 194, 'type': 'id'}
	global_variable_declaration {'lineno': 196, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 196, 'type': 'int'}
		id {'attr': 'TK_EOF', 'sym': <0x52eca8>, 'sig': 'int', 'lineno': 196, 'type': 'id'}
	global_variable_declaration {'lineno': 197, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 197, 'type': 'int'}
		id {'attr': 'TK_EOLN', 'sym': <0x52ed58>, 'sig': 'int', 'lineno': 197, 'type': 'id'}
	global_variable_declaration {'lineno': 198, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 198, 'type': 'int'}
		id {'attr': 'TK_NUMBER', 'sym': <0x52ee08>, 'sig': 'int', 'lineno': 198, 'type': 'id'}
	global_variable_declaration {'lineno': 199, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 199, 'type': 'int'}
		id {'attr': 'TK_ADD', 'sym': <0x52eeb8>, 'sig': 'int', 'lineno': 199, 'type': 'id'}
	global_variable_declaration {'lineno': 200, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 200, 'type': 'int'}
		id {'attr': 'TK_SUB', 'sym': <0x52ef68>, 'sig': 'int', 'lineno': 200, 'type': 'id'}
	global_variable_declaration {'lineno': 201, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 201, 'type': 'int'}
		id {'attr': 'TK_MUL', 'sym': <0x52f018>, 'sig': 'int', 'lineno': 201, 'type': 'id'}
	global_variable_declaration {'lineno': 202, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 202, 'type': 'int'}
		id {'attr': 'TK_DIV', 'sym': <0x52f0c8>, 'sig': 'int', 'lineno': 202, 'type': 'id'}
	global_variable_declaration {'lineno': 203, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 203, 'type': 'int'}
		id {'attr': 'TK_LPAREN', 'sym': <0x52f178>, 'sig': 'int', 'lineno': 203, 'type': 'id'}
	global_variable_declaration {'lineno': 204, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 204, 'type': 'int'}
		id {'attr': 'TK_RPAREN', 'sym': <0x52f228>, 'sig': 'int', 'lineno': 204, 'type': 'id'}
	global_variable_declaration {'lineno': 206, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 206, 'type': 'int'}
		id {'attr': 'ASCII_0', 'sym': <0x52f2d8>, 'sig': 'int', 'lineno': 206, 'type': 'id'}
	global_variable_declaration {'lineno': 207, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 207, 'type': 'int'}
		id {'attr': 'ASCII_9', 'sym': <0x52f388>, 'sig': 'int', 'lineno': 207, 'type': 'id'}
	global_variable_declaration {'lineno': 208, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 208, 'type': 'int'}
		id {'attr': 'ASCII_PLUS', 'sym': <0x52f438>, 'sig': 'int', 'lineno': 208, 'type': 'id'}
	global_variable_declaration {'lineno': 209, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 209, 'type': 'int'}
		id {'attr': 'ASCII_MINUS', 'sym': <0x52f6c8>, 'sig': 'int', 'lineno': 209, 'type': 'id'}
	global_variable_declaration {'lineno': 210, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 210, 'type': 'int'}
		id {'attr': 'ASCII_STAR', 'sym': <0x52f778>, 'sig': 'int', 'lineno': 210, 'type': 'id'}
	global_variable_declaration {'lineno': 211, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 211, 'type': 'int'}
		id {'attr': 'ASCII_SLASH', 'sym': <0x52f828>, 'sig': 'int', 'lineno': 211, 'type': 'id'}
	global_variable_declaration {'lineno': 212, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 212, 'type': 'int'}
		id {'attr': 'ASCII_LPAREN', 'sym': <0x52f8d8>, 'sig': 'int', 'lineno': 212, 'type': 'id'}
	global_variable_declaration {'lineno': 213, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 213, 'type': 'int'}
		id {'attr': 'ASCII_RPAREN', 'sym': <0x52f988>, 'sig': 'int', 'lineno': 213, 'type': 'id'}
	global_variable_declaration {'lineno': 214, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 214, 'type': 'int'}
		id {'attr': 'ASCII_SPACE', 'sym': <0x52fa38>, 'sig': 'int', 'lineno': 214, 'type': 'id'}
	global_variable_declaration {'lineno': 215, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 215, 'type': 'int'}
		id {'attr': 'ASCII_TAB', 'sym': <0x52fae8>, 'sig': 'int', 'lineno': 215, 'type': 'id'}
	global_variable_declaration {'lineno': 216, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 216, 'type': 'int'}
		id {'attr': 'ASCII_CR', 'sym': <0x52fb98>, 'sig': 'int', 'lineno': 216, 'type': 'id'}
	global_variable_declaration {'lineno': 217, 'type': 'global_variable_declaration'}
		int {'sig': 'int', 'lineno': 217, 'type': 'int'}
		id {'attr': 'ASCII_NL', 'sym': <0x52fc48>, 'sig': 'int', 'lineno': 217, 'type': 'id'}
	function_declaration {'lineno': 219, 'type': 'function_declaration'}
		void {'type': 'void'}
		id {'attr': 'init', 'sym': <0x52fcf8>, 'sig': 'f()', 'lineno': 219, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			statement {'lineno': 221, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 221, 'type': '='}
					id {'attr': 'EOF', 'sym': <0x52ebf8>, 'sig': 'int', 'lineno': 221, 'type': 'id'}
					- {'sig': 'int', 'lineno': 221, 'type': '-'}
						number {'attr': '1', 'sig': 'int', 'lineno': 221, 'type': 'number'}
			statement {'lineno': 223, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 223, 'type': '='}
					id {'attr': 'ASCII_0', 'sym': <0x52f2d8>, 'sig': 'int', 'lineno': 223, 'type': 'id'}
					number {'attr': '48', 'sig': 'int', 'lineno': 223, 'type': 'number'}
			statement {'lineno': 224, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 224, 'type': '='}
					id {'attr': 'ASCII_9', 'sym': <0x52f388>, 'sig': 'int', 'lineno': 224, 'type': 'id'}
					number {'attr': '57', 'sig': 'int', 'lineno': 224, 'type': 'number'}
			statement {'lineno': 225, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 225, 'type': '='}
					id {'attr': 'ASCII_PLUS', 'sym': <0x52f438>, 'sig': 'int', 'lineno': 225, 'type': 'id'}
					number {'attr': '43', 'sig': 'int', 'lineno': 225, 'type': 'number'}
			statement {'lineno': 226, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 226, 'type': '='}
					id {'attr': 'ASCII_MINUS', 'sym': <0x52f6c8>, 'sig': 'int', 'lineno': 226, 'type': 'id'}
					number {'attr': '45', 'sig': 'int', 'lineno': 226, 'type': 'number'}
			statement {'lineno': 227, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 227, 'type': '='}
					id {'attr': 'ASCII_STAR', 'sym': <0x52f778>, 'sig': 'int', 'lineno': 227, 'type': 'id'}
					number {'attr': '42', 'sig': 'int', 'lineno': 227, 'type': 'number'}
			statement {'lineno': 228, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 228, 'type': '='}
					id {'attr': 'ASCII_SLASH', 'sym': <0x52f828>, 'sig': 'int', 'lineno': 228, 'type': 'id'}
					number {'attr': '47', 'sig': 'int', 'lineno': 228, 'type': 'number'}
			statement {'lineno': 229, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 229, 'type': '='}
					id {'attr': 'ASCII_LPAREN', 'sym': <0x52f8d8>, 'sig': 'int', 'lineno': 229, 'type': 'id'}
					number {'attr': '40', 'sig': 'int', 'lineno': 229, 'type': 'number'}
			statement {'lineno': 230, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 230, 'type': '='}
					id {'attr': 'ASCII_RPAREN', 'sym': <0x52f988>, 'sig': 'int', 'lineno': 230, 'type': 'id'}
					number {'attr': '41', 'sig': 'int', 'lineno': 230, 'type': 'number'}
			statement {'lineno': 231, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 231, 'type': '='}
					id {'attr': 'ASCII_SPACE', 'sym': <0x52fa38>, 'sig': 'int', 'lineno': 231, 'type': 'id'}
					number {'attr': '32', 'sig': 'int', 'lineno': 231, 'type': 'number'}
			statement {'lineno': 232, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 232, 'type': '='}
					id {'attr': 'ASCII_TAB', 'sym': <0x52fae8>, 'sig': 'int', 'lineno': 232, 'type': 'id'}
					number {'attr': '9', 'sig': 'int', 'lineno': 232, 'type': 'number'}
			statement {'lineno': 233, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 233, 'type': '='}
					id {'attr': 'ASCII_CR', 'sym': <0x52fb98>, 'sig': 'int', 'lineno': 233, 'type': 'id'}
					number {'attr': '13', 'sig': 'int', 'lineno': 233, 'type': 'number'}
			statement {'lineno': 234, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 234, 'type': '='}
					id {'attr': 'ASCII_NL', 'sym': <0x52fc48>, 'sig': 'int', 'lineno': 234, 'type': 'id'}
					number {'attr': '10', 'sig': 'int', 'lineno': 234, 'type': 'number'}
			statement {'lineno': 236, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 236, 'type': '='}
					id {'attr': 'TK_EOF', 'sym': <0x52eca8>, 'sig': 'int', 'lineno': 236, 'type': 'id'}
					number {'attr': '256', 'sig': 'int', 'lineno': 236, 'type': 'number'}
			statement {'lineno': 237, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 237, 'type': '='}
					id {'attr': 'TK_NUMBER', 'sym': <0x52ee08>, 'sig': 'int', 'lineno': 237, 'type': 'id'}
					number {'attr': '257', 'sig': 'int', 'lineno': 237, 'type': 'number'}
			statement {'lineno': 238, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 238, 'type': '='}
					id {'attr': 'TK_ADD', 'sym': <0x52eeb8>, 'sig': 'int', 'lineno': 238, 'type': 'id'}
					id {'attr': 'ASCII_PLUS', 'sym': <0x52f438>, 'sig': 'int', 'lineno': 238, 'type': 'id'}
			statement {'lineno': 239, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 239, 'type': '='}
					id {'attr': 'TK_SUB', 'sym': <0x52ef68>, 'sig': 'int', 'lineno': 239, 'type': 'id'}
					id {'attr': 'ASCII_MINUS', 'sym': <0x52f6c8>, 'sig': 'int', 'lineno': 239, 'type': 'id'}
			statement {'lineno': 240, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 240, 'type': '='}
					id {'attr': 'TK_MUL', 'sym': <0x52f018>, 'sig': 'int', 'lineno': 240, 'type': 'id'}
					id {'attr': 'ASCII_STAR', 'sym': <0x52f778>, 'sig': 'int', 'lineno': 240, 'type': 'id'}
			statement {'lineno': 241, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 241, 'type': '='}
					id {'attr': 'TK_DIV', 'sym': <0x52f0c8>, 'sig': 'int', 'lineno': 241, 'type': 'id'}
					id {'attr': 'ASCII_SLASH', 'sym': <0x52f828>, 'sig': 'int', 'lineno': 241, 'type': 'id'}
			statement {'lineno': 242, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 242, 'type': '='}
					id {'attr': 'TK_LPAREN', 'sym': <0x52f178>, 'sig': 'int', 'lineno': 242, 'type': 'id'}
					id {'attr': 'ASCII_LPAREN', 'sym': <0x52f8d8>, 'sig': 'int', 'lineno': 242, 'type': 'id'}
			statement {'lineno': 243, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 243, 'type': '='}
					id {'attr': 'TK_RPAREN', 'sym': <0x52f228>, 'sig': 'int', 'lineno': 243, 'type': 'id'}
					id {'attr': 'ASCII_RPAREN', 'sym': <0x52f988>, 'sig': 'int', 'lineno': 243, 'type': 'id'}
			statement {'lineno': 244, 'type': 'statement'}
				= {'sig': 'int', 'lineno': 244, 'type': '='}
					id {'attr': 'TK_EOLN', 'sym': <0x52ed58>, 'sig': 'int', 'lineno': 244, 'type': 'id'}
					id {'attr': 'ASCII_NL', 'sym': <0x52fc48>, 'sig': 'int', 'lineno': 244, 'type': 'id'}
```
#### Professors
```
program {'startSymbol': <stab.Symbol instance at 0x7f5945a37f00>, 'type': 'program'}
	mainDecl {'type': 'mainDecl', 'lineno': 5}
		void {'sig': 'void', 'type': 'void'}
		id {'attr': 'calculator', 'sym': <stab.Symbol instance at 0x7f5945a37f00>, 'sig': 'f()', 'lineno': 5, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 7}
				funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 7}
					id {'attr': 'init', 'sym': <stab.Symbol instance at 0x7f59459dfaa0>, 'sig': 'f()', 'lineno': 7, 'type': 'id'}
					actuals {'type': 'actuals'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 8}
				funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 8}
					id {'attr': 'parser', 'sym': <stab.Symbol instance at 0x7f59459c8550>, 'sig': 'f()', 'lineno': 8, 'type': 'id'}
					actuals {'type': 'actuals'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 15}
		boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 15, 'attr': None}
		id {'attr': '_havechar', 'sym': <stab.Symbol instance at 0x7f5945a39aa0>, 'sig': 'boolean', 'lineno': 15, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 16}
		int {'sig': 'int', 'type': 'int', 'lineno': 16, 'attr': None}
		id {'attr': '_char', 'sym': <stab.Symbol instance at 0x7f5945a3c870>, 'sig': 'int', 'lineno': 16, 'type': 'id'}
	funcDecl {'type': 'funcDecl', 'lineno': 18}
		int {'sig': 'int', 'type': 'int', 'lineno': 18, 'attr': None}
		id {'attr': 'getc', 'sym': <stab.Symbol instance at 0x7f5945a3df50>, 'sig': 'f()', 'lineno': 18, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			if {'type': 'if', 'lineno': 20}
				id {'attr': '_havechar', 'sym': <stab.Symbol instance at 0x7f5945a39aa0>, 'sig': 'boolean', 'lineno': 20, 'type': 'id'}
				block {'type': 'block'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 21}
						= {'sig': 'boolean', 'type': '=', 'lineno': 21}
							id {'attr': '_havechar', 'sym': <stab.Symbol instance at 0x7f5945a39aa0>, 'sig': 'boolean', 'lineno': 21, 'type': 'id'}
							false {'sig': 'boolean', 'type': 'false', 'lineno': 21, 'attr': None}
					return {'type': 'return', 'lineno': 22}
						id {'attr': '_char', 'sym': <stab.Symbol instance at 0x7f5945a3c870>, 'sig': 'int', 'lineno': 22, 'type': 'id'}
			return {'type': 'return', 'lineno': 24}
				funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 24}
					id {'attr': 'getchar', 'sym': <stab.Symbol instance at 0x7f5945a2f5f0>, 'sig': 'f()', 'lineno': 24, 'type': 'id'}
					actuals {'type': 'actuals'}
	funcDecl {'type': 'funcDecl', 'lineno': 27}
		void {'sig': 'void', 'type': 'void', 'lineno': 27, 'attr': None}
		id {'attr': 'ungetc', 'sym': <stab.Symbol instance at 0x7f5945a3e190>, 'sig': 'f(int)', 'lineno': 27, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal', 'lineno': 27}
				int {'sig': 'int', 'type': 'int', 'lineno': 27, 'attr': None}
				id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e28c0>, 'sig': 'int', 'lineno': 27, 'type': 'id'}
		block {'type': 'block'}
			if {'type': 'if', 'lineno': 29}
				id {'attr': '_havechar', 'sym': <stab.Symbol instance at 0x7f5945a39aa0>, 'sig': 'boolean', 'lineno': 29, 'type': 'id'}
				block {'type': 'block'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 30}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 30}
							id {'attr': 'prints', 'sym': <stab.Symbol instance at 0x7f5945a57500>, 'sig': 'f(string)', 'lineno': 30, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'sig': 'string', 'type': 'string', 'lineno': 30, 'attr': 'Internal error: too many ungets!\\n'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 31}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 31}
							id {'attr': 'halt', 'sym': <stab.Symbol instance at 0x7f5945a32050>, 'sig': 'f()', 'lineno': 31, 'type': 'id'}
							actuals {'type': 'actuals'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 33}
				= {'sig': 'boolean', 'type': '=', 'lineno': 33}
					id {'attr': '_havechar', 'sym': <stab.Symbol instance at 0x7f5945a39aa0>, 'sig': 'boolean', 'lineno': 33, 'type': 'id'}
					true {'sig': 'boolean', 'type': 'true', 'lineno': 33, 'attr': None}
			stmtExpr {'type': 'stmtExpr', 'lineno': 34}
				= {'sig': 'int', 'type': '=', 'lineno': 34}
					id {'attr': '_char', 'sym': <stab.Symbol instance at 0x7f5945a3c870>, 'sig': 'int', 'lineno': 34, 'type': 'id'}
					id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e28c0>, 'sig': 'int', 'lineno': 34, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 41}
		boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 41, 'attr': None}
		id {'attr': '_havetoken', 'sym': <stab.Symbol instance at 0x7f5945a3f6e0>, 'sig': 'boolean', 'lineno': 41, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 42}
		int {'sig': 'int', 'type': 'int', 'lineno': 42, 'attr': None}
		id {'attr': '_token', 'sym': <stab.Symbol instance at 0x7f59459c14b0>, 'sig': 'int', 'lineno': 42, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 43}
		int {'sig': 'int', 'type': 'int', 'lineno': 43, 'attr': None}
		id {'attr': 'attr', 'sym': <stab.Symbol instance at 0x7f59459c3730>, 'sig': 'int', 'lineno': 43, 'type': 'id'}
	funcDecl {'type': 'funcDecl', 'lineno': 45}
		int {'sig': 'int', 'type': 'int', 'lineno': 45, 'attr': None}
		id {'attr': 'peek', 'sym': <stab.Symbol instance at 0x7f59459c4190>, 'sig': 'f()', 'lineno': 45, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			if {'type': 'if', 'lineno': 47}
				id {'attr': '_havetoken', 'sym': <stab.Symbol instance at 0x7f5945a3f6e0>, 'sig': 'boolean', 'lineno': 47, 'type': 'id'}
				return {'type': 'return', 'lineno': 48}
					id {'attr': '_token', 'sym': <stab.Symbol instance at 0x7f59459c14b0>, 'sig': 'int', 'lineno': 48, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 50}
				= {'sig': 'boolean', 'type': '=', 'lineno': 50}
					id {'attr': '_havetoken', 'sym': <stab.Symbol instance at 0x7f5945a3f6e0>, 'sig': 'boolean', 'lineno': 50, 'type': 'id'}
					true {'sig': 'boolean', 'type': 'true', 'lineno': 50, 'attr': None}
			return {'type': 'return', 'lineno': 51}
				= {'sig': 'int', 'type': '=', 'lineno': 51}
					id {'attr': '_token', 'sym': <stab.Symbol instance at 0x7f59459c14b0>, 'sig': 'int', 'lineno': 51, 'type': 'id'}
					funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 51}
						id {'attr': 'scanner', 'sym': <stab.Symbol instance at 0x7f59459c75a0>, 'sig': 'f()', 'lineno': 51, 'type': 'id'}
						actuals {'type': 'actuals'}
	funcDecl {'type': 'funcDecl', 'lineno': 54}
		void {'sig': 'void', 'type': 'void', 'lineno': 54, 'attr': None}
		id {'attr': 'match', 'sym': <stab.Symbol instance at 0x7f59459c4f00>, 'sig': 'f(int)', 'lineno': 54, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal', 'lineno': 54}
				int {'sig': 'int', 'type': 'int', 'lineno': 54, 'attr': None}
				id {'attr': 'expect', 'sym': <stab.Symbol instance at 0x7f59459e27d0>, 'sig': 'int', 'lineno': 54, 'type': 'id'}
		block {'type': 'block'}
			if {'type': 'if', 'lineno': 56}
				!= {'sig': 'boolean', 'type': '!=', 'lineno': 56}
					funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 56}
						id {'attr': 'peek', 'sym': <stab.Symbol instance at 0x7f59459c4190>, 'sig': 'f()', 'lineno': 56, 'type': 'id'}
						actuals {'type': 'actuals'}
					id {'attr': 'expect', 'sym': <stab.Symbol instance at 0x7f59459e27d0>, 'sig': 'int', 'lineno': 56, 'type': 'id'}
				block {'type': 'block'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 57}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 57}
							id {'attr': 'prints', 'sym': <stab.Symbol instance at 0x7f5945a57500>, 'sig': 'f(string)', 'lineno': 57, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'sig': 'string', 'type': 'string', 'lineno': 57, 'attr': 'Error: expected '}
					stmtExpr {'type': 'stmtExpr', 'lineno': 58}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 58}
							id {'attr': 'printc', 'sym': <stab.Symbol instance at 0x7f5945a2f140>, 'sig': 'f(int)', 'lineno': 58, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'expect', 'sym': <stab.Symbol instance at 0x7f59459e27d0>, 'sig': 'int', 'lineno': 58, 'type': 'id'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 59}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 59}
							id {'attr': 'prints', 'sym': <stab.Symbol instance at 0x7f5945a57500>, 'sig': 'f(string)', 'lineno': 59, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'sig': 'string', 'type': 'string', 'lineno': 59, 'attr': '\\n'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 60}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 60}
							id {'attr': 'halt', 'sym': <stab.Symbol instance at 0x7f5945a32050>, 'sig': 'f()', 'lineno': 60, 'type': 'id'}
							actuals {'type': 'actuals'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 62}
				= {'sig': 'boolean', 'type': '=', 'lineno': 62}
					id {'attr': '_havetoken', 'sym': <stab.Symbol instance at 0x7f5945a3f6e0>, 'sig': 'boolean', 'lineno': 62, 'type': 'id'}
					false {'sig': 'boolean', 'type': 'false', 'lineno': 62, 'attr': None}
	funcDecl {'type': 'funcDecl', 'lineno': 65}
		int {'sig': 'int', 'type': 'int', 'lineno': 65, 'attr': None}
		id {'attr': 'scanner', 'sym': <stab.Symbol instance at 0x7f59459c75a0>, 'sig': 'f()', 'lineno': 65, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 67}
				int {'sig': 'int', 'type': 'int', 'lineno': 67, 'attr': None}
				id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 67, 'type': 'id'}
			while {'type': 'while', 'lineno': 69}
				funcCall {'sig': 'boolean', 'type': 'funcCall', 'lineno': 69}
					id {'attr': 'isspace', 'sym': <stab.Symbol instance at 0x7f59459c5e60>, 'sig': 'f(int)', 'lineno': 69, 'type': 'id'}
					actuals {'type': 'actuals'}
						= {'sig': 'int', 'type': '=', 'lineno': 69}
							id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 69, 'type': 'id'}
							funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 69}
								id {'attr': 'getc', 'sym': <stab.Symbol instance at 0x7f5945a3df50>, 'sig': 'f()', 'lineno': 69, 'type': 'id'}
								actuals {'type': 'actuals'}
				nullStmt {'type': 'nullStmt', 'lineno': 70}
			if {'type': 'if', 'lineno': 72}
				== {'sig': 'boolean', 'type': '==', 'lineno': 72}
					id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 72, 'type': 'id'}
					id {'attr': 'EOF', 'sym': <stab.Symbol instance at 0x7f59459c97d0>, 'sig': 'int', 'lineno': 72, 'type': 'id'}
				return {'type': 'return', 'lineno': 72}
					id {'attr': 'TK_EOF', 'sym': <stab.Symbol instance at 0x7f59459ca230>, 'sig': 'int', 'lineno': 72, 'type': 'id'}
			if {'type': 'if', 'lineno': 73}
				== {'sig': 'boolean', 'type': '==', 'lineno': 73}
					id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 73, 'type': 'id'}
					id {'attr': 'ASCII_NL', 'sym': <stab.Symbol instance at 0x7f59459df370>, 'sig': 'int', 'lineno': 73, 'type': 'id'}
				return {'type': 'return', 'lineno': 73}
					id {'attr': 'TK_EOLN', 'sym': <stab.Symbol instance at 0x7f59459cbaf0>, 'sig': 'int', 'lineno': 73, 'type': 'id'}
			if {'type': 'if', 'lineno': 74}
				== {'sig': 'boolean', 'type': '==', 'lineno': 74}
					id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 74, 'type': 'id'}
					id {'attr': 'ASCII_PLUS', 'sym': <stab.Symbol instance at 0x7f59459d8e60>, 'sig': 'int', 'lineno': 74, 'type': 'id'}
				return {'type': 'return', 'lineno': 74}
					id {'attr': 'TK_ADD', 'sym': <stab.Symbol instance at 0x7f59459cf230>, 'sig': 'int', 'lineno': 74, 'type': 'id'}
			if {'type': 'if', 'lineno': 75}
				== {'sig': 'boolean', 'type': '==', 'lineno': 75}
					id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 75, 'type': 'id'}
					id {'attr': 'ASCII_MINUS', 'sym': <stab.Symbol instance at 0x7f59459d95a0>, 'sig': 'int', 'lineno': 75, 'type': 'id'}
				return {'type': 'return', 'lineno': 75}
					id {'attr': 'TK_SUB', 'sym': <stab.Symbol instance at 0x7f59459cf3c0>, 'sig': 'int', 'lineno': 75, 'type': 'id'}
			if {'type': 'if', 'lineno': 76}
				== {'sig': 'boolean', 'type': '==', 'lineno': 76}
					id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 76, 'type': 'id'}
					id {'attr': 'ASCII_STAR', 'sym': <stab.Symbol instance at 0x7f59459da780>, 'sig': 'int', 'lineno': 76, 'type': 'id'}
				return {'type': 'return', 'lineno': 76}
					id {'attr': 'TK_MUL', 'sym': <stab.Symbol instance at 0x7f59459cf5f0>, 'sig': 'int', 'lineno': 76, 'type': 'id'}
			if {'type': 'if', 'lineno': 77}
				== {'sig': 'boolean', 'type': '==', 'lineno': 77}
					id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 77, 'type': 'id'}
					id {'attr': 'ASCII_SLASH', 'sym': <stab.Symbol instance at 0x7f59459da9b0>, 'sig': 'int', 'lineno': 77, 'type': 'id'}
				return {'type': 'return', 'lineno': 77}
					id {'attr': 'TK_DIV', 'sym': <stab.Symbol instance at 0x7f59459d2230>, 'sig': 'int', 'lineno': 77, 'type': 'id'}
			if {'type': 'if', 'lineno': 78}
				== {'sig': 'boolean', 'type': '==', 'lineno': 78}
					id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 78, 'type': 'id'}
					id {'attr': 'ASCII_LPAREN', 'sym': <stab.Symbol instance at 0x7f59459dc0f0>, 'sig': 'int', 'lineno': 78, 'type': 'id'}
				return {'type': 'return', 'lineno': 78}
					id {'attr': 'TK_LPAREN', 'sym': <stab.Symbol instance at 0x7f59459d24b0>, 'sig': 'int', 'lineno': 78, 'type': 'id'}
			if {'type': 'if', 'lineno': 79}
				== {'sig': 'boolean', 'type': '==', 'lineno': 79}
					id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 79, 'type': 'id'}
					id {'attr': 'ASCII_RPAREN', 'sym': <stab.Symbol instance at 0x7f59459dc2d0>, 'sig': 'int', 'lineno': 79, 'type': 'id'}
				return {'type': 'return', 'lineno': 79}
					id {'attr': 'TK_RPAREN', 'sym': <stab.Symbol instance at 0x7f59459d5fa0>, 'sig': 'int', 'lineno': 79, 'type': 'id'}
			if {'type': 'if', 'lineno': 81}
				funcCall {'sig': 'boolean', 'type': 'funcCall', 'lineno': 81}
					id {'attr': 'isdigit', 'sym': <stab.Symbol instance at 0x7f59459c5f50>, 'sig': 'f(int)', 'lineno': 81, 'type': 'id'}
					actuals {'type': 'actuals'}
						id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 81, 'type': 'id'}
				block {'type': 'block'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 82}
						= {'sig': 'int', 'type': '=', 'lineno': 82}
							id {'attr': 'attr', 'sym': <stab.Symbol instance at 0x7f59459c3730>, 'sig': 'int', 'lineno': 82, 'type': 'id'}
							number {'sig': 'int', 'type': 'number', 'lineno': 82, 'attr': '0'}
					while {'type': 'while', 'lineno': 83}
						funcCall {'sig': 'boolean', 'type': 'funcCall', 'lineno': 83}
							id {'attr': 'isdigit', 'sym': <stab.Symbol instance at 0x7f59459c5f50>, 'sig': 'f(int)', 'lineno': 83, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 83, 'type': 'id'}
						block {'type': 'block'}
							stmtExpr {'type': 'stmtExpr', 'lineno': 84}
								= {'sig': 'int', 'type': '=', 'lineno': 84}
									id {'attr': 'attr', 'sym': <stab.Symbol instance at 0x7f59459c3730>, 'sig': 'int', 'lineno': 84, 'type': 'id'}
									+ {'sig': 'int', 'type': '+', 'lineno': 84}
										* {'sig': 'int', 'type': '*', 'lineno': 84}
											id {'attr': 'attr', 'sym': <stab.Symbol instance at 0x7f59459c3730>, 'sig': 'int', 'lineno': 84, 'type': 'id'}
											number {'sig': 'int', 'type': 'number', 'lineno': 84, 'attr': '10'}
										- {'sig': 'int', 'type': '-', 'lineno': 84}
											id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 84, 'type': 'id'}
											id {'attr': 'ASCII_0', 'sym': <stab.Symbol instance at 0x7f59459d70a0>, 'sig': 'int', 'lineno': 84, 'type': 'id'}
							stmtExpr {'type': 'stmtExpr', 'lineno': 85}
								= {'sig': 'int', 'type': '=', 'lineno': 85}
									id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 85, 'type': 'id'}
									funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 85}
										id {'attr': 'getc', 'sym': <stab.Symbol instance at 0x7f5945a3df50>, 'sig': 'f()', 'lineno': 85, 'type': 'id'}
										actuals {'type': 'actuals'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 87}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 87}
							id {'attr': 'ungetc', 'sym': <stab.Symbol instance at 0x7f5945a3e190>, 'sig': 'f(int)', 'lineno': 87, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e2d70>, 'sig': 'int', 'lineno': 87, 'type': 'id'}
					return {'type': 'return', 'lineno': 88}
						id {'attr': 'TK_NUMBER', 'sym': <stab.Symbol instance at 0x7f59459cbcd0>, 'sig': 'int', 'lineno': 88, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 91}
				funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 91}
					id {'attr': 'prints', 'sym': <stab.Symbol instance at 0x7f5945a57500>, 'sig': 'f(string)', 'lineno': 91, 'type': 'id'}
					actuals {'type': 'actuals'}
						string {'sig': 'string', 'type': 'string', 'lineno': 91, 'attr': 'Error: invalid character.\\n'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 92}
				funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 92}
					id {'attr': 'halt', 'sym': <stab.Symbol instance at 0x7f5945a32050>, 'sig': 'f()', 'lineno': 92, 'type': 'id'}
					actuals {'type': 'actuals'}
	funcDecl {'type': 'funcDecl', 'lineno': 95}
		boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 95, 'attr': None}
		id {'attr': 'isdigit', 'sym': <stab.Symbol instance at 0x7f59459c5f50>, 'sig': 'f(int)', 'lineno': 95, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal', 'lineno': 95}
				int {'sig': 'int', 'type': 'int', 'lineno': 95, 'attr': None}
				id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e31e0>, 'sig': 'int', 'lineno': 95, 'type': 'id'}
		block {'type': 'block'}
			return {'type': 'return', 'lineno': 97}
				&& {'sig': 'boolean', 'type': '&&', 'lineno': 97}
					>= {'sig': 'boolean', 'type': '>=', 'lineno': 97}
						id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e31e0>, 'sig': 'int', 'lineno': 97, 'type': 'id'}
						id {'attr': 'ASCII_0', 'sym': <stab.Symbol instance at 0x7f59459d70a0>, 'sig': 'int', 'lineno': 97, 'type': 'id'}
					<= {'sig': 'boolean', 'type': '<=', 'lineno': 97}
						id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e31e0>, 'sig': 'int', 'lineno': 97, 'type': 'id'}
						id {'attr': 'ASCII_9', 'sym': <stab.Symbol instance at 0x7f59459d7140>, 'sig': 'int', 'lineno': 97, 'type': 'id'}
	funcDecl {'type': 'funcDecl', 'lineno': 100}
		boolean {'sig': 'boolean', 'type': 'boolean', 'lineno': 100, 'attr': None}
		id {'attr': 'isspace', 'sym': <stab.Symbol instance at 0x7f59459c5e60>, 'sig': 'f(int)', 'lineno': 100, 'type': 'id'}
		formals {'type': 'formals'}
			formal {'sig': 'int', 'type': 'formal', 'lineno': 100}
				int {'sig': 'int', 'type': 'int', 'lineno': 100, 'attr': None}
				id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e46e0>, 'sig': 'int', 'lineno': 100, 'type': 'id'}
		block {'type': 'block'}
			return {'type': 'return', 'lineno': 102}
				|| {'sig': 'boolean', 'type': '||', 'lineno': 103}
					|| {'sig': 'boolean', 'type': '||', 'lineno': 102}
						== {'sig': 'boolean', 'type': '==', 'lineno': 102}
							id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e46e0>, 'sig': 'int', 'lineno': 102, 'type': 'id'}
							id {'attr': 'ASCII_SPACE', 'sym': <stab.Symbol instance at 0x7f59459dd820>, 'sig': 'int', 'lineno': 102, 'type': 'id'}
						== {'sig': 'boolean', 'type': '==', 'lineno': 103}
							id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e46e0>, 'sig': 'int', 'lineno': 103, 'type': 'id'}
							id {'attr': 'ASCII_TAB', 'sym': <stab.Symbol instance at 0x7f59459de230>, 'sig': 'int', 'lineno': 103, 'type': 'id'}
					== {'sig': 'boolean', 'type': '==', 'lineno': 104}
						id {'attr': 'ch', 'sym': <stab.Symbol instance at 0x7f59459e46e0>, 'sig': 'int', 'lineno': 104, 'type': 'id'}
						id {'attr': 'ASCII_CR', 'sym': <stab.Symbol instance at 0x7f59459df460>, 'sig': 'int', 'lineno': 104, 'type': 'id'}
	funcDecl {'type': 'funcDecl', 'lineno': 111}
		void {'sig': 'void', 'type': 'void', 'lineno': 111, 'attr': None}
		id {'attr': 'parser', 'sym': <stab.Symbol instance at 0x7f59459c8550>, 'sig': 'f()', 'lineno': 111, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 113}
				int {'sig': 'int', 'type': 'int', 'lineno': 113, 'attr': None}
				id {'attr': 'result', 'sym': <stab.Symbol instance at 0x7f59459e4910>, 'sig': 'int', 'lineno': 113, 'type': 'id'}
			while {'type': 'while', 'lineno': 115}
				!= {'sig': 'boolean', 'type': '!=', 'lineno': 115}
					funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 115}
						id {'attr': 'peek', 'sym': <stab.Symbol instance at 0x7f59459c4190>, 'sig': 'f()', 'lineno': 115, 'type': 'id'}
						actuals {'type': 'actuals'}
					id {'attr': 'TK_EOF', 'sym': <stab.Symbol instance at 0x7f59459ca230>, 'sig': 'int', 'lineno': 115, 'type': 'id'}
				block {'type': 'block'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 116}
						= {'sig': 'int', 'type': '=', 'lineno': 116}
							id {'attr': 'result', 'sym': <stab.Symbol instance at 0x7f59459e4910>, 'sig': 'int', 'lineno': 116, 'type': 'id'}
							funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 116}
								id {'attr': 'E', 'sym': <stab.Symbol instance at 0x7f59459c8b40>, 'sig': 'f()', 'lineno': 116, 'type': 'id'}
								actuals {'type': 'actuals'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 117}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 117}
							id {'attr': 'match', 'sym': <stab.Symbol instance at 0x7f59459c4f00>, 'sig': 'f(int)', 'lineno': 117, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'TK_EOLN', 'sym': <stab.Symbol instance at 0x7f59459cbaf0>, 'sig': 'int', 'lineno': 117, 'type': 'id'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 119}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 119}
							id {'attr': 'prints', 'sym': <stab.Symbol instance at 0x7f5945a57500>, 'sig': 'f(string)', 'lineno': 119, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'sig': 'string', 'type': 'string', 'lineno': 119, 'attr': ' = '}
					stmtExpr {'type': 'stmtExpr', 'lineno': 120}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 120}
							id {'attr': 'printi', 'sym': <stab.Symbol instance at 0x7f5945a2a820>, 'sig': 'f(int)', 'lineno': 120, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'result', 'sym': <stab.Symbol instance at 0x7f59459e4910>, 'sig': 'int', 'lineno': 120, 'type': 'id'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 121}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 121}
							id {'attr': 'prints', 'sym': <stab.Symbol instance at 0x7f5945a57500>, 'sig': 'f(string)', 'lineno': 121, 'type': 'id'}
							actuals {'type': 'actuals'}
								string {'sig': 'string', 'type': 'string', 'lineno': 121, 'attr': '\\n'}
	funcDecl {'type': 'funcDecl', 'lineno': 125}
		int {'sig': 'int', 'type': 'int', 'lineno': 125, 'attr': None}
		id {'attr': 'E', 'sym': <stab.Symbol instance at 0x7f59459c8b40>, 'sig': 'f()', 'lineno': 125, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 127}
				int {'sig': 'int', 'type': 'int', 'lineno': 127, 'attr': None}
				id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e4b40>, 'sig': 'int', 'lineno': 127, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 128}
				int {'sig': 'int', 'type': 'int', 'lineno': 128, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f59459e6280>, 'sig': 'int', 'lineno': 128, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 129}
				int {'sig': 'int', 'type': 'int', 'lineno': 129, 'attr': None}
				id {'attr': 'token', 'sym': <stab.Symbol instance at 0x7f59459e6500>, 'sig': 'int', 'lineno': 129, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 131}
				= {'sig': 'int', 'type': '=', 'lineno': 131}
					id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e4b40>, 'sig': 'int', 'lineno': 131, 'type': 'id'}
					funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 131}
						id {'attr': 'T', 'sym': <stab.Symbol instance at 0x7f59459c9370>, 'sig': 'f()', 'lineno': 131, 'type': 'id'}
						actuals {'type': 'actuals'}
			while {'type': 'while', 'lineno': 132}
				|| {'sig': 'boolean', 'type': '||', 'lineno': 132}
					== {'sig': 'boolean', 'type': '==', 'lineno': 132}
						funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 132}
							id {'attr': 'peek', 'sym': <stab.Symbol instance at 0x7f59459c4190>, 'sig': 'f()', 'lineno': 132, 'type': 'id'}
							actuals {'type': 'actuals'}
						id {'attr': 'TK_ADD', 'sym': <stab.Symbol instance at 0x7f59459cf230>, 'sig': 'int', 'lineno': 132, 'type': 'id'}
					== {'sig': 'boolean', 'type': '==', 'lineno': 132}
						funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 132}
							id {'attr': 'peek', 'sym': <stab.Symbol instance at 0x7f59459c4190>, 'sig': 'f()', 'lineno': 132, 'type': 'id'}
							actuals {'type': 'actuals'}
						id {'attr': 'TK_SUB', 'sym': <stab.Symbol instance at 0x7f59459cf3c0>, 'sig': 'int', 'lineno': 132, 'type': 'id'}
				block {'type': 'block'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 133}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 133}
							id {'attr': 'match', 'sym': <stab.Symbol instance at 0x7f59459c4f00>, 'sig': 'f(int)', 'lineno': 133, 'type': 'id'}
							actuals {'type': 'actuals'}
								= {'sig': 'int', 'type': '=', 'lineno': 133}
									id {'attr': 'token', 'sym': <stab.Symbol instance at 0x7f59459e6500>, 'sig': 'int', 'lineno': 133, 'type': 'id'}
									funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 133}
										id {'attr': 'peek', 'sym': <stab.Symbol instance at 0x7f59459c4190>, 'sig': 'f()', 'lineno': 133, 'type': 'id'}
										actuals {'type': 'actuals'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 134}
						= {'sig': 'int', 'type': '=', 'lineno': 134}
							id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f59459e6280>, 'sig': 'int', 'lineno': 134, 'type': 'id'}
							funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 134}
								id {'attr': 'T', 'sym': <stab.Symbol instance at 0x7f59459c9370>, 'sig': 'f()', 'lineno': 134, 'type': 'id'}
								actuals {'type': 'actuals'}
					ifElse {'type': 'ifElse', 'lineno': 136}
						== {'sig': 'boolean', 'type': '==', 'lineno': 136}
							id {'attr': 'token', 'sym': <stab.Symbol instance at 0x7f59459e6500>, 'sig': 'int', 'lineno': 136, 'type': 'id'}
							id {'attr': 'TK_ADD', 'sym': <stab.Symbol instance at 0x7f59459cf230>, 'sig': 'int', 'lineno': 136, 'type': 'id'}
						stmtExpr {'type': 'stmtExpr', 'lineno': 137}
							= {'sig': 'int', 'type': '=', 'lineno': 137}
								id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e4b40>, 'sig': 'int', 'lineno': 137, 'type': 'id'}
								+ {'sig': 'int', 'type': '+', 'lineno': 137}
									id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e4b40>, 'sig': 'int', 'lineno': 137, 'type': 'id'}
									id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f59459e6280>, 'sig': 'int', 'lineno': 137, 'type': 'id'}
						stmtExpr {'type': 'stmtExpr', 'lineno': 139}
							= {'sig': 'int', 'type': '=', 'lineno': 139}
								id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e4b40>, 'sig': 'int', 'lineno': 139, 'type': 'id'}
								- {'sig': 'int', 'type': '-', 'lineno': 139}
									id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e4b40>, 'sig': 'int', 'lineno': 139, 'type': 'id'}
									id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f59459e6280>, 'sig': 'int', 'lineno': 139, 'type': 'id'}
			return {'type': 'return', 'lineno': 141}
				id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e4b40>, 'sig': 'int', 'lineno': 141, 'type': 'id'}
	funcDecl {'type': 'funcDecl', 'lineno': 144}
		int {'sig': 'int', 'type': 'int', 'lineno': 144, 'attr': None}
		id {'attr': 'T', 'sym': <stab.Symbol instance at 0x7f59459c9370>, 'sig': 'f()', 'lineno': 144, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 146}
				int {'sig': 'int', 'type': 'int', 'lineno': 146, 'attr': None}
				id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e87d0>, 'sig': 'int', 'lineno': 146, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 147}
				int {'sig': 'int', 'type': 'int', 'lineno': 147, 'attr': None}
				id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f59459e9d20>, 'sig': 'int', 'lineno': 147, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 148}
				int {'sig': 'int', 'type': 'int', 'lineno': 148, 'attr': None}
				id {'attr': 'token', 'sym': <stab.Symbol instance at 0x7f59459ea730>, 'sig': 'int', 'lineno': 148, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 150}
				= {'sig': 'int', 'type': '=', 'lineno': 150}
					id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e87d0>, 'sig': 'int', 'lineno': 150, 'type': 'id'}
					funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 150}
						id {'attr': 'F', 'sym': <stab.Symbol instance at 0x7f59459c9870>, 'sig': 'f()', 'lineno': 150, 'type': 'id'}
						actuals {'type': 'actuals'}
			while {'type': 'while', 'lineno': 151}
				|| {'sig': 'boolean', 'type': '||', 'lineno': 151}
					== {'sig': 'boolean', 'type': '==', 'lineno': 151}
						funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 151}
							id {'attr': 'peek', 'sym': <stab.Symbol instance at 0x7f59459c4190>, 'sig': 'f()', 'lineno': 151, 'type': 'id'}
							actuals {'type': 'actuals'}
						id {'attr': 'TK_MUL', 'sym': <stab.Symbol instance at 0x7f59459cf5f0>, 'sig': 'int', 'lineno': 151, 'type': 'id'}
					== {'sig': 'boolean', 'type': '==', 'lineno': 151}
						funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 151}
							id {'attr': 'peek', 'sym': <stab.Symbol instance at 0x7f59459c4190>, 'sig': 'f()', 'lineno': 151, 'type': 'id'}
							actuals {'type': 'actuals'}
						id {'attr': 'TK_DIV', 'sym': <stab.Symbol instance at 0x7f59459d2230>, 'sig': 'int', 'lineno': 151, 'type': 'id'}
				block {'type': 'block'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 152}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 152}
							id {'attr': 'match', 'sym': <stab.Symbol instance at 0x7f59459c4f00>, 'sig': 'f(int)', 'lineno': 152, 'type': 'id'}
							actuals {'type': 'actuals'}
								= {'sig': 'int', 'type': '=', 'lineno': 152}
									id {'attr': 'token', 'sym': <stab.Symbol instance at 0x7f59459ea730>, 'sig': 'int', 'lineno': 152, 'type': 'id'}
									funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 152}
										id {'attr': 'peek', 'sym': <stab.Symbol instance at 0x7f59459c4190>, 'sig': 'f()', 'lineno': 152, 'type': 'id'}
										actuals {'type': 'actuals'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 153}
						= {'sig': 'int', 'type': '=', 'lineno': 153}
							id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f59459e9d20>, 'sig': 'int', 'lineno': 153, 'type': 'id'}
							funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 153}
								id {'attr': 'F', 'sym': <stab.Symbol instance at 0x7f59459c9870>, 'sig': 'f()', 'lineno': 153, 'type': 'id'}
								actuals {'type': 'actuals'}
					ifElse {'type': 'ifElse', 'lineno': 155}
						== {'sig': 'boolean', 'type': '==', 'lineno': 155}
							id {'attr': 'token', 'sym': <stab.Symbol instance at 0x7f59459ea730>, 'sig': 'int', 'lineno': 155, 'type': 'id'}
							id {'attr': 'TK_MUL', 'sym': <stab.Symbol instance at 0x7f59459cf5f0>, 'sig': 'int', 'lineno': 155, 'type': 'id'}
						stmtExpr {'type': 'stmtExpr', 'lineno': 156}
							= {'sig': 'int', 'type': '=', 'lineno': 156}
								id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e87d0>, 'sig': 'int', 'lineno': 156, 'type': 'id'}
								* {'sig': 'int', 'type': '*', 'lineno': 156}
									id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e87d0>, 'sig': 'int', 'lineno': 156, 'type': 'id'}
									id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f59459e9d20>, 'sig': 'int', 'lineno': 156, 'type': 'id'}
						stmtExpr {'type': 'stmtExpr', 'lineno': 158}
							= {'sig': 'int', 'type': '=', 'lineno': 158}
								id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e87d0>, 'sig': 'int', 'lineno': 158, 'type': 'id'}
								/ {'sig': 'int', 'type': '/', 'lineno': 158}
									id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e87d0>, 'sig': 'int', 'lineno': 158, 'type': 'id'}
									id {'attr': 'r', 'sym': <stab.Symbol instance at 0x7f59459e9d20>, 'sig': 'int', 'lineno': 158, 'type': 'id'}
			return {'type': 'return', 'lineno': 160}
				id {'attr': 'l', 'sym': <stab.Symbol instance at 0x7f59459e87d0>, 'sig': 'int', 'lineno': 160, 'type': 'id'}
	funcDecl {'type': 'funcDecl', 'lineno': 163}
		int {'sig': 'int', 'type': 'int', 'lineno': 163, 'attr': None}
		id {'attr': 'F', 'sym': <stab.Symbol instance at 0x7f59459c9870>, 'sig': 'f()', 'lineno': 163, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 165}
				int {'sig': 'int', 'type': 'int', 'lineno': 165, 'attr': None}
				id {'attr': 'result', 'sym': <stab.Symbol instance at 0x7f59459ebe10>, 'sig': 'int', 'lineno': 165, 'type': 'id'}
			varDecl {'sig': 'int', 'type': 'varDecl', 'lineno': 167}
				int {'sig': 'int', 'type': 'int', 'lineno': 167, 'attr': None}
				id {'attr': 'token', 'sym': <stab.Symbol instance at 0x7f59459ec050>, 'sig': 'int', 'lineno': 167, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 168}
				= {'sig': 'int', 'type': '=', 'lineno': 168}
					id {'attr': 'token', 'sym': <stab.Symbol instance at 0x7f59459ec050>, 'sig': 'int', 'lineno': 168, 'type': 'id'}
					funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 168}
						id {'attr': 'peek', 'sym': <stab.Symbol instance at 0x7f59459c4190>, 'sig': 'f()', 'lineno': 168, 'type': 'id'}
						actuals {'type': 'actuals'}
			ifElse {'type': 'ifElse', 'lineno': 170}
				== {'sig': 'boolean', 'type': '==', 'lineno': 170}
					id {'attr': 'token', 'sym': <stab.Symbol instance at 0x7f59459ec050>, 'sig': 'int', 'lineno': 170, 'type': 'id'}
					id {'attr': 'TK_LPAREN', 'sym': <stab.Symbol instance at 0x7f59459d24b0>, 'sig': 'int', 'lineno': 170, 'type': 'id'}
				block {'type': 'block'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 171}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 171}
							id {'attr': 'match', 'sym': <stab.Symbol instance at 0x7f59459c4f00>, 'sig': 'f(int)', 'lineno': 171, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'TK_LPAREN', 'sym': <stab.Symbol instance at 0x7f59459d24b0>, 'sig': 'int', 'lineno': 171, 'type': 'id'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 172}
						= {'sig': 'int', 'type': '=', 'lineno': 172}
							id {'attr': 'result', 'sym': <stab.Symbol instance at 0x7f59459ebe10>, 'sig': 'int', 'lineno': 172, 'type': 'id'}
							funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 172}
								id {'attr': 'E', 'sym': <stab.Symbol instance at 0x7f59459c8b40>, 'sig': 'f()', 'lineno': 172, 'type': 'id'}
								actuals {'type': 'actuals'}
					stmtExpr {'type': 'stmtExpr', 'lineno': 173}
						funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 173}
							id {'attr': 'match', 'sym': <stab.Symbol instance at 0x7f59459c4f00>, 'sig': 'f(int)', 'lineno': 173, 'type': 'id'}
							actuals {'type': 'actuals'}
								id {'attr': 'TK_RPAREN', 'sym': <stab.Symbol instance at 0x7f59459d5fa0>, 'sig': 'int', 'lineno': 173, 'type': 'id'}
				ifElse {'type': 'ifElse', 'lineno': 175}
					== {'sig': 'boolean', 'type': '==', 'lineno': 175}
						id {'attr': 'token', 'sym': <stab.Symbol instance at 0x7f59459ec050>, 'sig': 'int', 'lineno': 175, 'type': 'id'}
						id {'attr': 'TK_SUB', 'sym': <stab.Symbol instance at 0x7f59459cf3c0>, 'sig': 'int', 'lineno': 175, 'type': 'id'}
					block {'type': 'block'}
						stmtExpr {'type': 'stmtExpr', 'lineno': 176}
							funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 176}
								id {'attr': 'match', 'sym': <stab.Symbol instance at 0x7f59459c4f00>, 'sig': 'f(int)', 'lineno': 176, 'type': 'id'}
								actuals {'type': 'actuals'}
									id {'attr': 'TK_SUB', 'sym': <stab.Symbol instance at 0x7f59459cf3c0>, 'sig': 'int', 'lineno': 176, 'type': 'id'}
						stmtExpr {'type': 'stmtExpr', 'lineno': 177}
							= {'sig': 'int', 'type': '=', 'lineno': 177}
								id {'attr': 'result', 'sym': <stab.Symbol instance at 0x7f59459ebe10>, 'sig': 'int', 'lineno': 177, 'type': 'id'}
								- {'sig': 'int', 'type': '-', 'lineno': 177}
									funcCall {'sig': 'int', 'type': 'funcCall', 'lineno': 177}
										id {'attr': 'F', 'sym': <stab.Symbol instance at 0x7f59459c9870>, 'sig': 'f()', 'lineno': 177, 'type': 'id'}
										actuals {'type': 'actuals'}
					ifElse {'type': 'ifElse', 'lineno': 179}
						== {'sig': 'boolean', 'type': '==', 'lineno': 179}
							id {'attr': 'token', 'sym': <stab.Symbol instance at 0x7f59459ec050>, 'sig': 'int', 'lineno': 179, 'type': 'id'}
							id {'attr': 'TK_NUMBER', 'sym': <stab.Symbol instance at 0x7f59459cbcd0>, 'sig': 'int', 'lineno': 179, 'type': 'id'}
						block {'type': 'block'}
							stmtExpr {'type': 'stmtExpr', 'lineno': 180}
								funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 180}
									id {'attr': 'match', 'sym': <stab.Symbol instance at 0x7f59459c4f00>, 'sig': 'f(int)', 'lineno': 180, 'type': 'id'}
									actuals {'type': 'actuals'}
										id {'attr': 'TK_NUMBER', 'sym': <stab.Symbol instance at 0x7f59459cbcd0>, 'sig': 'int', 'lineno': 180, 'type': 'id'}
							stmtExpr {'type': 'stmtExpr', 'lineno': 181}
								= {'sig': 'int', 'type': '=', 'lineno': 181}
									id {'attr': 'result', 'sym': <stab.Symbol instance at 0x7f59459ebe10>, 'sig': 'int', 'lineno': 181, 'type': 'id'}
									id {'attr': 'attr', 'sym': <stab.Symbol instance at 0x7f59459c3730>, 'sig': 'int', 'lineno': 181, 'type': 'id'}
						block {'type': 'block'}
							stmtExpr {'type': 'stmtExpr', 'lineno': 184}
								funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 184}
									id {'attr': 'prints', 'sym': <stab.Symbol instance at 0x7f5945a57500>, 'sig': 'f(string)', 'lineno': 184, 'type': 'id'}
									actuals {'type': 'actuals'}
										string {'sig': 'string', 'type': 'string', 'lineno': 184, 'attr': 'Error: expected factor.\\n'}
							stmtExpr {'type': 'stmtExpr', 'lineno': 185}
								funcCall {'sig': 'void', 'type': 'funcCall', 'lineno': 185}
									id {'attr': 'halt', 'sym': <stab.Symbol instance at 0x7f5945a32050>, 'sig': 'f()', 'lineno': 185, 'type': 'id'}
									actuals {'type': 'actuals'}
			return {'type': 'return', 'lineno': 187}
				id {'attr': 'result', 'sym': <stab.Symbol instance at 0x7f59459ebe10>, 'sig': 'int', 'lineno': 187, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 194}
		int {'sig': 'int', 'type': 'int', 'lineno': 194, 'attr': None}
		id {'attr': 'EOF', 'sym': <stab.Symbol instance at 0x7f59459c97d0>, 'sig': 'int', 'lineno': 194, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 196}
		int {'sig': 'int', 'type': 'int', 'lineno': 196, 'attr': None}
		id {'attr': 'TK_EOF', 'sym': <stab.Symbol instance at 0x7f59459ca230>, 'sig': 'int', 'lineno': 196, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 197}
		int {'sig': 'int', 'type': 'int', 'lineno': 197, 'attr': None}
		id {'attr': 'TK_EOLN', 'sym': <stab.Symbol instance at 0x7f59459cbaf0>, 'sig': 'int', 'lineno': 197, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 198}
		int {'sig': 'int', 'type': 'int', 'lineno': 198, 'attr': None}
		id {'attr': 'TK_NUMBER', 'sym': <stab.Symbol instance at 0x7f59459cbcd0>, 'sig': 'int', 'lineno': 198, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 199}
		int {'sig': 'int', 'type': 'int', 'lineno': 199, 'attr': None}
		id {'attr': 'TK_ADD', 'sym': <stab.Symbol instance at 0x7f59459cf230>, 'sig': 'int', 'lineno': 199, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 200}
		int {'sig': 'int', 'type': 'int', 'lineno': 200, 'attr': None}
		id {'attr': 'TK_SUB', 'sym': <stab.Symbol instance at 0x7f59459cf3c0>, 'sig': 'int', 'lineno': 200, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 201}
		int {'sig': 'int', 'type': 'int', 'lineno': 201, 'attr': None}
		id {'attr': 'TK_MUL', 'sym': <stab.Symbol instance at 0x7f59459cf5f0>, 'sig': 'int', 'lineno': 201, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 202}
		int {'sig': 'int', 'type': 'int', 'lineno': 202, 'attr': None}
		id {'attr': 'TK_DIV', 'sym': <stab.Symbol instance at 0x7f59459d2230>, 'sig': 'int', 'lineno': 202, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 203}
		int {'sig': 'int', 'type': 'int', 'lineno': 203, 'attr': None}
		id {'attr': 'TK_LPAREN', 'sym': <stab.Symbol instance at 0x7f59459d24b0>, 'sig': 'int', 'lineno': 203, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 204}
		int {'sig': 'int', 'type': 'int', 'lineno': 204, 'attr': None}
		id {'attr': 'TK_RPAREN', 'sym': <stab.Symbol instance at 0x7f59459d5fa0>, 'sig': 'int', 'lineno': 204, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 206}
		int {'sig': 'int', 'type': 'int', 'lineno': 206, 'attr': None}
		id {'attr': 'ASCII_0', 'sym': <stab.Symbol instance at 0x7f59459d70a0>, 'sig': 'int', 'lineno': 206, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 207}
		int {'sig': 'int', 'type': 'int', 'lineno': 207, 'attr': None}
		id {'attr': 'ASCII_9', 'sym': <stab.Symbol instance at 0x7f59459d7140>, 'sig': 'int', 'lineno': 207, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 208}
		int {'sig': 'int', 'type': 'int', 'lineno': 208, 'attr': None}
		id {'attr': 'ASCII_PLUS', 'sym': <stab.Symbol instance at 0x7f59459d8e60>, 'sig': 'int', 'lineno': 208, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 209}
		int {'sig': 'int', 'type': 'int', 'lineno': 209, 'attr': None}
		id {'attr': 'ASCII_MINUS', 'sym': <stab.Symbol instance at 0x7f59459d95a0>, 'sig': 'int', 'lineno': 209, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 210}
		int {'sig': 'int', 'type': 'int', 'lineno': 210, 'attr': None}
		id {'attr': 'ASCII_STAR', 'sym': <stab.Symbol instance at 0x7f59459da780>, 'sig': 'int', 'lineno': 210, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 211}
		int {'sig': 'int', 'type': 'int', 'lineno': 211, 'attr': None}
		id {'attr': 'ASCII_SLASH', 'sym': <stab.Symbol instance at 0x7f59459da9b0>, 'sig': 'int', 'lineno': 211, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 212}
		int {'sig': 'int', 'type': 'int', 'lineno': 212, 'attr': None}
		id {'attr': 'ASCII_LPAREN', 'sym': <stab.Symbol instance at 0x7f59459dc0f0>, 'sig': 'int', 'lineno': 212, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 213}
		int {'sig': 'int', 'type': 'int', 'lineno': 213, 'attr': None}
		id {'attr': 'ASCII_RPAREN', 'sym': <stab.Symbol instance at 0x7f59459dc2d0>, 'sig': 'int', 'lineno': 213, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 214}
		int {'sig': 'int', 'type': 'int', 'lineno': 214, 'attr': None}
		id {'attr': 'ASCII_SPACE', 'sym': <stab.Symbol instance at 0x7f59459dd820>, 'sig': 'int', 'lineno': 214, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 215}
		int {'sig': 'int', 'type': 'int', 'lineno': 215, 'attr': None}
		id {'attr': 'ASCII_TAB', 'sym': <stab.Symbol instance at 0x7f59459de230>, 'sig': 'int', 'lineno': 215, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 216}
		int {'sig': 'int', 'type': 'int', 'lineno': 216, 'attr': None}
		id {'attr': 'ASCII_CR', 'sym': <stab.Symbol instance at 0x7f59459df460>, 'sig': 'int', 'lineno': 216, 'type': 'id'}
	globVarDecl {'type': 'globVarDecl', 'lineno': 217}
		int {'sig': 'int', 'type': 'int', 'lineno': 217, 'attr': None}
		id {'attr': 'ASCII_NL', 'sym': <stab.Symbol instance at 0x7f59459df370>, 'sig': 'int', 'lineno': 217, 'type': 'id'}
	funcDecl {'type': 'funcDecl', 'lineno': 219}
		void {'sig': 'void', 'type': 'void', 'lineno': 219, 'attr': None}
		id {'attr': 'init', 'sym': <stab.Symbol instance at 0x7f59459dfaa0>, 'sig': 'f()', 'lineno': 219, 'type': 'id'}
		formals {'type': 'formals'}
		block {'type': 'block'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 221}
				= {'sig': 'int', 'type': '=', 'lineno': 221}
					id {'attr': 'EOF', 'sym': <stab.Symbol instance at 0x7f59459c97d0>, 'sig': 'int', 'lineno': 221, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 221, 'attr': '-1'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 223}
				= {'sig': 'int', 'type': '=', 'lineno': 223}
					id {'attr': 'ASCII_0', 'sym': <stab.Symbol instance at 0x7f59459d70a0>, 'sig': 'int', 'lineno': 223, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 223, 'attr': '48'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 224}
				= {'sig': 'int', 'type': '=', 'lineno': 224}
					id {'attr': 'ASCII_9', 'sym': <stab.Symbol instance at 0x7f59459d7140>, 'sig': 'int', 'lineno': 224, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 224, 'attr': '57'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 225}
				= {'sig': 'int', 'type': '=', 'lineno': 225}
					id {'attr': 'ASCII_PLUS', 'sym': <stab.Symbol instance at 0x7f59459d8e60>, 'sig': 'int', 'lineno': 225, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 225, 'attr': '43'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 226}
				= {'sig': 'int', 'type': '=', 'lineno': 226}
					id {'attr': 'ASCII_MINUS', 'sym': <stab.Symbol instance at 0x7f59459d95a0>, 'sig': 'int', 'lineno': 226, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 226, 'attr': '45'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 227}
				= {'sig': 'int', 'type': '=', 'lineno': 227}
					id {'attr': 'ASCII_STAR', 'sym': <stab.Symbol instance at 0x7f59459da780>, 'sig': 'int', 'lineno': 227, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 227, 'attr': '42'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 228}
				= {'sig': 'int', 'type': '=', 'lineno': 228}
					id {'attr': 'ASCII_SLASH', 'sym': <stab.Symbol instance at 0x7f59459da9b0>, 'sig': 'int', 'lineno': 228, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 228, 'attr': '47'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 229}
				= {'sig': 'int', 'type': '=', 'lineno': 229}
					id {'attr': 'ASCII_LPAREN', 'sym': <stab.Symbol instance at 0x7f59459dc0f0>, 'sig': 'int', 'lineno': 229, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 229, 'attr': '40'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 230}
				= {'sig': 'int', 'type': '=', 'lineno': 230}
					id {'attr': 'ASCII_RPAREN', 'sym': <stab.Symbol instance at 0x7f59459dc2d0>, 'sig': 'int', 'lineno': 230, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 230, 'attr': '41'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 231}
				= {'sig': 'int', 'type': '=', 'lineno': 231}
					id {'attr': 'ASCII_SPACE', 'sym': <stab.Symbol instance at 0x7f59459dd820>, 'sig': 'int', 'lineno': 231, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 231, 'attr': '32'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 232}
				= {'sig': 'int', 'type': '=', 'lineno': 232}
					id {'attr': 'ASCII_TAB', 'sym': <stab.Symbol instance at 0x7f59459de230>, 'sig': 'int', 'lineno': 232, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 232, 'attr': '9'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 233}
				= {'sig': 'int', 'type': '=', 'lineno': 233}
					id {'attr': 'ASCII_CR', 'sym': <stab.Symbol instance at 0x7f59459df460>, 'sig': 'int', 'lineno': 233, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 233, 'attr': '13'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 234}
				= {'sig': 'int', 'type': '=', 'lineno': 234}
					id {'attr': 'ASCII_NL', 'sym': <stab.Symbol instance at 0x7f59459df370>, 'sig': 'int', 'lineno': 234, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 234, 'attr': '10'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 236}
				= {'sig': 'int', 'type': '=', 'lineno': 236}
					id {'attr': 'TK_EOF', 'sym': <stab.Symbol instance at 0x7f59459ca230>, 'sig': 'int', 'lineno': 236, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 236, 'attr': '256'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 237}
				= {'sig': 'int', 'type': '=', 'lineno': 237}
					id {'attr': 'TK_NUMBER', 'sym': <stab.Symbol instance at 0x7f59459cbcd0>, 'sig': 'int', 'lineno': 237, 'type': 'id'}
					number {'sig': 'int', 'type': 'number', 'lineno': 237, 'attr': '257'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 238}
				= {'sig': 'int', 'type': '=', 'lineno': 238}
					id {'attr': 'TK_ADD', 'sym': <stab.Symbol instance at 0x7f59459cf230>, 'sig': 'int', 'lineno': 238, 'type': 'id'}
					id {'attr': 'ASCII_PLUS', 'sym': <stab.Symbol instance at 0x7f59459d8e60>, 'sig': 'int', 'lineno': 238, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 239}
				= {'sig': 'int', 'type': '=', 'lineno': 239}
					id {'attr': 'TK_SUB', 'sym': <stab.Symbol instance at 0x7f59459cf3c0>, 'sig': 'int', 'lineno': 239, 'type': 'id'}
					id {'attr': 'ASCII_MINUS', 'sym': <stab.Symbol instance at 0x7f59459d95a0>, 'sig': 'int', 'lineno': 239, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 240}
				= {'sig': 'int', 'type': '=', 'lineno': 240}
					id {'attr': 'TK_MUL', 'sym': <stab.Symbol instance at 0x7f59459cf5f0>, 'sig': 'int', 'lineno': 240, 'type': 'id'}
					id {'attr': 'ASCII_STAR', 'sym': <stab.Symbol instance at 0x7f59459da780>, 'sig': 'int', 'lineno': 240, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 241}
				= {'sig': 'int', 'type': '=', 'lineno': 241}
					id {'attr': 'TK_DIV', 'sym': <stab.Symbol instance at 0x7f59459d2230>, 'sig': 'int', 'lineno': 241, 'type': 'id'}
					id {'attr': 'ASCII_SLASH', 'sym': <stab.Symbol instance at 0x7f59459da9b0>, 'sig': 'int', 'lineno': 241, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 242}
				= {'sig': 'int', 'type': '=', 'lineno': 242}
					id {'attr': 'TK_LPAREN', 'sym': <stab.Symbol instance at 0x7f59459d24b0>, 'sig': 'int', 'lineno': 242, 'type': 'id'}
					id {'attr': 'ASCII_LPAREN', 'sym': <stab.Symbol instance at 0x7f59459dc0f0>, 'sig': 'int', 'lineno': 242, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 243}
				= {'sig': 'int', 'type': '=', 'lineno': 243}
					id {'attr': 'TK_RPAREN', 'sym': <stab.Symbol instance at 0x7f59459d5fa0>, 'sig': 'int', 'lineno': 243, 'type': 'id'}
					id {'attr': 'ASCII_RPAREN', 'sym': <stab.Symbol instance at 0x7f59459dc2d0>, 'sig': 'int', 'lineno': 243, 'type': 'id'}
			stmtExpr {'type': 'stmtExpr', 'lineno': 244}
				= {'sig': 'int', 'type': '=', 'lineno': 244}
					id {'attr': 'TK_EOLN', 'sym': <stab.Symbol instance at 0x7f59459cbaf0>, 'sig': 'int', 'lineno': 244, 'type': 'id'}
					id {'attr': 'ASCII_NL', 'sym': <stab.Symbol instance at 0x7f59459df370>, 'sig': 'int', 'lineno': 244, 'type': 'id'}

```

