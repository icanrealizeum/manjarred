/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140424-64 [May  4 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of apic.dat, Wed Jul 16 15:48:28 2014
 *
 * ACPI Data Table [APIC]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
[004h 0004   4]                 Table Length : 0000007A
[008h 0008   1]                     Revision : 02
[009h 0009   1]                     Checksum : DF
[00Ah 0010   6]                       Oem ID : "LENOVO"
[010h 0016   8]                 Oem Table ID : "CB-01   "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "PTL "
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]           Local Apic Address : FEE00000
[028h 0040   4]        Flags (decoded below) : 00000001
                         PC-AT Compatibility : 1

[02Ch 0044   1]                Subtable Type : 00 [Processor Local APIC]
[02Dh 0045   1]                       Length : 08
[02Eh 0046   1]                 Processor ID : 00
[02Fh 0047   1]                Local Apic ID : 00
[030h 0048   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1

[034h 0052   1]                Subtable Type : 00 [Processor Local APIC]
[035h 0053   1]                       Length : 08
[036h 0054   1]                 Processor ID : 01
[037h 0055   1]                Local Apic ID : 01
[038h 0056   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1

[03Ch 0060   1]                Subtable Type : 00 [Processor Local APIC]
[03Dh 0061   1]                       Length : 08
[03Eh 0062   1]                 Processor ID : 02
[03Fh 0063   1]                Local Apic ID : 02
[040h 0064   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1

[044h 0068   1]                Subtable Type : 00 [Processor Local APIC]
[045h 0069   1]                       Length : 08
[046h 0070   1]                 Processor ID : 03
[047h 0071   1]                Local Apic ID : 03
[048h 0072   4]        Flags (decoded below) : 00000001
                           Processor Enabled : 1

[04Ch 0076   1]                Subtable Type : 01 [I/O APIC]
[04Dh 0077   1]                       Length : 0C
[04Eh 0078   1]                  I/O Apic ID : 02
[04Fh 0079   1]                     Reserved : 00
[050h 0080   4]                      Address : FEC00000
[054h 0084   4]                    Interrupt : 00000000

[058h 0088   1]                Subtable Type : 02 [Interrupt Source Override]
[059h 0089   1]                       Length : 0A
[05Ah 0090   1]                          Bus : 00
[05Bh 0091   1]                       Source : 00
[05Ch 0092   4]                    Interrupt : 00000002
[060h 0096   2]        Flags (decoded below) : 0000
                                    Polarity : 0
                                Trigger Mode : 0

[062h 0098   1]                Subtable Type : 04 [Local APIC NMI]
[063h 0099   1]                       Length : 06
[064h 0100   1]                 Processor ID : 00
[065h 0101   2]        Flags (decoded below) : 0005
                                    Polarity : 1
                                Trigger Mode : 1
[067h 0103   1]         Interrupt Input LINT : 01

[068h 0104   1]                Subtable Type : 04 [Local APIC NMI]
[069h 0105   1]                       Length : 06
[06Ah 0106   1]                 Processor ID : 01
[06Bh 0107   2]        Flags (decoded below) : 0005
                                    Polarity : 1
                                Trigger Mode : 1
[06Dh 0109   1]         Interrupt Input LINT : 01

[06Eh 0110   1]                Subtable Type : 04 [Local APIC NMI]
[06Fh 0111   1]                       Length : 06
[070h 0112   1]                 Processor ID : 02
[071h 0113   2]        Flags (decoded below) : 0005
                                    Polarity : 1
                                Trigger Mode : 1
[073h 0115   1]         Interrupt Input LINT : 01

[074h 0116   1]                Subtable Type : 04 [Local APIC NMI]
[075h 0117   1]                       Length : 06
[076h 0118   1]                 Processor ID : 03
[077h 0119   2]        Flags (decoded below) : 0005
                                    Polarity : 1
                                Trigger Mode : 1
[079h 0121   1]         Interrupt Input LINT : 01

Raw Table Data: Length 122 (0x7A)

  0000: 41 50 49 43 7A 00 00 00 02 DF 4C 45 4E 4F 56 4F  APICz.....LENOVO
  0010: 43 42 2D 30 31 20 20 20 01 00 00 00 50 54 4C 20  CB-01   ....PTL 
  0020: 01 00 00 00 00 00 E0 FE 01 00 00 00 00 08 00 00  ................
  0030: 01 00 00 00 00 08 01 01 01 00 00 00 00 08 02 02  ................
  0040: 01 00 00 00 00 08 03 03 01 00 00 00 01 0C 02 00  ................
  0050: 00 00 C0 FE 00 00 00 00 02 0A 00 00 02 00 00 00  ................
  0060: 00 00 04 06 00 05 00 01 04 06 01 05 00 01 04 06  ................
  0070: 02 05 00 01 04 06 03 05 00 01                    ..........
