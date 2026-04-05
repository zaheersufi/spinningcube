	.file	"cube.c"
	.text
	.p2align 4
	.globl	mult_mat_vec
	.type	mult_mat_vec, @function
mult_mat_vec:
.LFB49:
	.cfi_startproc
	endbr64
	leaq	128(%rsi), %rcx
	movq	%rsi, %rax
	leaq	32(%rdi), %rsi
	cmpq	%rcx, %rdi
	setnb	%cl
	cmpq	%rsi, %rax
	setnb	%sil
	orb	%sil, %cl
	je	.L2
	leaq	31(%rdi), %rcx
	subq	%rdx, %rcx
	cmpq	$62, %rcx
	jbe	.L2
	pxor	%xmm6, %xmm6
	movsd	(%rdx), %xmm7
	movsd	8(%rdx), %xmm5
	movsd	16(%rdx), %xmm4
	movsd	24(%rdx), %xmm3
	movups	%xmm6, (%rdi)
	movupd	(%rax), %xmm1
	movupd	32(%rax), %xmm10
	unpcklpd	%xmm7, %xmm7
	unpcklpd	%xmm5, %xmm5
	movupd	16(%rax), %xmm2
	movlpd	8(%rax), %xmm2
	unpcklpd	%xmm4, %xmm4
	unpcklpd	%xmm3, %xmm3
	movhpd	16(%rax), %xmm1
	movhpd	48(%rax), %xmm10
	movupd	48(%rax), %xmm8
	movlpd	40(%rax), %xmm8
	movapd	%xmm1, %xmm0
	movapd	%xmm2, %xmm9
	unpckhpd	%xmm10, %xmm1
	movups	%xmm6, 16(%rdi)
	unpcklpd	%xmm10, %xmm0
	unpcklpd	%xmm8, %xmm9
	unpckhpd	%xmm8, %xmm2
	mulpd	%xmm7, %xmm0
	mulpd	%xmm5, %xmm9
	mulpd	%xmm4, %xmm1
	mulpd	%xmm3, %xmm2
	addpd	%xmm6, %xmm0
	addpd	%xmm9, %xmm0
	addpd	%xmm1, %xmm0
	addpd	%xmm2, %xmm0
	movups	%xmm0, (%rdi)
	movupd	64(%rax), %xmm1
	movupd	80(%rax), %xmm9
	movupd	96(%rax), %xmm8
	movupd	112(%rax), %xmm0
	movapd	%xmm1, %xmm2
	unpckhpd	%xmm9, %xmm1
	unpcklpd	%xmm9, %xmm2
	movapd	%xmm8, %xmm9
	unpckhpd	%xmm0, %xmm8
	unpcklpd	%xmm0, %xmm9
	movapd	%xmm2, %xmm0
	unpcklpd	%xmm9, %xmm0
	unpckhpd	%xmm9, %xmm2
	mulpd	%xmm7, %xmm0
	mulpd	%xmm4, %xmm2
	addpd	%xmm6, %xmm0
	movapd	%xmm1, %xmm6
	unpckhpd	%xmm8, %xmm1
	mulpd	%xmm3, %xmm1
	unpcklpd	%xmm8, %xmm6
	mulpd	%xmm6, %xmm5
	addpd	%xmm5, %xmm0
	addpd	%xmm2, %xmm0
	addpd	%xmm1, %xmm0
	movups	%xmm0, 16(%rdi)
	ret
.L2:
	pxor	%xmm2, %xmm2
	movsd	%xmm2, (%rdi)
	movsd	(%rax), %xmm0
	mulsd	(%rdx), %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, (%rdi)
	movsd	8(%rax), %xmm1
	mulsd	8(%rdx), %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, (%rdi)
	movsd	16(%rax), %xmm0
	mulsd	16(%rdx), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdi)
	movsd	24(%rax), %xmm1
	mulsd	24(%rdx), %xmm1
	movsd	%xmm2, 8(%rdi)
	addsd	%xmm0, %xmm1
	movsd	%xmm1, (%rdi)
	movsd	32(%rax), %xmm0
	mulsd	(%rdx), %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, 8(%rdi)
	movsd	40(%rax), %xmm1
	mulsd	8(%rdx), %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rdi)
	movsd	48(%rax), %xmm0
	mulsd	16(%rdx), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rdi)
	movsd	56(%rax), %xmm1
	mulsd	24(%rdx), %xmm1
	movsd	%xmm2, 16(%rdi)
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 8(%rdi)
	movsd	64(%rax), %xmm0
	mulsd	(%rdx), %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, 16(%rdi)
	movsd	72(%rax), %xmm1
	mulsd	8(%rdx), %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 16(%rdi)
	movsd	80(%rax), %xmm0
	mulsd	16(%rdx), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 16(%rdi)
	movsd	88(%rax), %xmm1
	mulsd	24(%rdx), %xmm1
	movsd	%xmm2, 24(%rdi)
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 16(%rdi)
	movsd	96(%rax), %xmm0
	mulsd	(%rdx), %xmm0
	addsd	%xmm2, %xmm0
	movsd	%xmm0, 24(%rdi)
	movsd	104(%rax), %xmm1
	mulsd	8(%rdx), %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 24(%rdi)
	movsd	112(%rax), %xmm0
	mulsd	16(%rdx), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 24(%rdi)
	movsd	120(%rax), %xmm1
	mulsd	24(%rdx), %xmm1
	addsd	%xmm0, %xmm1
	movsd	%xmm1, 24(%rdi)
	ret
	.cfi_endproc
.LFE49:
	.size	mult_mat_vec, .-mult_mat_vec
	.p2align 4
	.globl	triangle_area
	.type	triangle_area, @function
