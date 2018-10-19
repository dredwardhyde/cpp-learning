	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	__Z2f1P4Banki           ## -- Begin function _Z2f1P4Banki
	.p2align	4, 0x90
__Z2f1P4Banki:                          ## @_Z2f1P4Banki
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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movslq	%esi, %r15
	xorl	%r12d, %r12d
	leaq	_tx(%rip), %r13
	.p2align	4, 0x90
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_2 Depth 2
                                        ##     Child Loop BB0_10 Depth 2
	callq	_rand
	cltq
	cqto
	idivq	8(%r14)
	movq	%rdx, %rbx
	.p2align	4, 0x90
LBB0_2:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	callq	_rand
	cltq
	cqto
	idivq	8(%r14)
	cmpl	%edx, %ebx
	je	LBB0_2
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movq	(%r14), %rax
	movslq	%ebx, %rcx
	shlq	$6, %rcx
	movslq	%edx, %rdx
	shlq	$6, %rdx
	movl	(%rax,%rdx), %esi
	addl	(%rax,%rcx), %esi
	movl	%esi, _Touch(%rip)
	xbegin	LBB0_5
## %bb.4:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	$-1, %eax
	cmpl	$-1, %eax
	jne	LBB0_10
	jmp	LBB0_7
	.p2align	4, 0x90
LBB0_5:                                 ##   in Loop: Header=BB0_1 Depth=1
	# XABORT DEF
	cmpl	$-1, %eax
	jne	LBB0_10
	jmp	LBB0_7
	.p2align	4, 0x90
LBB0_25:                                ##   in Loop: Header=BB0_10 Depth=2
	xbegin	LBB0_5
## %bb.26:                              ##   in Loop: Header=BB0_10 Depth=2
	movl	$-1, %eax
	cmpl	$-1, %eax
	je	LBB0_7
LBB0_10:                                ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	__abort(%rip), %rsi
	incq	(%rsi,%r15,8)
	testl	%eax, %eax
	je	LBB0_24
## %bb.11:                              ##   in Loop: Header=BB0_10 Depth=2
	testb	$4, %al
	jne	LBB0_12
## %bb.13:                              ##   in Loop: Header=BB0_10 Depth=2
	testb	$8, %al
	jne	LBB0_14
LBB0_15:                                ##   in Loop: Header=BB0_10 Depth=2
	testb	$16, %al
	jne	LBB0_16
LBB0_17:                                ##   in Loop: Header=BB0_10 Depth=2
	testb	$2, %al
	je	LBB0_18
LBB0_19:                                ##   in Loop: Header=BB0_10 Depth=2
	testb	$32, %al
	jne	LBB0_20
## %bb.22:                              ##   in Loop: Header=BB0_10 Depth=2
	testb	$1, %al
	je	LBB0_25
	jmp	LBB0_23
	.p2align	4, 0x90
LBB0_24:                                ##   in Loop: Header=BB0_10 Depth=2
	movq	_zero(%rip), %rax
	incq	(%rax,%r15,8)
	movq	(%r14), %rax
	movl	(%rax,%rdx), %esi
	addl	(%rax,%rcx), %esi
	movl	%esi, _Touch(%rip)
	jmp	LBB0_25
	.p2align	4, 0x90
LBB0_12:                                ##   in Loop: Header=BB0_10 Depth=2
	movq	_conflict(%rip), %rsi
	incq	(%rsi,%r15,8)
	testb	$8, %al
	je	LBB0_15
LBB0_14:                                ##   in Loop: Header=BB0_10 Depth=2
	movq	_capacity(%rip), %rsi
	incq	(%rsi,%r15,8)
	testb	$16, %al
	je	LBB0_17
LBB0_16:                                ##   in Loop: Header=BB0_10 Depth=2
	movq	_debug(%rip), %rsi
	incq	(%rsi,%r15,8)
	testb	$2, %al
	jne	LBB0_19
LBB0_18:                                ##   in Loop: Header=BB0_1 Depth=1
	leaq	_failed(%rip), %rax
	jmp	LBB0_8
	.p2align	4, 0x90
LBB0_7:                                 ##   in Loop: Header=BB0_1 Depth=1
	movq	(%r14), %rax
	incq	(%rax,%rcx)
	decq	(%rax,%rdx)
	xend
	movq	%r13, %rax
LBB0_8:                                 ##   in Loop: Header=BB0_1 Depth=1
	movq	(%rax), %rax
	incq	(%rax,%r15,8)
	incl	%r12d
	cmpl	$1000000000, %r12d      ## imm = 0x3B9ACA00
	jb	LBB0_1
