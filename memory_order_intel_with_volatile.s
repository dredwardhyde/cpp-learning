	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	__Z8producerv           ## -- Begin function _Z8producerv
	.p2align	4, 0x90
__Z8producerv:                          ## @_Z8producerv
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$24, %edi
	callq	__Znwm
	movq	$0, (%rax)
	movb	$10, (%rax)
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
	movl	$1819043144, 1(%rax)    ## imm = 0x6C6C6548
	movw	$111, 5(%rax)
	movq	%rax, _ptr2(%rip)
	## InlineAsm Start
	## InlineAsm End
	movl	$42, _data(%rip)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z8consumerv           ## -- Begin function _Z8consumerv
	.p2align	4, 0x90
__Z8consumerv:                          ## @_Z8consumerv
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
	pushq	%r14
	pushq	%rbx
	subq	$16, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.p2align	4, 0x90
    //VOLATILE ДОБАВИЛ ПРОВЕРКУ ПЕРЕМЕННОЙ В ЦИКЛЕ
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	cmpq	$0, _ptr2(%rip)
	je	LBB1_1
## %bb.2:
	movq	_ptr2(%rip), %rdi
	movb	(%rdi), %al
	testb	$1, %al
	je	LBB1_3
## %bb.4:
	movq	8(%rdi), %rax
	cmpq	$5, %rax
	je	LBB1_6
	jmp	LBB1_16
LBB1_3:
	shrb	%al
	movzbl	%al, %eax
	cmpq	$5, %rax
	jne	LBB1_16
LBB1_6:
Ltmp0:
	leaq	L_.str(%rip), %rcx
	xorl	%esi, %esi
	movq	$-1, %rdx
	movl	$5, %r8d
	callq	__ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmPKcm
Ltmp1:
## %bb.7:
	testl	%eax, %eax
	jne	LBB1_16
## %bb.8:
	cmpl	$42, _data(%rip)
	jne	LBB1_17
## %bb.9:
	movq	__ZNSt3__14coutE@GOTPCREL(%rip), %rdi
	leaq	L_.str.4(%rip), %rsi
	movl	$7, %edx
	callq	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	movq	%rax, %rbx
	movq	(%rbx), %rax
	movq	-24(%rax), %rsi
	addq	%rbx, %rsi
	leaq	-24(%rbp), %r14
	movq	%r14, %rdi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp3:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	movq	%r14, %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp4:
## %bb.10:
	movq	(%rax), %rcx
Ltmp5:
	movl	$10, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
	movl	%eax, %r14d
