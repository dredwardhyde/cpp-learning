	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	__Z8producerP15lock_free_stackIiE ## -- Begin function _Z8producerP15lock_free_stackIiE
	.p2align	4, 0x90
__Z8producerP15lock_free_stackIiE:      ## @_Z8producerP15lock_free_stackIiE
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
	.globl	__Z8consumerP15lock_free_stackIiE ## -- Begin function _Z8consumerP15lock_free_stackIiE
	.p2align	4, 0x90
__Z8consumerP15lock_free_stackIiE:      ## @_Z8consumerP15lock_free_stackIiE
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
	movq	%rdi, %r13
	leaq	-56(%rbp), %rdi
	movq	%r13, %rsi
	callq	__ZN15lock_free_stackIiE3popEv
	movq	-56(%rbp), %rax
	testq	%rax, %rax
	je	LBB1_8
## %bb.1:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %r14
	leaq	L_.str(%rip), %r15
	leaq	-56(%rbp), %r12
	.p2align	4, 0x90
LBB1_2:                                 ## =>This Inner Loop Header: Depth=1
	movl	(%rax), %esi
Ltmp3:
	movq	%r14, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
Ltmp4:
## %bb.3:                               ##   in Loop: Header=BB1_2 Depth=1
Ltmp5:
	movl	$1, %edx
	movq	%rax, %rdi
	movq	%r15, %rsi
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
Ltmp6:
## %bb.4:                               ##   in Loop: Header=BB1_2 Depth=1
	movq	-48(%rbp), %rbx
	testq	%rbx, %rbx
	je	LBB1_7
## %bb.5:                               ##   in Loop: Header=BB1_2 Depth=1
	movq	$-1, %rax
	lock		xaddq	%rax, 8(%rbx)
	testq	%rax, %rax
	jne	LBB1_7
## %bb.6:                               ##   in Loop: Header=BB1_2 Depth=1
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movq	%rbx, %rdi
	callq	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB1_7:                                 ##   in Loop: Header=BB1_2 Depth=1
	movq	%r12, %rdi
	movq	%r13, %rsi
	callq	__ZN15lock_free_stackIiE3popEv
	movq	-56(%rbp), %rax
	testq	%rax, %rax
	jne	LBB1_2
LBB1_8:
	movq	-48(%rbp), %rbx
	testq	%rbx, %rbx
	je	LBB1_11
## %bb.9:
	movq	$-1, %rax
	lock		xaddq	%rax, 8(%rbx)
	testq	%rax, %rax
	jne	LBB1_11
## %bb.10:
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movq	%rbx, %rdi
	callq	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB1_11:
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB1_12:
Ltmp7:
	movq	%rax, %r14
	movq	-48(%rbp), %rbx
	testq	%rbx, %rbx
	je	LBB1_15
## %bb.13:
	movq	$-1, %rax
	lock		xaddq	%rax, 8(%rbx)
	testq	%rax, %rax
	jne	LBB1_15
## %bb.14:
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movq	%rbx, %rdi
	callq	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB1_15:
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
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
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
Lset11 = Ltmp7-Lfunc_begin1             ##     jumps to Ltmp7
	.long	Lset11
	.byte	0                       ##   On action: cleanup
Lset12 = Ltmp6-Lfunc_begin1             ## >> Call Site 3 <<
	.long	Lset12
Lset13 = Lfunc_end1-Ltmp6               ##   Call between Ltmp6 and Lfunc_end1
	.long	Lset13
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
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	xorl	%eax, %eax
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	xorl	%ebx, %ebx
	lock		cmpxchg16b	(%r15)
	movq	%rax, %r12
	movq	%rdx, %rsi
                                        ## implicit-def: %r14d
	jmp	LBB2_1
	.p2align	4, 0x90
LBB2_18:                                ##   in Loop: Header=BB2_1 Depth=1
	movq	%r13, %rdi
	callq	__ZdlPv
	movq	-56(%rbp), %rsi         ## 8-byte Reload
LBB2_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_2 Depth 2
	movq	%r14, %rcx
	shlq	$32, %rcx
	movl	%r12d, %eax
	incl	%r12d
	orq	%rcx, %rax
	movq	%rsi, %rdx
	movq	%rsi, %rcx
	movq	%r12, %rbx
	lock		cmpxchg16b	(%r15)
	movq	%rsi, %r13
	je	LBB2_4
	.p2align	4, 0x90
LBB2_2:                                 ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	%rdx, %r13
	movq	%rax, %r14
	leal	1(%r14), %r12d
	movq	%r13, %rcx
	movq	%r12, %rbx
	lock		cmpxchg16b	(%r15)
	jne	LBB2_2
## %bb.3:                               ##   in Loop: Header=BB2_1 Depth=1
	shrq	$32, %r14
