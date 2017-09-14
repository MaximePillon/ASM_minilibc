bits 64

section .text

global write:function

write:
	mov	eax, 4
	int	80h
	ret
