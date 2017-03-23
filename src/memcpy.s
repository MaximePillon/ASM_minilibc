	global memcpy

section .text

memcpy:
	xor rax, rax		; set rax at the value 0

memcpy_while:
	mov cl, byte[rsi]	; stock the byte pointed by rsi in cl
	cmp cl, -1
	jmp return
	mov byte[rdi], cl	; stock the byte pointed by cl in rdi
	inc rdi			; increment the value of rdi by one
	inc rsi			; increment the value of rsi by one
	dec rdx			; decrement the value of the third arg
	cmp rdx, 0		; compare the value of rdx with 0
	jnz memcpy_while	; jump if is not 0, so while rdx > 0 jump, else don't

return:
	mov rax, rdi		; stock the pointer to dest to rax
	ret
