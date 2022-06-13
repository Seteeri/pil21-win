	.text
	.file	"ext.l"
	.globl	Snx                             # -- Begin function Snx
	.p2align	4, 0x90
	.type	Snx,@function
Snx:                                    # @Snx
	.cfi_startproc
# %bb.0:                                # %"$1"
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r15
	movq	8(%rdi), %rbx
	movq	%rbx, %rdi
	callq	evSym@PLT
	movq	SymTab@GOTPCREL(%rip), %r14
	addq	$8, %r14
	cmpq	%r14, %rax
	je	.LBB0_9
# %bb.1:                                # %"$3"
	movq	%rbx, -56(%rbp)                 # 8-byte Spill
	movq	%r15, %rdi
	movq	%rax, %rsi
	callq	xName@PLT
	movq	%rsp, %r12
	leaq	-32(%r12), %r13
	movq	%r13, %rsp
	movq	$0, -32(%r12)
	movq	%rax, -24(%r12)
	addq	$-24, %r12
	movq	%r13, %rdi
	callq	symChar@PLT
	movl	%eax, %ebx
	.p2align	4, 0x90
.LBB0_2:                                # %"$5"
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$47, %ebx
	jg	.LBB0_4
# %bb.3:                                # %"$6"
                                        #   in Loop: Header=BB0_2 Depth=1
	movq	%r13, %rdi
	callq	symChar@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.LBB0_2
	jmp	.LBB0_9
.LBB0_4:                                # %"$7"
	movq	env@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rax, 16(%r13)
	movq	%r12, (%rcx)
	movq	%rsp, %r14
	leaq	-32(%r14), %rax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	movq	%rax, %rsp
	movq	$4, -32(%r14)
	movq	$2, -16(%r14)
	addq	$-16, %r14
	movq	-56(%rbp), %rax                 # 8-byte Reload
	movq	8(%rax), %rsi
	testb	$15, %sil
	je	.LBB0_6
# %bb.5:
	movl	$24, %r15d
	jmp	.LBB0_7
.LBB0_6:                                # %"$10"
	movq	%r15, %rdi
	callq	evCnt@PLT
	movq	env@GOTPCREL(%rip), %rcx
	movq	%rax, %r15
	movq	(%rcx), %r12
.LBB0_7:                                # %"$12"
	movq	-48(%rbp), %rsi                 # 8-byte Reload
	movq	%r12, 24(%rsi)
	movq	%r14, (%rcx)
	leal	-97(%rbx), %eax
	movl	%ebx, %ecx
	andl	$-32, %ecx
	movl	%ebx, %edx
	andl	$-33, %edx
	cmpl	$26, %eax
	movl	%ebx, %r12d
	cmovbl	%edx, %r12d
	cmpl	$128, %ebx
	cmovel	%edx, %r12d
	cmpl	$224, %ecx
	cmovel	%edx, %r12d
	movl	%r12d, %edi
	callq	charSym@PLT
	movq	%r13, %rdi
	callq	symChar@PLT
	testl	%eax, %eax
	jne	.LBB0_12
.LBB0_8:                                # %"$24"
	movq	(%r14), %rdi
	callq	consStr@PLT
	movq	%rax, %r14
	movq	16(%r13), %rax
	movq	env@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
.LBB0_9:                                # %"$8"
	movq	%r14, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
	.p2align	4, 0x90
.LBB0_10:                               #   in Loop: Header=BB0_12 Depth=1
	.cfi_def_cfa %rbp, 16
	movl	%r12d, %ebx
.LBB0_11:                               # %"$26"
                                        #   in Loop: Header=BB0_12 Depth=1
	movq	%r13, %rdi
	callq	symChar@PLT
	testl	%eax, %eax
	movl	%ebx, %r12d
	je	.LBB0_8
.LBB0_12:                               # %"$23"
                                        # =>This Inner Loop Header: Depth=1
	cmpl	$33, %eax
	jl	.LBB0_10
# %bb.13:                               # %"$25"
                                        #   in Loop: Header=BB0_12 Depth=1
	addl	$-48, %eax
	cmpl	$193, %eax
	ja	.LBB0_14