## %bb.9:
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB0_20:
	leaq	L_str.5(%rip), %rdi
	callq	_puts
	movl	$-1, %edi
	callq	_exit
LBB0_23:
	leaq	L_str(%rip), %rdi
	callq	_puts
	movl	$-1, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.globl	__Z2f2v                 ## -- Begin function _Z2f2v
	.p2align	4, 0x90
__Z2f2v:                                ## @_Z2f2v
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
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	leaq	L_str.6(%rip), %rdi
	callq	_puts
	xorl	%r10d, %r10d
	xorl	%eax, %eax
	xorl	%r8d, %r8d
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	xorl	%r11d, %r11d
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	%r12, -48(%rbp)         ## 8-byte Spill
	movq	_tx(%rip), %rdx
	movq	__abort(%rip), %rsi
	movq	_failed(%rip), %rbx
	movq	%rax, %r12
	movq	_capacity(%rip), %rax
	movq	_debug(%rip), %rdi
	movq	(%rdx), %rdx
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
	movq	(%rsi), %rcx
	movq	%rcx, -64(%rbp)         ## 8-byte Spill
	movq	(%rbx), %rbx
	movq	%rbx, -80(%rbp)         ## 8-byte Spill
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movq	%r8, %r9
	movq	%r13, %r15
	movq	(%rdi), %r13
	movq	%rdx, %rsi
	subq	%r10, %rsi
	movq	%rcx, %rdx
	subq	%r12, %rdx
	movq	%rbx, %rcx
	subq	%r14, %rcx
	movq	%rax, %r8
	subq	%r9, %r8
	movq	%r13, %r9
	subq	%r15, %r9
	movq	_conflict(%rip), %rax
	movq	(%rax), %r15
	movq	%r15, %r14
	subq	%r11, %r14
	movq	_zero(%rip), %rax
	movq	(%rax), %r12
	movq	%r12, %rbx
	subq	-48(%rbp), %rbx         ## 8-byte Folded Reload
	xorl	%eax, %eax
	leaq	L_.str.3(%rip), %rdi
	pushq	%rbx
	pushq	%r14
	callq	_printf
	addq	$16, %rsp
	movl	$1, %edi
	callq	_sleep
	movq	-72(%rbp), %r10         ## 8-byte Reload
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	-56(%rbp), %r8          ## 8-byte Reload
	movq	-80(%rbp), %r14         ## 8-byte Reload
	movq	%r15, %r11
	jmp	LBB1_1
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
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
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movl	$16, %edi
	callq	__Znwm
	movq	%rax, %rbx
	movq	%rbx, -64(%rbp)
	movl	$655360, %edi           ## imm = 0xA0000
	callq	__Znam
	movq	%rax, (%rbx)
	movq	$10240, 8(%rbx)         ## imm = 0x2800
	addq	$72, %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	%rcx, -64(%rax)
	movq	$0, -72(%rax)
	leaq	1(%rcx), %rdx
	movq	%rdx, (%rax)
	movq	$0, -8(%rax)
	subq	$-128, %rax
	addq	$2, %rcx
	cmpq	$10240, %rcx            ## imm = 0x2800
	jne	LBB2_1
## %bb.2:
	movl	$8, %edi
	callq	__Znam
	movq	%rax, _tx(%rip)
	movl	$8, %edi
	callq	__Znam
	movq	%rax, __abort(%rip)
	movl	$8, %edi
	callq	__Znam
	movq	%rax, _capacity(%rip)
	movl	$8, %edi
	callq	__Znam
	movq	%rax, _debug(%rip)
	movl	$8, %edi
	callq	__Znam
	movq	%rax, _failed(%rip)
	movl	$8, %edi
	callq	__Znam
	movq	%rax, _conflict(%rip)
	movl	$8, %edi
	callq	__Znam
	movq	%rax, _zero(%rip)
	movl	$8, %edi
	callq	__Znwm
	movq	%rax, %rbx
Ltmp0:
	leaq	__Z2f2v(%rip), %rsi
	movq	%rbx, %rdi
	callq	__ZNSt3__16threadC2IRFPvvEJEvEEOT_DpOT0_
Ltmp1:
## %bb.3:
	movl	$0, -52(%rbp)
	xorl	%eax, %eax
	leaq	__Z2f1P4Banki(%rip), %r14
	leaq	-64(%rbp), %r15
	leaq	-52(%rbp), %r12
	.p2align	4, 0x90
