bits 64

global memset:function

section .text

memset:
	xor rax, rax		; set rax at the value 0
	xor r8, r8

memset_while:
	mov byte[rdi + r8], sil	; stock the byte pointed by rdi in cl
	inc r8			; increment the value of rdi by one
	dec rdx			; decrement the value of the third arg
	cmp rdx, 0		; compare the value of rdx with 0
	jnz memset_while	; jump if is not 0, so while rdx > 0 jump, else don't

return:
	mov rax, rdi		; stock the pointer to dest to rax
	ret
