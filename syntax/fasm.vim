" Vim syntax file
" Language:    Flat Assembler (FASM)
" Maintainer:  Iaroslav Borodkin

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn match fasmComment ";.*$" contains=@Spell

" Strings / Characters
syn region fasmString start=+'+ skip=+''+ end=+'+ oneline
syn region fasmString start=+"+ skip=+""+ end=+"+ oneline

" Decimal
syn match fasmNumber "\<\d\+\>"
" Hexadecimal
syn match fasmNumber "\<0x[0-9a-fA-F]\+\>"
syn match fasmNumber "\<\d[0-9a-fA-F]*[hH]\>"
syn match fasmNumber "\$[0-9a-fA-F]\+\>"
" Binary
syn match fasmNumber "\<[01]\+[bB]\>"
" Octal
syn match fasmNumber "\<[0-7]\+[oOqQ]\>"

" Data Types
syn keyword fasmType db dw dd dq dt dp df
syn keyword fasmType rb rw rd rq rt rp rf
syn keyword fasmType byte word dword qword tword pword fword
syn keyword fasmType ptr

" Directives, Macros, Preprocessor
syn keyword fasmDirective format use16 use32 use64 org
syn keyword fasmDirective arm thumb aarch64 riscv
syn keyword fasmDirective section segment entry extrn public file
syn keyword fasmDirective include align virtual at
syn keyword fasmDirective load store
syn keyword fasmMacro macro end struc restore equ times rept
syn keyword fasmMacro match irp irps local forward common reverse
syn keyword fasmConditional if else

" Labels
syn match fasmLabel "^\s*[A-Za-z_$.][A-Za-z0-9_$.]*\s*:"
syn match fasmLabel "\<@@\>:"

" Anonymous labels
syn match fasmLabel "\<@@\>"

" x86 8/16/32/64-bit registers
syn keyword fasmRegister al ah ax eax rax
syn keyword fasmRegister bl bh bx ebx rbx
syn keyword fasmRegister cl ch cx ecx rcx
syn keyword fasmRegister dl dh dx edx rdx
syn keyword fasmRegister si esi rsi di edi rdi
syn keyword fasmRegister bp ebp rbp sp esp rsp
syn keyword fasmRegister r8 r9 r10 r11 r12 r13 r14 r15
syn keyword fasmRegister r8b r9b r10b r11b r12b r13b r14b r15b
syn keyword fasmRegister r8w r9w r10w r11w r12w r13w r14w r15w
syn keyword fasmRegister r8d r9d r10d r11d r12d r13d r14d r15d

" x86 Segment registers
syn keyword fasmRegister cs ds es fs gs ss

" ARM registers
syn keyword fasmRegister r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15
syn keyword fasmRegister w0 w1 w2 w3 w4 w5 w6 w7 w8 w9 w10 w11 w12 w13 w14 w15 w16 w17 w18 w19 w20 w21 w22 w23 w24 w25 w26 w27 w28 w29 w30
syn keyword fasmRegister x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30
syn keyword fasmRegister lr pc

" RISC-V registers
syn keyword fasmRegister zero ra gp tp fp s0 s1 a0 a1 a2 a3 a4 a5 a6 a7 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 t0 t1 t2 t3 t4 t5 t6

" Floating point, SSE, AVX
syn match fasmRegister "\<st[0-7]\>"
syn match fasmRegister "\<mm[0-7]\>"
syn match fasmRegister "\<xmm[0-9]\>"
syn match fasmRegister "\<xmm1[0-5]\>"
syn match fasmRegister "\<ymm[0-9]\>"
syn match fasmRegister "\<ymm1[0-5]\>"
syn match fasmRegister "\<zmm[0-9]\>"
syn match fasmRegister "\<zmm[1-2][0-9]\>"
syn match fasmRegister "\<zmm3[0-1]\>"

" ARM Neon/SVE and RISC-V Vector/FP registers
syn match fasmRegister "\<[qdsvz]\([0-2]\?[0-9]\|3[0-1]\)\>"
syn match fasmRegister "\<p\([0-9]\|1[0-5]\)\>"

" ARM SIMD / NEON instructions
syn keyword fasmInstruction vadd vsub vmul vmla vmls vdiv vcvt vcmp vmov vld1 vst1 vld2 vst2 vld3 vst3 vld4 vst4 vabs vneg

" RISC-V Vector instructions
syn keyword fasmInstruction vsetvli vsetvl vsetivli
syn match fasmInstruction "\<v[a-z0-9]\+\.[vximfw]\{1,2\}\>"

" Control / Debug registers
syn match fasmRegister "\<cr[0-8]\>"
syn match fasmRegister "\<dr[0-7]\>"

" Data manipulation
syn keyword fasmInstruction mov xchg push pop lea cbw cwd cdq cqo bswap

" Arithmetic & Logic
syn keyword fasmInstruction add adc sub sbb mul imul div idiv inc dec
syn keyword fasmInstruction and or xor not neg test
syn keyword fasmInstruction shl shr sal sar rol ror rcl rcr
syn keyword fasmInstruction cmp bt btc btr bts

" Control flow
syn keyword fasmInstruction jmp call ret retn retf enter leave
syn keyword fasmInstruction ja jae jb jbe jc jcxz jecxz jrcxz
syn keyword fasmInstruction je jg jge jl jle jna jnae jnb jnbe
syn keyword fasmInstruction jnc jne jng jnge jnl jnle jno jnp
syn keyword fasmInstruction jns jnz jo jp jpe jpo js jz
syn keyword fasmInstruction loop loope loopne loopnz loopz
syn keyword fasmInstruction int into syscall sysret int3

" String operations
syn keyword fasmInstruction movs movsb movsw movsd movsq
syn keyword fasmInstruction cmps cmpsb cmpsw cmpsd cmpsq
syn keyword fasmInstruction scas scasb scasw scasd scasq
syn keyword fasmInstruction lods lodsb lodsw lodsd lodsq
syn keyword fasmInstruction stos stosb stosw stosd stosq
syn keyword fasmInstruction rep repe repne repnz repz

" Processor control
syn keyword fasmInstruction clc cld cli cmc nop stc std sti hlt cpuid

" ARM instructions
syn keyword fasmInstruction ldr str b bl bx svc

" RISC-V instructions
syn keyword fasmInstruction addi addiw lui auipc jal jalr beq bne blt bge

" Neovim Highlight Groups
hi def link fasmComment     Comment
hi def link fasmString      String
hi def link fasmNumber      Number
hi def link fasmType        Type
hi def link fasmDirective   PreProc
hi def link fasmMacro       Macro
hi def link fasmConditional Conditional
hi def link fasmLabel       Function
hi def link fasmRegister    Identifier
hi def link fasmInstruction Statement

let b:current_syntax = "fasm"
