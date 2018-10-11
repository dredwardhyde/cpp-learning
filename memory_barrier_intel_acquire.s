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
	movq	$0, 16(%rax)
	movq	$0, 8(%rax)
	movb	$10, (%rax)
	movl	$1819043144, 1(%rax)    ## imm = 0x6C6C6548
	movw	$111, 5(%rax)
	movl	$42, _data(%rip)
	movq	%rax, _ptr(%rip)
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
	.p2align	4, 0x90
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	_ptr(%rip), %rdi
	testq	%rdi, %rdi
	je	LBB1_1
## %bb.2:
	movb	(%rdi), %al
	testb	$1, %al
	je	LBB1_3
## %bb.4:
	movq	8(%rdi), %rax
	cmpq	$5, %rax
	je	LBB1_6
	jmp	LBB1_11
LBB1_3:
	shrb	%al
	movzbl	%al, %eax
	cmpq	$5, %rax
	jne	LBB1_11
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
	jne	LBB1_11
## %bb.8:
	cmpl	$42, _data(%rip)
	jne	LBB1_12
## %bb.9:
	popq	%rbp
	retq
LBB1_11:
	leaq	L___func__._Z8consumerv(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	leaq	L_.str.2(%rip), %rcx
	movl	$46, %edx
	callq	___assert_rtn
LBB1_12:
	leaq	L___func__._Z8consumerv(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	leaq	L_.str.3(%rip), %rcx
	movl	$47, %edx
	callq	___assert_rtn
LBB1_10:
Ltmp2:
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
	.asciz	"\242\200\200"          ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	26                      ## Call site table length
Lset0 = Ltmp0-Lfunc_begin0              ## >> Call Site 1 <<
	.long	Lset0
Lset1 = Ltmp1-Ltmp0                     ##   Call between Ltmp0 and Ltmp1
	.long	Lset1
Lset2 = Ltmp2-Lfunc_begin0              ##     jumps to Ltmp2
	.long	Lset2
	.byte	1                       ##   On action: 1
Lset3 = Ltmp1-Lfunc_begin0              ## >> Call Site 2 <<
	.long	Lset3
Lset4 = Lfunc_end0-Ltmp1                ##   Call between Ltmp1 and Lfunc_end0
	.long	Lset4
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
	callq	__ZNSt3__16threadC2IRFvvEJEvEEOT_DpOT0_
Ltmp3:
	leaq	__Z8consumerv(%rip), %rsi
	leaq	-16(%rbp), %rdi
	callq	__ZNSt3__16threadC2IRFvvEJEvEEOT_DpOT0_
Ltmp4:
## %bb.1:
Ltmp6:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp7:
## %bb.2:
Ltmp8:
	leaq	-16(%rbp), %rdi
	callq	__ZNSt3__16thread4joinEv
Ltmp9:
## %bb.3:
	leaq	-16(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
LBB2_4:
Ltmp5:
	movq	%rax, %rbx
	jmp	LBB2_6
LBB2_5:
Ltmp10:
	movq	%rax, %rbx
	leaq	-16(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
LBB2_6:
	leaq	-24(%rbp), %rdi
	callq	__ZNSt3__16threadD1Ev
	movq	%rbx, %rdi
	callq	__Unwind_Resume
	ud2
Lfunc_end1:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2
GCC_except_table2:
Lexception1:
	.byte	255                     ## @LPStart Encoding = omit
	.byte	155                     ## @TType Encoding = indirect pcrel sdata4
	.asciz	"\266\200\200"          ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	52                      ## Call site table length
Lset5 = Lfunc_begin1-Lfunc_begin1       ## >> Call Site 1 <<
	.long	Lset5
Lset6 = Ltmp3-Lfunc_begin1              ##   Call between Lfunc_begin1 and Ltmp3
	.long	Lset6
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset7 = Ltmp3-Lfunc_begin1              ## >> Call Site 2 <<
	.long	Lset7
Lset8 = Ltmp4-Ltmp3                     ##   Call between Ltmp3 and Ltmp4
	.long	Lset8
Lset9 = Ltmp5-Lfunc_begin1              ##     jumps to Ltmp5
	.long	Lset9
	.byte	0                       ##   On action: cleanup
Lset10 = Ltmp6-Lfunc_begin1             ## >> Call Site 3 <<
	.long	Lset10
Lset11 = Ltmp9-Ltmp6                    ##   Call between Ltmp6 and Ltmp9
	.long	Lset11
Lset12 = Ltmp10-Lfunc_begin1            ##     jumps to Ltmp10
	.long	Lset12
	.byte	0                       ##   On action: cleanup
Lset13 = Ltmp9-Lfunc_begin1             ## >> Call Site 4 <<
	.long	Lset13
Lset14 = Lfunc_end1-Ltmp9               ##   Call between Ltmp9 and Lfunc_end1
	.long	Lset14
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
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
	.private_extern	__ZNSt3__16threadC2IRFvvEJEvEEOT_DpOT0_ ## -- Begin function _ZNSt3__16threadC2IRFvvEJEvEEOT_DpOT0_
	.globl	__ZNSt3__16threadC2IRFvvEJEvEEOT_DpOT0_
	.weak_def_can_be_hidden	__ZNSt3__16threadC2IRFvvEJEvEEOT_DpOT0_
	.p2align	4, 0x90
__ZNSt3__16threadC2IRFvvEJEvEEOT_DpOT0_: ## @_ZNSt3__16threadC2IRFvvEJEvEEOT_DpOT0_
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
Ltmp11:
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structC1Ev
Ltmp12:
## %bb.1:
Ltmp14:
	movl	$16, %edi
	callq	__Znwm
	movq	%rax, %rbx
Ltmp15:
## %bb.2:
	movq	%r15, (%rbx)
	movq	%r12, 8(%rbx)
Ltmp17:
	movq	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvvEEEEEEPvSA_@GOTPCREL(%rip), %rdx
	xorl	%esi, %esi
	movq	%r14, %rdi
	movq	%rbx, %rcx
	callq	_pthread_create
Ltmp18:
## %bb.3:
	testl	%eax, %eax
	jne	LBB4_9
## %bb.4:
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB4_9:
Ltmp19:
	leaq	L_.str.5(%rip), %rsi
	movl	%eax, %edi
	callq	__ZNSt3__120__throw_system_errorEiPKc
Ltmp20:
## %bb.10:
	ud2
LBB4_6:
Ltmp21:
	movq	%rax, %r14
	movq	(%rbx), %r15
	movq	$0, (%rbx)
	testq	%r15, %r15
	je	LBB4_8
## %bb.7:
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%r15, %rdi
	callq	__ZdlPv
LBB4_8:
	movq	%rbx, %rdi
	callq	__ZdlPv
	movq	%r14, %rdi
	callq	__Unwind_Resume
	ud2
LBB4_11:
Ltmp16:
	movq	%rax, %r14
	movq	%r15, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	jmp	LBB4_12
LBB4_5:
Ltmp13:
	movq	%rax, %r14
LBB4_12:
	movq	%r15, %rdi
	callq	__ZdlPv
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
	.asciz	"\303\200"              ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	65                      ## Call site table length
Lset15 = Lfunc_begin2-Lfunc_begin2      ## >> Call Site 1 <<
	.long	Lset15
Lset16 = Ltmp11-Lfunc_begin2            ##   Call between Lfunc_begin2 and Ltmp11
	.long	Lset16
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
Lset17 = Ltmp11-Lfunc_begin2            ## >> Call Site 2 <<
	.long	Lset17
Lset18 = Ltmp12-Ltmp11                  ##   Call between Ltmp11 and Ltmp12
	.long	Lset18
Lset19 = Ltmp13-Lfunc_begin2            ##     jumps to Ltmp13
	.long	Lset19
	.byte	0                       ##   On action: cleanup
Lset20 = Ltmp14-Lfunc_begin2            ## >> Call Site 3 <<
	.long	Lset20
Lset21 = Ltmp15-Ltmp14                  ##   Call between Ltmp14 and Ltmp15
	.long	Lset21
Lset22 = Ltmp16-Lfunc_begin2            ##     jumps to Ltmp16
	.long	Lset22
	.byte	0                       ##   On action: cleanup
Lset23 = Ltmp17-Lfunc_begin2            ## >> Call Site 4 <<
	.long	Lset23
Lset24 = Ltmp20-Ltmp17                  ##   Call between Ltmp17 and Ltmp20
	.long	Lset24
Lset25 = Ltmp21-Lfunc_begin2            ##     jumps to Ltmp21
	.long	Lset25
	.byte	0                       ##   On action: cleanup
Lset26 = Ltmp20-Lfunc_begin2            ## >> Call Site 5 <<
	.long	Lset26
Lset27 = Lfunc_end2-Ltmp20              ##   Call between Ltmp20 and Lfunc_end2
	.long	Lset27
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvvEEEEEEPvSA_ ## -- Begin function _ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvvEEEEEEPvSA_
	.weak_definition	__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvvEEEEEEPvSA_
	.p2align	4, 0x90
__ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvvEEEEEEPvSA_: ## @_ZNSt3__114__thread_proxyINS_5tupleIJNS_10unique_ptrINS_15__thread_structENS_14default_deleteIS3_EEEEPFvvEEEEEEPvSA_
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
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r15
Ltmp22:
	callq	__ZNSt3__119__thread_local_dataEv
Ltmp23:
## %bb.1:
	movq	(%r15), %rsi
	movq	$0, (%r15)
	movq	(%rax), %rdi
Ltmp25:
	callq	_pthread_setspecific
Ltmp26:
## %bb.2:
Ltmp27:
	callq	*8(%r15)
Ltmp28:
## %bb.3:
	movq	(%r15), %rbx
	movq	$0, (%r15)
	testq	%rbx, %rbx
	je	LBB5_5
## %bb.4:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB5_5:
	movq	%r15, %rdi
	callq	__ZdlPv
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB5_7:
Ltmp24:
	movq	%rax, %r14
	testq	%r15, %r15
	jne	LBB5_8
	jmp	LBB5_11
LBB5_6:
Ltmp29:
	movq	%rax, %r14
LBB5_8:
	movq	(%r15), %rbx
	movq	$0, (%r15)
	testq	%rbx, %rbx
	je	LBB5_10
## %bb.9:
	movq	%rbx, %rdi
	callq	__ZNSt3__115__thread_structD1Ev
	movq	%rbx, %rdi
	callq	__ZdlPv
LBB5_10:
	movq	%r15, %rdi
	callq	__ZdlPv
LBB5_11:
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
	.byte	41                      ## @TType base offset
	.byte	3                       ## Call site Encoding = udata4
	.byte	39                      ## Call site table length
Lset28 = Ltmp22-Lfunc_begin3            ## >> Call Site 1 <<
	.long	Lset28
Lset29 = Ltmp23-Ltmp22                  ##   Call between Ltmp22 and Ltmp23
	.long	Lset29
Lset30 = Ltmp24-Lfunc_begin3            ##     jumps to Ltmp24
	.long	Lset30
	.byte	0                       ##   On action: cleanup
Lset31 = Ltmp25-Lfunc_begin3            ## >> Call Site 2 <<
	.long	Lset31
Lset32 = Ltmp28-Ltmp25                  ##   Call between Ltmp25 and Ltmp28
	.long	Lset32
Lset33 = Ltmp29-Lfunc_begin3            ##     jumps to Ltmp29
	.long	Lset33
	.byte	0                       ##   On action: cleanup
Lset34 = Ltmp28-Lfunc_begin3            ## >> Call Site 3 <<
	.long	Lset34
Lset35 = Lfunc_end3-Ltmp28              ##   Call between Ltmp28 and Lfunc_end3
	.long	Lset35
	.long	0                       ##     has no landing pad
	.byte	0                       ##   On action: cleanup
	.p2align	2
                                        ## -- End function
	.globl	_ptr                    ## @ptr
.zerofill __DATA,__common,_ptr,8,3
	.globl	_data                   ## @data
.zerofill __DATA,__common,_data,4,2
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Hello"

L___func__._Z8consumerv:                ## @__func__._Z8consumerv
	.asciz	"consumer"

L_.str.1:                               ## @.str.1
	.asciz	"memory_order.cpp"

L_.str.2:                               ## @.str.2
	.asciz	"*p2 == \"Hello\""

L_.str.3:                               ## @.str.3
	.asciz	"data == 42"

L_.str.5:                               ## @.str.5
	.asciz	"thread constructor failed"


.subsections_via_symbols