# %bb.15:                               # %"$28"
                                        #   in Loop: Header=BB0_12 Depth=1
	movl	%eax, %eax
	movq	($SnxTab)@GOTPCREL(%rip), %rcx
	movzbl	(%rcx,%rax), %ebx
	testl	%ebx, %ebx
	je	.LBB0_14
# %bb.16:                               # %"$31"
                                        #   in Loop: Header=BB0_12 Depth=1
	cmpl	%ebx, %r12d
	je	.LBB0_10
# %bb.19:                               # %"$34"
                                        #   in Loop: Header=BB0_12 Depth=1
	decq	%r15
	je	.LBB0_8
# %bb.20:                               # %"$35"
                                        #   in Loop: Header=BB0_12 Depth=1
	movl	%ebx, %edi
	movq	-48(%rbp), %rsi                 # 8-byte Reload
	callq	charSym@PLT
	jmp	.LBB0_11
	.p2align	4, 0x90
.LBB0_14:                               #   in Loop: Header=BB0_12 Depth=1
	xorl	%ebx, %ebx
	jmp	.LBB0_11
.Lfunc_end0:
	.size	Snx, .Lfunc_end0-Snx
	.cfi_endproc
                                        # -- End function
	.globl	FD                              # -- Begin function FD
	.p2align	4, 0x90
	.type	FD,@function
FD:                                     # @FD
	.cfi_startproc
# %bb.0:                                # %"$1"
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movq	8(%rdi), %rax
	movq	(%rax), %r15
	testb	$6, %r15b
	jne	.LBB1_4
# %bb.1:                                # %"$3"
	testb	$8, %r15b
	jne	.LBB1_2
# %bb.3:                                # %"$5"
	movq	%r15, %rdi
	callq	evList@PLT
	movq	%rax, %r15
	jmp	.LBB1_4
.LBB1_2:                                # %"$6"
	movq	(%r15), %r15
.LBB1_4:                                # %"$2"
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	xCnt@PLT
	movq	%rax, %rbx
	testl	%ebx, %ebx
	js	.LBB1_6
# %bb.5:                                # %"$7"
	movl	%ebx, %edi
	xorl	%esi, %esi
	callq	initInFile@PLT
	movl	%ebx, %edi
	callq	initOutFile@PLT
.LBB1_6:                                # %"$8"
	movq	%r15, %rax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	FD, .Lfunc_end1-FD
	.cfi_endproc
                                        # -- End function
	.globl	Base64                          # -- Begin function Base64
	.p2align	4, 0x90
	.type	Base64,@function
Base64:                                 # @Base64
	.cfi_startproc
# %bb.0:                                # %"$1"
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	8(%rdi), %rbp
	testb	$15, %bpl
	je	.LBB2_19
# %bb.1:                                # %"$4"
	movq	($Chr)@GOTPCREL(%rip), %rax
	movl	(%rax), %ebp
	cmpl	$32, %ebp
	ja	.LBB2_5
# %bb.2:                                # %"$8.preheader"
	movq	($Get)@GOTPCREL(%rip), %rbx
	.p2align	4, 0x90
.LBB2_3:                                # %"$8"
                                        # =>This Inner Loop Header: Depth=1
	callq	*(%rbx)
	cmpl	$33, %eax
	jb	.LBB2_3
# %bb.4:
	movl	%eax, %ebp
.LBB2_5:                                # %"$9"
	movq	($Chr64)@GOTPCREL(%rip), %rdi
	movl	$65, %edx
	movl	%ebp, %esi
	callq	memchr@PLT
	testq	%rax, %rax
	je	.LBB2_15
# %bb.6:                                # %"$10"
	movq	%rax, %rbx
	subl	($Chr64)@GOTPCREL(%rip), %ebx
	movq	($Get)@GOTPCREL(%rip), %r14
	callq	*(%r14)
	movq	($Stat64)@GOTPCREL(%rip), %rbp
	movl	(%rbp), %ecx
	cmpl	$1, %ecx
	je	.LBB2_12
# %bb.7:                                # %"$10"
	testl	%ecx, %ecx
	jne	.LBB2_13
