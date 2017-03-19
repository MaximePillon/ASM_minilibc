	global strlen

section .text

strlen:
	mov rax, -1 		; assign to rax the value 0
strlen_while:
	inc rax			; increment the value of rax by one
	mov cl,byte [rdi]	; stock the byte pointed by rdi in cl
	inc rdi			; increment the value of rdi by one
	cmp cl, 0		; compare the value of cl with 0
	jnz strlen_while	; jump if is not 0, so while cl != 0 jump, else no
	ret			; return to caller