triangle_area:
.LFB50:
	.cfi_startproc
	endbr64
	movapd	%xmm3, %xmm6
	subsd	%xmm5, %xmm6
	subsd	%xmm1, %xmm5
	subsd	%xmm3, %xmm1
	mulsd	%xmm0, %xmm6
	movsd	.LC2(%rip), %xmm0
	mulsd	%xmm2, %xmm5
	mulsd	%xmm4, %xmm1
	addsd	%xmm5, %xmm6
	addsd	%xmm1, %xmm6
	mulsd	%xmm6, %xmm0
	ret
	.cfi_endproc
.LFE50:
	.size	triangle_area, .-triangle_area
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC11:
	.string	"\033[H"
	.text
	.p2align 4
	.globl	render
	.type	render, @function
render:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$4096, %rsp
	.cfi_def_cfa_offset 4152
	orq	$0, (%rsp)
	subq	$4096, %rsp
	.cfi_def_cfa_offset 8248
	orq	$0, (%rsp)
	subq	$4096, %rsp
	.cfi_def_cfa_offset 12344
	orq	$0, (%rsp)
	subq	$1048, %rsp
	.cfi_def_cfa_offset 13392
	movsd	.LC6(%rip), %xmm0
	unpcklpd	%xmm0, %xmm0
	movq	%fs:40, %rax
	movq	%rax, 13320(%rsp)
	xorl	%eax, %eax
	leaq	1312(%rsp), %r12
	leaq	1712(%rsp), %rbx
	movq	%r12, %rcx
	leaq	13712(%rsp), %rbp
	movq	%rbx, %rdx
	.p2align 4,,10
	.p2align 3
.L13:
	movq	%rdx, %rsi
	movq	%rcx, %rax
	subq	%rcx, %rsi
	andl	$16, %esi
	je	.L14
	leaq	16(%rcx), %rax
	movaps	%xmm0, (%rcx)
	cmpq	%rdx, %rax
	je	.L92
	.p2align 4,,10
	.p2align 3
.L14:
	movaps	%xmm0, (%rax)
	addq	$32, %rax
	movaps	%xmm0, -16(%rax)
	cmpq	%rdx, %rax
	jne	.L14
.L92:
	leaq	400(%rax), %rdx
	addq	$400, %rcx
	cmpq	%rbp, %rdx
	jne	.L13
	movsd	rot_time(%rip), %xmm1
	movsd	.LC7(%rip), %xmm0
	leaq	280(%rsp), %r13
	leaq	272(%rsp), %r14
	movq	%r14, %rsi
	movq	%r13, %rdi
	mulsd	%xmm1, %xmm0
	movsd	%xmm1, 48(%rsp)
	divsd	.LC8(%rip), %xmm0
	call	sincos@PLT
	movq	%r14, %rsi
	movsd	280(%rsp), %xmm10
	movq	.LC9(%rip), %xmm7
	movsd	48(%rsp), %xmm1
	movq	%r13, %rdi
	mulsd	.LC10(%rip), %xmm1
	movapd	%xmm10, %xmm14
	movsd	272(%rsp), %xmm9
	movsd	%xmm10, 16(%rsp)
	mulsd	.LC7(%rip), %xmm1
	xorpd	%xmm7, %xmm14
	divsd	.LC8(%rip), %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm9, 32(%rsp)
	movsd	%xmm14, (%rsp)
	call	sincos@PLT
	movsd	32(%rsp), %xmm9
	pxor	%xmm2, %xmm2
	movsd	280(%rsp), %xmm0
	movq	.LC9(%rip), %xmm7
	movsd	(%rsp), %xmm14
	leaq	800(%rsp), %rax
	leaq	544(%rsp), %rsi
	movapd	%xmm0, %xmm6
	movsd	16(%rsp), %xmm10
	movsd	272(%rsp), %xmm13
	unpcklpd	%xmm9, %xmm9
	unpcklpd	%xmm6, %xmm6
	xorpd	%xmm0, %xmm7
	unpcklpd	%xmm14, %xmm14
	unpcklpd	%xmm10, %xmm10
	movaps	%xmm6, 256(%rsp)
	unpcklpd	%xmm7, %xmm7
	movsd	model_view(%rip), %xmm6
	unpcklpd	%xmm13, %xmm13
	leaq	288(%rsp), %rcx
	leaq	model_coords(%rip), %rdx
	unpcklpd	%xmm6, %xmm6
	leaq	1056(%rsp), %rdi
	movaps	%xmm6, 240(%rsp)
	movsd	8+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 224(%rsp)
	movsd	16+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 208(%rsp)
	movsd	24+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 192(%rsp)
	movsd	32+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 176(%rsp)
	movsd	40+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 160(%rsp)
	movsd	48+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 144(%rsp)
	movsd	56+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 128(%rsp)
	movsd	64+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 112(%rsp)
	movsd	72+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 96(%rsp)
	movsd	80+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 80(%rsp)
	movsd	88+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 64(%rsp)
	movsd	96+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 48(%rsp)
	movsd	104+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 32(%rsp)
	movsd	112+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, 16(%rsp)
	movsd	120+model_view(%rip), %xmm6
	unpcklpd	%xmm6, %xmm6
	movaps	%xmm6, (%rsp)