Ltmp6:
## %bb.11:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
	movsbl	%r14b, %esi
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE3putEc
	movq	%rbx, %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB1_16:
	leaq	L___func__._Z8consumerv(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	leaq	L_.str.2(%rip), %rcx
	movl	$29, %edx
	callq	___assert_rtn
LBB1_17:
	leaq	L___func__._Z8consumerv(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	leaq	L_.str.3(%rip), %rcx
	movl	$30, %edx
	callq	___assert_rtn
LBB1_15:
Ltmp2:
	movq	%rax, %rdi
	callq	___cxa_call_unexpected
LBB1_12:
Ltmp7:
	movq	%rax, %rbx
Ltmp8:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp9:
## %bb.13:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
LBB1_14:
Ltmp10:
	movq	%rax, %rdi
	callq	___clang_call_terminate
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table1:
Lexception0:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\330"                  ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	78                      ## Call site table length
Lset0 = Ltmp0-Lfunc_begin0              ## >> Call Site 1 <<
	.long	Lset0
Lset1 = Ltmp1-Ltmp0                     ##   Call between Ltmp0 and Ltmp1
	.long	Lset1
Lset2 = Ltmp2-Lfunc_begin0              ##     jumps to Ltmp2
	.long	Lset2
	.byte	1                       ##   On action: 1
Lset3 = Ltmp1-Lfunc_begin0              ## >> Call Site 2 <<
	.long	Lset3
Lset4 = Ltmp3-Ltmp1                     ##   Call between Ltmp1 and Ltmp3
	.long	Lset4
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset5 = Ltmp3-Lfunc_begin0              ## >> Call Site 3 <<
	.long	Lset5
Lset6 = Ltmp6-Ltmp3                     ##   Call between Ltmp3 and Ltmp6
	.long	Lset6
Lset7 = Ltmp7-Lfunc_begin0              ##     jumps to Ltmp7
	.long	Lset7
	.byte	0                       ##   On action: cleanup
Lset8 = Ltmp6-Lfunc_begin0              ## >> Call Site 4 <<
	.long	Lset8
Lset9 = Ltmp8-Ltmp6                     ##   Call between Ltmp6 and Ltmp8
	.long	Lset9
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset10 = Ltmp8-Lfunc_begin0             ## >> Call Site 5 <<
	.long	Lset10
Lset11 = Ltmp9-Ltmp8                    ##   Call between Ltmp8 and Ltmp9
	.long	Lset11
Lset12 = Ltmp10-Lfunc_begin0            ##     jumps to Ltmp10
	.long	Lset12
	.byte	3                       ##   On action: 2
Lset13 = Ltmp9-Lfunc_begin0             ## >> Call Site 6 <<
	.long	Lset13
Lset14 = Lfunc_end0-Ltmp9               ##   Call between Ltmp9 and Lfunc_end0
	.long	Lset14
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	127                     ## >> Action Record 1 <<
                                        ##   Filter TypeInfo -1
	.byte	0                       ##   No further actions
	.byte	1                       ## >> Action Record 2 <<
                                        ##   Catch TypeInfo 1
	.byte	0                       ##   No further actions
                                        ## >> Catch TypeInfos <<
	.long	0                       ## TypeInfo 1
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
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
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -24
	leaq	__Z8producerv(%rip), %rsi
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16threadC2IPFvvEEET_
Ltmp11:
	leaq	__Z8consumerv(%rip), %rsi
	leaq	-16(%rbp), %rdi
	callq	__ZNSt3__16threadC2IPFvvEEET_
Ltmp12:
## %bb.1:
Ltmp13:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp14:
## %bb.2:
Ltmp15:
	leaq	-16(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp16:
## %bb.3:
Ltmp20:
	leaq	-16(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
Ltmp21:
## %bb.4:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB2_5:
Ltmp22:
	movq	%rax, %rbx
	jmp	LBB2_7
LBB2_6:
Ltmp17:
	movq	%rax, %rbx
Ltmp18:
	leaq	-16(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
Ltmp19:
LBB2_7:
Ltmp23:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
Ltmp24:
## %bb.8:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
LBB2_9:
Ltmp25:
	movq	%rax, %rdi
	callq	___clang_call_terminate
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table2:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\343\200"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	91                      ## Call site table length
Lset15 = Lfunc_begin1-Lfunc_begin1      ## >> Call Site 1 <<
	.long	Lset15
Lset16 = Ltmp11-Lfunc_begin1            ##   Call between Lfunc_begin1 and Ltmp11
	.long	Lset16
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset17 = Ltmp11-Lfunc_begin1            ## >> Call Site 2 <<
	.long	Lset17
Lset18 = Ltmp12-Ltmp11                  ##   Call between Ltmp11 and Ltmp12
	.long	Lset18
Lset19 = Ltmp22-Lfunc_begin1            ##     jumps to Ltmp22
	.long	Lset19
	.byte	0                       ##   On action: cleanup
Lset20 = Ltmp13-Lfunc_begin1            ## >> Call Site 3 <<
	.long	Lset20
Lset21 = Ltmp16-Ltmp13                  ##   Call between Ltmp13 and Ltmp16
	.long	Lset21
Lset22 = Ltmp17-Lfunc_begin1            ##     jumps to Ltmp17
	.long	Lset22
	.byte	0                       ##   On action: cleanup
Lset23 = Ltmp20-Lfunc_begin1            ## >> Call Site 4 <<
	.long	Lset23
Lset24 = Ltmp21-Ltmp20                  ##   Call between Ltmp20 and Ltmp21
	.long	Lset24
Lset25 = Ltmp22-Lfunc_begin1            ##     jumps to Ltmp22
	.long	Lset25
	.byte	0                       ##   On action: cleanup
Lset26 = Ltmp21-Lfunc_begin1            ## >> Call Site 5 <<
	.long	Lset26
Lset27 = Ltmp18-Ltmp21                  ##   Call between Ltmp21 and Ltmp18
	.long	Lset27
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset28 = Ltmp18-Lfunc_begin1            ## >> Call Site 6 <<
	.long	Lset28
Lset29 = Ltmp24-Ltmp18                  ##   Call between Ltmp18 and Ltmp24
	.long	Lset29
Lset30 = Ltmp25-Lfunc_begin1            ##     jumps to Ltmp25
	.long	Lset30
	.byte	1                       ##   On action: 1
Lset31 = Ltmp24-Lfunc_begin1            ## >> Call Site 7 <<
	.long	Lset31
Lset32 = Lfunc_end1-Ltmp24              ##   Call between Ltmp24 and Lfunc_end1
	.long	Lset32
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
	.globl	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m ## -- Begin function _ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.weak_def_can_be_hidden	__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
	.p2align	4, 0x90
__ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m: ## @_ZNSt3__124__put_character_sequenceIcNS_11char_traitsIcEEEERNS_13basic_ostreamIT_T0_EES7_PKS4_m
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
	subq	$40, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
Ltmp26:
	leaq	-80(%rbp), %rdi
	movq	%rbx, %rsi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryC1ERS3_
Ltmp27:
## %bb.1:
	cmpb	$0, -80(%rbp)
	je	LBB4_11
## %bb.2:
	movq	(%rbx), %rax
	movq	-24(%rax), %rax
	leaq	(%rbx,%rax), %r12
	movq	40(%rbx,%rax), %rdi
	movl	8(%rbx,%rax), %r13d
	movl	144(%rbx,%rax), %eax
	cmpl	$-1, %eax
	jne	LBB4_8
## %bb.3:
Ltmp28:
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	leaq	-56(%rbp), %rdi
	movq	%r12, %rsi
	callq	__ZNKSt3__18ios_base6getlocEv
Ltmp29:
## %bb.4:
Ltmp30:
	movq	__ZNSt3__15ctypeIcE2idE@GOTPCREL(%rip), %rsi
	leaq	-56(%rbp), %rdi
	callq	__ZNKSt3__16locale9use_facetERNS0_2idE
Ltmp31:
## %bb.5:
	movq	(%rax), %rcx
Ltmp32:
	movl	$32, %esi
	movq	%rax, %rdi
	callq	*56(%rcx)
	movb	%al, -41(%rbp)          ## 1-byte Spill
Ltmp33:
## %bb.6:
Ltmp38:
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp39:
## %bb.7:
	movsbl	-41(%rbp), %eax         ## 1-byte Folded Reload
	movl	%eax, 144(%r12)
	movq	-64(%rbp), %rdi         ## 8-byte Reload
LBB4_8:
	addq	%r15, %r14
	andl	$176, %r13d
	cmpl	$32, %r13d
	movq	%r15, %rdx
	cmoveq	%r14, %rdx
Ltmp40:
	movsbl	%al, %r9d
	movq	%r15, %rsi
	movq	%r14, %rcx
	movq	%r12, %r8
	callq	__ZNSt3__116__pad_and_outputIcNS_11char_traitsIcEEEENS_19ostreambuf_iteratorIT_T0_EES6_PKS4_S8_S8_RNS_8ios_baseES4_
Ltmp41:
## %bb.9:
	testq	%rax, %rax
	jne	LBB4_11
## %bb.10:
	movq	(%rbx), %rax
	movq	-24(%rax), %rax
	leaq	(%rbx,%rax), %rdi
	movl	32(%rbx,%rax), %esi
	orl	$5, %esi
Ltmp42:
	callq	__ZNSt3__18ios_base5clearEj
Ltmp43:
LBB4_11:
Ltmp47:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp48:
LBB4_19:
	movq	%rbx, %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB4_12:
Ltmp34:
	movq	%rax, %r14
Ltmp35:
	leaq	-56(%rbp), %rdi
	callq	__ZNSt3__16localeD1Ev
Ltmp36:
	jmp	LBB4_15
LBB4_13:
Ltmp37:
	movq	%rax, %rdi
	callq	___clang_call_terminate
LBB4_14:
Ltmp44:
	movq	%rax, %r14
LBB4_15:
Ltmp45:
	leaq	-80(%rbp), %rdi
	callq	__ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE6sentryD1Ev
Ltmp46:
	jmp	LBB4_17
LBB4_16:
Ltmp49:
	movq	%rax, %r14
LBB4_17:
	movq	%r14, %rdi
	callq	___cxa_begin_catch
	movq	(%rbx), %rax
	movq	%rbx, %rdi
	addq	-24(%rax), %rdi
Ltmp50:
	callq	__ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv
Ltmp51:
## %bb.18:
	callq	___cxa_end_catch
	jmp	LBB4_19
LBB4_20:
Ltmp52:
	movq	%rax, %rbx
Ltmp53:
	callq	___cxa_end_catch
Ltmp54:
## %bb.21:
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
LBB4_22:
Ltmp55:
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
Lset33 = Ltmp26-Lfunc_begin2            ## >> Call Site 1 <<
	.long	Lset33
Lset34 = Ltmp27-Ltmp26                  ##   Call between Ltmp26 and Ltmp27
	.long	Lset34
Lset35 = Ltmp49-Lfunc_begin2            ##     jumps to Ltmp49
	.long	Lset35
	.byte	1                       ##   On action: 1
Lset36 = Ltmp28-Lfunc_begin2            ## >> Call Site 2 <<
	.long	Lset36
Lset37 = Ltmp29-Ltmp28                  ##   Call between Ltmp28 and Ltmp29
	.long	Lset37
Lset38 = Ltmp44-Lfunc_begin2            ##     jumps to Ltmp44
	.long	Lset38
	.byte	1                       ##   On action: 1
Lset39 = Ltmp30-Lfunc_begin2            ## >> Call Site 3 <<
	.long	Lset39
Lset40 = Ltmp33-Ltmp30                  ##   Call between Ltmp30 and Ltmp33
	.long	Lset40
Lset41 = Ltmp34-Lfunc_begin2            ##     jumps to Ltmp34
	.long	Lset41
	.byte	1                       ##   On action: 1
Lset42 = Ltmp38-Lfunc_begin2            ## >> Call Site 4 <<
	.long	Lset42
Lset43 = Ltmp43-Ltmp38                  ##   Call between Ltmp38 and Ltmp43
	.long	Lset43
Lset44 = Ltmp44-Lfunc_begin2            ##     jumps to Ltmp44
	.long	Lset44
	.byte	1                       ##   On action: 1
Lset45 = Ltmp47-Lfunc_begin2            ## >> Call Site 5 <<
	.long	Lset45
Lset46 = Ltmp48-Ltmp47                  ##   Call between Ltmp47 and Ltmp48
	.long	Lset46
Lset47 = Ltmp49-Lfunc_begin2            ##     jumps to Ltmp49
	.long	Lset47
	.byte	1                       ##   On action: 1
Lset48 = Ltmp35-Lfunc_begin2            ## >> Call Site 6 <<
	.long	Lset48
Lset49 = Ltmp36-Ltmp35                  ##   Call between Ltmp35 and Ltmp36
	.long	Lset49
Lset50 = Ltmp37-Lfunc_begin2            ##     jumps to Ltmp37
	.long	Lset50
	.byte	1                       ##   On action: 1
Lset51 = Ltmp45-Lfunc_begin2            ## >> Call Site 7 <<
	.long	Lset51
Lset52 = Ltmp46-Ltmp45                  ##   Call between Ltmp45 and Ltmp46
	.long	Lset52
Lset53 = Ltmp55-Lfunc_begin2            ##     jumps to Ltmp55
	.long	Lset53
	.byte	1                       ##   On action: 1
Lset54 = Ltmp46-Lfunc_begin2            ## >> Call Site 8 <<
	.long	Lset54
Lset55 = Ltmp50-Ltmp46                  ##   Call between Ltmp46 and Ltmp50
	.long	Lset55
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset56 = Ltmp50-Lfunc_begin2            ## >> Call Site 9 <<
	.long	Lset56
Lset57 = Ltmp51-Ltmp50                  ##   Call between Ltmp50 and Ltmp51
	.long	Lset57
Lset58 = Ltmp52-Lfunc_begin2            ##     jumps to Ltmp52
	.long	Lset58
	.byte	0                       ##   On action: cleanup
Lset59 = Ltmp51-Lfunc_begin2            ## >> Call Site 10 <<
	.long	Lset59
Lset60 = Ltmp53-Ltmp51                  ##   Call between Ltmp51 and Ltmp53
	.long	Lset60
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset61 = Ltmp53-Lfunc_begin2            ## >> Call Site 11 <<
	.long	Lset61
Lset62 = Ltmp54-Ltmp53                  ##   Call between Ltmp53 and Ltmp54
	.long	Lset62
Lset63 = Ltmp55-Lfunc_begin2            ##     jumps to Ltmp55
	.long	Lset63
	.byte	1                       ##   On action: 1
Lset64 = Ltmp54-Lfunc_begin2            ## >> Call Site 12 <<
	.long	Lset64
Lset65 = Lfunc_end2-Ltmp54              ##   Call between Ltmp54 and Lfunc_end2
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
	je	LBB5_19
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
	jle	LBB5_3
## %bb.2:
	movq	(%r13), %rax
	movq	%r13, %rdi
	movq	%rbx, %rdx
	callq	*96(%rax)
	cmpq	%rbx, %rax
	jne	LBB5_19
LBB5_3:
	testq	%r14, %r14
	jle	LBB5_15
## %bb.4:
	movq	%r12, -80(%rbp)         ## 8-byte Spill
	xorps	%xmm0, %xmm0
	movaps	%xmm0, -64(%rbp)
	movq	$0, -48(%rbp)
	cmpq	$23, %r14
	jae	LBB5_8
## %bb.5:
	movl	%r14d, %eax
	addb	%al, %al
	movb	%al, -64(%rbp)
	leaq	-63(%rbp), %rbx
	movq	%rbx, %r12
	jmp	LBB5_9
LBB5_8:
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
LBB5_9:
	movzbl	-68(%rbp), %esi         ## 1-byte Folded Reload
	movq	%r12, %rdi
	movq	%r14, %rdx
	callq	_memset
	movb	$0, (%r12,%r14)
	testb	$1, -64(%rbp)
	je	LBB5_11
## %bb.10:
	movq	-48(%rbp), %rbx
LBB5_11:
	movq	(%r13), %rax
Ltmp56:
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%r14, %rdx
	callq	*96(%rax)
	movq	%rax, %rbx
Ltmp57:
	movq	-80(%rbp), %r12         ## 8-byte Reload
## %bb.12:
	testb	$1, -64(%rbp)
	je	LBB5_14
## %bb.13:
	movq	-48(%rbp), %rdi
	callq	__ZdlPv
LBB5_14:
	cmpq	%r14, %rbx
	jne	LBB5_19
LBB5_15:
	movq	-88(%rbp), %rsi         ## 8-byte Reload
	subq	%rsi, %r15
	testq	%r15, %r15
	jle	LBB5_17
## %bb.16:
	movq	(%r13), %rax
	movq	%r13, %rdi
	movq	%r15, %rdx
	callq	*96(%rax)
	cmpq	%r15, %rax
	jne	LBB5_19
LBB5_17:
	movq	$0, 24(%r12)
	jmp	LBB5_20
LBB5_19:
	xorl	%r13d, %r13d
LBB5_20:
	movq	%r13, %rax
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB5_21:
Ltmp58:
	movq	%rax, %rbx
	testb	$1, -64(%rbp)
	je	LBB5_23
## %bb.22:
	movq	-48(%rbp), %rdi
	callq	__ZdlPv
LBB5_23:
	movq	%rbx, %rdi
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
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
Lset66 = Lfunc_begin3-Lfunc_begin3      ## >> Call Site 1 <<
	.long	Lset66
Lset67 = Ltmp56-Lfunc_begin3            ##   Call between Lfunc_begin3 and Ltmp56
	.long	Lset67
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset68 = Ltmp56-Lfunc_begin3            ## >> Call Site 2 <<
	.long	Lset68
Lset69 = Ltmp57-Ltmp56                  ##   Call between Ltmp56 and Ltmp57
	.long	Lset69
Lset70 = Ltmp58-Lfunc_begin3            ##     jumps to Ltmp58
	.long	Lset70
	.byte	0                       ##   On action: cleanup
Lset71 = Ltmp57-Lfunc_begin3            ## >> Call Site 3 <<
	.long	Lset71
Lset72 = Lfunc_end3-Ltmp57              ##   Call between Ltmp57 and Lfunc_end3
	.long	Lset72
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.private_extern	__ZNSt3__16threadC2IPFvvEEET_ ## -- Begin function _ZNSt3__16threadC2IPFvvEEET_
	.globl	__ZNSt3__16threadC2IPFvvEEET_
	.weak_def_can_be_hidden	__ZNSt3__16threadC2IPFvvEEET_
	.p2align	4, 0x90
__ZNSt3__16threadC2IPFvvEEET_:          ## @_ZNSt3__16threadC2IPFvvEEET_
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
	pushq	%r12
	pushq	%rbx
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r12
	movq	%rdi, %r14
	movl	$16, %edi
	callq	__Znwm
	movq	%rax, %r15
Ltmp59:
	movl	$8, %edi
	callq	__Znwm
	movq	%rax, %rbx
Ltmp60:
## %bb.1:
Ltmp62:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structC1Ev
Ltmp63:
## %bb.2:
	movq	%rbx, (%r15)
	movq	%r12, 8(%r15)
Ltmp65:
	movq	__ZNSt3__120__thread_proxy_cxx03INS_20__thread_invoke_pairIPFvvEEEEEPvS5_@GOTPCREL(%rip), %rdx
	xorl	%esi, %esi
	movq	%r14, %rdi
	movq	%r15, %rcx
	callq	_pthread_create
Ltmp66:
## %bb.3:
	testl	%eax, %eax
	jne	LBB6_10
## %bb.4:
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB6_10:
Ltmp67:
	leaq	L_.str.6(%rip), %rsi
	movl	%eax, %edi
	callq	__ZNSt3__120__throw_system_errorEiPKc
Ltmp68:
## %bb.11:
	ud2
LBB6_7:
Ltmp69:
	movq	%rax, %r14
	movq	(%r15), %rbx
	movq	$0, (%r15)
	testq	%rbx, %rbx
	je	LBB6_6
## %bb.8:
Ltmp70:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
Ltmp71:
	jmp	LBB6_9
LBB6_13:
Ltmp72:
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r14, %rdi
	callq	___cxa_call_unexpected
LBB6_12:
Ltmp64:
	movq	%rax, %r14
LBB6_9:
	movq	%rbx, %rdi
	callq	__ZdlPv
	jmp	LBB6_6
LBB6_5:
Ltmp61:
	movq	%rax, %r14
LBB6_6:
	movq	%r15, %rdi
	callq	__ZdlPv
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
	.asciz	"\322\200\200"          ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	78                      ## Call site table length
Lset73 = Lfunc_begin4-Lfunc_begin4      ## >> Call Site 1 <<
	.long	Lset73
Lset74 = Ltmp59-Lfunc_begin4            ##   Call between Lfunc_begin4 and Ltmp59
	.long	Lset74
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset75 = Ltmp59-Lfunc_begin4            ## >> Call Site 2 <<
	.long	Lset75
Lset76 = Ltmp60-Ltmp59                  ##   Call between Ltmp59 and Ltmp60
	.long	Lset76
Lset77 = Ltmp61-Lfunc_begin4            ##     jumps to Ltmp61
	.long	Lset77
	.byte	0                       ##   On action: cleanup
Lset78 = Ltmp62-Lfunc_begin4            ## >> Call Site 3 <<
	.long	Lset78
Lset79 = Ltmp63-Ltmp62                  ##   Call between Ltmp62 and Ltmp63
	.long	Lset79
Lset80 = Ltmp64-Lfunc_begin4            ##     jumps to Ltmp64
	.long	Lset80
	.byte	0                       ##   On action: cleanup
Lset81 = Ltmp65-Lfunc_begin4            ## >> Call Site 4 <<
	.long	Lset81
Lset82 = Ltmp68-Ltmp65                  ##   Call between Ltmp65 and Ltmp68
	.long	Lset82
Lset83 = Ltmp69-Lfunc_begin4            ##     jumps to Ltmp69
	.long	Lset83
	.byte	0                       ##   On action: cleanup
Lset84 = Ltmp70-Lfunc_begin4            ## >> Call Site 5 <<
	.long	Lset84
Lset85 = Ltmp71-Ltmp70                  ##   Call between Ltmp70 and Ltmp71
	.long	Lset85
Lset86 = Ltmp72-Lfunc_begin4            ##     jumps to Ltmp72
	.long	Lset86
	.byte	1                       ##   On action: 1
Lset87 = Ltmp71-Lfunc_begin4            ## >> Call Site 6 <<
	.long	Lset87
Lset88 = Lfunc_end4-Ltmp71              ##   Call between Ltmp71 and Lfunc_end4
	.long	Lset88
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	127                     ## >> Action Record 1 <<
                                        ##   Filter TypeInfo -1
	.byte	0                       ##   No further actions
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__120__thread_proxy_cxx03INS_20__thread_invoke_pairIPFvvEEEEEPvS5_ ## -- Begin function _ZNSt3__120__thread_proxy_cxx03INS_20__thread_invoke_pairIPFvvEEEEEPvS5_
	.weak_definition	__ZNSt3__120__thread_proxy_cxx03INS_20__thread_invoke_pairIPFvvEEEEEPvS5_
	.p2align	4, 0x90
__ZNSt3__120__thread_proxy_cxx03INS_20__thread_invoke_pairIPFvvEEEEEPvS5_: ## @_ZNSt3__120__thread_proxy_cxx03INS_20__thread_invoke_pairIPFvvEEEEEPvS5_
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
Ltmp78:
	callq	*8(%r15)
Ltmp79:
## %bb.3:
	movq	(%r15), %rbx
	movq	$0, (%r15)
	testq	%rbx, %rbx
	je	LBB7_6
## %bb.4:
Ltmp84:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
Ltmp85:
## %bb.5:
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB7_6:
	movq	%r15, %rdi
	callq	__ZdlPv
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB7_7:
Ltmp86:
LBB7_8:
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r14, %rdi
	callq	___cxa_call_unexpected
LBB7_10:
Ltmp75:
	movq	%rax, %r14
	testq	%r15, %r15
	jne	LBB7_11
	jmp	LBB7_15
LBB7_9:
Ltmp80:
	movq	%rax, %r14
LBB7_11:
	movq	(%r15), %rbx
	movq	$0, (%r15)
	testq	%rbx, %rbx
	je	LBB7_14
## %bb.12:
Ltmp81:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
Ltmp82:
## %bb.13:
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB7_14:
	movq	%r15, %rdi
	callq	__ZdlPv
LBB7_15:
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
LBB7_16:
Ltmp83:
	jmp	LBB7_8
Lfunc_end5:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table7:
Lexception5:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\322\200\200"          ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	78                      ## Call site table length
Lset89 = Ltmp73-Lfunc_begin5            ## >> Call Site 1 <<
	.long	Lset89
Lset90 = Ltmp74-Ltmp73                  ##   Call between Ltmp73 and Ltmp74
	.long	Lset90
Lset91 = Ltmp75-Lfunc_begin5            ##     jumps to Ltmp75
	.long	Lset91
	.byte	0                       ##   On action: cleanup
Lset92 = Ltmp76-Lfunc_begin5            ## >> Call Site 2 <<
	.long	Lset92
Lset93 = Ltmp79-Ltmp76                  ##   Call between Ltmp76 and Ltmp79
	.long	Lset93
Lset94 = Ltmp80-Lfunc_begin5            ##     jumps to Ltmp80
	.long	Lset94
	.byte	0                       ##   On action: cleanup
Lset95 = Ltmp84-Lfunc_begin5            ## >> Call Site 3 <<
	.long	Lset95
Lset96 = Ltmp85-Ltmp84                  ##   Call between Ltmp84 and Ltmp85
	.long	Lset96
Lset97 = Ltmp86-Lfunc_begin5            ##     jumps to Ltmp86
	.long	Lset97
	.byte	1                       ##   On action: 1
Lset98 = Ltmp85-Lfunc_begin5            ## >> Call Site 4 <<
	.long	Lset98
Lset99 = Ltmp81-Ltmp85                  ##   Call between Ltmp85 and Ltmp81
	.long	Lset99
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset100 = Ltmp81-Lfunc_begin5           ## >> Call Site 5 <<
	.long	Lset100
Lset101 = Ltmp82-Ltmp81                 ##   Call between Ltmp81 and Ltmp82
	.long	Lset101
Lset102 = Ltmp83-Lfunc_begin5           ##     jumps to Ltmp83
	.long	Lset102
	.byte	1                       ##   On action: 1
Lset103 = Ltmp82-Lfunc_begin5           ## >> Call Site 6 <<
	.long	Lset103
Lset104 = Lfunc_end5-Ltmp82             ##   Call between Ltmp82 and Lfunc_end5
	.long	Lset104
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.byte	127                     ## >> Action Record 1 <<
                                        ##   Filter TypeInfo -1
	.byte	0                       ##   No further actions
                                        ## >> Filter TypeInfos <<
	.byte	0
	.p2align	2
                                        ## -- End function
	.globl	_ptr2                   ## @ptr2
.zerofill __DATA,__common,_ptr2,8,3
	.globl	_data                   ## @data
.zerofill __DATA,__common,_data,4,2
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Hello"

L___func__._Z8consumerv:                ## @__func__._Z8consumerv
	.asciz	"consumer"

L_.str.1:                               ## @.str.1
	.asciz	"memory_order_intel.cpp"

L_.str.2:                               ## @.str.2
	.asciz	"*ptr2 == \"Hello\""

L_.str.3:                               ## @.str.3
	.asciz	"data == 42"

L_.str.4:                               ## @.str.4
	.asciz	"Success"

L_.str.6:                               ## @.str.6
	.asciz	"thread constructor failed"


.subsections_via_symbols
