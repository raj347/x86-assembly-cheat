; # CPUID

    ; Fills EAX, EBX, ECX and EDX with CPU information

    ; The exact data do show depends on the value of EAX.

    ; Information available includes:

    ; - vendor
    ; - version
    ; - features (mmx, simd, rdrand, etc.) <http://en.wikipedia.org/wiki/CPUID# EAX.3D1:_Processor_Info_and_Feature_Bits>
    ; - caches
    ; - tlbs <http://en.wikipedia.org/wiki/Translation_lookaside_buffer>

    ; On Linux, part of this information is parsed and made available at `cat /proc/cpuinfo`.

    ; The cool thing about this instruction is that it allows you to check the CPU specs
    ; and take alternative actions based on that inside your program.

%include "lib/asm_io.inc"

ENTRY
    mov eax, 0
    cpuid

    ; "Genu", shorthand for "genuine"
    ; 1970169159 == 0x 75 6e 65 47 == 'u', 'n', 'e', 'G' in ASCII
    PRINT_INT ebx

    ; 'inte', shorthand for "Intel
    ; 1818588270 == 0x 6c 65 74 6e == 'l', 'e', 't', 'n'
    PRINT_INT ecx

    EXIT
