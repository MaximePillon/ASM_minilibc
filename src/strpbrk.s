global strpbrk

section .text

strpbrk:
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
	je try
	cmp cl, byte[rbx]
	je exit
	inc rbx
	jmp reject

exit:
	ret
