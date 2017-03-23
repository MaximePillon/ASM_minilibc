
section .text

global strcmp

strcmp:
	xor	rax, rax	; set rax at the 0 value

try:
	mov	al, byte[rsi]	; save the byte pointed by rsi in al
	mov	bl, byte[rdi]	; save the byte pointed by rdi in bl
	cmp	al, bl		; compare the value of al and bl
	jne	return		; (if != 0 jump to return)
	cmp	bl, 0		; compare the value of al and 0
	je	return		; (if == 0 jump to return)
	inc	rsi		; increment the value of esi (esi + 1)
	inc	rdi		; increment the value of edi (edi + 1)
	jmp	try

return:
	sub	bl, al		; substract the value bl by al
	movsx	rax, bl		; set the return value to the value of the substract

exit:
	ret
