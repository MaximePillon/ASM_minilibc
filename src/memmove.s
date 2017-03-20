	global memmove

section .text

memmove:
	xor rax, rax		; set rax at the value 0
	xor r8, r8

memmove_while:
	mov cl, byte[rsi]	; stock the byte pointed by rdi in cl
	mov byte[r8], cl	; stock the byte pointed by cl in rsi
	inc rsi			; increment the value of rdi by one
	inc r8			; increment the value of rsi by one
	dec rdx			; decrement the value of the third arg
	cmp rdx, 0		; compare the value of rdx with 0
	jnz memmove_while	; jump if is not 0, so while rdx > 0 jump, else don't

return:
	mov rax, rdi		; stock the pointer to dest to rax
	ret