# %bb.8:                                # %"$15"
	movq	($Chr64)@GOTPCREL(%rip), %rdi
	movl	$65, %edx
	movl	%eax, %esi
	callq	memchr@PLT
	testq	%rax, %rax
	je	.LBB2_9
# %bb.11:                               # %"$18"
	subl	($Chr64)@GOTPCREL(%rip), %eax
	movq	($Next64)@GOTPCREL(%rip), %r15
	movl	%eax, (%r15)
	callq	*(%r14)
	incl	(%rbp)
	shll	$2, %ebx
	movl	(%r15), %eax
	shrl	$4, %eax
	orl	%ebx, %eax
	cltq
	jmp	.LBB2_14
.LBB2_19:                               # %"$3"
	movq	%rdi, %rbx
	movq	(%rbp), %rsi
	testb	$6, %sil
	jne	.LBB2_23
# %bb.20:                               # %"$24"
	testb	$8, %sil
	jne	.LBB2_21
# %bb.22:                               # %"$26"
	movq	%rsi, %rdi
	callq	evList@PLT
	movq	%rax, %rsi
	jmp	.LBB2_23
.LBB2_15:                               # %"$11"
	cmpl	$61, %ebp
	jne	.LBB2_18
# %bb.16:                               # %"$19"
	movq	($Get)@GOTPCREL(%rip), %rbx
	callq	*(%rbx)
	movq	($Stat64)@GOTPCREL(%rip), %rax
	cmpl	$1, (%rax)
	jne	.LBB2_18
# %bb.17:                               # %"$21"
	callq	*(%rbx)
.LBB2_18:                               # %"$20"
	movq	($Stat64)@GOTPCREL(%rip), %rax
	movl	$0, (%rax)
.LBB2_10:                               # %"$2"
	movq	SymTab@GOTPCREL(%rip), %rax
	addq	$8, %rax
	jmp	.LBB2_38
.LBB2_12:                               # %"$16"
	movq	($Next64)@GOTPCREL(%rip), %rcx
	movl	(%rcx), %eax
	shll	$4, %eax
	movzbl	%al, %edx
	movl	%ebx, %eax
	shrq	$2, %rax
	orq	%rdx, %rax
	shlq	$4, %rax
	orq	$2, %rax
	movl	%ebx, (%rcx)
	movl	$2, (%rbp)
	jmp	.LBB2_38
.LBB2_13:                               # %"$13"
	movl	$0, (%rbp)
	movq	($Next64)@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	shll	$6, %eax
	movzbl	%al, %ecx
	movslq	%ebx, %rax
	orq	%rcx, %rax
.LBB2_14:                               # %"$2"
	shlq	$4, %rax
	orq	$2, %rax
	jmp	.LBB2_38
.LBB2_21:                               # %"$27"
	movq	(%rsi), %rsi
.LBB2_23:                               # %"$23"
	movq	SymTab@GOTPCREL(%rip), %r14
	leaq	8(%r14), %rax
	cmpq	%rax, %rsi
	je	.LBB2_38
# %bb.24:                               # %"$28"
	movq	%rbx, %rdi
	callq	xCnt@PLT
	movq	%rax, %r12
	shrq	$2, %rax
	movq	($Chr64)@GOTPCREL(%rip), %rcx
	movq	($Put)@GOTPCREL(%rip), %r15
	movzbl	(%rcx,%rax), %edi
	callq	*(%r15)
	movq	8(%rbp), %r13
	movq	(%r13), %rsi
	testb	$6, %sil
	jne	.LBB2_28
# %bb.25:                               # %"$31"
	testb	$8, %sil
	jne	.LBB2_26
# %bb.27:                               # %"$33"
	movq	%rsi, %rdi
	callq	evList@PLT
	movq	%rax, %rsi
	jmp	.LBB2_28
.LBB2_9:                                # %"$17"
	movl	$0, (%rbp)
	jmp	.LBB2_10
.LBB2_26:                               # %"$34"
	movq	(%rsi), %rsi
.LBB2_28:                               # %"$30"
	addq	$8, %r14
	cmpq	%r14, %rsi
	jne	.LBB2_30