LBB2_4:                                 ##   in Loop: Header=BB2_1 Depth=1
	testq	%r13, %r13
	je	LBB2_5
## %bb.6:                               ##   in Loop: Header=BB2_1 Depth=1
	movl	24(%r13), %ebx
	shlq	$32, %r14
	movl	%r12d, %eax
	orq	%r14, %rax
	movq	32(%r13), %rcx
	movq	%r13, %rdx
	lock		cmpxchg16b	(%r15)
	movq	%rdx, %rsi
	movq	%rax, %r14
	je	LBB2_7
## %bb.14:                              ##   in Loop: Header=BB2_1 Depth=1
	movl	%r14d, %r12d
	shrq	$32, %r14
	lock		decl	16(%r13)
	jne	LBB2_1
## %bb.15:                              ##   in Loop: Header=BB2_1 Depth=1
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	movl	16(%r13), %eax
	movq	8(%r13), %rbx
	testq	%rbx, %rbx
	je	LBB2_18
## %bb.16:                              ##   in Loop: Header=BB2_1 Depth=1
	movq	$-1, %rax
	lock		xaddq	%rax, 8(%rbx)
	testq	%rax, %rax
	jne	LBB2_18
## %bb.17:                              ##   in Loop: Header=BB2_1 Depth=1
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movq	%rbx, %rdi
	callq	__ZNSt3__119__shared_weak_count14__release_weakEv
	jmp	LBB2_18
LBB2_5:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	$0, 8(%rax)
	movq	$0, (%rax)
	jmp	LBB2_13
LBB2_7:
	movq	-48(%rbp), %rbx         ## 8-byte Reload
	movq	$0, 8(%rbx)
	movq	$0, (%rbx)
	movq	(%r13), %rax
	movq	%rax, (%rbx)
	movq	$0, (%r13)
	movq	8(%rbx), %rax
	movq	8(%r13), %rcx
	movq	%rcx, 8(%rbx)
	movq	%rax, 8(%r13)
	leal	-2(%r12), %eax
	lock		xaddl	%eax, 16(%r13)
	movl	$2, %ecx
	subl	%r12d, %ecx
	cmpl	%ecx, %eax
	jne	LBB2_12
## %bb.8:
	movq	8(%r13), %r14
	testq	%r14, %r14
	je	LBB2_11
## %bb.9:
	movq	$-1, %rax
	lock		xaddq	%rax, 8(%r14)
	testq	%rax, %rax
	jne	LBB2_11
## %bb.10:
	movq	(%r14), %rax
	movq	%r14, %rdi
	callq	*16(%rax)
	movq	%r14, %rdi
	callq	__ZNSt3__119__shared_weak_count14__release_weakEv
LBB2_11:
	movq	%r13, %rdi
	callq	__ZdlPv
LBB2_12:
	movq	%rbx, %rax
LBB2_13:
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
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
	pushq	%r14
	pushq	%rbx
	subq	$64, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	$16, %edi
	callq	__Znwm
	xorps	%xmm0, %xmm0
	movaps	%xmm0, (%rax)
	movq	%rax, -72(%rbp)
	leaq	-72(%rbp), %r14
	movq	%r14, -56(%rbp)
	leaq	__Z8producerP15lock_free_stackIiE(%rip), %rbx
	leaq	-64(%rbp), %rdi
	leaq	-56(%rbp), %rdx
	movq	%rbx, %rsi
	callq	__ZNSt3__16threadC2IRFvP15lock_free_stackIiEEJNS_17reference_wrapperIS4_EEEvEEOT_DpOT0_
	movq	%r14, -48(%rbp)
Ltmp8:
	leaq	-56(%rbp), %rdi
	leaq	-48(%rbp), %rdx
	movq	%rbx, %rsi
	callq	__ZNSt3__16threadC2IRFvP15lock_free_stackIiEEJNS_17reference_wrapperIS4_EEEvEEOT_DpOT0_
Ltmp9:
## %bb.1:
	movq	%r14, -40(%rbp)
Ltmp11:
	leaq	__Z8producerP15lock_free_stackIiE(%rip), %rsi
	leaq	-48(%rbp), %rdi
	leaq	-40(%rbp), %rdx
	callq	__ZNSt3__16threadC2IRFvP15lock_free_stackIiEEJNS_17reference_wrapperIS4_EEEvEEOT_DpOT0_
