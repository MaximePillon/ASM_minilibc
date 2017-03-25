bits 64

global strstr:function

section .text

strstr:
	xor rax, rax 		; assign to rax the value 0
	xor rbx, rbx
	mov rax, rdi
try:
	mov rdi, rax
	mov rbx, rsi
	inc rax
	jmp reject

reject:
	mov cl, byte[rdi]
	cmp cl, 0
	je exitHard
	cmp byte[rbx], 0
	je exit
	mov dl, byte[rbx]
	inc rbx
	inc rdi
	cmp cl, dl
	je reject
	jmp try

exit:
	sub rax, 1
	ret

exitHard:
	mov rax, 0
	ret
