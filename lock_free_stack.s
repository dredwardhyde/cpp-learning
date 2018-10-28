	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	__Z8producerR15lock_free_stackIiE ## -- Begin function _Z8producerR15lock_free_stackIiE
	.p2align	4, 0x90
__Z8producerR15lock_free_stackIiE:      ## @_Z8producerR15lock_free_stackIiE
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
## %bb.0:
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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movq	__ZTVNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE@GOTPCREL(%rip), %r12
	addq	$16, %r12
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
	movl	$40, %edi
	callq	__Znwm
	movq	%rax, %r15
Ltmp0:
	movl	$32, %edi
	callq	__Znwm
Ltmp1:
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
	movq	%r12, (%rax)
	movq	%rax, %rsi
	addq	$24, %rsi
	movl	%r13d, 24(%rax)
	movq	%rsi, (%r15)
	movq	%rax, 8(%r15)
	xorl	%eax, %eax
	movq	%r15, %rdi
	movq	%rsi, %rdx
	callq	__ZNSt3__110shared_ptrIiE18__enable_weak_thisEz
	movl	$0, 16(%r15)
	xorl	%eax, %eax
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	lock		cmpxchg16b	(%r14)
	movl	%eax, 24(%r15)
	movq	%rdx, 32(%r15)
	movq	24(%r15), %rax
	movl	$1, %ebx
	movq	%r15, %rcx
	lock		cmpxchg16b	(%r14)
	je	LBB0_5
	.p2align	4, 0x90
LBB0_3:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	%rax, 24(%r15)
	movq	%rdx, 32(%r15)
	movl	$1, %ebx
	movq	%r15, %rcx
	lock		cmpxchg16b	(%r14)
	jne	LBB0_3
LBB0_5:                                 ##   in Loop: Header=BB0_1 Depth=1
	incl	%r13d
	cmpl	$20, %r13d
	jb	LBB0_1
## %bb.6:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB0_7:
Ltmp2:
	movq	%rax, %rbx
	movq	%r15, %rdi
	callq	__ZdlPv
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table0:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
Lset0 = Lfunc_begin0-Lfunc_begin0       ## >> Call Site 1 <<
	.long	Lset0
Lset1 = Ltmp0-Lfunc_begin0              ##   Call between Lfunc_begin0 and Ltmp0
	.long	Lset1
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset2 = Ltmp0-Lfunc_begin0              ## >> Call Site 2 <<
	.long	Lset2
Lset3 = Ltmp1-Ltmp0                     ##   Call between Ltmp0 and Ltmp1
	.long	Lset3
Lset4 = Ltmp2-Lfunc_begin0              ##     jumps to Ltmp2
	.long	Lset4
	.byte	0                       ##   On action: cleanup
Lset5 = Ltmp1-Lfunc_begin0              ## >> Call Site 3 <<
	.long	Lset5
Lset6 = Lfunc_end0-Ltmp1                ##   Call between Ltmp1 and Lfunc_end0
	.long	Lset6
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z8consumerR15lock_free_stackIiE ## -- Begin function _Z8consumerR15lock_free_stackIiE
	.p2align	4, 0x90
__Z8consumerR15lock_free_stackIiE:      ## @_Z8consumerR15lock_free_stackIiE
Lfunc_begin1:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception1
## %bb.0:
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
	leaq	-56(%rbp), %rdi
	movq	%r15, %rsi
	callq	__ZN15lock_free_stackIiE3popEv
	movq	-56(%rbp), %rax
	testq	%rax, %rax
	je	LBB1_13
## %bb.1:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %r14
	leaq	-64(%rbp), %r12
LBB1_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	(%rax), %esi
Ltmp3:
	movq	%r14, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
	movq	%rax, %r13
Ltmp4:
## %bb.3:                               ##   in Loop: Header=BB1_2 Depth=1
	movq	(%r13), %rax
	movq	-24(%rax), %rsi
	addq	%r13, %rsi
Ltmp5:
	movq	%r12, %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp6:
## %bb.4:                               ##   in Loop: Header=BB1_2 Depth=1
Ltmp7:
	movq	%r12, %rdi
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp8:
## %bb.5:                               ##   in Loop: Header=BB1_2 Depth=1
	movq	(%rax), %rcx
Ltmp9:
	movl	$10, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
	movl	%eax, %ebx
Ltmp10:
## %bb.6:                               ##   in Loop: Header=BB1_2 Depth=1
	movq	%r12, %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp12:
	movsbl	%bl, %esi
	movq	%r13, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp13:
## %bb.7:                               ##   in Loop: Header=BB1_2 Depth=1
Ltmp14:
	movq	%r13, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp15:
## %bb.8:                               ##   in Loop: Header=BB1_2 Depth=1
Ltmp16:
	movq	%r13, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp17:
## %bb.9:                               ##   in Loop: Header=BB1_2 Depth=1
	movq	-48(%rbp), %rbx
	testq	%rbx, %rbx
	je	LBB1_12
## %bb.10:                              ##   in Loop: Header=BB1_2 Depth=1
	movq	$-1, %rax
	lock		xaddq	%rax, 8(%rbx)
	testq	%rax, %rax
	jne	LBB1_12
## %bb.11:                              ##   in Loop: Header=BB1_2 Depth=1
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movq	%rbx, %rdi
	callq	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB1_12:                                ##   in Loop: Header=BB1_2 Depth=1
	leaq	-56(%rbp), %rdi
	movq	%r15, %rsi
	callq	__ZN15lock_free_stackIiE3popEv
	movq	-56(%rbp), %rax
	testq	%rax, %rax
	jne	LBB1_2
LBB1_13:
	movq	-48(%rbp), %rbx
	testq	%rbx, %rbx
	je	LBB1_16
## %bb.14:
	movq	$-1, %rax
	lock		xaddq	%rax, 8(%rbx)
	testq	%rax, %rax
	jne	LBB1_16