# %bb.29:                               # %"$35"
	shll	$4, %r12d
	andl	$48, %r12d
	movq	($Chr64)@GOTPCREL(%rip), %rax
	movl	(%rax,%r12), %edi
	callq	*(%r15)
	movl	$61, %edi
	callq	*(%r15)
	movl	$61, %edi
	callq	*(%r15)
	movq	%r14, %rax
	jmp	.LBB2_38
.LBB2_30:                               # %"$36"
	movq	%rbx, %rdi
	callq	xCnt@PLT
	movq	%r15, %rcx
	movq	%rax, %r15
	shll	$4, %r12d
	andl	$48, %r12d
	shrq	$4, %rax
	orq	%r12, %rax
	movq	($Chr64)@GOTPCREL(%rip), %r12
	movzbl	(%r12,%rax), %edi
	movq	%rcx, %rbp
	callq	*(%rcx)
	movq	8(%r13), %rax
	movq	(%rax), %rsi
	testb	$6, %sil
	jne	.LBB2_34
# %bb.31:                               # %"$38"
	testb	$8, %sil
	jne	.LBB2_32
# %bb.33:                               # %"$40"
	movq	%rsi, %rdi
	callq	evList@PLT
	movq	%rax, %rsi
	jmp	.LBB2_34
.LBB2_32:                               # %"$41"
	movq	(%rsi), %rsi
.LBB2_34:                               # %"$37"
	cmpq	%r14, %rsi
	jne	.LBB2_37
# %bb.35:                               # %"$42"
	andl	$15, %r15d
	movl	(%r12,%r15,4), %edi
	callq	*(%rbp)
	movl	$61, %edi
	callq	*(%rbp)
	movq	%r14, %rax
	jmp	.LBB2_38
.LBB2_37:                               # %"$43"
	movq	%rbx, %rdi
	callq	xCnt@PLT
	movq	%rax, %rbx
	shll	$2, %r15d
	andl	$60, %r15d
	shrq	$6, %rax
	orq	%r15, %rax
	movzbl	(%r12,%rax), %edi
	callq	*(%rbp)
	andl	$63, %ebx
	movzbl	(%r12,%rbx), %edi
	callq	*(%rbp)
	movl	$280, %eax                      # imm = 0x118
	addq	SymTab@GOTPCREL(%rip), %rax
.LBB2_38:                               # %"$2"
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end2:
	.size	Base64, .Lfunc_end2-Base64
	.cfi_endproc
                                        # -- End function
	.type	$Empty,@object                  # @"$Empty"
	.section	.rodata,"a",@progbits
	.globl	$Empty
$Empty:
	.zero	1
	.size	$Empty, 1

	.type	$Delim,@object                  # @"$Delim"
	.globl	$Delim
$Delim:
	.asciz	" \t\n\r\"'(),[]`{}~"
	.size	$Delim, 16

	.type	$SnxTab,@object                 # @"$SnxTab"
	.data
	.globl	$SnxTab
	.p2align	4
$SnxTab:
	.ascii	"0123456789\000\000\000\000\000\000\000\000FST\000FS\000\000SSLNN\000FSRST\000FFS\000S\000\000\000\000\000\000\000FST\000FS\000\000SSLNN\000FSRST\000FFS\000S\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000S\000\000\000\000\000\000\000\000TN\000\000\000\000\000S\000\000\000\000\000\000\000S\000\000\000\000\000\000\000S\000\000\000\000\000\000\000\000\000N"
	.size	$SnxTab, 194

	.type	$Chr64,@object                  # @"$Chr64"
	.section	.rodata,"a",@progbits
	.globl	$Chr64
	.p2align	4
$Chr64:
	.asciz	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	.size	$Chr64, 65

	.type	$Stat64,@object                 # @"$Stat64"
	.bss
	.globl	$Stat64
	.p2align	2
$Stat64:
	.long	0                               # 0x0
	.size	$Stat64, 4

	.type	$Next64,@object                 # @"$Next64"
	.globl	$Next64
	.p2align	2
$Next64:
	.long	0                               # 0x0
	.size	$Next64, 4

	.section	".note.GNU-stack","",@progbits