.L16:
	movapd	(%rdx), %xmm15
	movapd	32(%rdx), %xmm3
	movapd	%xmm10, %xmm12
	addq	$64, %rax
	movapd	16(%rdx), %xmm5
	movlpd	8(%rdx), %xmm5
	addq	$64, %rsi
	addq	$64, %rcx
	movhpd	16(%rdx), %xmm15
	movhpd	48(%rdx), %xmm3
	movapd	48(%rdx), %xmm0
	addq	$64, %rdx
	movlpd	-24(%rdx), %xmm0
	movapd	%xmm15, %xmm1
	movapd	%xmm5, %xmm4
	unpckhpd	%xmm3, %xmm15
	mulpd	%xmm15, %xmm12
	unpcklpd	%xmm3, %xmm1
	movapd	%xmm9, %xmm3
	unpcklpd	%xmm0, %xmm4
	unpckhpd	%xmm0, %xmm5
	movapd	%xmm1, %xmm0
	mulpd	%xmm2, %xmm1
	movapd	%xmm4, %xmm8
	movapd	%xmm15, %xmm6
	mulpd	%xmm4, %xmm3
	addpd	%xmm2, %xmm0
	movapd	%xmm5, %xmm11
	mulpd	%xmm2, %xmm8
	mulpd	%xmm14, %xmm4
	mulpd	%xmm2, %xmm6
	addpd	%xmm2, %xmm1
	mulpd	%xmm9, %xmm15
	mulpd	%xmm2, %xmm11
	addpd	%xmm8, %xmm0
	addpd	%xmm1, %xmm3
	addpd	%xmm6, %xmm0
	addpd	%xmm12, %xmm3
	movapd	%xmm4, %xmm12
	movapd	%xmm1, %xmm4
	addpd	%xmm1, %xmm12
	addpd	%xmm8, %xmm4
	addpd	%xmm11, %xmm0
	addpd	%xmm11, %xmm3
	addpd	%xmm6, %xmm4
	addpd	%xmm15, %xmm12
	movapd	%xmm0, %xmm1
	movapd	%xmm3, %xmm8
	movapd	%xmm3, %xmm6
	addpd	%xmm11, %xmm12
	addpd	%xmm5, %xmm4
	movapd	%xmm0, %xmm5
	unpcklpd	%xmm4, %xmm8
	unpcklpd	%xmm12, %xmm5
	unpckhpd	%xmm4, %xmm6
	unpckhpd	%xmm12, %xmm1
	movapd	%xmm5, %xmm11
	unpckhpd	%xmm8, %xmm5
	movaps	%xmm5, -48(%rcx)
	movapd	%xmm1, %xmm5
	unpckhpd	%xmm6, %xmm1
	unpcklpd	%xmm8, %xmm11
	movaps	%xmm1, -16(%rcx)
	movapd	%xmm13, %xmm1
	unpcklpd	%xmm6, %xmm5
	movapd	%xmm3, %xmm6
	mulpd	%xmm0, %xmm1
	movaps	%xmm5, -32(%rcx)
	movapd	%xmm7, %xmm5
	movapd	%xmm4, %xmm8
	mulpd	%xmm2, %xmm6
	movaps	%xmm11, -64(%rcx)
	movapd	%xmm12, %xmm11
	mulpd	%xmm12, %xmm5
	mulpd	%xmm2, %xmm11
	mulpd	%xmm13, %xmm12
	addpd	%xmm2, %xmm1
	mulpd	%xmm2, %xmm8
	addpd	%xmm6, %xmm1
	addpd	%xmm5, %xmm1
	movapd	%xmm0, %xmm5
	mulpd	%xmm2, %xmm5
	mulpd	256(%rsp), %xmm0
	addpd	%xmm8, %xmm1
	addpd	%xmm2, %xmm5
	addpd	%xmm2, %xmm0
	addpd	%xmm5, %xmm3
	addpd	%xmm6, %xmm5
	addpd	%xmm6, %xmm0
	addpd	%xmm11, %xmm3
	addpd	%xmm12, %xmm0
	addpd	%xmm8, %xmm3
	addpd	%xmm8, %xmm0
	movapd	%xmm5, %xmm8
	movapd	%xmm1, %xmm5
	addpd	%xmm11, %xmm8
	movapd	%xmm3, %xmm11
	movapd	%xmm3, %xmm6
	unpcklpd	%xmm0, %xmm5
	addpd	%xmm4, %xmm8
	movapd	%xmm1, %xmm4
	movapd	%xmm5, %xmm12
	unpckhpd	%xmm0, %xmm4
	unpcklpd	%xmm8, %xmm11
	unpckhpd	%xmm8, %xmm6
	unpckhpd	%xmm11, %xmm5
	unpcklpd	%xmm11, %xmm12
	movapd	96(%rsp), %xmm11
	movaps	%xmm5, -48(%rsi)
	movapd	%xmm4, %xmm5
	unpckhpd	%xmm6, %xmm4
	movaps	%xmm4, -16(%rsi)
	mulpd	%xmm3, %xmm11
	unpcklpd	%xmm6, %xmm5
	movapd	240(%rsp), %xmm4
	movapd	160(%rsp), %xmm6
	movaps	%xmm5, -32(%rsi)
	movapd	224(%rsp), %xmm5
	mulpd	%xmm1, %xmm4
	movaps	%xmm12, -64(%rsi)
	mulpd	%xmm3, %xmm5
	mulpd	%xmm3, %xmm6
	mulpd	32(%rsp), %xmm3
	addpd	%xmm2, %xmm4
	addpd	%xmm5, %xmm4
	movapd	208(%rsp), %xmm5
	mulpd	%xmm0, %xmm5
	addpd	%xmm5, %xmm4
	movapd	192(%rsp), %xmm5
	mulpd	%xmm8, %xmm5
	addpd	%xmm5, %xmm4
	movapd	176(%rsp), %xmm5
	mulpd	%xmm1, %xmm5
	addpd	%xmm2, %xmm5
	addpd	%xmm6, %xmm5
	movapd	144(%rsp), %xmm6
	mulpd	%xmm0, %xmm6
	addpd	%xmm6, %xmm5
	movapd	128(%rsp), %xmm6
	mulpd	%xmm8, %xmm6
	addpd	%xmm6, %xmm5
	movapd	112(%rsp), %xmm6
	mulpd	%xmm1, %xmm6
	mulpd	48(%rsp), %xmm1
	addpd	%xmm2, %xmm6
	addpd	%xmm2, %xmm1
	addpd	%xmm11, %xmm6
	movapd	80(%rsp), %xmm11
	addpd	%xmm3, %xmm1
	movapd	%xmm5, %xmm3
	mulpd	%xmm0, %xmm11
	mulpd	16(%rsp), %xmm0
	addpd	%xmm11, %xmm6
	movapd	64(%rsp), %xmm11
	addpd	%xmm1, %xmm0
	movapd	%xmm4, %xmm1
	mulpd	%xmm8, %xmm11
	mulpd	(%rsp), %xmm8
	addpd	%xmm11, %xmm6
	addpd	%xmm8, %xmm0
	unpcklpd	%xmm6, %xmm1
	unpckhpd	%xmm6, %xmm4
	unpcklpd	%xmm0, %xmm3
	unpckhpd	%xmm0, %xmm5
	movapd	%xmm1, %xmm0
	unpcklpd	%xmm3, %xmm0
	unpckhpd	%xmm3, %xmm1
	movaps	%xmm0, -64(%rax)
	movapd	%xmm4, %xmm0
	unpckhpd	%xmm5, %xmm4
	unpcklpd	%xmm5, %xmm0
	movaps	%xmm1, -48(%rax)
	movaps	%xmm0, -32(%rax)
	movaps	%xmm4, -16(%rax)
	cmpq	%rax, %rdi
	jne	.L16
	movapd	viewport(%rip), %xmm1
	movq	%rbx, %rcx
	movapd	800(%rsp), %xmm6
	leaq	triangle_coords(%rip), %rdx
	movapd	32+viewport(%rip), %xmm11
	leaq	144(%rdx), %r11
	movlpd	8+viewport(%rip), %xmm11
	movhpd	32+viewport(%rip), %xmm1
	unpcklpd	%xmm6, %xmm6
	movapd	800(%rsp), %xmm8
	movapd	64+viewport(%rip), %xmm0
	movapd	%xmm1, %xmm13
	movapd	%xmm11, %xmm14
	movapd	16+viewport(%rip), %xmm12
	movapd	816(%rsp), %xmm10
	mulpd	%xmm6, %xmm13
	unpckhpd	%xmm8, %xmm8
	movhpd	96+viewport(%rip), %xmm0
	movapd	96+viewport(%rip), %xmm4
	mulpd	%xmm8, %xmm14
	movlpd	72+viewport(%rip), %xmm4
	movhpd	48+viewport(%rip), %xmm12
	unpcklpd	%xmm10, %xmm10
	mulpd	%xmm0, %xmm6
	movapd	80+viewport(%rip), %xmm5
	movapd	48+viewport(%rip), %xmm9
	mulpd	%xmm4, %xmm8
	movapd	112+viewport(%rip), %xmm3
	movlpd	24+viewport(%rip), %xmm9
	movhpd	112+viewport(%rip), %xmm5
	movlpd	88+viewport(%rip), %xmm3
	movapd	816(%rsp), %xmm7
	addpd	%xmm2, %xmm13
	unpckhpd	%xmm7, %xmm7
	addpd	%xmm2, %xmm6
	addpd	%xmm14, %xmm13
	movapd	%xmm12, %xmm14
	mulpd	%xmm10, %xmm14
	mulpd	%xmm5, %xmm10
	addpd	%xmm8, %xmm6
	movapd	832(%rsp), %xmm8
	unpckhpd	%xmm8, %xmm8
	addpd	%xmm14, %xmm13
	movapd	%xmm9, %xmm14
	mulpd	%xmm7, %xmm14
	addpd	%xmm10, %xmm6
	movapd	848(%rsp), %xmm10
	mulpd	%xmm3, %xmm7
	unpcklpd	%xmm10, %xmm10
	addpd	%xmm14, %xmm13
	movapd	%xmm11, %xmm14
	addpd	%xmm7, %xmm6
	mulpd	%xmm8, %xmm14
	movapd	848(%rsp), %xmm7
	mulpd	%xmm4, %xmm8
	movaps	%xmm13, 1056(%rsp)
	movapd	%xmm1, %xmm13
	unpckhpd	%xmm7, %xmm7
	movaps	%xmm6, 1072(%rsp)
	movapd	832(%rsp), %xmm6
	unpcklpd	%xmm6, %xmm6
	mulpd	%xmm6, %xmm13
	mulpd	%xmm0, %xmm6
	addpd	%xmm2, %xmm13
	addpd	%xmm2, %xmm6
	addpd	%xmm14, %xmm13
	movapd	%xmm12, %xmm14
	mulpd	%xmm10, %xmm14
	addpd	%xmm8, %xmm6
	movapd	864(%rsp), %xmm8
	mulpd	%xmm5, %xmm10
	unpckhpd	%xmm8, %xmm8
	addpd	%xmm14, %xmm13
	movapd	%xmm9, %xmm14
	mulpd	%xmm7, %xmm14
	addpd	%xmm10, %xmm6
	movapd	880(%rsp), %xmm10
	mulpd	%xmm3, %xmm7
	unpcklpd	%xmm10, %xmm10
	addpd	%xmm14, %xmm13
	movapd	%xmm8, %xmm14
	addpd	%xmm7, %xmm6
	mulpd	%xmm11, %xmm14
	movapd	880(%rsp), %xmm7
	mulpd	%xmm4, %xmm8
	movaps	%xmm13, 1088(%rsp)
	unpckhpd	%xmm7, %xmm7
	movaps	%xmm6, 1104(%rsp)
	movapd	864(%rsp), %xmm6
	unpcklpd	%xmm6, %xmm6
	movapd	%xmm6, %xmm13
	mulpd	%xmm1, %xmm13
	mulpd	%xmm0, %xmm6
	addpd	%xmm2, %xmm13
	addpd	%xmm2, %xmm6
	addpd	%xmm14, %xmm13
	movapd	%xmm10, %xmm14
	mulpd	%xmm12, %xmm14
	addpd	%xmm8, %xmm6
	mulpd	%xmm5, %xmm10
	addpd	%xmm14, %xmm13
	movapd	%xmm9, %xmm14
	mulpd	%xmm7, %xmm14
	addpd	%xmm10, %xmm6
	mulpd	%xmm3, %xmm7
	addpd	%xmm14, %xmm13
	addpd	%xmm7, %xmm6
	movaps	%xmm13, 1120(%rsp)
	movapd	896(%rsp), %xmm8
	movapd	912(%rsp), %xmm10
	movaps	%xmm6, 1136(%rsp)
	movapd	896(%rsp), %xmm6
	movapd	912(%rsp), %xmm7
	unpckhpd	%xmm8, %xmm8
	unpcklpd	%xmm10, %xmm10
	unpcklpd	%xmm6, %xmm6
	movapd	%xmm8, %xmm14
	unpckhpd	%xmm7, %xmm7
	mulpd	%xmm11, %xmm14
	movapd	%xmm6, %xmm13
	mulpd	%xmm1, %xmm13
	mulpd	%xmm0, %xmm6
	mulpd	%xmm4, %xmm8
	addpd	%xmm2, %xmm13
	addpd	%xmm2, %xmm6
	addpd	%xmm14, %xmm13
	movapd	%xmm12, %xmm14
	mulpd	%xmm10, %xmm14
	addpd	%xmm8, %xmm6
	movapd	928(%rsp), %xmm8
	mulpd	%xmm5, %xmm10
	unpckhpd	%xmm8, %xmm8
	addpd	%xmm14, %xmm13
	movapd	%xmm9, %xmm14
	mulpd	%xmm7, %xmm14
	addpd	%xmm10, %xmm6
	movapd	944(%rsp), %xmm10
	mulpd	%xmm3, %xmm7
	unpcklpd	%xmm10, %xmm10
	addpd	%xmm14, %xmm13
	movapd	%xmm8, %xmm14
	addpd	%xmm7, %xmm6
	mulpd	%xmm11, %xmm14
	movapd	944(%rsp), %xmm7
	mulpd	%xmm4, %xmm8
	movaps	%xmm13, 1152(%rsp)
	unpckhpd	%xmm7, %xmm7
	movaps	%xmm6, 1168(%rsp)
	movapd	928(%rsp), %xmm6
	unpcklpd	%xmm6, %xmm6
	movapd	%xmm6, %xmm13
	mulpd	%xmm1, %xmm13
	mulpd	%xmm0, %xmm6
	addpd	%xmm2, %xmm13
	addpd	%xmm2, %xmm6
	addpd	%xmm14, %xmm13
	movapd	%xmm10, %xmm14
	mulpd	%xmm12, %xmm14
	addpd	%xmm8, %xmm6
	movapd	960(%rsp), %xmm8
	mulpd	%xmm5, %xmm10
	unpckhpd	%xmm8, %xmm8
	addpd	%xmm14, %xmm13
	movapd	%xmm9, %xmm14
	mulpd	%xmm7, %xmm14
	addpd	%xmm10, %xmm6
	movapd	976(%rsp), %xmm10
	mulpd	%xmm3, %xmm7
	unpcklpd	%xmm10, %xmm10
	addpd	%xmm14, %xmm13
	movapd	%xmm8, %xmm14
	addpd	%xmm7, %xmm6
	mulpd	%xmm11, %xmm14
	movapd	976(%rsp), %xmm7
	mulpd	%xmm4, %xmm8
	movaps	%xmm13, 1184(%rsp)
	unpckhpd	%xmm7, %xmm7
	movaps	%xmm6, 1200(%rsp)
	movapd	960(%rsp), %xmm6
	unpcklpd	%xmm6, %xmm6
	movapd	%xmm6, %xmm13
	mulpd	%xmm1, %xmm13
	mulpd	%xmm0, %xmm6
	addpd	%xmm2, %xmm13
	addpd	%xmm2, %xmm6
	addpd	%xmm14, %xmm13
	movapd	%xmm10, %xmm14
	mulpd	%xmm12, %xmm14
	addpd	%xmm8, %xmm6
	movapd	992(%rsp), %xmm8
	mulpd	%xmm5, %xmm10
	unpckhpd	%xmm8, %xmm8
	addpd	%xmm14, %xmm13
	movapd	%xmm7, %xmm14
	mulpd	%xmm3, %xmm7
	addpd	%xmm10, %xmm6
	movapd	1008(%rsp), %xmm10
	mulpd	%xmm9, %xmm14
	unpcklpd	%xmm10, %xmm10
	addpd	%xmm7, %xmm6
	movapd	1008(%rsp), %xmm7
	addpd	%xmm14, %xmm13
	movapd	%xmm8, %xmm14
	mulpd	%xmm11, %xmm14
	unpckhpd	%xmm7, %xmm7
	movaps	%xmm6, 1232(%rsp)
	mulpd	%xmm4, %xmm8
	movapd	992(%rsp), %xmm6
	movaps	%xmm13, 1216(%rsp)
	movapd	%xmm1, %xmm13
	unpcklpd	%xmm6, %xmm6
	mulpd	%xmm6, %xmm13
	mulpd	%xmm0, %xmm6
	addpd	%xmm2, %xmm13
	addpd	%xmm2, %xmm6
	addpd	%xmm14, %xmm13
	movapd	%xmm12, %xmm14
	mulpd	%xmm10, %xmm14
	addpd	%xmm8, %xmm6
	movapd	1024(%rsp), %xmm8
	mulpd	%xmm5, %xmm10
	unpckhpd	%xmm8, %xmm8
	mulpd	%xmm8, %xmm11
	mulpd	%xmm8, %xmm4
	addpd	%xmm14, %xmm13
	movapd	%xmm9, %xmm14
	addpd	%xmm10, %xmm6
	mulpd	%xmm7, %xmm14
	movapd	1024(%rsp), %xmm10
	mulpd	%xmm3, %xmm7
	unpcklpd	%xmm10, %xmm10
	mulpd	%xmm10, %xmm1
	mulpd	%xmm10, %xmm0
	addpd	%xmm14, %xmm13
	addpd	%xmm7, %xmm6
	movapd	1040(%rsp), %xmm7
	addpd	%xmm2, %xmm1
	unpcklpd	%xmm7, %xmm7
	movaps	%xmm13, 1248(%rsp)
	pxor	%xmm13, %xmm13
	addpd	%xmm2, %xmm0
	movaps	%xmm6, 1264(%rsp)
	mulpd	%xmm7, %xmm12
	movapd	1040(%rsp), %xmm6
	mulpd	%xmm7, %xmm5
	addpd	%xmm11, %xmm1
	unpckhpd	%xmm6, %xmm6
	addpd	%xmm4, %xmm0
	mulpd	%xmm6, %xmm9
	mulpd	%xmm6, %xmm3
	addpd	%xmm12, %xmm1
	movsd	.LC3(%rip), %xmm12
	addpd	%xmm5, %xmm0
	movapd	%xmm12, %xmm15
	addpd	%xmm9, %xmm1
	addpd	%xmm3, %xmm0
	movaps	%xmm1, 1280(%rsp)
	movaps	%xmm0, 1296(%rsp)
	movsd	.LC4(%rip), %xmm11
	movsd	.LC2(%rip), %xmm14
	movapd	%xmm11, %xmm12
	jmp	.L35
