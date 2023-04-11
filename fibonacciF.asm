## Angela Juyo Rondon
##Porgama que ejecuta la seri de figonaci

JMP main
print:
	PUSH A
	PUSH B
	
	MOV B,A
	DIV A,10
	MOD B,10
	
	CALL char
	MOV A, B
	CALL char
	
	INC D
	
	POP B
	POP A
	RET
	
char:
	CMP A,0
	JZ end
		ADD A, 48
		MOV [D], A
		INC D
		SUB A, 48
		end:
	RET
main:
	MOV A, 0
	MOV B, 1
	MOV C, 0
	MOV D, 232
	loop:
		ADD A,B
		XCH A,B
		
		CALL print
		INC C
		CMP C, 10
		JNZ loop
	HLT