LBB2_4:                                 ## =>This Inner Loop Header: Depth=1
	movq	_zero(%rip), %rcx
	cltq
	movq	$0, (%rcx,%rax,8)
	movq	_conflict(%rip), %rcx
	movq	$0, (%rcx,%rax,8)
	movq	_failed(%rip), %rcx
	movq	$0, (%rcx,%rax,8)
	movq	_debug(%rip), %rcx
	movq	$0, (%rcx,%rax,8)
	movq	_capacity(%rip), %rcx
	movq	$0, (%rcx,%rax,8)
	movq	__abort(%rip), %rcx
	movq	$0, (%rcx,%rax,8)
	movq	_tx(%rip), %rcx
	movq	$0, (%rcx,%rax,8)
	movl	$8, %edi
	callq	__Znwm
	movq	%rax, %rbx
Ltmp3:
	movq	%rbx, %rdi
	movq	%r14, %rsi
	movq	%r15, %rdx
	movq	%r12, %rcx
	callq	__ZNSt3__16threadC2IRFPvP4BankiEJRS4_RiEvEEOT_DpOT0_
Ltmp4:
## %bb.5:                               ##   in Loop: Header=BB2_4 Depth=1
	movslq	-52(%rbp), %rcx
	movq	%rbx, -48(%rbp,%rcx,8)
	leal	1(%rcx), %eax
	movl	%eax, -52(%rbp)
	testq	%rcx, %rcx
	js	LBB2_4
