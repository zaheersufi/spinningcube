	.file	"cube.c"
	.text
	.globl	mult_mat_vec
	.type	mult_mat_vec, @function
mult_mat_vec:
	endbr64
	movq	%rdi, %r10
	movl	$0, %r11d
	jmp	.L2
.L4:
	movq	%r9, %rcx
	salq	$5, %rcx
	addq	%rsi, %rcx
	movslq	%eax, %rdi
	movsd	(%rdx,%rdi,8), %xmm0
	mulsd	(%rcx,%rdi,8), %xmm0
	addsd	(%r8), %xmm0
	movsd	%xmm0, (%r8)
	addl	$1, %eax
.L3:
	cmpl	$3, %eax
	jle	.L4
	addl	$1, %r11d
.L2:
	cmpl	$3, %r11d
	jg	.L6
	movslq	%r11d, %r9
	leaq	(%r10,%r9,8), %r8
	movq	$0x000000000, (%r8)
	movl	$0, %eax
	jmp	.L3
.L6:
	ret
	.size	mult_mat_vec, .-mult_mat_vec
	.globl	triangle_area
	.type	triangle_area, @function
triangle_area:
	endbr64
	movapd	%xmm3, %xmm6
	subsd	%xmm5, %xmm6
	mulsd	%xmm0, %xmm6
	subsd	%xmm1, %xmm5
	mulsd	%xmm2, %xmm5
	addsd	%xmm5, %xmm6
	subsd	%xmm3, %xmm1
	mulsd	%xmm4, %xmm1
	addsd	%xmm1, %xmm6
	movapd	%xmm6, %xmm0
	mulsd	.LC1(%rip), %xmm0
	ret
	.size	triangle_area, .-triangle_area
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC10:
	.string	"\033[H"
	.text
	.globl	render
	.type	render, @function
render:
	endbr64
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbp
	pushq	%rbx
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$1144, %rsp
	movq	%fs:40, %rax
	movq	%rax, 13416(%rsp)
	xorl	%eax, %eax
	movl	$0, %esi
	jmp	.L9
.L10:
	movslq	%eax, %rcx
	movslq	%esi, %rdx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rcx,%rdx,2), %rdx
	movq	.LC4(%rip), %rdi
	movq	%rdi, 1408(%rsp,%rdx,8)
	addl	$1, %eax
.L11:
	cmpl	$49, %eax
	jle	.L10
	addl	$1, %esi
.L9:
	cmpl	$29, %esi
	jg	.L63
	movl	$0, %eax
	jmp	.L11
.L63:
	movq	.LC5(%rip), %rbp
	movq	%rbp, 128(%rsp)
	movq	$0x000000000, 136(%rsp)
	movq	$0x000000000, 144(%rsp)
	movq	$0x000000000, 152(%rsp)
	movq	$0x000000000, 160(%rsp)
	movq	rot_time(%rip), %rbx
	movq	%rbx, %xmm0
	mulsd	.LC6(%rip), %xmm0
	divsd	.LC7(%rip), %xmm0
	movq	%xmm0, %r13
	call	cos@PLT
	movq	%xmm0, %r12
	movsd	%xmm0, 168(%rsp)
	movq	%r13, %xmm0
	call	sin@PLT
	movsd	%xmm0, 176(%rsp)
	movq	$0x000000000, 184(%rsp)
	movq	$0x000000000, 192(%rsp)
	xorpd	.LC8(%rip), %xmm0
	movsd	%xmm0, 200(%rsp)
	movq	%r12, 208(%rsp)
	movq	$0x000000000, 216(%rsp)
	movq	$0x000000000, 224(%rsp)
	movq	$0x000000000, 232(%rsp)
	movq	$0x000000000, 240(%rsp)
	movq	%rbp, 248(%rsp)
	movq	%rbx, %xmm0
	mulsd	.LC9(%rip), %xmm0
	mulsd	.LC6(%rip), %xmm0
	divsd	.LC7(%rip), %xmm0
	movq	%xmm0, %rbx
	call	cos@PLT
	movq	%xmm0, %r12
	movsd	%xmm0, 256(%rsp)
	movq	$0x000000000, 264(%rsp)
	movq	%rbx, %xmm0
	call	sin@PLT
	movapd	%xmm0, %xmm1
	xorpd	.LC8(%rip), %xmm1
	movsd	%xmm1, 272(%rsp)
	movq	$0x000000000, 280(%rsp)
	movq	$0x000000000, 288(%rsp)
	movq	%rbp, 296(%rsp)
	movq	$0x000000000, 304(%rsp)
	movq	$0x000000000, 312(%rsp)
	movsd	%xmm0, 320(%rsp)
	movq	$0x000000000, 328(%rsp)
	movq	%r12, 336(%rsp)
	movq	$0x000000000, 344(%rsp)
	movq	$0x000000000, 352(%rsp)
	movq	$0x000000000, 360(%rsp)
	movq	$0x000000000, 368(%rsp)
	movq	%rbp, 376(%rsp)
	movl	$0, %ebp
	jmp	.L12