## %bb.15:
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movq	%rbx, %rdi
	callq	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB1_16:
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB1_22:
Ltmp11:
	movq	%rax, %r14
	leaq	-64(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movq	-48(%rbp), %rbx
	testq	%rbx, %rbx
	je	LBB1_21
LBB1_19:
	movq	$-1, %rax
	lock		xaddq	%rax, 8(%rbx)
	testq	%rax, %rax
	jne	LBB1_21
## %bb.20:
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movq	%rbx, %rdi
	callq	__ZNSt3__119__shared_weak_count14__release_weakEv
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
LBB1_17:
Ltmp18:
	movq	%rax, %r14
	movq	-48(%rbp), %rbx
	testq	%rbx, %rbx
	jne	LBB1_19
LBB1_21:
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table1:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\303\200"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	65                      ## Call site table length
Lset7 = Lfunc_begin1-Lfunc_begin1       ## >> Call Site 1 <<
	.long	Lset7
Lset8 = Ltmp3-Lfunc_begin1              ##   Call between Lfunc_begin1 and Ltmp3
	.long	Lset8
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset9 = Ltmp3-Lfunc_begin1              ## >> Call Site 2 <<
	.long	Lset9
Lset10 = Ltmp6-Ltmp3                    ##   Call between Ltmp3 and Ltmp6
	.long	Lset10
Lset11 = Ltmp18-Lfunc_begin1            ##     jumps to Ltmp18
	.long	Lset11
	.byte	0                       ##   On action: cleanup
Lset12 = Ltmp7-Lfunc_begin1             ## >> Call Site 3 <<
	.long	Lset12
Lset13 = Ltmp10-Ltmp7                   ##   Call between Ltmp7 and Ltmp10
	.long	Lset13
Lset14 = Ltmp11-Lfunc_begin1            ##     jumps to Ltmp11
	.long	Lset14
	.byte	0                       ##   On action: cleanup
Lset15 = Ltmp12-Lfunc_begin1            ## >> Call Site 4 <<
	.long	Lset15
Lset16 = Ltmp17-Ltmp12                  ##   Call between Ltmp12 and Ltmp17
	.long	Lset16
Lset17 = Ltmp18-Lfunc_begin1            ##     jumps to Ltmp18
	.long	Lset17
	.byte	0                       ##   On action: cleanup
Lset18 = Ltmp17-Lfunc_begin1            ## >> Call Site 5 <<
	.long	Lset18
Lset19 = Lfunc_end1-Ltmp17              ##   Call between Ltmp17 and Lfunc_end1
	.long	Lset19
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN15lock_free_stackIiE3popEv ## -- Begin function _ZN15lock_free_stackIiE3popEv
	.weak_def_can_be_hidden	__ZN15lock_free_stackIiE3popEv
	.p2align	4, 0x90
__ZN15lock_free_stackIiE3popEv:         ## @_ZN15lock_free_stackIiE3popEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movq	%rsi, -88(%rbp)
	movq	-88(%rbp), %r15
	xorl	%eax, %eax
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	lock		cmpxchg16b	(%r15)
	movl	%eax, -64(%rbp)
	movq	%rdx, -56(%rbp)
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	leaq	-64(%rbp), %rsi
	movq	%r15, %rdi
	callq	__ZN15lock_free_stackIiE19increase_head_countERNS0_16counted_node_ptrE
	movq	-56(%rbp), %rax
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	LBB2_3
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	movq	%r14, %rdi
	xorl	%esi, %esi
	movl	$16, %edx
	callq	_memset
	movl	$1, -44(%rbp)
	jmp	LBB2_19
LBB2_3:                                 ##   in Loop: Header=BB2_1 Depth=1
	movb	$1, %sil
	movq	-40(%rbp), %rax
	movq	24(%rax), %rcx
	movq	32(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	%rcx, -80(%rbp)
	movl	-80(%rbp), %ebx
	leaq	-64(%rbp), %rdi
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	-72(%rbp), %rcx
	lock		cmpxchg16b	(%r15)
	sete	%cl
	testb	$1, %cl
	jne	LBB2_5
## %bb.4:                               ##   in Loop: Header=BB2_1 Depth=1
	xorl	%esi, %esi
	movq	%rax, (%rdi)
	movq	%rdx, 8(%rdi)
LBB2_5:                                 ##   in Loop: Header=BB2_1 Depth=1
	testb	$1, %sil
	jne	LBB2_6
	jmp	LBB2_13
LBB2_6:                                 ##   in Loop: Header=BB2_1 Depth=1
	xorl	%eax, %eax
	movb	$0, -25(%rbp)
	movq	$0, 8(%r14)
	movq	$0, (%r14)
	movq	-40(%rbp), %rcx
	movq	(%r14), %rdx
	movq	(%rcx), %rsi
	movq	%rsi, (%r14)
	movq	%rdx, (%rcx)
	movq	8(%r14), %rdx
	movq	8(%rcx), %rsi
	movq	%rsi, 8(%r14)
	movq	%rdx, 8(%rcx)
	movl	-64(%rbp), %ecx
	addl	$-2, %ecx
	movl	%ecx, -48(%rbp)
	movq	-40(%rbp), %rcx
	movl	-48(%rbp), %edx
	lock		xaddl	%edx, 16(%rcx)
	subl	-48(%rbp), %eax
	cmpl	%eax, %edx
	jne	LBB2_10
## %bb.7:                               ##   in Loop: Header=BB2_1 Depth=1
	movq	-40(%rbp), %rbx
	cmpq	$0, %rbx
	je	LBB2_9
## %bb.8:                               ##   in Loop: Header=BB2_1 Depth=1
	movq	%rbx, %rdi
	callq	__ZN15lock_free_stackIiE4nodeD1Ev
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB2_9:                                 ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_10
LBB2_10:                                ##   in Loop: Header=BB2_1 Depth=1
	movb	$1, -25(%rbp)
	movl	$1, -44(%rbp)
	testb	$1, -25(%rbp)
	jne	LBB2_12
## %bb.11:                              ##   in Loop: Header=BB2_1 Depth=1
	movq	%r14, %rdi
	callq	__ZNSt3__110shared_ptrIiED1Ev
LBB2_12:                                ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_19
LBB2_13:                                ##   in Loop: Header=BB2_1 Depth=1
	movq	-40(%rbp), %rax
	movl	$-1, %ecx
	lock		xaddl	%ecx, 16(%rax)
	cmpl	$1, %ecx
	jne	LBB2_17
## %bb.14:                              ##   in Loop: Header=BB2_1 Depth=1
	movq	-40(%rbp), %rbx
	cmpq	$0, %rbx
	je	LBB2_16
## %bb.15:                              ##   in Loop: Header=BB2_1 Depth=1
	movq	%rbx, %rdi
	callq	__ZN15lock_free_stackIiE4nodeD1Ev
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB2_16:                                ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_17
LBB2_17:                                ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_18
LBB2_18:                                ##   in Loop: Header=BB2_1 Depth=1
	movl	$0, -44(%rbp)
LBB2_19:                                ##   in Loop: Header=BB2_1 Depth=1
	cmpl	$0, -44(%rbp)
	jne	LBB2_21
## %bb.20:                              ##   in Loop: Header=BB2_1 Depth=1
	jmp	LBB2_1
LBB2_21:
	movq	%r14, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__110shared_ptrIiED1Ev ## -- Begin function _ZNSt3__110shared_ptrIiED1Ev
	.weak_def_can_be_hidden	__ZNSt3__110shared_ptrIiED1Ev
	.p2align	4, 0x90
__ZNSt3__110shared_ptrIiED1Ev:          ## @_ZNSt3__110shared_ptrIiED1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	8(%rdi), %rbx
	testq	%rbx, %rbx
	je	LBB3_2
## %bb.1:
	movq	$-1, %rax
	lock		xaddq	%rax, 8(%rbx)
	testq	%rax, %rax
	je	LBB3_3
LBB3_2:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB3_3:
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	__ZNSt3__119__shared_weak_count14__release_weakEv ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
Lfunc_begin2:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception2
## %bb.0:
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
	subq	$72, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	leaq	-112(%rbp), %rbx
	movq	%rbx, -64(%rbp)
Ltmp19:
	leaq	__Z8producerR15lock_free_stackIiE(%rip), %rsi
	leaq	-80(%rbp), %rdi
	leaq	-64(%rbp), %rdx
	callq	__ZNSt3__16threadC2IRFvR15lock_free_stackIiEEJNS_17reference_wrapperIS3_EEEvEEOT_DpOT0_
Ltmp20:
## %bb.1:
	movq	%rbx, -56(%rbp)
Ltmp22:
	leaq	__Z8producerR15lock_free_stackIiE(%rip), %rsi
	leaq	-64(%rbp), %rdi
	leaq	-56(%rbp), %rdx
	callq	__ZNSt3__16threadC2IRFvR15lock_free_stackIiEEJNS_17reference_wrapperIS3_EEEvEEOT_DpOT0_
Ltmp23:
## %bb.2:
Ltmp25:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp26:
## %bb.3:
Ltmp27:
	leaq	-64(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp28:
## %bb.4:
	movq	%rbx, -48(%rbp)
Ltmp30:
	leaq	__Z8consumerR15lock_free_stackIiE(%rip), %rsi
	leaq	-56(%rbp), %rdi
	leaq	-48(%rbp), %rdx
	callq	__ZNSt3__16threadC2IRFvR15lock_free_stackIiEEJNS_17reference_wrapperIS3_EEEvEEOT_DpOT0_
Ltmp31:
## %bb.5:
	movq	%rbx, -88(%rbp)
Ltmp33:
	leaq	__Z8consumerR15lock_free_stackIiE(%rip), %rsi
	leaq	-48(%rbp), %rdi
	leaq	-88(%rbp), %rdx
	callq	__ZNSt3__16threadC2IRFvR15lock_free_stackIiEEJNS_17reference_wrapperIS3_EEEvEEOT_DpOT0_
Ltmp34:
## %bb.6:
Ltmp36:
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp37:
## %bb.7:
Ltmp38:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp39:
## %bb.8:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	leaq	-64(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
Ltmp47:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	movl	$11, %edx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp48:
## %bb.9:
	leaq	-80(%rbp), %r14
	leaq	-112(%rbp), %r15
	.p2align	4, 0x90
LBB4_10:                                ## =>This Inner Loop Header: Depth=1
Ltmp50:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	__ZN15lock_free_stackIiE3popEv
Ltmp51:
## %bb.11:                              ##   in Loop: Header=BB4_10 Depth=1
	movq	-80(%rbp), %r12
	movq	-72(%rbp), %rbx
	testq	%rbx, %rbx
	je	LBB4_13
## %bb.12:                              ##   in Loop: Header=BB4_10 Depth=1
	movq	$-1, %rax
	lock		xaddq	%rax, 8(%rbx)
	testq	%rax, %rax
	je	LBB4_14
LBB4_13:                                ##   in Loop: Header=BB4_10 Depth=1
	testq	%r12, %r12
	jne	LBB4_10
	jmp	LBB4_15
	.p2align	4, 0x90
LBB4_14:                                ##   in Loop: Header=BB4_10 Depth=1
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movq	%rbx, %rdi
	callq	__ZNSt3__119__shared_weak_count14__release_weakEv
	testq	%r12, %r12
	jne	LBB4_10
LBB4_15:
	xorl	%eax, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB4_16:
Ltmp49:
	movq	%rax, %rdi
	callq	___clang_call_terminate
LBB4_17:
Ltmp35:
	movq	%rax, %r14
	jmp	LBB4_22
LBB4_18:
Ltmp32:
	jmp	LBB4_24
LBB4_19:
Ltmp24:
	movq	%rax, %r14
	jmp	LBB4_26
LBB4_20:
Ltmp21:
	movq	%rax, %r14
	jmp	LBB4_27
LBB4_21:
Ltmp40:
	movq	%rax, %r14
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
LBB4_22:
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	jmp	LBB4_25
LBB4_23:
Ltmp29:
LBB4_24:
	movq	%rax, %r14
LBB4_25:
	leaq	-64(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
LBB4_26:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
LBB4_27:
Ltmp41:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	movl	$11, %edx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp42:
## %bb.28:
	leaq	-80(%rbp), %r15
	leaq	-112(%rbp), %r12
LBB4_29:                                ## =>This Inner Loop Header: Depth=1
Ltmp44:
	movq	%r15, %rdi
	movq	%r12, %rsi
	callq	__ZN15lock_free_stackIiE3popEv
Ltmp45:
## %bb.30:                              ##   in Loop: Header=BB4_29 Depth=1
	movq	-80(%rbp), %r13
	movq	-72(%rbp), %rbx
	testq	%rbx, %rbx
	je	LBB4_33
## %bb.31:                              ##   in Loop: Header=BB4_29 Depth=1
	movq	$-1, %rax
	lock		xaddq	%rax, 8(%rbx)
	testq	%rax, %rax
	jne	LBB4_33
## %bb.32:                              ##   in Loop: Header=BB4_29 Depth=1
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movq	%rbx, %rdi
	callq	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB4_33:                                ##   in Loop: Header=BB4_29 Depth=1
	testq	%r13, %r13
	jne	LBB4_29
## %bb.34:
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
LBB4_35:
Ltmp43:
	movq	%rax, %rdi
	callq	___clang_call_terminate
LBB4_36:
Ltmp46:
	movq	%rax, %rdi
	callq	___clang_call_terminate
LBB4_37:
Ltmp52:
	movq	%rax, %rdi
	callq	___clang_call_terminate
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table4:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\245\201\200\200"      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.ascii	"\234\001"              ## Call site table length
Lset20 = Ltmp19-Lfunc_begin2            ## >> Call Site 1 <<
	.long	Lset20
Lset21 = Ltmp20-Ltmp19                  ##   Call between Ltmp19 and Ltmp20
	.long	Lset21
Lset22 = Ltmp21-Lfunc_begin2            ##     jumps to Ltmp21
	.long	Lset22
	.byte	0                       ##   On action: cleanup
Lset23 = Ltmp22-Lfunc_begin2            ## >> Call Site 2 <<
	.long	Lset23
Lset24 = Ltmp23-Ltmp22                  ##   Call between Ltmp22 and Ltmp23
	.long	Lset24
Lset25 = Ltmp24-Lfunc_begin2            ##     jumps to Ltmp24
	.long	Lset25
	.byte	0                       ##   On action: cleanup
Lset26 = Ltmp25-Lfunc_begin2            ## >> Call Site 3 <<
	.long	Lset26
Lset27 = Ltmp28-Ltmp25                  ##   Call between Ltmp25 and Ltmp28
	.long	Lset27
Lset28 = Ltmp29-Lfunc_begin2            ##     jumps to Ltmp29
	.long	Lset28
	.byte	0                       ##   On action: cleanup
Lset29 = Ltmp30-Lfunc_begin2            ## >> Call Site 4 <<
	.long	Lset29
Lset30 = Ltmp31-Ltmp30                  ##   Call between Ltmp30 and Ltmp31
	.long	Lset30
Lset31 = Ltmp32-Lfunc_begin2            ##     jumps to Ltmp32
	.long	Lset31
	.byte	0                       ##   On action: cleanup
Lset32 = Ltmp33-Lfunc_begin2            ## >> Call Site 5 <<
	.long	Lset32
Lset33 = Ltmp34-Ltmp33                  ##   Call between Ltmp33 and Ltmp34
	.long	Lset33
Lset34 = Ltmp35-Lfunc_begin2            ##     jumps to Ltmp35
	.long	Lset34
	.byte	0                       ##   On action: cleanup
Lset35 = Ltmp36-Lfunc_begin2            ## >> Call Site 6 <<
	.long	Lset35
Lset36 = Ltmp39-Ltmp36                  ##   Call between Ltmp36 and Ltmp39
	.long	Lset36
Lset37 = Ltmp40-Lfunc_begin2            ##     jumps to Ltmp40
	.long	Lset37
	.byte	0                       ##   On action: cleanup
Lset38 = Ltmp47-Lfunc_begin2            ## >> Call Site 7 <<
	.long	Lset38
Lset39 = Ltmp48-Ltmp47                  ##   Call between Ltmp47 and Ltmp48
	.long	Lset39
Lset40 = Ltmp49-Lfunc_begin2            ##     jumps to Ltmp49
	.long	Lset40
	.byte	1                       ##   On action: 1
Lset41 = Ltmp50-Lfunc_begin2            ## >> Call Site 8 <<
	.long	Lset41
Lset42 = Ltmp51-Ltmp50                  ##   Call between Ltmp50 and Ltmp51
	.long	Lset42
Lset43 = Ltmp52-Lfunc_begin2            ##     jumps to Ltmp52
	.long	Lset43
	.byte	1                       ##   On action: 1
Lset44 = Ltmp51-Lfunc_begin2            ## >> Call Site 9 <<
	.long	Lset44
Lset45 = Ltmp41-Ltmp51                  ##   Call between Ltmp51 and Ltmp41
	.long	Lset45
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset46 = Ltmp41-Lfunc_begin2            ## >> Call Site 10 <<
	.long	Lset46
Lset47 = Ltmp42-Ltmp41                  ##   Call between Ltmp41 and Ltmp42
	.long	Lset47
Lset48 = Ltmp43-Lfunc_begin2            ##     jumps to Ltmp43
	.long	Lset48
	.byte	1                       ##   On action: 1
Lset49 = Ltmp44-Lfunc_begin2            ## >> Call Site 11 <<
	.long	Lset49
Lset50 = Ltmp45-Ltmp44                  ##   Call between Ltmp44 and Ltmp45
	.long	Lset50
Lset51 = Ltmp46-Lfunc_begin2            ##     jumps to Ltmp46
	.long	Lset51
	.byte	1                       ##   On action: 1
Lset52 = Ltmp45-Lfunc_begin2            ## >> Call Site 12 <<
	.long	Lset52
Lset53 = Lfunc_end2-Ltmp45              ##   Call between Ltmp45 and Lfunc_end2
	.long	Lset53
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__110shared_ptrIiE18__enable_weak_thisEz ## -- Begin function _ZNSt3__110shared_ptrIiE18__enable_weak_thisEz
	.globl	__ZNSt3__110shared_ptrIiE18__enable_weak_thisEz
	.weak_def_can_be_hidden	__ZNSt3__110shared_ptrIiE18__enable_weak_thisEz
	.p2align	4, 0x90
__ZNSt3__110shared_ptrIiE18__enable_weak_thisEz: ## @_ZNSt3__110shared_ptrIiE18__enable_weak_thisEz
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.private_extern	___clang_call_terminate ## -- Begin function __clang_call_terminate
	.globl	___clang_call_terminate
	.weak_def_can_be_hidden	___clang_call_terminate
	.p2align	4, 0x90
___clang_call_terminate:                ## @__clang_call_terminate
## %bb.0:
	pushq	%rax
	callq	___cxa_begin_catch
	callq	__ZSt9terminatev
                                        ## -- End function
	.globl	__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEED1Ev ## -- Begin function _ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEED1Ev
	.weak_def_can_be_hidden	__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEED1Ev
	.p2align	4, 0x90
__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEED1Ev: ## @_ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEED1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	jmp	__ZNSt3__119__shared_weak_countD2Ev ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEED0Ev ## -- Begin function _ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEED0Ev
	.weak_def_can_be_hidden	__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEED0Ev
	.p2align	4, 0x90
__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEED0Ev: ## @_ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEED0Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	callq	__ZNSt3__119__shared_weak_countD2Ev
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEE16__on_zero_sharedEv ## -- Begin function _ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEE16__on_zero_sharedEv
	.weak_def_can_be_hidden	__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEE16__on_zero_sharedEv
	.p2align	4, 0x90
__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEE16__on_zero_sharedEv: ## @_ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEE16__on_zero_sharedEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEE21__on_zero_shared_weakEv ## -- Begin function _ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEE21__on_zero_shared_weakEv
	.weak_def_can_be_hidden	__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEE21__on_zero_shared_weakEv
	.p2align	4, 0x90
__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEE21__on_zero_shared_weakEv: ## @_ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEE21__on_zero_shared_weakEv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	jmp	__ZdlPv                 ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN15lock_free_stackIiE19increase_head_countERNS0_16counted_node_ptrE ## -- Begin function _ZN15lock_free_stackIiE19increase_head_countERNS0_16counted_node_ptrE
	.weak_def_can_be_hidden	__ZN15lock_free_stackIiE19increase_head_countERNS0_16counted_node_ptrE
	.p2align	4, 0x90
__ZN15lock_free_stackIiE19increase_head_countERNS0_16counted_node_ptrE: ## @_ZN15lock_free_stackIiE19increase_head_countERNS0_16counted_node_ptrE
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	.cfi_offset %rbx, -24
	movl	(%rsi), %ebx
	incl	%ebx
	movq	(%rsi), %rax
	movq	8(%rsi), %rdx
	movq	%rdx, %rcx
	lock		cmpxchg16b	(%rdi)
	je	LBB11_3
	.p2align	4, 0x90
LBB11_1:                                ## =>This Inner Loop Header: Depth=1
	movq	%rax, (%rsi)
	movq	%rdx, 8(%rsi)
	leal	1(%rax), %ebx
	movq	%rdx, %rcx
	lock		cmpxchg16b	(%rdi)
	jne	LBB11_1
LBB11_3:
	movl	%ebx, (%rsi)
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc ## -- Begin function _ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.weak_def_can_be_hidden	__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.p2align	4, 0x90
__ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc: ## @_ZNSt3__1lsINS_11char_traitsIcEEEERNS_13basic_ostreamIcT_EES6_PKc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	%rbx, %rdi
	callq	_strlen
	movq	%r14, %rdi
	movq	%rbx, %rsi
	movq	%rax, %rdx
	popq	%rbx
	popq	%r14
	popq	%rbp
	jmp	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZN15lock_free_stackIiE4nodeD1Ev ## -- Begin function _ZN15lock_free_stackIiE4nodeD1Ev
	.weak_def_can_be_hidden	__ZN15lock_free_stackIiE4nodeD1Ev
	.p2align	4, 0x90
__ZN15lock_free_stackIiE4nodeD1Ev:      ## @_ZN15lock_free_stackIiE4nodeD1Ev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	8(%rdi), %rbx
	testq	%rbx, %rbx
	je	LBB13_2
## %bb.1:
	movq	$-1, %rax
	lock		xaddq	%rax, 8(%rbx)
	testq	%rax, %rax
	je	LBB13_3
LBB13_2:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB13_3:
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movq	%rbx, %rdi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	__ZNSt3__119__shared_weak_count14__release_weakEv ## TAILCALL
	.cfi_endproc
                                        ## -- End function
	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ## -- Begin function _ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	4, 0x90
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Lfunc_begin3:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception3
## %bb.0:
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
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
Ltmp53:
	leaq	-80(%rbp), %rdi
	movq	%rbx, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp54:
## %bb.1:
	cmpb	$0, -80(%rbp)
	je	LBB14_10
## %bb.2:
	movq	(%rbx), %rax
	movq	-24(%rax), %rax
	leaq	(%rbx,%rax), %r12
	movq	40(%rbx,%rax), %rdi
	movl	8(%rbx,%rax), %r13d
	movl	144(%rbx,%rax), %eax
	cmpl	$-1, %eax
	jne	LBB14_7
## %bb.3:
Ltmp56:
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	leaq	-56(%rbp), %rdi
	movq	%r12, %rsi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp57:
## %bb.4:
Ltmp58:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	leaq	-56(%rbp), %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp59:
## %bb.5:
	movq	(%rax), %rcx
Ltmp60:
	movl	$32, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
	movb	%al, -41(%rbp)          ## 1-byte Spill
Ltmp61:
## %bb.6:
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	-41(%rbp), %eax         ## 1-byte Folded Reload
	movl	%eax, 144(%r12)
	movq	-64(%rbp), %rdi         ## 8-byte Reload
LBB14_7:
	addq	%r15, %r14
	andl	$176, %r13d
	cmpl	$32, %r13d
	movq	%r15, %rdx
	cmoveq	%r14, %rdx
Ltmp63:
	movsbl	%al, %r9d
	movq	%r15, %rsi
	movq	%r14, %rcx
	movq	%r12, %r8
	callq	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp64:
## %bb.8:
	testq	%rax, %rax
	jne	LBB14_10
## %bb.9:
	movq	(%rbx), %rax
	movq	-24(%rax), %rax
	leaq	(%rbx,%rax), %rdi
	movl	32(%rbx,%rax), %esi
	orl	$5, %esi
Ltmp66:
	callq	__ZNSt3__18ios_base5clearEj
Ltmp67:
LBB14_10:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
LBB14_11:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB14_12:
Ltmp68:
	jmp	LBB14_15
LBB14_13:
Ltmp62:
	movq	%rax, %r14
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	jmp	LBB14_16
LBB14_14:
Ltmp65:
LBB14_15:
	movq	%rax, %r14
LBB14_16:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
	jmp	LBB14_18
LBB14_17:
Ltmp55:
	movq	%rax, %r14
LBB14_18:
	movq	%r14, %rdi
	callq	___cxa_begin_catch
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	addq	-24(%rax), %rdi
Ltmp69:
	callq	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp70:
## %bb.19:
	callq	___cxa_end_catch
	jmp	LBB14_11
LBB14_20:
Ltmp71:
	movq	%rax, %rbx
Ltmp72:
	callq	___cxa_end_catch
Ltmp73:
## %bb.21:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
LBB14_22:
Ltmp74:
	movq	%rax, %rdi
	callq	___clang_call_terminate
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table14:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\213\201"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.ascii	"\202\001"              ## Call site table length
Lset54 = Ltmp53-Lfunc_begin3            ## >> Call Site 1 <<
	.long	Lset54
Lset55 = Ltmp54-Ltmp53                  ##   Call between Ltmp53 and Ltmp54
	.long	Lset55
Lset56 = Ltmp55-Lfunc_begin3            ##     jumps to Ltmp55
	.long	Lset56
	.byte	1                       ##   On action: 1
Lset57 = Ltmp56-Lfunc_begin3            ## >> Call Site 2 <<
	.long	Lset57
Lset58 = Ltmp57-Ltmp56                  ##   Call between Ltmp56 and Ltmp57
	.long	Lset58
Lset59 = Ltmp65-Lfunc_begin3            ##     jumps to Ltmp65
	.long	Lset59
	.byte	1                       ##   On action: 1
Lset60 = Ltmp58-Lfunc_begin3            ## >> Call Site 3 <<
	.long	Lset60
Lset61 = Ltmp61-Ltmp58                  ##   Call between Ltmp58 and Ltmp61
	.long	Lset61
Lset62 = Ltmp62-Lfunc_begin3            ##     jumps to Ltmp62
	.long	Lset62
	.byte	1                       ##   On action: 1
Lset63 = Ltmp63-Lfunc_begin3            ## >> Call Site 4 <<
	.long	Lset63
Lset64 = Ltmp64-Ltmp63                  ##   Call between Ltmp63 and Ltmp64
	.long	Lset64
Lset65 = Ltmp65-Lfunc_begin3            ##     jumps to Ltmp65
	.long	Lset65
	.byte	1                       ##   On action: 1
Lset66 = Ltmp66-Lfunc_begin3            ## >> Call Site 5 <<
	.long	Lset66
Lset67 = Ltmp67-Ltmp66                  ##   Call between Ltmp66 and Ltmp67
	.long	Lset67
Lset68 = Ltmp68-Lfunc_begin3            ##     jumps to Ltmp68
	.long	Lset68
	.byte	1                       ##   On action: 1
Lset69 = Ltmp67-Lfunc_begin3            ## >> Call Site 6 <<
	.long	Lset69
Lset70 = Ltmp69-Ltmp67                  ##   Call between Ltmp67 and Ltmp69
	.long	Lset70
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset71 = Ltmp69-Lfunc_begin3            ## >> Call Site 7 <<
	.long	Lset71
Lset72 = Ltmp70-Ltmp69                  ##   Call between Ltmp69 and Ltmp70
	.long	Lset72
Lset73 = Ltmp71-Lfunc_begin3            ##     jumps to Ltmp71
	.long	Lset73
	.byte	0                       ##   On action: cleanup
Lset74 = Ltmp70-Lfunc_begin3            ## >> Call Site 8 <<
	.long	Lset74
Lset75 = Ltmp72-Ltmp70                  ##   Call between Ltmp70 and Ltmp72
	.long	Lset75
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset76 = Ltmp72-Lfunc_begin3            ## >> Call Site 9 <<
	.long	Lset76
Lset77 = Ltmp73-Ltmp72                  ##   Call between Ltmp72 and Ltmp73
	.long	Lset77
Lset78 = Ltmp74-Lfunc_begin3            ##     jumps to Ltmp74
	.long	Lset78
	.byte	1                       ##   On action: 1
Lset79 = Ltmp73-Lfunc_begin3            ## >> Call Site 10 <<
	.long	Lset79
Lset80 = Lfunc_end3-Ltmp73              ##   Call between Ltmp73 and Lfunc_end3
	.long	Lset80
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_ ## -- Begin function _ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.globl	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.weak_def_can_be_hidden	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
	.p2align	4, 0x90
__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_: ## @_ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Lfunc_begin4:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception4
## %bb.0:
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
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r8, %r12
	movq	%rcx, %r15
	movq	%rdi, %r13
	testq	%r13, %r13
	je	LBB15_19
## %bb.1:
	movl	%r9d, -68(%rbp)         ## 4-byte Spill
	movq	%r15, %rax
	subq	%rsi, %rax
	movq	24(%r12), %rcx
	xorl	%r14d, %r14d
	subq	%rax, %rcx
	cmovgq	%rcx, %r14
	movq	%rdx, -88(%rbp)         ## 8-byte Spill
	movq	%rdx, %rbx
	subq	%rsi, %rbx
	testq	%rbx, %rbx
	jle	LBB15_3
## %bb.2:
	movq	(%r13), %rax
	movq	%r13, %rdi
	movq	%rbx, %rdx
	callq	*96(%rax)
	cmpq	%rbx, %rax
	jne	LBB15_19
LBB15_3:
	testq	%r14, %r14
	jle	LBB15_15
## %bb.4:
	movq	%r12, -80(%rbp)         ## 8-byte Spill
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -64(%rbp)
	movq	$0, -48(%rbp)
	cmpq	$23, %r14
	jae	LBB15_8
## %bb.5:
	movl	%r14d, %eax
	addb	%al, %al
	movb	%al, -64(%rbp)
	leaq	-63(%rbp), %rbx
	movq	%rbx, %r12
	jmp	LBB15_9
LBB15_8:
	leaq	16(%r14), %rbx
	andq	$-16, %rbx
	movq	%rbx, %rdi
	callq	__Znwm
	movq	%rax, %r12
	movq	%r12, -48(%rbp)
	orq	$1, %rbx
	movq	%rbx, -64(%rbp)
	movq	%r14, -56(%rbp)
	leaq	-63(%rbp), %rbx
LBB15_9:
	movzbl	-68(%rbp), %esi         ## 1-byte Folded Reload
	movq	%r12, %rdi
	movq	%r14, %rdx
	callq	_memset
	movb	$0, (%r12,%r14)
	testb	$1, -64(%rbp)
	je	LBB15_11
## %bb.10:
	movq	-48(%rbp), %rbx
LBB15_11:
	movq	(%r13), %rax
Ltmp75:
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	*96(%rax)
	movq	%rax, %rbx
Ltmp76:
	movq	-80(%rbp), %r12         ## 8-byte Reload
## %bb.12:
	testb	$1, -64(%rbp)
	je	LBB15_14
## %bb.13:
	movq	-48(%rbp), %rdi
	callq	__ZdlPv
LBB15_14:
	cmpq	%r14, %rbx
	jne	LBB15_19
LBB15_15:
	movq	-88(%rbp), %rsi         ## 8-byte Reload
	subq	%rsi, %r15
	testq	%r15, %r15
	jle	LBB15_17
## %bb.16:
	movq	(%r13), %rax
	movq	%r13, %rdi
	movq	%r15, %rdx
	callq	*96(%rax)
	cmpq	%r15, %rax
	jne	LBB15_19
LBB15_17:
	movq	$0, 24(%r12)
	jmp	LBB15_20
LBB15_19:
	xorl	%r13d, %r13d
LBB15_20:
	movq	%r13, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB15_21:
Ltmp77:
	movq	%rax, %rbx
	testb	$1, -64(%rbp)
	je	LBB15_23
## %bb.22:
	movq	-48(%rbp), %rdi
	callq	__ZdlPv
LBB15_23:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table15:
Lexception4:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
Lset81 = Lfunc_begin4-Lfunc_begin4      ## >> Call Site 1 <<
	.long	Lset81
Lset82 = Ltmp75-Lfunc_begin4            ##   Call between Lfunc_begin4 and Ltmp75
	.long	Lset82
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset83 = Ltmp75-Lfunc_begin4            ## >> Call Site 2 <<
	.long	Lset83
Lset84 = Ltmp76-Ltmp75                  ##   Call between Ltmp75 and Ltmp76
	.long	Lset84
Lset85 = Ltmp77-Lfunc_begin4            ##     jumps to Ltmp77
	.long	Lset85
	.byte	0                       ##   On action: cleanup
Lset86 = Ltmp76-Lfunc_begin4            ## >> Call Site 3 <<
	.long	Lset86
Lset87 = Lfunc_end4-Ltmp76              ##   Call between Ltmp76 and Lfunc_end4
	.long	Lset87
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16threadC2IRFvR15lock_free_stackIiEEJNS_17reference_wrapperIS3_EEEvEEOT_DpOT0_ ## -- Begin function _ZNSt3__16threadC2IRFvR15lock_free_stackIiEEJNS_17reference_wrapperIS3_EEEvEEOT_DpOT0_
	.globl	__ZNSt3__16threadC2IRFvR15lock_free_stackIiEEJNS_17reference_wrapperIS3_EEEvEEOT_DpOT0_
	.weak_def_can_be_hidden	__ZNSt3__16threadC2IRFvR15lock_free_stackIiEEJNS_17reference_wrapperIS3_EEEvEEOT_DpOT0_
	.p2align	4, 0x90
__ZNSt3__16threadC2IRFvR15lock_free_stackIiEEJNS_17reference_wrapperIS3_EEEvEEOT_DpOT0_: ## @_ZNSt3__16threadC2IRFvR15lock_free_stackIiEEJNS_17reference_wrapperIS3_EEEvEEOT_DpOT0_
Lfunc_begin5:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception5
## %bb.0:
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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r13
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$8, %edi
	callq	__Znwm
	movq	%rax, %r15
Ltmp78:
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structC1Ev
Ltmp79:
## %bb.1:
Ltmp81:
	movl	$24, %edi
	callq	__Znwm
	movq	%rax, %rbx
Ltmp82:
## %bb.2:
	movq	(%r13), %rax
	movq	%r15, (%rbx)
	movq	%r12, 8(%rbx)
	movq	%rax, 16(%rbx)
Ltmp84:
	movq	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvR15lock_free_stackIiEENS_17reference_wrapperIS8_EEEEEEEPvSF_@GOTPCREL(%rip), %rdx
	xorl	%esi, %esi
	movq	%r14, %rdi
	movq	%rbx, %rcx
	callq	_pthread_create
Ltmp85:
## %bb.3:
	testl	%eax, %eax
	jne	LBB16_9
## %bb.4:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB16_9:
Ltmp86:
	leaq	L_.str.3(%rip), %rsi
	movl	%eax, %edi
	callq	__ZNSt3__120__throw_system_errorEiPKc
Ltmp87:
## %bb.10:
	ud2
LBB16_6:
Ltmp88:
	movq	%rax, %r14
	movq	(%rbx), %r15
	movq	$0, (%rbx)
	testq	%r15, %r15
	je	LBB16_8
## %bb.7:
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%r15, %rdi
	callq	__ZdlPv
LBB16_8:
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
LBB16_11:
Ltmp83:
	movq	%rax, %r14
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	jmp	LBB16_12
LBB16_5:
Ltmp80:
	movq	%rax, %r14
LBB16_12:
	movq	%r15, %rdi
	callq	__ZdlPv
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table16:
Lexception5:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\303\200"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	65                      ## Call site table length
Lset88 = Lfunc_begin5-Lfunc_begin5      ## >> Call Site 1 <<
	.long	Lset88
Lset89 = Ltmp78-Lfunc_begin5            ##   Call between Lfunc_begin5 and Ltmp78
	.long	Lset89
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset90 = Ltmp78-Lfunc_begin5            ## >> Call Site 2 <<
	.long	Lset90
Lset91 = Ltmp79-Ltmp78                  ##   Call between Ltmp78 and Ltmp79
	.long	Lset91
Lset92 = Ltmp80-Lfunc_begin5            ##     jumps to Ltmp80
	.long	Lset92
	.byte	0                       ##   On action: cleanup
Lset93 = Ltmp81-Lfunc_begin5            ## >> Call Site 3 <<
	.long	Lset93
Lset94 = Ltmp82-Ltmp81                  ##   Call between Ltmp81 and Ltmp82
	.long	Lset94
Lset95 = Ltmp83-Lfunc_begin5            ##     jumps to Ltmp83
	.long	Lset95
	.byte	0                       ##   On action: cleanup
Lset96 = Ltmp84-Lfunc_begin5            ## >> Call Site 4 <<
	.long	Lset96
Lset97 = Ltmp87-Ltmp84                  ##   Call between Ltmp84 and Ltmp87
	.long	Lset97
Lset98 = Ltmp88-Lfunc_begin5            ##     jumps to Ltmp88
	.long	Lset98
	.byte	0                       ##   On action: cleanup
Lset99 = Ltmp87-Lfunc_begin5            ## >> Call Site 5 <<
	.long	Lset99
Lset100 = Lfunc_end5-Ltmp87             ##   Call between Ltmp87 and Lfunc_end5
	.long	Lset100
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvR15lock_free_stackIiEENS_17reference_wrapperIS8_EEEEEEEPvSF_ ## -- Begin function _ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvR15lock_free_stackIiEENS_17reference_wrapperIS8_EEEEEEEPvSF_
	.weak_definition	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvR15lock_free_stackIiEENS_17reference_wrapperIS8_EEEEEEEPvSF_
	.p2align	4, 0x90
__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvR15lock_free_stackIiEENS_17reference_wrapperIS8_EEEEEEEPvSF_: ## @_ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvR15lock_free_stackIiEENS_17reference_wrapperIS8_EEEEEEEPvSF_
Lfunc_begin6:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception6
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r15
Ltmp89:
	callq	__ZNSt3__119__thread_local_dataEv
Ltmp90:
## %bb.1:
	movq	(%r15), %rsi
	movq	$0, (%r15)
	movq	(%rax), %rdi
Ltmp92:
	callq	_pthread_setspecific
Ltmp93:
## %bb.2:
	movq	16(%r15), %rdi
Ltmp94:
	callq	*8(%r15)
Ltmp95:
## %bb.3:
	movq	(%r15), %rbx
	movq	$0, (%r15)
	testq	%rbx, %rbx
	je	LBB17_5
## %bb.4:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB17_5:
	movq	%r15, %rdi
	callq	__ZdlPv
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB17_7:
Ltmp91:
	movq	%rax, %r14
	testq	%r15, %r15
	jne	LBB17_8
	jmp	LBB17_11
LBB17_6:
Ltmp96:
	movq	%rax, %r14
LBB17_8:
	movq	(%r15), %rbx
	movq	$0, (%r15)
	testq	%rbx, %rbx
	je	LBB17_10
## %bb.9:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB17_10:
	movq	%r15, %rdi
	callq	__ZdlPv
LBB17_11:
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table17:
Lexception6:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
Lset101 = Ltmp89-Lfunc_begin6           ## >> Call Site 1 <<
	.long	Lset101
Lset102 = Ltmp90-Ltmp89                 ##   Call between Ltmp89 and Ltmp90
	.long	Lset102
Lset103 = Ltmp91-Lfunc_begin6           ##     jumps to Ltmp91
	.long	Lset103
	.byte	0                       ##   On action: cleanup
Lset104 = Ltmp92-Lfunc_begin6           ## >> Call Site 2 <<
	.long	Lset104
Lset105 = Ltmp95-Ltmp92                 ##   Call between Ltmp92 and Ltmp95
	.long	Lset105
Lset106 = Ltmp96-Lfunc_begin6           ##     jumps to Ltmp96
	.long	Lset106
	.byte	0                       ##   On action: cleanup
Lset107 = Ltmp95-Lfunc_begin6           ## >> Call Site 3 <<
	.long	Lset107
Lset108 = Lfunc_end6-Ltmp95             ##   Call between Ltmp95 and Lfunc_end6
	.long	Lset108
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__DATA,__const
	.globl	__ZTVNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE ## @_ZTVNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE
	.weak_def_can_be_hidden	__ZTVNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE
	.p2align	3
__ZTVNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE:
	.quad	0
	.quad	__ZTINSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE
	.quad	__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEED1Ev
	.quad	__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEED0Ev
	.quad	__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEE16__on_zero_sharedEv
	.quad	__ZNKSt3__119__shared_weak_count13__get_deleterERKSt9type_info
	.quad	__ZNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEE21__on_zero_shared_weakEv

	.section	__TEXT,__const
	.globl	__ZTSNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE ## @_ZTSNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE
	.weak_definition	__ZTSNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE
	.p2align	4
__ZTSNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE:
	.asciz	"NSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE"

	.section	__DATA,__const
	.globl	__ZTINSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE ## @_ZTINSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE
	.weak_definition	__ZTINSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE
	.p2align	4
__ZTINSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE:
	.quad	__ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	__ZTSNSt3__120__shared_ptr_emplaceIiNS_9allocatorIiEEEE
	.quad	__ZTINSt3__119__shared_weak_countE

	.section	__TEXT,__cstring,cstring_literals
L_.str.1:                               ## @.str.1
	.asciz	"Null\n"

L_.str.2:                               ## @.str.2
	.asciz	"Destructor\n"

L_.str.3:                               ## @.str.3
	.asciz	"thread constructor failed"


.subsections_via_symbols