## %bb.6:
	movq	-48(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-40(%rbp), %rax
	jne	LBB2_11
## %bb.7:
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB2_11:
	callq	___stack_chk_fail
LBB2_8:
Ltmp2:
	jmp	LBB2_10
LBB2_9:
Ltmp5:
LBB2_10:
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table2:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\303\200"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	65                      ## Call site table length
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
Lset6 = Ltmp3-Ltmp1                     ##   Call between Ltmp1 and Ltmp3
	.long	Lset6
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset7 = Ltmp3-Lfunc_begin0              ## >> Call Site 4 <<
	.long	Lset7
Lset8 = Ltmp4-Ltmp3                     ##   Call between Ltmp3 and Ltmp4
	.long	Lset8
Lset9 = Ltmp5-Lfunc_begin0              ##     jumps to Ltmp5
	.long	Lset9
	.byte	0                       ##   On action: cleanup
Lset10 = Ltmp4-Lfunc_begin0             ## >> Call Site 5 <<
	.long	Lset10
Lset11 = Lfunc_end0-Ltmp4               ##   Call between Ltmp4 and Lfunc_end0
	.long	Lset11
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16threadC2IRFPvvEJEvEEOT_DpOT0_ ## -- Begin function _ZNSt3__16threadC2IRFPvvEJEvEEOT_DpOT0_
	.globl	__ZNSt3__16threadC2IRFPvvEJEvEEOT_DpOT0_
	.weak_def_can_be_hidden	__ZNSt3__16threadC2IRFPvvEJEvEEOT_DpOT0_
	.p2align	4, 0x90
__ZNSt3__16threadC2IRFPvvEJEvEEOT_DpOT0_: ## @_ZNSt3__16threadC2IRFPvvEJEvEEOT_DpOT0_
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
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$8, %edi
	callq	__Znwm
	movq	%rax, %r15
Ltmp6:
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structC1Ev
Ltmp7:
## %bb.1:
Ltmp9:
	movl	$16, %edi
	callq	__Znwm
	movq	%rax, %rbx
Ltmp10:
## %bb.2:
	movq	%r15, (%rbx)
	movq	%r12, 8(%rbx)
Ltmp12:
	movq	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFPvvEEEEEES7_S7_@GOTPCREL(%rip), %rdx
	xorl	%esi, %esi
	movq	%r14, %rdi
	movq	%rbx, %rcx
	callq	_pthread_create
Ltmp13:
## %bb.3:
	testl	%eax, %eax
	jne	LBB3_9
## %bb.4:
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB3_9:
Ltmp14:
	leaq	L_.str.4(%rip), %rsi
	movl	%eax, %edi
	callq	__ZNSt3__120__throw_system_errorEiPKc
Ltmp15:
## %bb.10:
	ud2
LBB3_6:
Ltmp16:
	movq	%rax, %r14
	movq	(%rbx), %r15
	movq	$0, (%rbx)
	testq	%r15, %r15
	je	LBB3_8
## %bb.7:
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%r15, %rdi
	callq	__ZdlPv
LBB3_8:
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
LBB3_11:
Ltmp11:
	movq	%rax, %r14
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	jmp	LBB3_12
LBB3_5:
Ltmp8:
	movq	%rax, %r14
LBB3_12:
	movq	%r15, %rdi
	callq	__ZdlPv
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table3:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\303\200"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	65                      ## Call site table length
Lset12 = Lfunc_begin1-Lfunc_begin1      ## >> Call Site 1 <<
	.long	Lset12
Lset13 = Ltmp6-Lfunc_begin1             ##   Call between Lfunc_begin1 and Ltmp6
	.long	Lset13
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset14 = Ltmp6-Lfunc_begin1             ## >> Call Site 2 <<
	.long	Lset14
Lset15 = Ltmp7-Ltmp6                    ##   Call between Ltmp6 and Ltmp7
	.long	Lset15
Lset16 = Ltmp8-Lfunc_begin1             ##     jumps to Ltmp8
	.long	Lset16
	.byte	0                       ##   On action: cleanup
Lset17 = Ltmp9-Lfunc_begin1             ## >> Call Site 3 <<
	.long	Lset17
Lset18 = Ltmp10-Ltmp9                   ##   Call between Ltmp9 and Ltmp10
	.long	Lset18
Lset19 = Ltmp11-Lfunc_begin1            ##     jumps to Ltmp11
	.long	Lset19
	.byte	0                       ##   On action: cleanup
Lset20 = Ltmp12-Lfunc_begin1            ## >> Call Site 4 <<
	.long	Lset20
Lset21 = Ltmp15-Ltmp12                  ##   Call between Ltmp12 and Ltmp15
	.long	Lset21
Lset22 = Ltmp16-Lfunc_begin1            ##     jumps to Ltmp16
	.long	Lset22
	.byte	0                       ##   On action: cleanup
Lset23 = Ltmp15-Lfunc_begin1            ## >> Call Site 5 <<
	.long	Lset23
Lset24 = Lfunc_end1-Ltmp15              ##   Call between Ltmp15 and Lfunc_end1
	.long	Lset24
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFPvvEEEEEES7_S7_ ## -- Begin function _ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFPvvEEEEEES7_S7_
	.weak_definition	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFPvvEEEEEES7_S7_
	.p2align	4, 0x90
__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFPvvEEEEEES7_S7_: ## @_ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFPvvEEEEEES7_S7_
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r15
Ltmp17:
	callq	__ZNSt3__119__thread_local_dataEv
Ltmp18:
## %bb.1:
	movq	(%r15), %rsi
	movq	$0, (%r15)
	movq	(%rax), %rdi
Ltmp20:
	callq	_pthread_setspecific
Ltmp21:
## %bb.2:
Ltmp22:
	callq	*8(%r15)
Ltmp23:
## %bb.3:
	movq	(%r15), %rbx
	movq	$0, (%r15)
	testq	%rbx, %rbx
	je	LBB4_5
## %bb.4:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB4_5:
	movq	%r15, %rdi
	callq	__ZdlPv
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB4_7:
Ltmp19:
	movq	%rax, %r14
	testq	%r15, %r15
	jne	LBB4_8
	jmp	LBB4_11
LBB4_6:
Ltmp24:
	movq	%rax, %r14
LBB4_8:
	movq	(%r15), %rbx
	movq	$0, (%r15)
	testq	%rbx, %rbx
	je	LBB4_10
## %bb.9:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB4_10:
	movq	%r15, %rdi
	callq	__ZdlPv
LBB4_11:
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end2:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table4:
Lexception2:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
Lset25 = Ltmp17-Lfunc_begin2            ## >> Call Site 1 <<
	.long	Lset25
Lset26 = Ltmp18-Ltmp17                  ##   Call between Ltmp17 and Ltmp18
	.long	Lset26
Lset27 = Ltmp19-Lfunc_begin2            ##     jumps to Ltmp19
	.long	Lset27
	.byte	0                       ##   On action: cleanup
Lset28 = Ltmp20-Lfunc_begin2            ## >> Call Site 2 <<
	.long	Lset28
Lset29 = Ltmp23-Ltmp20                  ##   Call between Ltmp20 and Ltmp23
	.long	Lset29
Lset30 = Ltmp24-Lfunc_begin2            ##     jumps to Ltmp24
	.long	Lset30
	.byte	0                       ##   On action: cleanup
Lset31 = Ltmp23-Lfunc_begin2            ## >> Call Site 3 <<
	.long	Lset31
Lset32 = Lfunc_end2-Ltmp23              ##   Call between Ltmp23 and Lfunc_end2
	.long	Lset32
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16threadC2IRFPvP4BankiEJRS4_RiEvEEOT_DpOT0_ ## -- Begin function _ZNSt3__16threadC2IRFPvP4BankiEJRS4_RiEvEEOT_DpOT0_
	.globl	__ZNSt3__16threadC2IRFPvP4BankiEJRS4_RiEvEEOT_DpOT0_
	.weak_def_can_be_hidden	__ZNSt3__16threadC2IRFPvP4BankiEJRS4_RiEvEEOT_DpOT0_
	.p2align	4, 0x90
__ZNSt3__16threadC2IRFPvP4BankiEJRS4_RiEvEEOT_DpOT0_: ## @_ZNSt3__16threadC2IRFPvP4BankiEJRS4_RiEvEEOT_DpOT0_
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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, %r13
	movq	%rdx, %r14
	movq	%rsi, %r12
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	movl	$8, %edi
	callq	__Znwm
	movq	%rax, %r15
Ltmp25:
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structC1Ev
Ltmp26:
## %bb.1:
Ltmp28:
	movl	$32, %edi
	callq	__Znwm
	movq	%rax, %rbx
Ltmp29:
## %bb.2:
	movq	(%r14), %rax
	movl	(%r13), %ecx
	movq	%r15, (%rbx)
	movq	%r12, 8(%rbx)
	movq	%rax, 16(%rbx)
	movl	%ecx, 24(%rbx)
Ltmp31:
	movq	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFPvP4BankiES9_iEEEEES7_S7_@GOTPCREL(%rip), %rdx
	xorl	%esi, %esi
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	movq	%rbx, %rcx
	callq	_pthread_create
Ltmp32:
## %bb.3:
	testl	%eax, %eax
	jne	LBB5_9
## %bb.4:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB5_9:
Ltmp33:
	leaq	L_.str.4(%rip), %rsi
	movl	%eax, %edi
	callq	__ZNSt3__120__throw_system_errorEiPKc
Ltmp34:
## %bb.10:
	ud2
LBB5_6:
Ltmp35:
	movq	%rax, %r14
	movq	(%rbx), %r15
	movq	$0, (%rbx)
	testq	%r15, %r15
	je	LBB5_8
## %bb.7:
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%r15, %rdi
	callq	__ZdlPv
LBB5_8:
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
LBB5_11:
Ltmp30:
	movq	%rax, %r14
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	jmp	LBB5_12
LBB5_5:
Ltmp27:
	movq	%rax, %r14
LBB5_12:
	movq	%r15, %rdi
	callq	__ZdlPv
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end3:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table5:
Lexception3:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\303\200"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	65                      ## Call site table length
Lset33 = Lfunc_begin3-Lfunc_begin3      ## >> Call Site 1 <<
	.long	Lset33
Lset34 = Ltmp25-Lfunc_begin3            ##   Call between Lfunc_begin3 and Ltmp25
	.long	Lset34
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset35 = Ltmp25-Lfunc_begin3            ## >> Call Site 2 <<
	.long	Lset35
Lset36 = Ltmp26-Ltmp25                  ##   Call between Ltmp25 and Ltmp26
	.long	Lset36
Lset37 = Ltmp27-Lfunc_begin3            ##     jumps to Ltmp27
	.long	Lset37
	.byte	0                       ##   On action: cleanup
Lset38 = Ltmp28-Lfunc_begin3            ## >> Call Site 3 <<
	.long	Lset38
Lset39 = Ltmp29-Ltmp28                  ##   Call between Ltmp28 and Ltmp29
	.long	Lset39
Lset40 = Ltmp30-Lfunc_begin3            ##     jumps to Ltmp30
	.long	Lset40
	.byte	0                       ##   On action: cleanup
Lset41 = Ltmp31-Lfunc_begin3            ## >> Call Site 4 <<
	.long	Lset41
Lset42 = Ltmp34-Ltmp31                  ##   Call between Ltmp31 and Ltmp34
	.long	Lset42
Lset43 = Ltmp35-Lfunc_begin3            ##     jumps to Ltmp35
	.long	Lset43
	.byte	0                       ##   On action: cleanup
Lset44 = Ltmp34-Lfunc_begin3            ## >> Call Site 5 <<
	.long	Lset44
Lset45 = Lfunc_end3-Ltmp34              ##   Call between Ltmp34 and Lfunc_end3
	.long	Lset45
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFPvP4BankiES9_iEEEEES7_S7_ ## -- Begin function _ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFPvP4BankiES9_iEEEEES7_S7_
	.weak_definition	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFPvP4BankiES9_iEEEEES7_S7_
	.p2align	4, 0x90
__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFPvP4BankiES9_iEEEEES7_S7_: ## @_ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFPvP4BankiES9_iEEEEES7_S7_
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r15
Ltmp36:
	callq	__ZNSt3__119__thread_local_dataEv
Ltmp37:
## %bb.1:
	movq	(%r15), %rsi
	movq	$0, (%r15)
	movq	(%rax), %rdi
Ltmp39:
	callq	_pthread_setspecific
Ltmp40:
## %bb.2:
	movq	16(%r15), %rdi
	movl	24(%r15), %esi
Ltmp41:
	callq	*8(%r15)
Ltmp42:
## %bb.3:
	movq	(%r15), %rbx
	movq	$0, (%r15)
	testq	%rbx, %rbx
	je	LBB6_5
## %bb.4:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB6_5:
	movq	%r15, %rdi
	callq	__ZdlPv
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB6_7:
Ltmp38:
	movq	%rax, %r14
	testq	%r15, %r15
	jne	LBB6_8
	jmp	LBB6_11
LBB6_6:
Ltmp43:
	movq	%rax, %r14
LBB6_8:
	movq	(%r15), %rbx
	movq	$0, (%r15)
	testq	%rbx, %rbx
	je	LBB6_10
## %bb.9:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB6_10:
	movq	%r15, %rdi
	callq	__ZdlPv
LBB6_11:
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end4:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table6:
Lexception4:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
Lset46 = Ltmp36-Lfunc_begin4            ## >> Call Site 1 <<
	.long	Lset46
Lset47 = Ltmp37-Ltmp36                  ##   Call between Ltmp36 and Ltmp37
	.long	Lset47
Lset48 = Ltmp38-Lfunc_begin4            ##     jumps to Ltmp38
	.long	Lset48
	.byte	0                       ##   On action: cleanup
Lset49 = Ltmp39-Lfunc_begin4            ## >> Call Site 2 <<
	.long	Lset49
Lset50 = Ltmp42-Ltmp39                  ##   Call between Ltmp39 and Ltmp42
	.long	Lset50
Lset51 = Ltmp43-Lfunc_begin4            ##     jumps to Ltmp43
	.long	Lset51
	.byte	0                       ##   On action: cleanup
Lset52 = Ltmp42-Lfunc_begin4            ## >> Call Site 3 <<
	.long	Lset52
Lset53 = Lfunc_end4-Ltmp42              ##   Call between Ltmp42 and Lfunc_end4
	.long	Lset53
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.globl	_done                   ## @done
.zerofill __DATA,__common,_done,1,0
	.globl	_tx                     ## @tx
.zerofill __DATA,__common,_tx,8,3
	.globl	__abort                 ## @_abort
.zerofill __DATA,__common,__abort,8,3
	.globl	_capacity               ## @capacity
.zerofill __DATA,__common,_capacity,8,3
	.globl	_debug                  ## @debug
.zerofill __DATA,__common,_debug,8,3
	.globl	_failed                 ## @failed
.zerofill __DATA,__common,_failed,8,3
	.globl	_conflict               ## @conflict
.zerofill __DATA,__common,_conflict,8,3
	.globl	_zero                   ## @zero
.zerofill __DATA,__common,_zero,8,3
	.globl	_Touch                  ## @Touch
.zerofill __DATA,__common,_Touch,4,2
	.section	__TEXT,__cstring,cstring_literals
L_.str.3:                               ## @.str.3
	.asciz	"txs\t%ld\taborts\t\t%ld\tfaileds\t%ld\tcapacities\t%ld\tdebugs\t%ld\tconflit\t%ld\tzero\t%ld\n"

L_.str.4:                               ## @.str.4
	.asciz	"thread constructor failed"

	.p2align	4               ## @str
L_str:
	.asciz	"[ panic ] _XBEGIN_EXPLICIT"

	.p2align	4               ## @str.5
L_str.5:
	.asciz	"[ PANIC ] _XABORT_NESTED"

	.p2align	4               ## @str.6
L_str.6:
	.asciz	"_heartbeat function"


.subsections_via_symbols