.L87:
	comisd	%xmm8, %xmm1
	movapd	%xmm0, %xmm3
	jbe	.L94
.L18:
	pxor	%xmm11, %xmm11
	movq	%rax, %r9
	pxor	%xmm4, %xmm4
	salq	$5, %r9
	cvtsi2sdl	%esi, %xmm11
	movsd	1064(%rsp,%r9), %xmm7
	cvttsd2sil	%xmm7, %r9d
	comisd	%xmm11, %xmm7
	cvtsi2sdl	%r9d, %xmm4
	ja	.L19
	comisd	%xmm7, %xmm11
	movapd	%xmm4, %xmm2
	jbe	.L95
.L20:
	salq	$5, %rax
	movsd	1072(%rsp,%rax), %xmm0
	movslq	8(%rdx), %rax
	movq	%rax, %rbx
	minsd	%xmm0, %xmm12
	maxsd	%xmm0, %xmm15
	salq	$5, %rbx
	movsd	1056(%rsp,%rbx), %xmm6
	comisd	%xmm3, %xmm6
	ja	.L25
	cvttsd2sil	%xmm6, %edi
.L25:
	comisd	%xmm6, %xmm1
	ja	.L26
	cvttsd2sil	%xmm6, %r10d
.L26:
	movq	%rax, %rbx
	salq	$5, %rbx
	movsd	1064(%rsp,%rbx), %xmm5
	comisd	%xmm2, %xmm5
	ja	.L27
	cvttsd2sil	%xmm5, %r9d
