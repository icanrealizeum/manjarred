do not run this, just read:

# within manjaro xfce4 operating system (which is based on archlinux)

# used acpidump package to dump
# installed iasl package which replaced acpidump package
# /usr/bin/acpixtract is owned by iasl 20140424-1

# acpixtract -a acpidumpnow.hxt
# this extracted all those *.dat files

# iasl -d *.dat
# created *.dsl files from *.dat

# to properly decompile DSDT:

$ iasl -da dsdt.dat ssdt*.dat

Intel ACPI Component Architecture
ASL Optimizing Compiler version 20140424-64 [May  4 2014]
Copyright (c) 2000 - 2014 Intel Corporation

Loading Acpi table from file   dsdt.dat - Length 00064784 (00FD10)
ACPI: DSDT 0x0000000000000000 00FD10 (v01 LENOVO CB-01    00001000 LENO 00000001)
Acpi table [DSDT] successfully installed and loaded
Loading Acpi table from file  ssdt2.dat - Length 00006461 (00193D)
ACPI: SSDT 0x0000000000000000 00193D (v02 AMD    ALIB     00000001 MSFT 04000000)
Acpi table [SSDT] successfully installed and loaded
Pass 1 parse of [SSDT]
Pass 2 parse of [SSDT]
Loading Acpi table from file  ssdt1.dat - Length 00003636 (000E34)
ACPI: SSDT 0x0000000000000000 000E34 (v01 AMD    POWERNOW 00000001 AMD  00000001)
Acpi table [SSDT] successfully installed and loaded
Pass 1 parse of [SSDT]
Pass 2 parse of [SSDT]
Pass 1 parse of [DSDT]
Pass 2 parse of [DSDT]
Parsing Deferred Opcodes (Methods/Buffers/Packages/Regions)

Parsing completed

Found 5 external control methods, reparsing with new information
Pass 1 parse of [DSDT]
Pass 2 parse of [DSDT]
Parsing Deferred Opcodes (Methods/Buffers/Packages/Regions)

Parsing completed
Disassembly completed
ASL Output:    dsdt.dsl - 593649 bytes
Loading Acpi table from file  ssdt1.dat - Length 00003636 (000E34)
ACPI: SSDT 0x0000000000000000 000E34 (v01 AMD    POWERNOW 00000001 AMD  00000001)
Acpi table [SSDT] successfully installed and loaded
Loading Acpi table from file  ssdt2.dat - Length 00006461 (00193D)
ACPI: SSDT 0x0000000000000000 00193D (v02 AMD    ALIB     00000001 MSFT 04000000)
Acpi table [SSDT] successfully installed and loaded
Pass 1 parse of [SSDT]
Pass 2 parse of [SSDT]
Loading Acpi table from file   dsdt.dat - Length 00064784 (00FD10)
ACPI: DSDT 0x0000000000000000 00FD10 (v01 LENOVO CB-01    00001000 LENO 00000001)
Acpi table [DSDT] successfully installed and loaded
Pass 1 parse of [DSDT]
Pass 2 parse of [DSDT]
Pass 1 parse of [SSDT]
Pass 2 parse of [SSDT]
Parsing Deferred Opcodes (Methods/Buffers/Packages/Regions)

Parsing completed
Disassembly completed
ASL Output:    ssdt1.dsl - 34653 bytes
Loading Acpi table from file  ssdt2.dat - Length 00006461 (00193D)
ACPI: SSDT 0x0000000000000000 00193D (v02 AMD    ALIB     00000001 MSFT 04000000)
Acpi table [SSDT] successfully installed and loaded
Loading Acpi table from file  ssdt1.dat - Length 00003636 (000E34)
ACPI: SSDT 0x0000000000000000 000E34 (v01 AMD    POWERNOW 00000001 AMD  00000001)
Acpi table [SSDT] successfully installed and loaded
Pass 1 parse of [SSDT]
Pass 2 parse of [SSDT]
Loading Acpi table from file   dsdt.dat - Length 00064784 (00FD10)
ACPI: DSDT 0x0000000000000000 00FD10 (v01 LENOVO CB-01    00001000 LENO 00000001)
Acpi table [DSDT] successfully installed and loaded
Pass 1 parse of [DSDT]
Pass 2 parse of [DSDT]
Pass 1 parse of [SSDT]
Pass 2 parse of [SSDT]
Parsing Deferred Opcodes (Methods/Buffers/Packages/Regions)

Parsing completed
ACPI Error: External method arg count mismatch _SB_.ALIC: Current 6, attempted 2 (20140424/dmextern-872)

Found 1 external control methods, reparsing with new information
Pass 1 parse of [SSDT]
Pass 2 parse of [SSDT]
Parsing Deferred Opcodes (Methods/Buffers/Packages/Regions)

Parsing completed
Disassembly completed
ASL Output:    ssdt2.dsl - 44714 bytes

iASL Warning: There were 1 external control methods found during
disassembly, but only 0 was resolved (1 unresolved). Additional
ACPI tables may be required to properly disassemble the code. The
resulting disassembler output file may not compile because the
disassembler did not know how many arguments to assign to the
unresolved methods.

If necessary, the -fe option can be used to specify a file containing
control method external declarations with the associated method
argument counts. Each line of the file must be of the form:
    External (<method pathname>, MethodObj, <argument count>)
Invocation:
    iasl -fe refs.txt -d dsdt.aml