Ltmp12:
## %bb.2:
Ltmp14:
	leaq	-64(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp15:
## %bb.3:
Ltmp16:
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp17:
## %bb.4:
Ltmp18:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp19:
## %bb.5:
	movq	%r14, -32(%rbp)
Ltmp21:
	leaq	__Z8consumerP15lock_free_stackIiE(%rip), %rsi
	leaq	-40(%rbp), %rdi
	leaq	-32(%rbp), %rdx
	callq	__ZNSt3__16threadC2IRFvP15lock_free_stackIiEEJNS_17reference_wrapperIS4_EEEvEEOT_DpOT0_
Ltmp22:
## %bb.6:
	movq	%r14, -24(%rbp)
Ltmp24:
	leaq	__Z8consumerP15lock_free_stackIiE(%rip), %rsi
	leaq	-32(%rbp), %rdi
	leaq	-24(%rbp), %rdx
	callq	__ZNSt3__16threadC2IRFvP15lock_free_stackIiEEJNS_17reference_wrapperIS4_EEEvEEOT_DpOT0_
Ltmp25:
## %bb.7:
	movq	%r14, -80(%rbp)
Ltmp27:
	leaq	__Z8consumerP15lock_free_stackIiE(%rip), %rsi
	leaq	-24(%rbp), %rdi
	leaq	-80(%rbp), %rdx
	callq	__ZNSt3__16threadC2IRFvP15lock_free_stackIiEEJNS_17reference_wrapperIS4_EEEvEEOT_DpOT0_
Ltmp28:
## %bb.8:
Ltmp30:
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp31:
## %bb.9:
Ltmp32:
	leaq	-32(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp33:
## %bb.10:
Ltmp34:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp35:
## %bb.11:
	movq	-72(%rbp), %rbx
	testq	%rbx, %rbx
	je	LBB3_13
## %bb.12:
	movq	%rbx, %rdi
	callq	__ZN15lock_free_stackIiED2Ev
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB3_13:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	leaq	-32(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	leaq	-64(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB3_14:
Ltmp29:
	movq	%rax, %rbx
	jmp	LBB3_20
LBB3_15:
Ltmp26:
	movq	%rax, %rbx
	jmp	LBB3_21
LBB3_16:
Ltmp23:
	jmp	LBB3_23
LBB3_17:
Ltmp13:
	movq	%rax, %rbx
	jmp	LBB3_25
LBB3_18:
Ltmp10:
	movq	%rax, %rbx
	jmp	LBB3_26
LBB3_19:
Ltmp36:
	movq	%rax, %rbx
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
LBB3_20:
	leaq	-32(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
LBB3_21:
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	jmp	LBB3_24
LBB3_22:
Ltmp20:
LBB3_23:
	movq	%rax, %rbx
LBB3_24:
	leaq	-48(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
LBB3_25:
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
LBB3_26:
	leaq	-64(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table3:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\367\200"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	117                     ## Call site table length
Lset14 = Lfunc_begin2-Lfunc_begin2      ## >> Call Site 1 <<
	.long	Lset14
Lset15 = Ltmp8-Lfunc_begin2             ##   Call between Lfunc_begin2 and Ltmp8
	.long	Lset15
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset16 = Ltmp8-Lfunc_begin2             ## >> Call Site 2 <<
	.long	Lset16
Lset17 = Ltmp9-Ltmp8                    ##   Call between Ltmp8 and Ltmp9
	.long	Lset17
Lset18 = Ltmp10-Lfunc_begin2            ##     jumps to Ltmp10
	.long	Lset18
	.byte	0                       ##   On action: cleanup
Lset19 = Ltmp11-Lfunc_begin2            ## >> Call Site 3 <<
	.long	Lset19
Lset20 = Ltmp12-Ltmp11                  ##   Call between Ltmp11 and Ltmp12
	.long	Lset20
Lset21 = Ltmp13-Lfunc_begin2            ##     jumps to Ltmp13
	.long	Lset21
	.byte	0                       ##   On action: cleanup
Lset22 = Ltmp14-Lfunc_begin2            ## >> Call Site 4 <<
	.long	Lset22
Lset23 = Ltmp19-Ltmp14                  ##   Call between Ltmp14 and Ltmp19
	.long	Lset23
Lset24 = Ltmp20-Lfunc_begin2            ##     jumps to Ltmp20
	.long	Lset24
	.byte	0                       ##   On action: cleanup
Lset25 = Ltmp21-Lfunc_begin2            ## >> Call Site 5 <<
	.long	Lset25
Lset26 = Ltmp22-Ltmp21                  ##   Call between Ltmp21 and Ltmp22
	.long	Lset26
Lset27 = Ltmp23-Lfunc_begin2            ##     jumps to Ltmp23
	.long	Lset27
	.byte	0                       ##   On action: cleanup
Lset28 = Ltmp24-Lfunc_begin2            ## >> Call Site 6 <<
	.long	Lset28
Lset29 = Ltmp25-Ltmp24                  ##   Call between Ltmp24 and Ltmp25
	.long	Lset29
Lset30 = Ltmp26-Lfunc_begin2            ##     jumps to Ltmp26
	.long	Lset30
	.byte	0                       ##   On action: cleanup
Lset31 = Ltmp27-Lfunc_begin2            ## >> Call Site 7 <<
	.long	Lset31
Lset32 = Ltmp28-Ltmp27                  ##   Call between Ltmp27 and Ltmp28
	.long	Lset32
Lset33 = Ltmp29-Lfunc_begin2            ##     jumps to Ltmp29
	.long	Lset33
	.byte	0                       ##   On action: cleanup
Lset34 = Ltmp30-Lfunc_begin2            ## >> Call Site 8 <<
	.long	Lset34
Lset35 = Ltmp35-Ltmp30                  ##   Call between Ltmp30 and Ltmp35
	.long	Lset35
Lset36 = Ltmp36-Lfunc_begin2            ##     jumps to Ltmp36
	.long	Lset36
	.byte	0                       ##   On action: cleanup
Lset37 = Ltmp35-Lfunc_begin2            ## >> Call Site 9 <<
	.long	Lset37
Lset38 = Lfunc_end2-Ltmp35              ##   Call between Ltmp35 and Lfunc_end2
	.long	Lset38
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
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
Ltmp37:
	leaq	-80(%rbp), %rdi
	movq	%rbx, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp38:
## %bb.1:
	cmpb	$0, -80(%rbp)
	je	LBB10_10
## %bb.2:
	movq	(%rbx), %rax
	movq	-24(%rax), %rax
	leaq	(%rbx,%rax), %r12
	movq	40(%rbx,%rax), %rdi
	movl	8(%rbx,%rax), %r13d
	movl	144(%rbx,%rax), %eax
	cmpl	$-1, %eax
	jne	LBB10_7
## %bb.3:
Ltmp40:
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	leaq	-56(%rbp), %rdi
	movq	%r12, %rsi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp41:
## %bb.4:
Ltmp42:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	leaq	-56(%rbp), %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp43:
## %bb.5:
	movq	(%rax), %rcx
Ltmp44:
	movl	$32, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
	movb	%al, -41(%rbp)          ## 1-byte Spill
Ltmp45:
## %bb.6:
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	-41(%rbp), %eax         ## 1-byte Folded Reload
	movl	%eax, 144(%r12)
	movq	-64(%rbp), %rdi         ## 8-byte Reload
LBB10_7:
	addq	%r15, %r14
	andl	$176, %r13d
	cmpl	$32, %r13d
	movq	%r15, %rdx
	cmoveq	%r14, %rdx
Ltmp47:
	movsbl	%al, %r9d
	movq	%r15, %rsi
	movq	%r14, %rcx
	movq	%r12, %r8
	callq	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp48:
## %bb.8:
	testq	%rax, %rax
	jne	LBB10_10
## %bb.9:
	movq	(%rbx), %rax
	movq	-24(%rax), %rax
	leaq	(%rbx,%rax), %rdi
	movl	32(%rbx,%rax), %esi
	orl	$5, %esi
Ltmp50:
	callq	__ZNSt3__18ios_base5clearEj
Ltmp51:
LBB10_10:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
LBB10_11:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB10_12:
Ltmp52:
	jmp	LBB10_15
LBB10_13:
Ltmp46:
	movq	%rax, %r14
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	jmp	LBB10_16
LBB10_14:
Ltmp49:
LBB10_15:
	movq	%rax, %r14
LBB10_16:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
	jmp	LBB10_18
LBB10_17:
Ltmp39:
	movq	%rax, %r14
LBB10_18:
	movq	%r14, %rdi
	callq	___cxa_begin_catch
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	addq	-24(%rax), %rdi
Ltmp53:
	callq	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp54:
## %bb.19:
	callq	___cxa_end_catch
	jmp	LBB10_11
LBB10_20:
Ltmp55:
	movq	%rax, %rbx
Ltmp56:
	callq	___cxa_end_catch
Ltmp57:
## %bb.21:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
LBB10_22:
Ltmp58:
	movq	%rax, %rdi
	callq	___clang_call_terminate
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table10:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\213\201"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.ascii	"\202\001"              ## Call site table length
Lset39 = Ltmp37-Lfunc_begin3            ## >> Call Site 1 <<
	.long	Lset39
Lset40 = Ltmp38-Ltmp37                  ##   Call between Ltmp37 and Ltmp38
	.long	Lset40
Lset41 = Ltmp39-Lfunc_begin3            ##     jumps to Ltmp39
	.long	Lset41
	.byte	1                       ##   On action: 1
Lset42 = Ltmp40-Lfunc_begin3            ## >> Call Site 2 <<
	.long	Lset42
Lset43 = Ltmp41-Ltmp40                  ##   Call between Ltmp40 and Ltmp41
	.long	Lset43
Lset44 = Ltmp49-Lfunc_begin3            ##     jumps to Ltmp49
	.long	Lset44
	.byte	1                       ##   On action: 1
Lset45 = Ltmp42-Lfunc_begin3            ## >> Call Site 3 <<
	.long	Lset45
Lset46 = Ltmp45-Ltmp42                  ##   Call between Ltmp42 and Ltmp45
	.long	Lset46
Lset47 = Ltmp46-Lfunc_begin3            ##     jumps to Ltmp46
	.long	Lset47
	.byte	1                       ##   On action: 1
Lset48 = Ltmp47-Lfunc_begin3            ## >> Call Site 4 <<
	.long	Lset48
Lset49 = Ltmp48-Ltmp47                  ##   Call between Ltmp47 and Ltmp48
	.long	Lset49
Lset50 = Ltmp49-Lfunc_begin3            ##     jumps to Ltmp49
	.long	Lset50
	.byte	1                       ##   On action: 1
Lset51 = Ltmp50-Lfunc_begin3            ## >> Call Site 5 <<
	.long	Lset51
Lset52 = Ltmp51-Ltmp50                  ##   Call between Ltmp50 and Ltmp51
	.long	Lset52
Lset53 = Ltmp52-Lfunc_begin3            ##     jumps to Ltmp52
	.long	Lset53
	.byte	1                       ##   On action: 1
Lset54 = Ltmp51-Lfunc_begin3            ## >> Call Site 6 <<
	.long	Lset54
Lset55 = Ltmp53-Ltmp51                  ##   Call between Ltmp51 and Ltmp53
	.long	Lset55
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset56 = Ltmp53-Lfunc_begin3            ## >> Call Site 7 <<
	.long	Lset56
Lset57 = Ltmp54-Ltmp53                  ##   Call between Ltmp53 and Ltmp54
	.long	Lset57
Lset58 = Ltmp55-Lfunc_begin3            ##     jumps to Ltmp55
	.long	Lset58
	.byte	0                       ##   On action: cleanup
Lset59 = Ltmp54-Lfunc_begin3            ## >> Call Site 8 <<
	.long	Lset59
Lset60 = Ltmp56-Ltmp54                  ##   Call between Ltmp54 and Ltmp56
	.long	Lset60
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset61 = Ltmp56-Lfunc_begin3            ## >> Call Site 9 <<
	.long	Lset61
Lset62 = Ltmp57-Ltmp56                  ##   Call between Ltmp56 and Ltmp57
	.long	Lset62
Lset63 = Ltmp58-Lfunc_begin3            ##     jumps to Ltmp58
	.long	Lset63
	.byte	1                       ##   On action: 1
Lset64 = Ltmp57-Lfunc_begin3            ## >> Call Site 10 <<
	.long	Lset64
Lset65 = Lfunc_end3-Ltmp57              ##   Call between Ltmp57 and Lfunc_end3
	.long	Lset65
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
	je	LBB11_19
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
	jle	LBB11_3
## %bb.2:
	movq	(%r13), %rax
	movq	%r13, %rdi
	movq	%rbx, %rdx
	callq	*96(%rax)
	cmpq	%rbx, %rax
	jne	LBB11_19
LBB11_3:
	testq	%r14, %r14
	jle	LBB11_15
## %bb.4:
	movq	%r12, -80(%rbp)         ## 8-byte Spill
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -64(%rbp)
	movq	$0, -48(%rbp)
	cmpq	$23, %r14
	jae	LBB11_8
## %bb.5:
	movl	%r14d, %eax
	addb	%al, %al
	movb	%al, -64(%rbp)
	leaq	-63(%rbp), %rbx
	movq	%rbx, %r12
	jmp	LBB11_9
LBB11_8:
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
LBB11_9:
	movzbl	-68(%rbp), %esi         ## 1-byte Folded Reload
	movq	%r12, %rdi
	movq	%r14, %rdx
	callq	_memset
	movb	$0, (%r12,%r14)
	testb	$1, -64(%rbp)
	je	LBB11_11
## %bb.10:
	movq	-48(%rbp), %rbx
LBB11_11:
	movq	(%r13), %rax
Ltmp59:
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	*96(%rax)
	movq	%rax, %rbx
Ltmp60:
	movq	-80(%rbp), %r12         ## 8-byte Reload
## %bb.12:
	testb	$1, -64(%rbp)
	je	LBB11_14
## %bb.13:
	movq	-48(%rbp), %rdi
	callq	__ZdlPv
LBB11_14:
	cmpq	%r14, %rbx
	jne	LBB11_19
LBB11_15:
	movq	-88(%rbp), %rsi         ## 8-byte Reload
	subq	%rsi, %r15
	testq	%r15, %r15
	jle	LBB11_17
## %bb.16:
	movq	(%r13), %rax
	movq	%r13, %rdi
	movq	%r15, %rdx
	callq	*96(%rax)
	cmpq	%r15, %rax
	jne	LBB11_19
LBB11_17:
	movq	$0, 24(%r12)
	jmp	LBB11_20
LBB11_19:
	xorl	%r13d, %r13d
LBB11_20:
	movq	%r13, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB11_21:
Ltmp61:
	movq	%rax, %rbx
	testb	$1, -64(%rbp)
	je	LBB11_23
## %bb.22:
	movq	-48(%rbp), %rdi
	callq	__ZdlPv
LBB11_23:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table11:
Lexception4:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
Lset66 = Lfunc_begin4-Lfunc_begin4      ## >> Call Site 1 <<
	.long	Lset66
Lset67 = Ltmp59-Lfunc_begin4            ##   Call between Lfunc_begin4 and Ltmp59
	.long	Lset67
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset68 = Ltmp59-Lfunc_begin4            ## >> Call Site 2 <<
	.long	Lset68
Lset69 = Ltmp60-Ltmp59                  ##   Call between Ltmp59 and Ltmp60
	.long	Lset69
Lset70 = Ltmp61-Lfunc_begin4            ##     jumps to Ltmp61
	.long	Lset70
	.byte	0                       ##   On action: cleanup
Lset71 = Ltmp60-Lfunc_begin4            ## >> Call Site 3 <<
	.long	Lset71
Lset72 = Lfunc_end4-Ltmp60              ##   Call between Ltmp60 and Lfunc_end4
	.long	Lset72
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16threadC2IRFvP15lock_free_stackIiEEJNS_17reference_wrapperIS4_EEEvEEOT_DpOT0_ ## -- Begin function _ZNSt3__16threadC2IRFvP15lock_free_stackIiEEJNS_17reference_wrapperIS4_EEEvEEOT_DpOT0_
	.globl	__ZNSt3__16threadC2IRFvP15lock_free_stackIiEEJNS_17reference_wrapperIS4_EEEvEEOT_DpOT0_
	.weak_def_can_be_hidden	__ZNSt3__16threadC2IRFvP15lock_free_stackIiEEJNS_17reference_wrapperIS4_EEEvEEOT_DpOT0_
	.p2align	4, 0x90
__ZNSt3__16threadC2IRFvP15lock_free_stackIiEEJNS_17reference_wrapperIS4_EEEvEEOT_DpOT0_: ## @_ZNSt3__16threadC2IRFvP15lock_free_stackIiEEJNS_17reference_wrapperIS4_EEEvEEOT_DpOT0_
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
Ltmp62:
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structC1Ev
Ltmp63:
## %bb.1:
Ltmp65:
	movl	$24, %edi
	callq	__Znwm
	movq	%rax, %rbx
Ltmp66:
## %bb.2:
	movq	(%r13), %rax
	movq	%r15, (%rbx)
	movq	%r12, 8(%rbx)
	movq	%rax, 16(%rbx)
Ltmp68:
	movq	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvP15lock_free_stackIiEENS_17reference_wrapperIS9_EEEEEEEPvSF_@GOTPCREL(%rip), %rdx
	xorl	%esi, %esi
	movq	%r14, %rdi
	movq	%rbx, %rcx
	callq	_pthread_create
Ltmp69:
## %bb.3:
	testl	%eax, %eax
	jne	LBB12_9
## %bb.4:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB12_9:
Ltmp70:
	leaq	L_.str.2(%rip), %rsi
	movl	%eax, %edi
	callq	__ZNSt3__120__throw_system_errorEiPKc
Ltmp71:
## %bb.10:
	ud2
LBB12_6:
Ltmp72:
	movq	%rax, %r14
	movq	(%rbx), %r15
	movq	$0, (%rbx)
	testq	%r15, %r15
	je	LBB12_8
## %bb.7:
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%r15, %rdi
	callq	__ZdlPv
LBB12_8:
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
LBB12_11:
Ltmp67:
	movq	%rax, %r14
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	jmp	LBB12_12
LBB12_5:
Ltmp64:
	movq	%rax, %r14
LBB12_12:
	movq	%r15, %rdi
	callq	__ZdlPv
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table12:
Lexception5:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\303\200"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	65                      ## Call site table length
Lset73 = Lfunc_begin5-Lfunc_begin5      ## >> Call Site 1 <<
	.long	Lset73
Lset74 = Ltmp62-Lfunc_begin5            ##   Call between Lfunc_begin5 and Ltmp62
	.long	Lset74
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset75 = Ltmp62-Lfunc_begin5            ## >> Call Site 2 <<
	.long	Lset75
Lset76 = Ltmp63-Ltmp62                  ##   Call between Ltmp62 and Ltmp63
	.long	Lset76
Lset77 = Ltmp64-Lfunc_begin5            ##     jumps to Ltmp64
	.long	Lset77
	.byte	0                       ##   On action: cleanup
Lset78 = Ltmp65-Lfunc_begin5            ## >> Call Site 3 <<
	.long	Lset78
Lset79 = Ltmp66-Ltmp65                  ##   Call between Ltmp65 and Ltmp66
	.long	Lset79
Lset80 = Ltmp67-Lfunc_begin5            ##     jumps to Ltmp67
	.long	Lset80
	.byte	0                       ##   On action: cleanup
Lset81 = Ltmp68-Lfunc_begin5            ## >> Call Site 4 <<
	.long	Lset81
Lset82 = Ltmp71-Ltmp68                  ##   Call between Ltmp68 and Ltmp71
	.long	Lset82
Lset83 = Ltmp72-Lfunc_begin5            ##     jumps to Ltmp72
	.long	Lset83
	.byte	0                       ##   On action: cleanup
Lset84 = Ltmp71-Lfunc_begin5            ## >> Call Site 5 <<
	.long	Lset84
Lset85 = Lfunc_end5-Ltmp71              ##   Call between Ltmp71 and Lfunc_end5
	.long	Lset85
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvP15lock_free_stackIiEENS_17reference_wrapperIS9_EEEEEEEPvSF_ ## -- Begin function _ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvP15lock_free_stackIiEENS_17reference_wrapperIS9_EEEEEEEPvSF_
	.weak_definition	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvP15lock_free_stackIiEENS_17reference_wrapperIS9_EEEEEEEPvSF_
	.p2align	4, 0x90
__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvP15lock_free_stackIiEENS_17reference_wrapperIS9_EEEEEEEPvSF_: ## @_ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvP15lock_free_stackIiEENS_17reference_wrapperIS9_EEEEEEEPvSF_
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
Ltmp73:
	callq	__ZNSt3__119__thread_local_dataEv
Ltmp74:
## %bb.1:
	movq	(%r15), %rsi
	movq	$0, (%r15)
	movq	(%rax), %rdi
Ltmp76:
	callq	_pthread_setspecific
Ltmp77:
## %bb.2:
	movq	16(%r15), %rax
	movq	(%rax), %rdi
Ltmp78:
	callq	*8(%r15)
Ltmp79:
## %bb.3:
	movq	(%r15), %rbx
	movq	$0, (%r15)
	testq	%rbx, %rbx
	je	LBB13_5
## %bb.4:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB13_5:
	movq	%r15, %rdi
	callq	__ZdlPv
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB13_7:
Ltmp75:
	movq	%rax, %r14
	testq	%r15, %r15
	jne	LBB13_8
	jmp	LBB13_11
LBB13_6:
Ltmp80:
	movq	%rax, %r14
LBB13_8:
	movq	(%r15), %rbx
	movq	$0, (%r15)
	testq	%rbx, %rbx
	je	LBB13_10
## %bb.9:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB13_10:
	movq	%r15, %rdi
	callq	__ZdlPv
LBB13_11:
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end6:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table13:
Lexception6:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
Lset86 = Ltmp73-Lfunc_begin6            ## >> Call Site 1 <<
	.long	Lset86
Lset87 = Ltmp74-Ltmp73                  ##   Call between Ltmp73 and Ltmp74
	.long	Lset87
Lset88 = Ltmp75-Lfunc_begin6            ##     jumps to Ltmp75
	.long	Lset88
	.byte	0                       ##   On action: cleanup
Lset89 = Ltmp76-Lfunc_begin6            ## >> Call Site 2 <<
	.long	Lset89
Lset90 = Ltmp79-Ltmp76                  ##   Call between Ltmp76 and Ltmp79
	.long	Lset90
Lset91 = Ltmp80-Lfunc_begin6            ##     jumps to Ltmp80
	.long	Lset91
	.byte	0                       ##   On action: cleanup
Lset92 = Ltmp79-Lfunc_begin6            ## >> Call Site 3 <<
	.long	Lset92
Lset93 = Lfunc_end6-Ltmp79              ##   Call between Ltmp79 and Lfunc_end6
	.long	Lset93
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZN15lock_free_stackIiED2Ev ## -- Begin function _ZN15lock_free_stackIiED2Ev
	.weak_def_can_be_hidden	__ZN15lock_free_stackIiED2Ev
	.p2align	4, 0x90
__ZN15lock_free_stackIiED2Ev:           ## @_ZN15lock_free_stackIiED2Ev
Lfunc_begin7:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception7
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r15
Ltmp81:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str.3(%rip), %rsi
	movl	$20, %edx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %r14
Ltmp82:
## %bb.1:
	movq	(%r14), %rax
	movq	-24(%rax), %rsi
	addq	%r14, %rsi
Ltmp83:
	leaq	-40(%rbp), %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp84:
## %bb.2:
Ltmp85:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	leaq	-40(%rbp), %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp86:
## %bb.3:
	movq	(%rax), %rcx
Ltmp87:
	movl	$10, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
	movl	%eax, %ebx
Ltmp88:
## %bb.4:
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp90:
	movsbl	%bl, %esi
	movq	%r14, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
Ltmp91:
## %bb.5:
Ltmp92:
	movq	%r14, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
Ltmp93:
## %bb.6:
	leaq	-56(%rbp), %r14
	.p2align	4, 0x90
LBB14_7:                                ## =>This Inner Loop Header: Depth=1
Ltmp95:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	__ZN15lock_free_stackIiE3popEv
Ltmp96:
## %bb.8:                               ##   in Loop: Header=BB14_7 Depth=1
	movq	-56(%rbp), %r12
	movq	-48(%rbp), %rbx
	testq	%rbx, %rbx
	je	LBB14_11
## %bb.9:                               ##   in Loop: Header=BB14_7 Depth=1
	movq	$-1, %rax
	lock		xaddq	%rax, 8(%rbx)
	testq	%rax, %rax
	je	LBB14_10
LBB14_11:                               ##   in Loop: Header=BB14_7 Depth=1
	testq	%r12, %r12
	jne	LBB14_7
	jmp	LBB14_12
	.p2align	4, 0x90
LBB14_10:                               ##   in Loop: Header=BB14_7 Depth=1
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	callq	*16(%rax)
	movq	%rbx, %rdi
	callq	__ZNSt3__119__shared_weak_count14__release_weakEv
	testq	%r12, %r12
	jne	LBB14_7
LBB14_12:
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB14_17:
Ltmp89:
	movq	%rax, %rbx
	leaq	-40(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movq	%rbx, %rdi
	callq	___clang_call_terminate
LBB14_14:
Ltmp94:
	movq	%rax, %rbx
	movq	%rbx, %rdi
	callq	___clang_call_terminate
LBB14_13:
Ltmp97:
	movq	%rax, %rbx
	movq	%rbx, %rdi
	callq	___clang_call_terminate
Lfunc_end7:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table14:
Lexception7:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	73                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	65                      ## Call site table length
Lset94 = Ltmp81-Lfunc_begin7            ## >> Call Site 1 <<
	.long	Lset94
Lset95 = Ltmp84-Ltmp81                  ##   Call between Ltmp81 and Ltmp84
	.long	Lset95
Lset96 = Ltmp94-Lfunc_begin7            ##     jumps to Ltmp94
	.long	Lset96
	.byte	1                       ##   On action: 1
Lset97 = Ltmp85-Lfunc_begin7            ## >> Call Site 2 <<
	.long	Lset97
Lset98 = Ltmp88-Ltmp85                  ##   Call between Ltmp85 and Ltmp88
	.long	Lset98
Lset99 = Ltmp89-Lfunc_begin7            ##     jumps to Ltmp89
	.long	Lset99
	.byte	1                       ##   On action: 1
Lset100 = Ltmp90-Lfunc_begin7           ## >> Call Site 3 <<
	.long	Lset100
Lset101 = Ltmp93-Ltmp90                 ##   Call between Ltmp90 and Ltmp93
	.long	Lset101
Lset102 = Ltmp94-Lfunc_begin7           ##     jumps to Ltmp94
	.long	Lset102
	.byte	1                       ##   On action: 1
Lset103 = Ltmp95-Lfunc_begin7           ## >> Call Site 4 <<
	.long	Lset103
Lset104 = Ltmp96-Ltmp95                 ##   Call between Ltmp95 and Ltmp96
	.long	Lset104
Lset105 = Ltmp97-Lfunc_begin7           ##     jumps to Ltmp97
	.long	Lset105
	.byte	1                       ##   On action: 1
Lset106 = Ltmp96-Lfunc_begin7           ## >> Call Site 5 <<
	.long	Lset106
Lset107 = Lfunc_end7-Ltmp96             ##   Call between Ltmp96 and Lfunc_end7
	.long	Lset107
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	1                       ## >> Action Record 1 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	" "

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
L_.str.2:                               ## @.str.2
	.asciz	"thread constructor failed"

L_.str.3:                               ## @.str.3
	.asciz	"destruction of stack"


.subsections_via_symbols