.L27:
	comisd	%xmm5, %xmm11
	ja	.L28
	cvttsd2sil	%xmm5, %esi
.L28:
	movapd	%xmm7, %xmm4
	movapd	%xmm5, %xmm3
	movapd	%xmm9, %xmm11
	salq	$5, %rax
	subsd	%xmm5, %xmm4
	subsd	%xmm9, %xmm3
	movsd	1072(%rsp,%rax), %xmm1
	subsd	%xmm7, %xmm11
	minsd	%xmm1, %xmm12
	maxsd	%xmm1, %xmm15
	movsd	%xmm4, 64(%rsp)
	mulsd	%xmm10, %xmm4
	movsd	%xmm3, 32(%rsp)
	movsd	%xmm11, 48(%rsp)
	movapd	%xmm4, %xmm2
	movapd	%xmm3, %xmm4
	mulsd	%xmm8, %xmm4
	addsd	%xmm2, %xmm4
	movapd	%xmm11, %xmm2
	mulsd	%xmm6, %xmm2
	addsd	%xmm2, %xmm4
	mulsd	%xmm14, %xmm4
	ucomisd	%xmm13, %xmm4
	jp	.L33
	jne	.L33
.L37:
	addq	$12, %rdx
	cmpq	%r11, %rdx
	je	.L96
