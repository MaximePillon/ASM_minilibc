bits 64

section .text

global strcasecmp:function

strcasecmp:
	xor	rax, rax	; set rax at the 0 value
	xor	cl, cl

try:
	mov	al, byte[rsi]	; save the byte pointed by rsi in al
	mov	r10b, byte[rdi]	; save the byte pointed by rdi in r10b
	mov	cl, byte[rsi]
	inc	rsi		; increment the value of esi (rsi + 1)
	inc	rdi		; increment the value of edi (rdi + 1)
	cmp	al, 0		; compare the value of al and 0
	je	return		; (if == 0 jump to return)
	cmp	r10b, 0		; compare the value of al and 0
	je	return		; (if == 0 jump to return)
	cmp	al, r10b
	jg	sub_al
	cmp	al, r10b
	jl	add_al
	jmp	try

add_al:
	cmp	cl, 'A'
	jl	try
	cmp	cl, 'Z'
	jg	try
	add	cl, 32
	cmp	cl, r10b
	jne	return
	jmp	try

sub_al:
	cmp	cl, 'a'
	jl	try
	cmp	cl, 'z'
	jg	try
	sub	cl, 32
	cmp	cl, r10b
	jne	return
	jmp	try

return:
	sub	r10b, al	; substract the value r10b by al
	movsx	rax, r10b	; set the return value to the value of the substract
	ret

