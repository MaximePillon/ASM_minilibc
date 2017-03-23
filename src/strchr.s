section .text

global strchr

strchr:
	xor	rax, rax	; set rax at the 0 value

try:
	mov	al, byte[rdi]	; save the byte pointed by rdi in al
	cmp	al, sil		; compare the value of the second parameter and al
	je	return		; (if == 0 jump to return)
	cmp	al, 0		; compare the value of al and 0
	je	return		; (if == 0 jump to return)
	inc	rdi		; increment the value of rdi (rdi + 1)
	jmp	try

return:
	mov	rax, rdi

exit:
	ret