.L35:
	movslq	(%rdx), %r8
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	movq	%r8, %rax
	salq	$5, %rax
	movsd	1056(%rsp,%rax), %xmm10
	movsd	1064(%rsp,%rax), %xmm9
	movslq	4(%rdx), %rax
	cvttsd2sil	%xmm10, %r10d
	movq	%rax, %rdi
	cvttsd2sil	%xmm9, %esi
	salq	$5, %rdi
	movsd	1056(%rsp,%rdi), %xmm8
	cvtsi2sdl	%r10d, %xmm1
	cvttsd2sil	%xmm8, %edi
	comisd	%xmm1, %xmm8
	cvtsi2sdl	%edi, %xmm0
	jbe	.L87
.L17:
	movl	%r10d, %r9d
	movapd	%xmm1, %xmm3
	movapd	%xmm0, %xmm1
	movl	%edi, %r10d
	movl	%r9d, %edi
	jmp	.L18
.L95:
	movapd	%xmm4, %xmm11
	movl	%r9d, %esi
.L19:
	movl	%esi, %ebx
	movapd	%xmm11, %xmm2
	movapd	%xmm4, %xmm11
	movl	%r9d, %esi
	movl	%ebx, %r9d
	jmp	.L20
.L33:
	xorl	%eax, %eax
	movl	$49, %r13d
	testl	%edi, %edi
	cmovs	%eax, %edi
	cmpl	%r13d, %r10d
	cmovg	%r13d, %r10d
	cmpl	%r10d, %edi
	jg	.L37
	testl	%r9d, %r9d
	cmovs	%eax, %r9d
	movl	$29, %eax
	cmpl	%eax, %esi
	cmovle	%esi, %eax
	cmpl	%eax, %r9d
	jg	.L37
	movslq	%r9d, %rsi
	comisd	%xmm13, %xmm4
	leaq	(%rsi,%rsi,4), %rsi
	leaq	(%rsi,%rsi,4), %rbx
	movslq	%edi, %rsi
	leaq	(%rsi,%rbx,2), %rsi
	leaq	(%r12,%rsi,8), %rbx
	jbe	.L97
	salq	$5, %r8
	leal	1(%rax), %esi
	leal	1(%r10), %r13d
	movq	%r12, %r14
	leaq	13328(%r8), %rax
	movq	%rbp, %r12
	movsd	%xmm0, (%rsp)
	movq	%rdx, %rbp
	leaq	(%rsp,%rax), %r10
	movsd	%xmm1, 16(%rsp)
	movq	%xmm15, %rdx
	movsd	%xmm12, 80(%rsp)
	.p2align 4,,10
	.p2align 3
