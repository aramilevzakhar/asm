
section	.data
	msg db 'Аниме это хорошо',0xa ; наше сообщение
	len equ $- msg  ; длина нашего сообщения 
	;m2 times 9 dw 0
	;n1 db '1'
	;n2 db '1'
	n1 db 7
	n2 db 1
	count dw 0
	msg2 db 'Type value: ', 0xa
	len2 equ $- msg2

segment .bss
	num1 resb 3
	num2 resb 3


section	.text
  global _start ; должно быть объявлено для линкера (gcc)

_start:	       ; сообщаем линкеру точку входа
  ;mov	edx,len  ; длина сообщения
  ;mov	ecx,msg  ; сообщение для вывода на экран
  ;mov	ebx,1    ; файловый дескриптор (stdout)
  ;mov	eax,4    ; номер системного вызова (sys_write)
  ;int	0x80     ; вызов ядра

	mov eax, [n1]
	;sub eax, '0'

	mov ebx, [n2]
	;sub ebx, '0' 

	add eax, ebx
	add eax, '0'

	mov [num1], eax


	mov eax, 4
	mov ebx, 1
	mov ecx, num1
	mov edx, 5
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, num2
	mov edx, 3
	int 0x80


	
  mov	eax,1    ; номер системного вызова (sys_exit)
  int	0x80     ; вызов ядра



