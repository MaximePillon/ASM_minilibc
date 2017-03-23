global strstr

section .text

strstr:
	xor rax, rax 		; assign to rax the value 0
	xor rbx, rbx

try:
	mov cl, byte[rdi]
	mov rbx, rsi
	mov rax, rdi
	inc rdi
	cmp cl, 0
	je exit
	jmp reject

reject:
	cmp byte[rbx], 0
	je exit
	mov dl, byte[rbx]
	inc rbx
	cmp cl, dl
	je reject
	jmp try

exit:
	ret
