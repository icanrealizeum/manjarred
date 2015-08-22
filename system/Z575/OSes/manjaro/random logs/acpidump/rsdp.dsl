/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140424-64 [May  4 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of rsdp.dat, Wed Jul 16 15:48:29 2014
 *
 * ACPI Data Table [RSD ]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   8]                    Signature : "RSD PTR "
[008h 0008   1]                     Checksum : B0
[009h 0009   6]                       Oem ID : "LENOVO"
[00Fh 0015   1]                     Revision : 02
[010h 0016   4]                 RSDT Address : BF51A0AC
[014h 0020   4]                       Length : 00000024
[018h 0024   8]                 XSDT Address : 00000000BF51A120
[020h 0032   1]            Extended Checksum : 0B
[021h 0033   3]                     Reserved : 000000

Raw Table Data: Length 36 (0x24)

  0000: 52 53 44 20 50 54 52 20 B0 4C 45 4E 4F 56 4F 02  RSD PTR .LENOVO.
  0010: AC A0 51 BF 24 00 00 00 20 A1 51 BF 00 00 00 00  ..Q.$... .Q.....
  0020: 0B 00 00 00                                      ....