.L13:
	movslq	%ebp, %rbx
	salq	$5, %rbx
	leaq	model_coords(%rip), %rdx
	addq	%rbx, %rdx
	leaq	384(%rsp,%rbx), %r13
	leaq	128(%rsp), %rsi
	movq	%r13, %rdi
	call	mult_mat_vec
	leaq	640(%rsp,%rbx), %r12
	leaq	256(%rsp), %rsi
	movq	%r13, %rdx
	movq	%r12, %rdi
	call	mult_mat_vec
	leaq	896(%rsp,%rbx), %rdi
	movq	%r12, %rdx
	leaq	model_view(%rip), %rsi
	call	mult_mat_vec
	addl	$1, %ebp
.L12:
	cmpl	$7, %ebp
	jle	.L13
	movl	$0, %ebx
	jmp	.L14
.L15:
	movslq	%ebx, %rax
	salq	$5, %rax
	leaq	896(%rsp,%rax), %rdx
	leaq	1152(%rsp,%rax), %rdi
	leaq	viewport(%rip), %rsi
	call	mult_mat_vec
	addl	$1, %ebx
.L14:
	cmpl	$7, %ebx
	jle	.L15
	movl	$0, %r12d
	movsd	.LC2(%rip), %xmm5
	movsd	%xmm5, 16(%rsp)
	movsd	.LC3(%rip), %xmm5
	movsd	%xmm5, 8(%rsp)
	jmp	.L16
.L24:
	addl	$1, %edx
.L17:
	cmpl	$2, %edx
	jg	.L64
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ebx, %xmm0
	movslq	%edx, %rcx
	movslq	%r12d, %rax
	leaq	(%rax,%rax,2), %rax
	addq	%rcx, %rax
	leaq	triangle_coords(%rip), %rcx
	movl	(%rcx,%rax,4), %eax
	movslq	%eax, %rcx
	salq	$5, %rcx
	movsd	1152(%rsp,%rcx), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L18
	cvttsd2sil	%xmm1, %ebx
.L18:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	116(%rsp), %xmm0
	comisd	%xmm1, %xmm0
	ja	.L19
	cvttsd2sil	%xmm1, %esi
	movl	%esi, 116(%rsp)
.L19:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	120(%rsp), %xmm0
	movslq	%eax, %rcx
	salq	$5, %rcx
	movsd	1160(%rsp,%rcx), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L20
	cvttsd2sil	%xmm1, %esi
	movl	%esi, 120(%rsp)
.L20:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ebp, %xmm0
	comisd	%xmm1, %xmm0
	ja	.L21
	cvttsd2sil	%xmm1, %ebp
.L21:
	cltq
	salq	$5, %rax
	movsd	1168(%rsp,%rax), %xmm0
	comisd	8(%rsp), %xmm0
	ja	.L22
	movsd	%xmm0, 8(%rsp)
.L22:
	movsd	16(%rsp), %xmm2
	comisd	%xmm0, %xmm2
	ja	.L24
	movsd	%xmm0, 16(%rsp)
	jmp	.L24
.L64:
	leaq	triangle_coords(%rip), %rsi
	movslq	%r12d, %rcx
	leaq	(%rcx,%rcx), %rax
	leaq	(%rax,%rcx), %rdx
	movl	4(%rsi,%rdx,4), %r14d
	movslq	%r14d, %rdx
	salq	$5, %rdx
	movsd	1152(%rsp,%rdx), %xmm2
	movsd	%xmm2, 72(%rsp)
	movsd	1160(%rsp,%rdx), %xmm3
	movsd	%xmm3, 80(%rsp)
	addq	%rcx, %rax
	movl	8(%rsi,%rax,4), %r15d
	movslq	%r15d, %rax
	salq	$5, %rax
	movsd	1152(%rsp,%rax), %xmm4
	movsd	%xmm4, 88(%rsp)
	movsd	1160(%rsp,%rax), %xmm5
	movsd	%xmm5, 96(%rsp)
	movsd	64(%rsp), %xmm1
	movsd	56(%rsp), %xmm0
	call	triangle_area
	movapd	%xmm0, %xmm2
	pxor	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm2
	jp	.L58
	jne	.L58
.L27:
	addl	$1, %r12d