.L49:
	pxor	%xmm12, %xmm12
	movsd	64(%rsp), %xmm11
	movq	%rbx, %r8
	movl	%r9d, %eax
	cvtsi2sdl	%edi, %xmm12
	movsd	32(%rsp), %xmm15
	mulsd	%xmm12, %xmm11
	mulsd	%xmm12, %xmm15
	mulsd	48(%rsp), %xmm12
	.p2align 4,,10
	.p2align 3
.L46:
	pxor	%xmm2, %xmm2
	movapd	%xmm5, %xmm0
	cvtsi2sdl	%eax, %xmm2
	subsd	%xmm2, %xmm0
	mulsd	%xmm8, %xmm0
	movapd	%xmm0, %xmm1
	movapd	%xmm2, %xmm0
	subsd	%xmm7, %xmm0
	addsd	%xmm11, %xmm1
	mulsd	%xmm6, %xmm0
	addsd	%xmm1, %xmm0
	mulsd	%xmm14, %xmm0
	divsd	%xmm4, %xmm0
	comisd	%xmm0, %xmm13
	ja	.L47
	movapd	%xmm9, %xmm1
	movapd	%xmm2, %xmm3
	subsd	%xmm2, %xmm1
	subsd	%xmm5, %xmm3
	mulsd	%xmm6, %xmm1
	mulsd	%xmm10, %xmm3
	addsd	%xmm15, %xmm1
	addsd	%xmm3, %xmm1
	mulsd	%xmm14, %xmm1
	movapd	%xmm1, %xmm3
	divsd	%xmm4, %xmm3
	comisd	%xmm3, %xmm13
	ja	.L47
	movapd	%xmm7, %xmm1
	subsd	%xmm2, %xmm1
	subsd	%xmm9, %xmm2
	mulsd	%xmm10, %xmm1
	mulsd	%xmm8, %xmm2
	addsd	%xmm12, %xmm1
	addsd	%xmm1, %xmm2
	mulsd	%xmm14, %xmm2
	divsd	%xmm4, %xmm2
	comisd	%xmm2, %xmm13
	ja	.L47
	mulsd	-12256(%r10), %xmm0
	mulsd	(%rsp), %xmm3
	mulsd	16(%rsp), %xmm2
	addsd	%xmm3, %xmm0
	addsd	%xmm0, %xmm2
	comisd	(%r8), %xmm2
	jbe	.L47
	movsd	%xmm2, (%r8)
.L47:
	addl	$1, %eax
	addq	$400, %r8
	cmpl	%eax, %esi
	jne	.L46
	addl	$1, %edi
	addq	$8, %rbx
	cmpl	%r13d, %edi
	jne	.L49
	movq	%rdx, %xmm15
	movq	%rbp, %rdx
	movsd	80(%rsp), %xmm12
	movq	%r12, %rbp
	addq	$12, %rdx
	movq	%r14, %r12
	cmpq	%r11, %rdx
	jne	.L35
.L96:
	movl	$2, %edi
	xorl	%eax, %eax
	movsd	%xmm12, (%rsp)
	movq	%rcx, %rbx
	leaq	.LC11(%rip), %rsi
	movsd	%xmm15, 16(%rsp)
	leaq	.L53(%rip), %r12
	call	__printf_chk@PLT
	movsd	(%rsp), %xmm11
	movsd	16(%rsp), %xmm12
	subsd	%xmm11, %xmm12
	movsd	%xmm11, 16(%rsp)
	movsd	%xmm12, (%rsp)
	.p2align 4,,10
	.p2align 3
.L50:
	leaq	-400(%rbx), %r13
	.p2align 4,,10
	.p2align 3
.L62:
	movsd	0(%r13), %xmm0
	subsd	16(%rsp), %xmm0
	divsd	(%rsp), %xmm0
	mulsd	.LC12(%rip), %xmm0
	cvttsd2sil	%xmm0, %eax
	cmpl	$7, %eax
	jg	.L51
	ja	.L52
	movl	%eax, %eax
	movslq	(%r12,%rax,4), %rax
	addq	%r12, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L53:
	.long	.L60-.L53
	.long	.L59-.L53
	.long	.L58-.L53
	.long	.L57-.L53
	.long	.L56-.L53
	.long	.L55-.L53
	.long	.L54-.L53
	.long	.L51-.L53
	.text
