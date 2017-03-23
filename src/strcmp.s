
section .text

global strcmp

strcmp:
	xor	rax, rax	; set rax at the 0 value

try:
	mov	al, byte[rsi]	; save the byte pointed by rsi in al
	mov	r10b, byte[rdi]	; save the byte pointed by rdi in r10b
	cmp	al, r10b	; compare the value of al and r10b
	jne	return		; (if != 0 jump to return)
	cmp	r10b, 0		; compare the value of al and 0
	je	return		; (if == 0 jump to return)
	inc	rsi		; increment the value of esi (esi + 1)
	inc	rdi		; increment the value of edi (edi + 1)
	jmp	try

return:
	sub	r10b, al	; substract the value r10b by al
	movsx	rax, r10b	; set the return value to the value of the substract

exit:
	ret
