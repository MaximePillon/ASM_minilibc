
section .text

global strcasecmp

strcasecmp:
	xor	rax, rax	; set rax at the 0 value
	xor	cl, cl

try:
	mov	al, byte[rsi]	; save the byte pointed by rsi in al
	mov	r10b, byte[rdi]	; save the byte pointed by rdi in r10b
	jmp	cmp_case

return:
	sub	r10b, al	; substract the value r10b by al
	movsx	rax, r10b	; set the return value to the value of the substract
	ret

cmp_case:
	mov	cl, al
	inc	rsi		; increment the value of esi (esi + 1)
	inc	rdi		; increment the value of edi (edi + 1)
	cmp	al, r10b
	ja	sub_al
	cmp	al, r10b
	jb	add_al
	cmp	al, r10b
	je	try
	cmp	r10b, 0		; compare the value of al and 0
	je	return		; (if == 0 jump to return)

add_al:
	add	cl, 32
	cmp	cl, r10b
	jne	return
	jmp	try

sub_al:
	sub	cl, 32
	cmp	cl, r10b
	jne	return
	jmp	try

	