.L97:
	salq	$5, %r8
	leal	1(%rax), %esi
	movsd	%xmm0, 16(%rsp)
	movq	%rcx, %r15
	leaq	13328(%r8), %rax
	movsd	64(%rsp), %xmm0
	addl	$1, %r10d
	movsd	%xmm12, 80(%rsp)
	leaq	(%rsp,%rax), %r8
	movq	%xmm15, %rax
.L44:
	pxor	%xmm2, %xmm2
	movsd	32(%rsp), %xmm3
	movq	%rbx, %r14
	movl	%r9d, %ecx
	cvtsi2sdl	%edi, %xmm2
	movapd	%xmm0, %xmm12
	mulsd	%xmm2, %xmm3
	mulsd	%xmm2, %xmm12
	mulsd	48(%rsp), %xmm2
	movsd	%xmm3, (%rsp)
	movsd	%xmm2, 64(%rsp)
	.p2align 4,,10
	.p2align 3
.L43:
	pxor	%xmm11, %xmm11
	movapd	%xmm5, %xmm2
	cvtsi2sdl	%ecx, %xmm11
	subsd	%xmm11, %xmm2
	movapd	%xmm11, %xmm3
	subsd	%xmm7, %xmm3
	mulsd	%xmm8, %xmm2
	mulsd	%xmm6, %xmm3
	addsd	%xmm12, %xmm2
	addsd	%xmm3, %xmm2
	mulsd	%xmm14, %xmm2
	divsd	%xmm4, %xmm2
	comisd	%xmm13, %xmm2
	ja	.L40
	movapd	%xmm11, %xmm15
	movapd	%xmm9, %xmm3
	subsd	%xmm5, %xmm15
	subsd	%xmm11, %xmm3
	mulsd	%xmm10, %xmm15
	mulsd	%xmm6, %xmm3
	addsd	(%rsp), %xmm3
	addsd	%xmm15, %xmm3
	mulsd	%xmm14, %xmm3
	divsd	%xmm4, %xmm3
	comisd	%xmm13, %xmm3
	ja	.L40
	movapd	%xmm7, %xmm15
	subsd	%xmm11, %xmm15
	subsd	%xmm9, %xmm11
	mulsd	%xmm8, %xmm11
	mulsd	%xmm10, %xmm15
	addsd	64(%rsp), %xmm15
	addsd	%xmm11, %xmm15
	mulsd	%xmm14, %xmm15
	divsd	%xmm4, %xmm15
	comisd	%xmm13, %xmm15
	ja	.L40
	mulsd	-12256(%r8), %xmm2
	mulsd	16(%rsp), %xmm3
	mulsd	%xmm1, %xmm15
	addsd	%xmm2, %xmm3
	addsd	%xmm15, %xmm3
	comisd	(%r14), %xmm3
	jbe	.L40
	movsd	%xmm3, (%r14)
	.p2align 4,,10
	.p2align 3
.L40:
	addl	$1, %ecx
	addq	$400, %r14
	cmpl	%ecx, %esi
	jne	.L43
	addl	$1, %edi
	addq	$8, %rbx
	cmpl	%edi, %r10d
	jne	.L44
	movsd	80(%rsp), %xmm12
	movq	%rax, %xmm15
	movq	%r15, %rcx
	jmp	.L37
.L94:
	movapd	%xmm0, %xmm1
	movl	%edi, %r10d
	jmp	.L17
	.p2align 4,,10
	.p2align 3
.L51:
	movl	$36, %edi
	call	putchar@PLT
.L61:
	movl	$32, %edi
	addq	$8, %r13
	call	putchar@PLT
	cmpq	%r13, %rbx
	jne	.L62
	movl	$10, %edi
	addq	$400, %rbx
	call	putchar@PLT
	cmpq	%rbp, %rbx
	jne	.L50
	movl	$10, %edi
	call	putchar@PLT
	movq	13320(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L98
	addq	$13336, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$10, %edi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT
	.p2align 4,,10
	.p2align 3
.L54:
	.cfi_restore_state
	movl	$64, %edi
	call	putchar@PLT
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L58:
	movl	$43, %edi
	call	putchar@PLT
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L59:
	movl	$59, %edi
	call	putchar@PLT
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L60:
	movl	$39, %edi
	call	putchar@PLT
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L56:
	movl	$35, %edi
	call	putchar@PLT
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L57:
	movl	$79, %edi
	call	putchar@PLT
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L55:
	movl	$38, %edi
	call	putchar@PLT
	jmp	.L61
.L52:
	movl	$32, %edi
	call	putchar@PLT
	jmp	.L61
.L98:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	render, .-render
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%rax
	.cfi_def_cfa_offset 16
	popq	%rax
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.p2align 4,,10
	.p2align 3
.L100:
	xorl	%eax, %eax
	call	render
	movsd	.LC13(%rip), %xmm0
	addsd	rot_time(%rip), %xmm0
	movsd	%xmm0, rot_time(%rip)
	jmp	.L100
	.cfi_endproc
.LFE52:
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
.LC2:
	.long	0
	.long	1071644672
	.align 8
.LC3:
	.long	0
	.long	-1043477147
	.align 8
.LC4:
	.long	0
	.long	1104006501
	.align 8
.LC6:
	.long	0
	.long	-1071382528
	.align 8
.LC7:
	.long	1413754136
	.long	1074340347
	.align 8
.LC8:
	.long	0
	.long	1080459264
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC9:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC10:
	.long	0
	.long	1074266112
	.align 8
.LC12:
	.long	0
	.long	1075838976
	.align 8
.LC13:
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
