bits 64

section .text

global strncmp:function

strncmp:
	xor	rax, rax	; set rax at the 0 value
	xor	r8, r8

try:
	cmp	rdx, 0
	je	return
	mov	al, byte[rsi + r8]	; save the byte pointed by rsi in al
	mov	r10b, byte[rdi + r8]	; save the byte pointed by rdi in r10b
	inc	r8
	cmp	al, r10b		; compare the value of al and r10b
	jne	return			; (if != 0 jump to return)
	cmp	r10b, 0			; compare the value of al and 0
	je	return			; (if == 0 jump to return)
	dec	rdx			; decrement the value of the third argument
	jmp	try

return:
	cmp	r8, 0
	je	exit
	sub	r10b, al	; substract the value r10b by al
	movsx	rax, r10b	; set the return value to the value of the substract

exit:
	ret