.L16:
	cmpl	$11, %r12d
	jg	.L65
	movslq	%r12d, %rax
	leaq	(%rax,%rax,2), %rdx
	leaq	triangle_coords(%rip), %rax
	movl	(%rax,%rdx,4), %r13d
	movslq	%r13d, %rax
	salq	$5, %rax
	movsd	1152(%rsp,%rax), %xmm5
	movsd	%xmm5, 56(%rsp)
	cvttsd2sil	%xmm5, %ebx
	movsd	1160(%rsp,%rax), %xmm2
	movsd	%xmm2, 64(%rsp)
	cvttsd2sil	%xmm2, %eax
	movl	%eax, 120(%rsp)
	movl	%eax, %ebp
	movl	%ebx, 116(%rsp)
	movl	$1, %edx
	jmp	.L17
.L58:
	testl	%ebx, %ebx
	movl	$0, %edx
	cmovs	%edx, %ebx
	movl	%r12d, 124(%rsp)
	movsd	%xmm2, 24(%rsp)
	jmp	.L29
.L61:
	pxor	%xmm1, %xmm1
	movsd	48(%rsp), %xmm5
	comisd	%xmm1, %xmm5
	ja	.L33
	movsd	104(%rsp), %xmm2
	comisd	%xmm1, %xmm2
	ja	.L33
	comisd	%xmm1, %xmm0
	jbe	.L34
.L33:
	addl	$1, %r12d
.L30:
	movl	$29, %eax
	cmpl	%eax, %ebp
	cmovle	%ebp, %eax
	cmpl	%r12d, %eax
	jl	.L66
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%r12d, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ebx, %xmm0
	movsd	96(%rsp), %xmm5
	movsd	88(%rsp), %xmm4
	movsd	80(%rsp), %xmm3
	movsd	72(%rsp), %xmm2
	movsd	%xmm1, 32(%rsp)
	movsd	%xmm0, 40(%rsp)
	call	triangle_area
	movapd	%xmm0, %xmm4
	divsd	24(%rsp), %xmm4
	movsd	%xmm4, 48(%rsp)
	movsd	64(%rsp), %xmm5
	movsd	56(%rsp), %xmm4
	movsd	96(%rsp), %xmm3
	movsd	88(%rsp), %xmm2
	movsd	32(%rsp), %xmm1
	movsd	40(%rsp), %xmm0
	call	triangle_area
	movapd	%xmm0, %xmm6
	divsd	24(%rsp), %xmm6
	movsd	%xmm6, 104(%rsp)
	movsd	80(%rsp), %xmm5
	movsd	72(%rsp), %xmm4
	movsd	64(%rsp), %xmm3
	movsd	56(%rsp), %xmm2
	movsd	32(%rsp), %xmm1
	movsd	40(%rsp), %xmm0
	call	triangle_area
	movsd	24(%rsp), %xmm7
	divsd	%xmm7, %xmm0
	pxor	%xmm1, %xmm1
	comisd	%xmm1, %xmm7
	jbe	.L61
	comisd	48(%rsp), %xmm1
	ja	.L33
	comisd	104(%rsp), %xmm1
	ja	.L33
	comisd	%xmm0, %xmm1
	ja	.L33
.L34:
	movslq	%r13d, %rax
	salq	$5, %rax
	movsd	48(%rsp), %xmm1
	mulsd	1168(%rsp,%rax), %xmm1
	movslq	%r14d, %rax
	salq	$5, %rax
	movsd	104(%rsp), %xmm3
	mulsd	1168(%rsp,%rax), %xmm3
	addsd	%xmm3, %xmm1
	movslq	%r15d, %rax
	salq	$5, %rax
	mulsd	1168(%rsp,%rax), %xmm0
	addsd	%xmm1, %xmm0
	movslq	%ebx, %rax
	movslq	%r12d, %rdx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rax,%rdx,2), %rax
	comisd	1408(%rsp,%rax,8), %xmm0
	jbe	.L33
	movslq	%ebx, %rax
	movslq	%r12d, %rdx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rax,%rdx,2), %rax
	movsd	%xmm0, 1408(%rsp,%rax,8)
	jmp	.L33
.L66:
	addl	$1, %ebx
.L29:
	movl	$49, %eax
	movl	116(%rsp), %esi
	cmpl	%eax, %esi
	cmovle	%esi, %eax
	cmpl	%ebx, %eax
	jl	.L67
	movl	120(%rsp), %eax
	testl	%eax, %eax
	movl	$0, %r12d
	cmovns	%eax, %r12d
	jmp	.L30
.L67:
	movl	124(%rsp), %r12d
	jmp	.L27
