	global memcpy

section .text

memcpy:
	xor rax, rax		; set rax at the value 0

memcpy_while:
	mov cl, byte[rdi]	; stock the byte pointed by rdi in cl
	mov byte[rsi], cl	; stock the byte pointed by cl in rsi
	inc rdi			; increment the value of rdi by one
	inc rsi			; increment the value of rsi by one
	dec rdx			; decrement the value of the third arg
	cmp rdx, 0		; compare the value of rdx with 0
	jnz memcpy_while	; jump if is not 0, so while rdx > 0 jump, else don't

return:
	mov rax, rdi		; stock the pointer to dest to rax
	ret
