	global strcspn

section .text

strcspn:
	mov rax, -1 		; assign to rax the value 0
	mov rbx, 0

try:
	inc rax
	mov cl, byte[rdi]
	mov rbx, rsi
	inc rdi
	cmp cl, 0
	jne reject
	ret

reject:
	cmp byte[rbx], 0
	je try
	cmp cl, byte[rbx]
	je exit
	inc rbx
	jmp reject

exit:
	ret
