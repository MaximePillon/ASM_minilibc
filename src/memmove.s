bits 64

global memmove:function

section .text

memmove:
	xor rax, rax		; set rax at the value 0
	xor r8, r8
	ret
