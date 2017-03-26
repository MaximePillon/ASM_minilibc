bits 64

section .text

global strcasecmp:function

strcasecmp:
	xor	rax, rax	; set rax at the 0 value
	xor	r8, r8
	xor	r10b, r10b

try:
	mov	al, byte[rsi + r8]	; save the byte pointed by rsi in al
	mov	cl, byte[rdi + r8]	; save the byte pointed by rdi in r10b
	inc	r8
	cmp	al, 0		; compare the value of al and 0
	je	return		; (if == 0 jump to return)
	cmp	cl, 0		; compare the value of al and 0
	je	return		; (if == 0 jump to return)
	cmp	al, cl
	jg	sub_al
	cmp	al, cl
	jl	add_al
	jmp	try

add_al:
	cmp	al, 'A'
	jl	return
	cmp	al, 'Z'
	jg	return
	add	al, 32
	cmp	al, cl
	jg	addret
	cmp	al, cl
	jl	return
	jmp	try

sub_al:
	cmp	al, 'a'
	jl	return
	cmp	al, 'z'
	jg	return
	sub	al, 32
	cmp	al, cl
	jg	return
	cmp	al, cl
	jl	subret
	jmp	try

addret:
	sub	al, 32
	sub	cl, al		; substract the value r10b by al$
	movsx	rax, cl		; set the return value to the value of the substract
	ret
	
subret:
	add	al, 32
	sub	cl, al		; substract the value r10b by al
	movsx	rax, cl		; set the return value to the value of the substract
	ret
	
return:
	sub	cl, al		; substract the value r10b by al
	movsx	rax, cl		; set the return value to the value of the substract
	ret