.L65:
	leaq	.LC10(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %ebp
	jmp	.L39
.L49:
	movl	$39, %edi
	call	putchar@PLT
	jmp	.L50
.L48:
	movl	$59, %edi
	call	putchar@PLT
	jmp	.L50
.L47:
	movl	$43, %edi
	call	putchar@PLT
	jmp	.L50
.L46:
	movl	$79, %edi
	call	putchar@PLT
	jmp	.L50
.L45:
	movl	$35, %edi
	call	putchar@PLT
	jmp	.L50
.L44:
	movl	$38, %edi
	call	putchar@PLT
	jmp	.L50
.L43:
	movl	$64, %edi
	call	putchar@PLT
	jmp	.L50
.L40:
	movl	$36, %edi
	call	putchar@PLT
.L50:
	movl	$32, %edi
	call	putchar@PLT
	addl	$1, %ebx
.L52:
	cmpl	$49, %ebx
	jg	.L68
	movslq	%ebx, %rax
	movslq	%ebp, %rdx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	(%rax,%rdx,2), %rax
	movsd	1408(%rsp,%rax,8), %xmm0
	movsd	8(%rsp), %xmm6
	subsd	%xmm6, %xmm0
	movsd	16(%rsp), %xmm1
	subsd	%xmm6, %xmm1
	divsd	%xmm1, %xmm0
	mulsd	.LC11(%rip), %xmm0
	cvttsd2sil	%xmm0, %eax
	cmpl	$7, %eax
	jg	.L40
	ja	.L41
	movl	%eax, %eax
	leaq	.L42(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L42:
	.long	.L49-.L42
	.long	.L48-.L42
	.long	.L47-.L42
	.long	.L46-.L42
	.long	.L45-.L42
	.long	.L44-.L42
	.long	.L43-.L42
	.long	.L40-.L42
	.text
.L41:
	movl	$32, %edi
	call	putchar@PLT
	jmp	.L50
.L68:
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, %ebp
.L39:
	cmpl	$29, %ebp
	jg	.L69
	movl	$0, %ebx
	jmp	.L52
.L69:
	movl	$10, %edi
	call	putchar@PLT
	movl	$10, %edi
	call	putchar@PLT
	movq	13416(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L70
	addq	$13432, %rsp
	popq	%rbx
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L70:
	call	__stack_chk_fail@PLT
	.size	render, .-render
	.globl	main
	.type	main, @function
main:
	endbr64
	pushq	%rax
	popq	%rax
	subq	$8, %rsp
.L72:
	movl	$0, %eax
	call	render
	movsd	.LC12(%rip), %xmm0
	addsd	rot_time(%rip), %xmm0
	movsd	%xmm0, rot_time(%rip)
	jmp	.L72
	.size	main, .-main
	.globl	rot_time
	.bss
	.align 8
	.type	rot_time, @object
	.size	rot_time, 8
rot_time:
	.zero	8
	.globl	viewport
	.data
	.align 32
	.type	viewport, @object
	.size	viewport, 128
viewport:
	.long	0
	.long	1077477376
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1077444608
	.long	0
	.long	0
	.long	0
	.long	1076756480
	.long	0
	.long	0
	.long	0
	.long	1076690944
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.globl	model_view
	.align 32
	.type	model_view, @object
	.size	model_view, 128
model_view:
	.long	0
	.long	1071644672
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1071644672
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1071644672
	.long	0
	.long	1072693248
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1072693248
	.globl	triangle_coords
	.align 32
	.type	triangle_coords, @object
	.size	triangle_coords, 144
triangle_coords:
	.long	1
	.long	5
	.long	7
	.long	1
	.long	7
	.long	3
	.long	0
	.long	2
	.long	6
	.long	0
	.long	6
	.long	4
	.long	0
	.long	1
	.long	3
	.long	0
	.long	3
	.long	2
	.long	4
	.long	6
	.long	7
	.long	4
	.long	7
	.long	5
	.long	2
	.long	3
	.long	7
	.long	2
	.long	7
	.long	6
	.long	0
	.long	4
	.long	5
	.long	0
	.long	5
	.long	1
	.globl	model_coords
	.align 32
	.type	model_coords, @object
	.size	model_coords, 256
model_coords:
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.long	0
	.long	1072693248
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	-1074790400
	.long	0
	.long	1072693248
	.long	0
	.long	-1074790400
	.long	0
	.long	1072693248
	.long	0
	.long	-1074790400
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	-1074790400
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	-1074790400
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1071644672
	.align 8
.LC2:
	.long	0
	.long	-1043477147
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.align 8
.LC4:
	.long	0
	.long	-1071382528
	.align 8
.LC5:
	.long	0
	.long	1072693248
	.align 8
.LC6:
	.long	1413754136
	.long	1074340347
	.align 8
.LC7:
	.long	0
	.long	1080459264
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC8:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC9:
	.long	0
	.long	1074266112
	.align 8
.LC11:
	.long	0
	.long	1075838976
	.align 8
.LC12:
	.long	1202590843
	.long	1065646817
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
