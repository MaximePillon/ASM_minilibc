section .text

global rindex

rindex:
	xor	rax, rax	; set rax at the 0 value

try:
	mov	cl, byte[rdi]	; save the byte pointed by rdi in bl
	cmp	cl, sil		; compare the value of the second parameter and bl
	je	return		; (if == 0 jump to return)
	cmp	cl, 0		; compare the value of al and 0
	je	exit		; (if == 0 jump to return)
	inc	rdi		; increment the value of rdi (rdi + 1)
	jmp	try

return:
	mov	rax, rdi
	inc	rdi		; increment the value of rdi (rdi + 1)
	jmp	try

exit:
	ret


