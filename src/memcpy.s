bits 64

global memcpy:function

section .text

memcpy:
	xor rax, rax		; set rax at the value 0
	xor r8, r8

memcpy_while:
	mov cl, byte[rsi + r8]	; stock the byte pointed by rsi in cl
	mov byte[rdi + r8], cl	; stock the byte pointed by cl in rdi
	inc r8			; increment the value of rdi by one
	dec rdx			; decrement the value of the third arg
	cmp rdx, 0		; compare the value of rdx with 0
	jnz memcpy_while	; jump if is not 0, so while rdx > 0 jump, else don't

return:
	mov rax, rdi		; stock the pointer to dest to rax
	ret
