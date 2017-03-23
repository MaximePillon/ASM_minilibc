
section .text

global strcasecmp

strcasecmp:
	xor	rax, rax	; set rax at the 0 value
	xor	cl, cl

try:
	mov	al, byte[rsi]	; save the byte pointed by rsi in al
	mov	bl, byte[rdi]	; save the byte pointed by rdi in bl
	jmp	cmp_case

return:
	sub	bl, al		; substract the value bl by al
	movsx	rax, bl		; set the return value to the value of the substract
	ret

cmp_case:
	mov	cl, al
	inc	rsi		; increment the value of esi (esi + 1)
	inc	rdi		; increment the value of edi (edi + 1)
	cmp	al, bl
	ja	sub_al
	cmp	al, bl
	jb	add_al
	cmp	al, bl
	je	try
	cmp	bl, 0		; compare the value of al and 0
	je	return		; (if == 0 jump to return)

add_al:
	add	cl, 32
	cmp	cl, bl
	jne	return
	jmp	try

sub_al:
	sub	cl, 32
	cmp	cl, bl
	jne	return
	jmp	try

	
