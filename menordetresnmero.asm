## Angela Maria Juyo Rondon, Cedula : 52533807
.data
message:  .ascii	 "Buen día, Favor ingrese un numero: "
line:	  .asciiz 	 "\n"	# se coloca un salto de linea

.text 
.globl main		

main:
#como vamos a solicitar 3 valores los vamos a requerir para almacear y por último comparar para indicar cual el numero menor
#comandos la, li permiten mostrar y cargar mensaje de solicitud de información, comnado syscall llama a una función del s.o,
# comando move, mueve los datos que pedimos a los espacios o ubicaciones asignadas
la $a0 message		
li $v0 4		
syscall
li $v0 5		
syscall			
move $t0 $v0		

la $a0 message		
li $v0 4		
syscall
li $v0 5
syscall
move $t1 $v0

la $a0 message		
li $v0 4		
syscall
li $v0 5
syscall
move $t2 $v0

# Iniciamos las comparaciones con el fin de verificar cual es el valor menor de los 3 números digitados al iniciar el programa
sle $t3 $t0 $t1		# realiza la comparación entre el dato almacenados en t0 y t1 (si t1 es mayor o igual a t0)
beq $t3 $zero elseB	# valida si ($t3 == 0)
sle $t3 $t0 $t2
beq $t3 $zero elseB
move $a0 $t0
j print			

elseB:
slt $t3 $t1 $t0		# realiza la comparación entre el dato almacenados en t1 y t0 (si t1 es menor el valor en t0)
beq $t3 $zero elseC
sle $t3 $t1 $t2
beq $t3 $zero elseC
move $a0 $t1
j print

elseC:
move $a0 $t2
j print

print:

li $v0 1		# carga $v0 a 1: permite mostrar un entero
syscall

li $v0 10	
syscall			# fin y salida del rograma
