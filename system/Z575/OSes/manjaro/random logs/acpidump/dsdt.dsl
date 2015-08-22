/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140424-64 [May  4 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of dsdt.dat, Wed Jul 16 15:48:28 2014
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000FD10 (64784)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0x3A
 *     OEM ID           "LENOVO"
 *     OEM Table ID     "CB-01   "
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "LENO"
 *     Compiler Version 0x00000001 (1)
 */
DefinitionBlock ("dsdt.aml", "DSDT", 1, "LENOVO", "CB-01   ", 0x00001000)
{
    /*
     * iASL Warning: There were 1 external control methods found during
     * disassembly, but additional ACPI tables to resolve these externals
     * were not specified. This resulting disassembler output file may not
     * compile because the disassembler did not know how many arguments
     * to assign to these methods. To specify the tables needed to resolve
     * external control method references, the -e option can be used to
     * specify the filenames. Example iASL invocations:
     *     iasl -e ssdt1.aml ssdt2.aml ssdt3.aml -d dsdt.aml
     *     iasl -e dsdt.aml ssdt2.aml -d ssdt1.aml
     *     iasl -e ssdt*.aml -d dsdt.aml
     *
     * In addition, the -fe option can be used to specify a file containing
     * control method external declarations with the associated method
     * argument counts. Each line of the file must be of the form:
     *     External (<method pathname>, MethodObj, <argument count>)
     * Invocation:
     *     iasl -fe refs.txt -d dsdt.aml
     *
     * The following methods were unresolved and many not compile properly
     * because the disassembler had to guess at the number of arguments
     * required for each:
     */
    External (ALIB, MethodObj)    // Warning: Unresolved method, guessing 2 arguments

    External (_PR_.C000._PPC, UnknownObj)
    External (_PR_.C001._PPC, UnknownObj)
    External (_PR_.C002._PPC, UnknownObj)
    External (_PR_.C003._PPC, UnknownObj)

    Scope (_PR)
    {
        Processor (C000, 0x00, 0x00000810, 0x06) {}
        Processor (C001, 0x01, 0x00000810, 0x06) {}
        Processor (C002, 0x02, 0x00000810, 0x06) {}
        Processor (C003, 0x03, 0x00000810, 0x06) {}
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (_S3, Package (0x04)  // _S3_: S3 System State
    {
        0x03, 
        0x03, 
        0x00, 
        0x00
    })
    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x04, 
        0x04, 
        0x00, 
        0x00
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x05, 
        0x05, 
        0x00, 
        0x00
    })
    OperationRegion (DEB2, SystemIO, 0x80, 0x02)
    Field (DEB2, WordAcc, NoLock, Preserve)
    {
        P80H,   16
    }

    OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
        PIDX,   8, 
        PDAT,   8
    }

    OperationRegion (P01, SystemIO, 0x0801, 0x01)
    Field (P01, ByteAcc, NoLock, Preserve)
    {
        PST1,   8
    }

    Scope (_SB)
    {
        Name (LINX, 0x00)
        Name (OSSP, 0x00)
        Name (OSTB, Ones)
        OperationRegion (OSTY, SystemMemory, 0xBF479F98, 0x00000001)
        Field (OSTY, AnyAcc, NoLock, Preserve)
        {
            TPOS,   8
        }

        Method (OSTP, 0, NotSerialized)
        {
            If (LEqual (OSTB, Ones))
            {
                If (CondRefOf (_OSI, Local0))
                {
                    Store (0x00, OSTB) /* \_SB_.OSTB */
                    Store (0x00, TPOS) /* \_SB_.TPOS */
                    If (_OSI ("Windows 2001"))
                    {
                        Store (0x08, OSTB) /* \_SB_.OSTB */
                        Store (0x08, TPOS) /* \_SB_.TPOS */
                    }

                    If (_OSI ("Windows 2001.1"))
                    {
                        Store (0x20, OSTB) /* \_SB_.OSTB */
                        Store (0x20, TPOS) /* \_SB_.TPOS */
                    }

                    If (_OSI ("Windows 2001 SP1"))
                    {
                        Store (0x10, OSTB) /* \_SB_.OSTB */
                        Store (0x10, TPOS) /* \_SB_.TPOS */
                    }

                    If (_OSI ("Windows 2001 SP2"))
                    {
                        Store (0x11, OSTB) /* \_SB_.OSTB */
                        Store (0x11, TPOS) /* \_SB_.TPOS */
                    }

                    If (_OSI ("Windows 2001 SP3"))
                    {
                        Store (0x12, OSTB) /* \_SB_.OSTB */
                        Store (0x12, TPOS) /* \_SB_.TPOS */
                    }

                    If (_OSI ("Windows 2006"))
                    {
                        Store (0x40, OSTB) /* \_SB_.OSTB */
                        Store (0x40, TPOS) /* \_SB_.TPOS */
                    }

                    If (_OSI ("Windows 2006 SP1"))
                    {
                        Store (0x01, OSSP) /* \_SB_.OSSP */
                        Store (0x40, OSTB) /* \_SB_.OSTB */
                        Store (0x40, TPOS) /* \_SB_.TPOS */
                    }

                    If (_OSI ("Windows 2009"))
                    {
                        Store (0x01, OSSP) /* \_SB_.OSSP */
                        Store (0x50, OSTB) /* \_SB_.OSTB */
                        Store (0x50, TPOS) /* \_SB_.TPOS */
                    }

                    If (_OSI ("Linux"))
                    {
                        Store (0x01, LINX) /* \_SB_.LINX */
                        Store (0x80, OSTB) /* \_SB_.OSTB */
                        Store (0x80, TPOS) /* \_SB_.TPOS */
                    }
                }
                Else
                {
                    If (CondRefOf (_OS, Local0))
                    {
                        If (SEQL (_OS, "Microsoft Windows"))
                        {
                            Store (0x01, OSTB) /* \_SB_.OSTB */
                            Store (0x01, TPOS) /* \_SB_.TPOS */
                        }
                        Else
                        {
                            If (SEQL (_OS, "Microsoft WindowsME: Millennium Edition"))
                            {
                                Store (0x02, OSTB) /* \_SB_.OSTB */
                                Store (0x02, TPOS) /* \_SB_.TPOS */
                            }
                            Else
                            {
                                If (SEQL (_OS, "Microsoft Windows NT"))
                                {
                                    Store (0x04, OSTB) /* \_SB_.OSTB */
                                    Store (0x04, TPOS) /* \_SB_.TPOS */
                                }
                                Else
                                {
                                    Store (0x00, OSTB) /* \_SB_.OSTB */
                                    Store (0x00, TPOS) /* \_SB_.TPOS */
                                }
                            }
                        }
                    }
                    Else
                    {
                        Store (0x00, OSTB) /* \_SB_.OSTB */
                        Store (0x00, TPOS) /* \_SB_.TPOS */
                    }
                }

                ^PCI0.LPC0.PHS1 (0xB0)
                If (LEqual (TPOS, 0x80)) {}
            }

            Return (OSTB) /* \_SB_.OSTB */
        }

        Method (SEQL, 2, Serialized)
        {
            Store (SizeOf (Arg0), Local0)
            Store (SizeOf (Arg1), Local1)
            If (LNotEqual (Local0, Local1))
            {
                Return (Zero)
            }

            Name (BUF0, Buffer (Local0) {})
            Store (Arg0, BUF0) /* \_SB_.SEQL.BUF0 */
            Name (BUF1, Buffer (Local0) {})
            Store (Arg1, BUF1) /* \_SB_.SEQL.BUF1 */
            Store (Zero, Local2)
            While (LLess (Local2, Local0))
            {
                Store (DerefOf (Index (BUF0, Local2)), Local3)
                Store (DerefOf (Index (BUF1, Local2)), Local4)
                If (LNotEqual (Local3, Local4))
                {
                    Return (Zero)
                }

                Increment (Local2)
            }

            Return (One)
        }
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        \_SB.PCI0.LPC0.EC0.ECPS (Arg0)
        TRPS (0xC0, 0x00)
        If (LEqual (Arg0, 0x05))
        {
            Store (0x10, \_SB.PCI0.LPC0.BCMD)
            Store (0xAB, \_SB.PCI0.LPC0.SMIC)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (Zero, \_SB.PCI0.SMB.PHYD)
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (Zero, \_SB.PCI0.SMB.RSTU)
            Store (0x01, \_SB.PCI0.SMB.BLNK)
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        \_SB.PCI0.LPC0.EC0.ECWK (Arg0)
        If (LGreaterEqual (\_SB.TPOS, 0x40)) {}
        If (LEqual (\_SB.TPOS, 0x80)) {}
        If (LEqual (Arg0, 0x03))
        {
            \_GPE.TRIG ()
            Store (One, \_SB.PCI0.SMB.RSTU)
            Store (0x00, \_SB.PCI0.SMB.SRBT)
        }

        If (LEqual (Arg0, 0x04))
        {
            If (GPIC)
            {
                \_SB.PCI0.LPC0.DSPI ()
            }

            \_GPE.TRIG ()
            Store (One, \_SB.PCI0.SMB.PHYD)
            Store (0x0F, \_SB.PCI0.LPC0.BCMD)
            Store (0xAB, \_SB.PCI0.LPC0.SMIC)
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Store (0x03, \_SB.PCI0.SMB.BLNK)
        Notify (\_SB.PCI0, 0x00) // Bus Check
    }

    Scope (_SI)
    {
        Method (_SST, 1, NotSerialized)  // _SST: System Status
        {
            If (LEqual (Arg0, 0x01))
            {
                Store ("===== SST Working =====", Debug)
            }

            If (LEqual (Arg0, 0x02))
            {
                Store ("===== SST Waking =====", Debug)
            }

            If (LEqual (Arg0, 0x03))
            {
                Store ("===== SST Sleeping =====", Debug)
            }

            If (LEqual (Arg0, 0x04))
            {
                Store ("===== SST Sleeping S4 =====", Debug)
            }
        }
    }

    Name (GPIC, 0x00)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        Store (Arg0, GPIC) /* \GPIC */
        If (Arg0)
        {
            \_SB.PCI0.LPC0.DSPI ()
        }
    }

    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
        }

        Device (PCI0)
        {
            Name (_ADR, 0x00)  // _ADR: Address
            Name (_UID, 0x01)  // _UID: Unique ID
            Name (_BBN, 0x00)  // _BBN: BIOS Bus Number
            Name (AMHP, 0x00)
            Name (VGPU, 0x00010000)
            Scope (\_SB.PCI0)
            {
                Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
                Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
                Name (SUPP, 0x00)
                Name (CTRL, 0x00)
                Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
                {
                    CreateDWordField (Arg3, 0x00, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    If (LEqual (Arg0, Buffer (0x10)
                            {
                                /* 0000 */   0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40,
                                /* 0008 */   0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                            }))
                    {
                        Store (CDW2, SUPP) /* \_SB_.PCI0.SUPP */
                        Store (CDW3, CTRL) /* \_SB_.PCI0.CTRL */
                        If (LOr (LNotEqual (And (SUPP, 0x16), 0x16), LEqual (
                            AMHP, 0x80000000)))
                        {
                            And (CTRL, 0x1E, CTRL) /* \_SB_.PCI0.CTRL */
                        }

                        And (CTRL, 0x1D, CTRL) /* \_SB_.PCI0.CTRL */
                        If (Not (And (CDW1, 0x01)))
                        {
                            If (OSSP)
                            {
                                If (And (CTRL, 0x01)) {}
                                If (And (CTRL, 0x04))
                                {
                                    Store (One, ^SMB.EPNM) /* \_SB_.PCI0.SMB_.EPNM */
                                    Store (Zero, ^SMB.DPPF) /* \_SB_.PCI0.SMB_.DPPF */
                                    Store (One, ^SMB.PWDE) /* \_SB_.PCI0.SMB_.PWDE */
                                }
                                Else
                                {
                                    Store (Zero, ^SMB.EPNM) /* \_SB_.PCI0.SMB_.EPNM */
                                    Store (One, ^SMB.DPPF) /* \_SB_.PCI0.SMB_.DPPF */
                                    Store (Zero, ^SMB.PWDE) /* \_SB_.PCI0.SMB_.PWDE */
                                }
                            }
                        }

                        If (LNotEqual (Arg1, One))
                        {
                            Or (CDW1, 0x08, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                        }

                        If (LNotEqual (CDW3, CTRL))
                        {
                            Or (CDW1, 0x10, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                        }

                        Store (CTRL, CDW3) /* \_SB_.PCI0._OSC.CDW3 */
                        Return (Arg3)
                    }
                    Else
                    {
                        Or (CDW1, 0x04, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                        Return (Arg3)
                    }
                }
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                OSTP ()
                \_GPE.TRIG ()
                If (LAnd (LEqual (TPOS, 0x40), LEqual (OSSP, 0x00)))
                {
                    Store (0x80000000, AMHP) /* \_SB_.PCI0.AMHP */
                }
            }

            OperationRegion (NBMS, PCI_Config, 0x60, 0x08)
            Field (NBMS, DWordAcc, NoLock, Preserve)
            {
                MIDX,   32, 
                MIDR,   32
            }

            OperationRegion (NBXP, PCI_Config, 0xE0, 0x08)
            Field (NBXP, DWordAcc, NoLock, Preserve)
            {
                NBXI,   32, 
                NBXD,   32
            }

            Mutex (NBMM, 0x00)
            Mutex (NBXM, 0x00)
            Method (NBMR, 1, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                And (Arg0, 0x7F, Local0)
                Store (Local0, MIDX) /* \_SB_.PCI0.MIDX */
                Store (MIDR, Local0)
                Store (0x7F, MIDX) /* \_SB_.PCI0.MIDX */
                Release (NBMM)
                Return (Local0)
            }

            Method (NBMW, 2, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                And (Arg0, 0x7F, Local0)
                Or (Local0, 0x80, Local0)
                Store (Local0, MIDX) /* \_SB_.PCI0.MIDX */
                Store (Arg1, MIDR) /* \_SB_.PCI0.MIDR */
                Store (And (Local0, 0x7F, Local0), MIDX) /* \_SB_.PCI0.MIDX */
                Release (NBMM)
            }

            Method (NBXR, 1, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                Store (Arg0, NBXI) /* \_SB_.PCI0.NBXI */
                Store (NBXD, Local0)
                Store (0x00, NBXI) /* \_SB_.PCI0.NBXI */
                Release (NBXM)
                Return (Local0)
            }

            Method (NBXW, 2, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                Store (Arg0, NBXI) /* \_SB_.PCI0.NBXI */
                Store (Arg1, NBXD) /* \_SB_.PCI0.NBXD */
                Store (0x00, NBXI) /* \_SB_.PCI0.NBXI */
                Release (NBXM)
            }

            Method (GFXM, 0, NotSerialized)
            {
                Store (NBMR (0x08), Local0)
                ShiftRight (Local0, 0x08, Local0)
                And (Local0, 0x0F, Local0)
                Return (Local0)
            }

            Method (GPPM, 0, NotSerialized)
            {
                Store (NBMR (0x67), Local0)
                And (Local0, 0x0F, Local0)
                Return (Local0)
            }

            Method (GPPX, 0, NotSerialized)
            {
                Store (NBMR (0x2D), Local0)
                ShiftRight (Local0, 0x07, Local0)
                And (Local0, 0x0F, Local0)
                Return (Local0)
            }

            Method (XPTR, 2, NotSerialized)
            {
                If (LLess (Arg0, 0x02))
                {
                    Return (0x00)
                }

                If (LOr (LGreater (Arg0, 0x0A), LEqual (Arg0, 0x08)))
                {
                    Return (0x00)
                }
                Else
                {
                    Store (GPPM (), Local0)
                    Store (GPPX (), Local1)
                    If (LEqual (Arg0, 0x0A))
                    {
                        If (LAnd (LEqual (Local0, 0x03), LEqual (Local1, 0x03)))
                        {
                            Store (0x20, Local0)
                            Store (NBMR (0x2D), Local2)
                            If (Arg1)
                            {
                                And (Local2, Not (Local0), Local2)
                            }
                            Else
                            {
                                Or (Local2, Local0, Local2)
                            }

                            NBMW (0x2D, Local2)
                            Return (Ones)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        If (LAnd (LGreaterEqual (Local0, 0x02), LGreaterEqual (Local1, 0x02)))
                        {
                            Store (0x10, Local0)
                            Store (NBMR (0x2D), Local2)
                            If (Arg1)
                            {
                                And (Local2, Not (Local0), Local2)
                            }
                            Else
                            {
                                Or (Local2, Local0, Local2)
                            }

                            NBMW (0x2D, Local2)
                            Return (Ones)
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Store (0x01, Local0)
                    If (LLess (Arg0, 0x04))
                    {
                        Add (Arg0, 0x02, Local1)
                    }
                    Else
                    {
                        Add (Arg0, 0x11, Local1)
                    }

                    ShiftLeft (Local0, Local1, Local0)
                    Store (NBMR (0x08), Local2)
                    If (Arg1)
                    {
                        And (Local2, Not (Local0), Local2)
                    }
                    Else
                    {
                        Or (Local2, Local0, Local2)
                    }

                    NBMW (0x08, Local2)
                    Return (Ones)
                }
            }

            OperationRegion (K8ST, SystemMemory, 0xBF479E98, 0x00000048)
            Field (K8ST, AnyAcc, NoLock, Preserve)
            {
                C0_0,   16, 
                C2_0,   16, 
                C4_0,   16, 
                C6_0,   16, 
                C8_0,   16, 
                CA_0,   16, 
                CC_0,   16, 
                CE_0,   16, 
                D0_0,   16, 
                D2_0,   16, 
                D4_0,   16, 
                D6_0,   16, 
                D8_0,   16, 
                DA_0,   16, 
                DC_0,   16, 
                DE_0,   16, 
                E0_0,   16, 
                E2_0,   16, 
                E4_0,   16, 
                E6_0,   16, 
                E8_0,   16, 
                EA_0,   16, 
                EC_0,   16, 
                EE_0,   16, 
                F0_0,   16, 
                F2_0,   16, 
                F4_0,   16, 
                F6_0,   16, 
                F8_0,   16, 
                FA_0,   16, 
                FC_0,   16, 
                FE_0,   16, 
                TOML,   32, 
                TOMH,   32
            }

            Name (RSRC, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, SubDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C2000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C6000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000C9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CA000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CE000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D2000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D6000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000D9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DA000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DE000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y0F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y10, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E2000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y11, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y12, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E6000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y13, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000E9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y14, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EA000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y15, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y16, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EE000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _Y17, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _Y18, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xE1000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x08000000,         // Length
                    0x00,, _Y19, AddressRangeMemory, TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    0x00,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    0x00,, , TypeStatic)
            })
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                CreateBitField (RSRC, \_SB.PCI0._Y00._RW, C0RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y00._LEN, C0LN)  // _LEN: Length
                Store (One, C0RW) /* \_SB_.PCI0._CRS.C0RW */
                Store (0x2000, C0LN) /* \_SB_.PCI0._CRS.C0LN */
                If (And (C0_0, 0x1818))
                {
                    Store (0x00, C0LN) /* \_SB_.PCI0._CRS.C0LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y01._RW, C2RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y01._LEN, C2LN)  // _LEN: Length
                Store (One, C2RW) /* \_SB_.PCI0._CRS.C2RW */
                Store (0x2000, C2LN) /* \_SB_.PCI0._CRS.C2LN */
                If (And (C2_0, 0x1818))
                {
                    Store (0x00, C2LN) /* \_SB_.PCI0._CRS.C2LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y02._RW, C4RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y02._LEN, C4LN)  // _LEN: Length
                Store (One, C4RW) /* \_SB_.PCI0._CRS.C4RW */
                Store (0x2000, C4LN) /* \_SB_.PCI0._CRS.C4LN */
                If (And (C4_0, 0x1818))
                {
                    Store (0x00, C4LN) /* \_SB_.PCI0._CRS.C4LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y03._RW, C6RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y03._LEN, C6LN)  // _LEN: Length
                Store (One, C6RW) /* \_SB_.PCI0._CRS.C6RW */
                Store (0x2000, C6LN) /* \_SB_.PCI0._CRS.C6LN */
                If (And (C6_0, 0x1818))
                {
                    Store (0x00, C6LN) /* \_SB_.PCI0._CRS.C6LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y04._RW, C8RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y04._LEN, C8LN)  // _LEN: Length
                Store (One, C8RW) /* \_SB_.PCI0._CRS.C8RW */
                Store (0x2000, C8LN) /* \_SB_.PCI0._CRS.C8LN */
                If (And (C8_0, 0x1818))
                {
                    Store (0x00, C8LN) /* \_SB_.PCI0._CRS.C8LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y05._RW, CARW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y05._LEN, CALN)  // _LEN: Length
                Store (One, CARW) /* \_SB_.PCI0._CRS.CARW */
                Store (0x2000, CALN) /* \_SB_.PCI0._CRS.CALN */
                If (And (CA_0, 0x1818))
                {
                    Store (0x00, CALN) /* \_SB_.PCI0._CRS.CALN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y06._RW, CCRW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y06._LEN, CCLN)  // _LEN: Length
                Store (One, CCRW) /* \_SB_.PCI0._CRS.CCRW */
                Store (0x2000, CCLN) /* \_SB_.PCI0._CRS.CCLN */
                If (And (CC_0, 0x1818))
                {
                    Store (0x00, CCLN) /* \_SB_.PCI0._CRS.CCLN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y07._RW, CERW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y07._LEN, CELN)  // _LEN: Length
                Store (One, CERW) /* \_SB_.PCI0._CRS.CERW */
                Store (0x2000, CELN) /* \_SB_.PCI0._CRS.CELN */
                If (And (CE_0, 0x1818))
                {
                    Store (0x00, CELN) /* \_SB_.PCI0._CRS.CELN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y08._RW, D0RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y08._LEN, D0LN)  // _LEN: Length
                Store (One, D0RW) /* \_SB_.PCI0._CRS.D0RW */
                Store (0x2000, D0LN) /* \_SB_.PCI0._CRS.D0LN */
                If (And (D0_0, 0x1818))
                {
                    Store (0x00, D0LN) /* \_SB_.PCI0._CRS.D0LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y09._RW, D2RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y09._LEN, D2LN)  // _LEN: Length
                Store (One, D2RW) /* \_SB_.PCI0._CRS.D2RW */
                Store (0x2000, D2LN) /* \_SB_.PCI0._CRS.D2LN */
                If (And (D2_0, 0x1818))
                {
                    Store (0x00, D2LN) /* \_SB_.PCI0._CRS.D2LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0A._RW, D4RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0A._LEN, D4LN)  // _LEN: Length
                Store (One, D4RW) /* \_SB_.PCI0._CRS.D4RW */
                Store (0x2000, D4LN) /* \_SB_.PCI0._CRS.D4LN */
                If (And (D4_0, 0x1818))
                {
                    Store (0x00, D4LN) /* \_SB_.PCI0._CRS.D4LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0B._RW, D6RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0B._LEN, D6LN)  // _LEN: Length
                Store (One, D6RW) /* \_SB_.PCI0._CRS.D6RW */
                Store (0x2000, D6LN) /* \_SB_.PCI0._CRS.D6LN */
                If (And (D6_0, 0x1818))
                {
                    Store (0x00, D6LN) /* \_SB_.PCI0._CRS.D6LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0C._RW, D8RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0C._LEN, D8LN)  // _LEN: Length
                Store (One, D8RW) /* \_SB_.PCI0._CRS.D8RW */
                Store (0x2000, D8LN) /* \_SB_.PCI0._CRS.D8LN */
                If (And (D8_0, 0x1818))
                {
                    Store (0x00, D8LN) /* \_SB_.PCI0._CRS.D8LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0D._RW, DARW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0D._LEN, DALN)  // _LEN: Length
                Store (One, DARW) /* \_SB_.PCI0._CRS.DARW */
                Store (0x2000, DALN) /* \_SB_.PCI0._CRS.DALN */
                If (And (DA_0, 0x1818))
                {
                    Store (0x00, DALN) /* \_SB_.PCI0._CRS.DALN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0E._RW, DCRW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0E._LEN, DCLN)  // _LEN: Length
                Store (One, DCRW) /* \_SB_.PCI0._CRS.DCRW */
                Store (0x2000, DCLN) /* \_SB_.PCI0._CRS.DCLN */
                If (And (DC_0, 0x1818))
                {
                    Store (0x00, DCLN) /* \_SB_.PCI0._CRS.DCLN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y0F._RW, DERW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y0F._LEN, DELN)  // _LEN: Length
                Store (One, DERW) /* \_SB_.PCI0._CRS.DERW */
                Store (0x2000, DELN) /* \_SB_.PCI0._CRS.DELN */
                If (And (DE_0, 0x1818))
                {
                    Store (0x00, DELN) /* \_SB_.PCI0._CRS.DELN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y10._RW, E0RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y10._LEN, E0LN)  // _LEN: Length
                Store (One, E0RW) /* \_SB_.PCI0._CRS.E0RW */
                Store (0x2000, E0LN) /* \_SB_.PCI0._CRS.E0LN */
                If (And (E0_0, 0x1818))
                {
                    Store (0x00, E0LN) /* \_SB_.PCI0._CRS.E0LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y11._RW, E2RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y11._LEN, E2LN)  // _LEN: Length
                Store (One, E2RW) /* \_SB_.PCI0._CRS.E2RW */
                Store (0x2000, E2LN) /* \_SB_.PCI0._CRS.E2LN */
                If (And (E2_0, 0x1818))
                {
                    Store (0x00, E2LN) /* \_SB_.PCI0._CRS.E2LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y12._RW, E4RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y12._LEN, E4LN)  // _LEN: Length
                Store (One, E4RW) /* \_SB_.PCI0._CRS.E4RW */
                Store (0x2000, E4LN) /* \_SB_.PCI0._CRS.E4LN */
                If (And (E4_0, 0x1818))
                {
                    Store (0x00, E4LN) /* \_SB_.PCI0._CRS.E4LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y13._RW, E6RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y13._LEN, E6LN)  // _LEN: Length
                Store (One, E6RW) /* \_SB_.PCI0._CRS.E6RW */
                Store (0x2000, E6LN) /* \_SB_.PCI0._CRS.E6LN */
                If (And (E6_0, 0x1818))
                {
                    Store (0x00, E6LN) /* \_SB_.PCI0._CRS.E6LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y14._RW, E8RW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y14._LEN, E8LN)  // _LEN: Length
                Store (One, E8RW) /* \_SB_.PCI0._CRS.E8RW */
                Store (0x2000, E8LN) /* \_SB_.PCI0._CRS.E8LN */
                If (And (E8_0, 0x1818))
                {
                    Store (0x00, E8LN) /* \_SB_.PCI0._CRS.E8LN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y15._RW, EARW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y15._LEN, EALN)  // _LEN: Length
                Store (One, EARW) /* \_SB_.PCI0._CRS.EARW */
                Store (0x2000, EALN) /* \_SB_.PCI0._CRS.EALN */
                If (And (EA_0, 0x1818))
                {
                    Store (0x00, EALN) /* \_SB_.PCI0._CRS.EALN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y16._RW, ECRW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y16._LEN, ECLN)  // _LEN: Length
                Store (One, ECRW) /* \_SB_.PCI0._CRS.ECRW */
                Store (0x2000, ECLN) /* \_SB_.PCI0._CRS.ECLN */
                If (And (EC_0, 0x1818))
                {
                    Store (0x00, ECLN) /* \_SB_.PCI0._CRS.ECLN */
                }

                CreateBitField (RSRC, \_SB.PCI0._Y17._RW, EERW)  // _RW_: Read-Write Status
                CreateDWordField (RSRC, \_SB.PCI0._Y17._LEN, EELN)  // _LEN: Length
                Store (One, EERW) /* \_SB_.PCI0._CRS.EERW */
                Store (0x2000, EELN) /* \_SB_.PCI0._CRS.EELN */
                If (And (EE_0, 0x1818))
                {
                    Store (0x00, EELN) /* \_SB_.PCI0._CRS.EELN */
                }

                CreateDWordField (RSRC, \_SB.PCI0._Y18._MIN, BT1S)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y18._MAX, BT1M)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y18._LEN, BT1L)  // _LEN: Length
                CreateDWordField (RSRC, \_SB.PCI0._Y19._MIN, BT2S)  // _MIN: Minimum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y19._MAX, BT2M)  // _MAX: Maximum Base Address
                CreateDWordField (RSRC, \_SB.PCI0._Y19._LEN, BT2L)  // _LEN: Length
                Store (0xF8000000, Local0)
                Store (TOML, BT1S) /* \_SB_.PCI0._CRS.BT1S */
                Store (Subtract (Local0, 0x01), BT1M) /* \_SB_.PCI0._CRS.BT1M */
                Subtract (Local0, TOML, BT1L) /* \_SB_.PCI0._CRS.BT1L */
                Return (RSRC) /* \_SB_.PCI0.RSRC */
            }

            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (MEM1, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0F50,             // Range Minimum
                        0x0F50,             // Range Maximum
                        0x01,               // Alignment
                        0x02,               // Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y1A)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y1B)
                    Memory32Fixed (ReadWrite,
                        0xF8000000,         // Address Base
                        0x04000000,         // Address Length
                        )
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1A._BAS, MB01)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1A._LEN, ML01)  // _LEN: Length
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1B._BAS, MB02)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y1B._LEN, ML02)  // _LEN: Length
                    If (GPIC)
                    {
                        Store (0xFEC00000, MB01) /* \_SB_.PCI0.MEMR._CRS.MB01 */
                        Store (0xFEE00000, MB02) /* \_SB_.PCI0.MEMR._CRS.MB02 */
                        Store (0x1000, ML01) /* \_SB_.PCI0.MEMR._CRS.ML01 */
                        Store (0x1000, ML02) /* \_SB_.PCI0.MEMR._CRS.ML02 */
                    }

                    Return (MEM1) /* \_SB_.PCI0.MEMR.MEM1 */
                }
            }

            Scope (\_SB.PCI0)
            {
                Method (AFN0, 0, Serialized)
                {
                    If (LEqual (VGPU, ^VGA._ADR))
                    {
                        ^VGA.AFN0 ()
                    }

                    If (LEqual (VGPU, ^PB3._ADR))
                    {
                        ^PB3.VGA.AFN0 ()
                    }
                }

                Method (AFN1, 1, Serialized)
                {
                }

                Method (AFN2, 2, Serialized)
                {
                }

                Method (AFN3, 2, Serialized)
                {
                    If (LEqual (VGPU, ^VGA._ADR))
                    {
                        ^VGA.AFN3 (Arg0, Arg1)
                    }

                    If (LEqual (VGPU, ^PB3._ADR))
                    {
                        ^PB3.VGA.AFN3 (Arg0, Arg1)
                    }
                }

                Method (AFN4, 1, Serialized)
                {
                    If (LEqual (VGPU, ^VGA._ADR))
                    {
                        ^VGA.AFN4 (Arg0)
                    }

                    If (LEqual (VGPU, ^PB3._ADR))
                    {
                        ^PB3.VGA.AFN4 (Arg0)
                    }
                }

                Method (AFN5, 0, Serialized)
                {
                    If (LEqual (VGPU, ^VGA._ADR))
                    {
                        ^VGA.AFN5 ()
                    }

                    If (LEqual (VGPU, ^PB3._ADR))
                    {
                        ^PB3.VGA.AFN5 ()
                    }
                }

                Method (AFN6, 0, Serialized)
                {
                    If (LEqual (VGPU, ^VGA._ADR))
                    {
                        ^VGA.AFN6 ()
                    }

                    If (LEqual (VGPU, ^PB3._ADR))
                    {
                        ^PB3.VGA.AFN6 ()
                    }
                }

                Method (AFN7, 1, Serialized)
                {
                    If (LEqual (VGPU, ^VGA._ADR))
                    {
                        ^VGA.AFN7 (Arg0)
                    }

                    If (LEqual (VGPU, ^PB3._ADR))
                    {
                        ^PB3.VGA.AFN7 (Arg0)
                    }
                }
            }

            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (GPIC)
                {
                    Return (Package (0x2B)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x02, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x03, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x02, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x03, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x01, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x02, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x03, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x03, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x02, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x03, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            0x00, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }
                    })
                }
                Else
                {
                    Return (Package (0x2B)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            ^LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x01, 
                            ^LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            ^LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x01, 
                            ^LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x02, 
                            ^LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x03, 
                            ^LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x00, 
                            ^LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x01, 
                            ^LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x02, 
                            ^LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0003FFFF, 
                            0x03, 
                            ^LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x00, 
                            ^LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x01, 
                            ^LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x02, 
                            ^LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x03, 
                            ^LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x00, 
                            ^LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x01, 
                            ^LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x02, 
                            ^LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0005FFFF, 
                            0x03, 
                            ^LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            ^LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x01, 
                            ^LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            ^LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x03, 
                            ^LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x00, 
                            ^LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x01, 
                            ^LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x02, 
                            ^LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0007FFFF, 
                            0x03, 
                            ^LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0011FFFF, 
                            0x00, 
                            ^LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x00, 
                            ^LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0012FFFF, 
                            0x01, 
                            ^LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            ^LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x01, 
                            ^LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x00, 
                            ^LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x01, 
                            ^LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            0x00, 
                            ^LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0010FFFF, 
                            0x01, 
                            ^LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            ^LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            ^LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            ^LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            ^LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x00, 
                            ^LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x01, 
                            ^LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x02, 
                            ^LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0015FFFF, 
                            0x03, 
                            ^LPC0.LNKD, 
                            0x00
                        }
                    })
                }
            }

            OperationRegion (BAR1, PCI_Config, 0x14, 0x04)
            Field (BAR1, ByteAcc, NoLock, Preserve)
            {
                NBBA,   32
            }

            Method (XCMP, 2, NotSerialized)
            {
                If (LNotEqual (0x10, SizeOf (Arg0)))
                {
                    Return (0x00)
                }

                If (LNotEqual (0x10, SizeOf (Arg1)))
                {
                    Return (0x00)
                }

                Store (0x00, Local0)
                While (LLess (Local0, 0x10))
                {
                    If (LNotEqual (DerefOf (Index (Arg0, Local0)), DerefOf (Index (
                        Arg1, Local0))))
                    {
                        Return (0x00)
                    }

                    Increment (Local0)
                }

                Return (0x01)
            }

            Device (PB2)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC0.LNKB, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xF8010100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Store (Zero, Local0)
                    If (And (VC0S, 0x00020000))
                    {
                        Store (Ones, Local0)
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    Store (Arg0, XPIR) /* \_SB_.PCI0.PB2_.XPIR */
                    Store (XPID, Local0)
                    Store (0x00, XPIR) /* \_SB_.PCI0.PB2_.XPIR */
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Store (Arg0, XPIR) /* \_SB_.PCI0.PB2_.XPIR */
                    Store (Arg1, XPID) /* \_SB_.PCI0.PB2_.XPID */
                    Store (0x00, XPIR) /* \_SB_.PCI0.PB2_.XPIR */
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Store (0x00, Local1)
                    Store (XPPB (), Local0)
                    If (LGreater (0x04, Local0))
                    {
                        Store (0x00, Local1)
                    }

                    If (LGreater (0x08, Local0))
                    {
                        Store (0x00010000, Local1)
                    }

                    If (LGreater (0x0B, Local0))
                    {
                        Store (0x00020000, Local1)
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Store (XPPB (), Local0)
                    Store (GPPX (), Local2)
                    Store (GFXM (), Local3)
                    Store (0x00, Local1)
                    If (LEqual (0x10, Local0))
                    {
                        Store (0xFFFF, Local1)
                        If (Local3)
                        {
                            Store (0x0F0F, Local1)
                        }
                    }

                    If (LEqual (0x18, Local0))
                    {
                        Store (0xF0F0, Local1)
                    }

                    If (LEqual (0x20, Local0))
                    {
                        Store (0x1010, Local1)
                    }

                    If (LEqual (0x28, Local0))
                    {
                        Store (0x2020, Local1)
                    }

                    If (LEqual (0x30, Local0))
                    {
                        Store (0x4040, Local1)
                    }

                    If (LEqual (0x38, Local0))
                    {
                        Store (0x8080, Local1)
                    }

                    If (LEqual (0x48, Local0))
                    {
                        Store (0x00, Local1)
                        If (LEqual (0x02, Local2))
                        {
                            Store (0x0303, Local1)
                        }

                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0101, Local1)
                        }
                    }

                    If (LEqual (0x50, Local0))
                    {
                        Store (0x00, Local1)
                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0202, Local1)
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Store (XPPD (), Local1)
                    If (LNotEqual (0x00, Local1))
                    {
                        Store (NBXR (Add (0x65, XPCN ())), Local2)
                        If (Arg0)
                        {
                            And (Local2, Not (Local1), Local2)
                        }
                        Else
                        {
                            Or (Local2, Local1, Local2)
                        }

                        NBXW (Add (0x65, XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB2_.LKCN */
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB2_.LKCN */
                    Store (0x64, Local1)
                    Store (0x01, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (0x01)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (0x00, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB2_.LKCN */
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Store (GFXM (), Local0)
                    Store (XPPB (), Local1)
                    Store (0x00, Local2)
                    If (LEqual (0x10, Local1))
                    {
                        Store (0x01, Local2)
                        Store (0x00770070, Local3)
                        If (Local0)
                        {
                            Store (0x00330030, Local3)
                        }
                    }

                    If (LAnd (LEqual (0x18, Local1), Local0))
                    {
                        Store (0x01, Local2)
                        Store (0x00440040, Local3)
                    }

                    Store (NBMR (0x07), Local0)
                    Store (NBXR (0x65), Local1)
                    If (LAnd (Local0, 0x0201F000))
                    {
                        Store (0x00440040, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0xF0F0))
                        {
                            Store (0x00, Local5)
                        }
                    }
                    Else
                    {
                        Store (0x00110010, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0x0F0F))
                        {
                            Store (0x00, Local5)
                        }
                    }

                    If (Local2)
                    {
                        Store (Or (Local3, Local4), Local6)
                        Store (And (Local5, Local4), Local0)
                        Store (Or (Local3, Local0), Local7)
                        Store (NBMR (0x2E), Local0)
                        If (Arg0)
                        {
                            And (Local0, Not (Local6), Local0)
                        }
                        Else
                        {
                            Or (Local0, Local7, Local0)
                        }

                        NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        XPTR (ShiftLeft (XPPB (), 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        XPTR (ShiftLeft (XPPB (), 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }

                    Name (ATIB, Buffer (0x0100) {})
                    Method (ATIF, 2, Serialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            Return (AF00 ())
                        }

                        If (LEqual (Arg0, 0x01))
                        {
                            Return (AF01 ())
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Return (AF02 ())
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Return (AF03 (DerefOf (Index (Arg1, 0x02)), DerefOf (Index (Arg1, 
                                0x04))))
                        }

                        If (LEqual (Arg0, 0x0F))
                        {
                            Return (AF15 ())
                        }
                        Else
                        {
                            CreateWordField (ATIB, 0x00, SSZE)
                            CreateWordField (ATIB, 0x02, VERN)
                            CreateDWordField (ATIB, 0x04, NMSK)
                            CreateDWordField (ATIB, 0x08, SFUN)
                            Store (0x00, SSZE) /* \_SB_.PCI0.PB2_.VGA_.ATIF.SSZE */
                            Store (0x00, VERN) /* \_SB_.PCI0.PB2_.VGA_.ATIF.VERN */
                            Store (0x00, NMSK) /* \_SB_.PCI0.PB2_.VGA_.ATIF.NMSK */
                            Store (0x00, SFUN) /* \_SB_.PCI0.PB2_.VGA_.ATIF.SFUN */
                            Return (ATIB) /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                        }
                    }

                    Method (AF00, 0, NotSerialized)
                    {
                        Store (0xF0, P80H) /* \P80H */
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        Store (0x0C, SSZE) /* \_SB_.PCI0.PB2_.VGA_.AF00.SSZE */
                        Store (0x01, VERN) /* \_SB_.PCI0.PB2_.VGA_.AF00.VERN */
                        If (LEqual (^^^VGA.PXEN, 0x80000000))
                        {
                            Store (0x01, NMSK) /* \_SB_.PCI0.PB2_.VGA_.AF00.NMSK */
                        }
                        Else
                        {
                            Store (0x41, NMSK) /* \_SB_.PCI0.PB2_.VGA_.AF00.NMSK */
                        }

                        If (LEqual (^^^VGA.AF7E, 0x80000001))
                        {
                            Or (NMSK, 0x80, NMSK) /* \_SB_.PCI0.PB2_.VGA_.AF00.NMSK */
                        }

                        Store (NMSK, MSKN) /* \_SB_.PCI0.PB2_.VGA_.MSKN */
                        Store (0x4007, SFUN) /* \_SB_.PCI0.PB2_.VGA_.AF00.SFUN */
                        Return (ATIB) /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                    }

                    Name (NCOD, 0x81)
                    Method (AF01, 0, NotSerialized)
                    {
                        Store (0xF1, P80H) /* \P80H */
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, VMSK)
                        CreateDWordField (ATIB, 0x06, FLGS)
                        Store (0x0B, VMSK) /* \_SB_.PCI0.PB2_.VGA_.AF01.VMSK */
                        Store (0x0A, SSZE) /* \_SB_.PCI0.PB2_.VGA_.AF01.SSZE */
                        Store (0x03, VMSK) /* \_SB_.PCI0.PB2_.VGA_.AF01.VMSK */
                        Store (0x01, FLGS) /* \_SB_.PCI0.PB2_.VGA_.AF01.FLGS */
                        Store (0x81, NCOD) /* \_SB_.PCI0.PB2_.VGA_.NCOD */
                        Return (ATIB) /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                    }

                    Name (PSBR, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00
                    })
                    Name (MSKN, 0x00)
                    Name (SEXM, 0x00)
                    Name (STHG, 0x00)
                    Name (STHI, 0x00)
                    Name (SFPG, 0x00)
                    Name (SFPI, 0x00)
                    Name (SSPS, 0x00)
                    Name (SSDM, 0x0A)
                    Name (SCDY, 0x00)
                    Name (SACT, Buffer (0x07)
                    {
                         0x01, 0x02, 0x08, 0x80, 0x03, 0x09, 0x81
                    })
                    Method (AF02, 0, NotSerialized)
                    {
                        Store (0xF2, P80H) /* \P80H */
                        CreateBitField (PSBR, 0x00, PDSW)
                        CreateBitField (PSBR, 0x01, PEXM)
                        CreateBitField (PSBR, 0x02, PTHR)
                        CreateBitField (PSBR, 0x03, PFPS)
                        CreateBitField (PSBR, 0x04, PSPS)
                        CreateBitField (PSBR, 0x05, PDCC)
                        CreateBitField (PSBR, 0x06, PXPS)
                        CreateBitField (PSBR, 0x07, PBRT)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, PSBI)
                        CreateByteField (ATIB, 0x06, EXPM)
                        CreateByteField (ATIB, 0x07, THRM)
                        CreateByteField (ATIB, 0x08, THID)
                        CreateByteField (ATIB, 0x09, FPWR)
                        CreateByteField (ATIB, 0x0A, FPID)
                        CreateByteField (ATIB, 0x0B, SPWR)
                        CreateByteField (ATIB, 0x0C, BRTL)
                        Store (0x0D, SSZE) /* \_SB_.PCI0.PB2_.VGA_.AF02.SSZE */
                        Store (PSBR, PSBI) /* \_SB_.PCI0.PB2_.VGA_.AF02.PSBI */
                        If (PDSW)
                        {
                            Store (0x82, P80H) /* \P80H */
                            Store (Zero, PDSW) /* \_SB_.PCI0.PB2_.VGA_.AF02.PDSW */
                        }

                        If (PEXM)
                        {
                            Store (SEXM, EXPM) /* \_SB_.PCI0.PB2_.VGA_.AF02.EXPM */
                            Store (Zero, SEXM) /* \_SB_.PCI0.PB2_.VGA_.SEXM */
                            Store (Zero, PEXM) /* \_SB_.PCI0.PB2_.VGA_.AF02.PEXM */
                        }

                        If (PTHR)
                        {
                            Store (STHG, THRM) /* \_SB_.PCI0.PB2_.VGA_.AF02.THRM */
                            Store (STHI, THID) /* \_SB_.PCI0.PB2_.VGA_.AF02.THID */
                            Store (Zero, STHG) /* \_SB_.PCI0.PB2_.VGA_.STHG */
                            Store (Zero, STHI) /* \_SB_.PCI0.PB2_.VGA_.STHI */
                            Store (Zero, PTHR) /* \_SB_.PCI0.PB2_.VGA_.AF02.PTHR */
                        }

                        If (PFPS)
                        {
                            Store (SFPG, FPWR) /* \_SB_.PCI0.PB2_.VGA_.AF02.FPWR */
                            Store (SFPI, FPWR) /* \_SB_.PCI0.PB2_.VGA_.AF02.FPWR */
                            Store (Zero, SFPG) /* \_SB_.PCI0.PB2_.VGA_.SFPG */
                            Store (Zero, SFPI) /* \_SB_.PCI0.PB2_.VGA_.SFPI */
                            Store (Zero, PFPS) /* \_SB_.PCI0.PB2_.VGA_.AF02.PFPS */
                        }

                        If (PSPS)
                        {
                            Store (SSPS, SPWR) /* \_SB_.PCI0.PB2_.VGA_.AF02.SPWR */
                            Store (Zero, PSPS) /* \_SB_.PCI0.PB2_.VGA_.AF02.PSPS */
                        }

                        If (PXPS)
                        {
                            Store (0xA2, P80H) /* \P80H */
                            Store (Zero, PXPS) /* \_SB_.PCI0.PB2_.VGA_.AF02.PXPS */
                        }

                        If (PBRT)
                        {
                            Store (0xF7, P80H) /* \P80H */
                            Store (Zero, PBRT) /* \_SB_.PCI0.PB2_.VGA_.AF02.PBRT */
                        }

                        Return (ATIB) /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                    }

                    Method (AF03, 2, NotSerialized)
                    {
                        Store (0xF3, P80H) /* \P80H */
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateWordField (ATIB, 0x02, SSDP)
                        CreateWordField (ATIB, 0x04, SCDP)
                        Store (Arg0, SSDP) /* \_SB_.PCI0.PB2_.VGA_.AF03.SSDP */
                        Store (Arg1, SCDP) /* \_SB_.PCI0.PB2_.VGA_.AF03.SCDP */
                        Name (NXTD, 0x06)
                        Name (CIDX, 0x06)
                        Store (SSDP, Local1)
                        And (Local1, 0x8B, Local1)
                        Store (SCDP, Local2)
                        If (0x00)
                        {
                            And (Local2, 0xFFFFFFFE, Local2)
                        }
                        Else
                        {
                            Or (Local2, 0x01, Local2)
                        }

                        Store (Local2, P80H) /* \P80H */
                        Store (Zero, Local0)
                        While (LLess (Local0, SizeOf (SACT)))
                        {
                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            If (LEqual (Local3, Local1))
                            {
                                Store (Local0, CIDX) /* \_SB_.PCI0.PB2_.VGA_.AF03.CIDX */
                                Store (SizeOf (SACT), Local0)
                            }
                            Else
                            {
                                Increment (Local0)
                            }
                        }

                        Store (CIDX, Local0)
                        While (LLess (Local0, SizeOf (SACT)))
                        {
                            Increment (Local0)
                            If (LEqual (Local0, SizeOf (SACT)))
                            {
                                Store (0x00, Local0)
                            }

                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            If (LEqual (And (Local3, Local2), Local3))
                            {
                                Store (Local0, NXTD) /* \_SB_.PCI0.PB2_.VGA_.AF03.NXTD */
                                Store (SizeOf (SACT), Local0)
                            }
                        }

                        If (LEqual (NXTD, SizeOf (SACT)))
                        {
                            Store (Zero, SSDP) /* \_SB_.PCI0.PB2_.VGA_.AF03.SSDP */
                        }
                        Else
                        {
                            Store (NXTD, Local0)
                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            And (SSDP, 0xFFFFFF74, SSDP) /* \_SB_.PCI0.PB2_.VGA_.AF03.SSDP */
                            Or (SSDP, Local3, SSDP) /* \_SB_.PCI0.PB2_.VGA_.AF03.SSDP */
                        }

                        Store (0x04, SSZE) /* \_SB_.PCI0.PB2_.VGA_.AF03.SSZE */
                        Store (SSDP, P80H) /* \P80H */
                        Return (ATIB) /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                    }

                    Method (AFN0, 0, Serialized)
                    {
                        If (And (MSKN, 0x01))
                        {
                            CreateBitField (PSBR, 0x00, PDSW)
                            Store (One, PDSW) /* \_SB_.PCI0.PB2_.VGA_.AFN0.PDSW */
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN3, 2, Serialized)
                    {
                        If (And (MSKN, 0x08))
                        {
                            Store (Arg0, Local0)
                            Store (Local0, SFPI) /* \_SB_.PCI0.PB2_.VGA_.SFPI */
                            Store (Arg1, Local0)
                            Store (And (Local0, 0x03, Local0), SFPG) /* \_SB_.PCI0.PB2_.VGA_.SFPG */
                            CreateBitField (PSBR, 0x03, PFPS)
                            Store (One, PFPS) /* \_SB_.PCI0.PB2_.VGA_.AFN3.PFPS */
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN4, 1, Serialized)
                    {
                        If (And (MSKN, 0x10))
                        {
                            Store (Arg0, Local0)
                            Store (SSPS, Local1)
                            Store (Local0, SSPS) /* \_SB_.PCI0.PB2_.VGA_.SSPS */
                            If (LEqual (Local0, Local1)) {}
                            Else
                            {
                                CreateBitField (PSBR, 0x04, PSPS)
                                Store (One, PSPS) /* \_SB_.PCI0.PB2_.VGA_.AFN4.PSPS */
                                Notify (VGA, NCOD)
                            }
                        }
                    }

                    Method (AFN5, 0, Serialized)
                    {
                        If (And (MSKN, 0x20))
                        {
                            CreateBitField (PSBR, 0x05, PDCC)
                            Store (One, PDCC) /* \_SB_.PCI0.PB2_.VGA_.AFN5.PDCC */
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN6, 0, Serialized)
                    {
                        If (And (MSKN, 0x40))
                        {
                            CreateBitField (PSBR, 0x06, PXPS)
                            Store (One, PXPS) /* \_SB_.PCI0.PB2_.VGA_.AFN6.PXPS */
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN7, 1, Serialized)
                    {
                        If (And (MSKN, 0x80))
                        {
                            CreateBitField (PSBR, 0x07, PBRT)
                            Store (One, PBRT) /* \_SB_.PCI0.PB2_.VGA_.AFN7.PBRT */
                            CreateByteField (ATIB, 0x0C, BRTL)
                            Store (Arg0, BRTL) /* \_SB_.PCI0.PB2_.VGA_.AFN7.BRTL */
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AF15, 0, NotSerialized)
                    {
                        Store (0xFF, P80H) /* \P80H */
                        CreateWordField (ATIB, 0x00, DNUM)
                        CreateWordField (ATIB, 0x02, DSZE)
                        Store (0x08, DSZE) /* \_SB_.PCI0.PB2_.VGA_.AF15.DSZE */
                        ^^^LPC0.PHS3 (0x8D, 0x0F, ATIB)
                        Store (^^^LPC0.INFO, ATIB) /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                        Return (ATIB) /* \_SB_.PCI0.PB2_.VGA_.ATIB */
                    }

                    Name (AT00, Buffer (0xFF) {})
                    Name (AT01, Buffer (0x03) {})
                    Method (ATCS, 2, Serialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            ATC0 ()
                        }

                        If (LEqual (Arg0, 0x01))
                        {
                            ATC1 ()
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            ATC2 (Arg1)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            ATC3 ()
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            ATC4 (Arg1)
                        }

                        Return (AT00) /* \_SB_.PCI0.PB2_.VGA_.AT00 */
                    }

                    Method (ATC0, 0, NotSerialized)
                    {
                        CreateWordField (AT00, 0x00, SZZE)
                        CreateWordField (AT00, 0x02, INTF)
                        CreateDWordField (AT00, 0x04, SUPP)
                        Store (0x08, SZZE) /* \_SB_.PCI0.PB2_.VGA_.ATC0.SZZE */
                        Store (0x01, INTF) /* \_SB_.PCI0.PB2_.VGA_.ATC0.INTF */
                        Store (0x0F, SUPP) /* \_SB_.PCI0.PB2_.VGA_.ATC0.SUPP */
                    }

                    Method (ATC1, 0, Serialized)
                    {
                        CreateWordField (AT00, 0x00, SZZE)
                        CreateDWordField (AT00, 0x02, VFMK)
                        CreateDWordField (AT00, 0x06, FLAG)
                        CreateField (AT00, 0x30, 0x01, DOCK)
                        Store (0x0A, SZZE) /* \_SB_.PCI0.PB2_.VGA_.ATC1.SZZE */
                        Store (0x01, VFMK) /* \_SB_.PCI0.PB2_.VGA_.ATC1.VFMK */
                        Store (0x00, FLAG) /* \_SB_.PCI0.PB2_.VGA_.ATC1.FLAG */
                        Store (0x01, DOCK) /* \_SB_.PCI0.PB2_.VGA_.ATC1.DOCK */
                    }

                    Method (ATC2, 1, Serialized)
                    {
                        CreateField (Arg0, 0x10, 0x03, FUCC)
                        CreateField (Arg0, 0x13, 0x06, DEVV)
                        CreateByteField (Arg0, 0x03, BUSS)
                        CreateDWordField (Arg0, 0x04, VFMK)
                        CreateDWordField (Arg0, 0x06, FLAG)
                        CreateField (Arg0, 0x30, 0x01, ADVC)
                        CreateField (Arg0, 0x31, 0x01, WFCM)
                        CreateByteField (Arg0, 0x08, RQST)
                        CreateByteField (Arg0, 0x09, PFRQ)
                        CreateWordField (AT00, 0x00, SZZE)
                        CreateByteField (AT00, 0x02, RETV)
                        Store (0x03, SZZE) /* \_SB_.PCI0.PB2_.VGA_.ATC2.SZZE */
                        Store (0x01, RETV) /* \_SB_.PCI0.PB2_.VGA_.ATC2.RETV */
                        Store (ALIB (0x02, Arg0), AT00) /* \_SB_.PCI0.PB2_.VGA_.AT00 */
                    }

                    Method (ATC3, 0, Serialized)
                    {
                        CreateWordField (AT00, 0x00, SZZE)
                        CreateByteField (AT00, 0x02, RETV)
                        CreateWordField (AT01, 0x00, SZZB)
                        CreateByteField (AT01, 0x02, PSPP)
                        Store (0x03, SZZE) /* \_SB_.PCI0.PB2_.VGA_.ATC3.SZZE */
                        Store (0x01, RETV) /* \_SB_.PCI0.PB2_.VGA_.ATC3.RETV */
                        Store (0x03, SZZB) /* \_SB_.PCI0.PB2_.VGA_.ATC3.SZZB */
                        Store (0x01, PSPP) /* \_SB_.PCI0.PB2_.VGA_.ATC3.PSPP */
                        Store (ALIB (0x03, AT01), AT00) /* \_SB_.PCI0.PB2_.VGA_.AT00 */
                    }

                    Method (ATC4, 1, Serialized)
                    {
                        CreateField (Arg0, 0x10, 0x03, FUCC)
                        CreateField (Arg0, 0x13, 0x06, DEVV)
                        CreateByteField (Arg0, 0x03, BUSS)
                        CreateByteField (Arg0, 0x04, NULN)
                        CreateWordField (AT00, 0x00, SZZE)
                        CreateByteField (AT00, 0x02, NULM)
                        Store (0x03, SZZE) /* \_SB_.PCI0.PB2_.VGA_.ATC4.SZZE */
                        Store (0x01, NULM) /* \_SB_.PCI0.PB2_.VGA_.ATC4.NULM */
                        Store (ALIB (0x04, Arg0), AT00) /* \_SB_.PCI0.PB2_.VGA_.AT00 */
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        If (LNotEqual (^^^VGA.PXMX, 0x80000000))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            If (LEqual (0x18, XPPB ()))
                            {
                                If (LNotEqual (^^^VGA.PXEN, 0x80000000))
                                {
                                    Return (0x00)
                                }
                                Else
                                {
                                    Return (0x01)
                                }
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                    }
                }

                Device (HDAU)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local2)
                        While (LLess (Local2, 0x0F))
                        {
                            Store (One, PSDC) /* \_SB_.PCI0.PB2_.PSDC */
                            Store (0x01, Local4)
                            Store (0xC8, Local5)
                            While (LAnd (Local4, Local5))
                            {
                                Store (XPRD (0xA5), Local6)
                                And (Local6, 0x7F, Local6)
                                If (LAnd (LGreaterEqual (Local6, 0x10), LNotEqual (Local6, 0x7F)))
                                {
                                    Store (0x00, Local4)
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Decrement (Local5)
                                }
                            }

                            If (LNot (Local4))
                            {
                                Store (XPDL (), Local5)
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Increment (Local2)
                                }
                                Else
                                {
                                    Store (ShiftLeft (XPPB (), 0x03), ^^LPC0.INFO) /* \_SB_.PCI0.LPC0.INFO */
                                    ^^LPC0.PHS1 (0x87)
                                    If (LEqual (XPR2 (), Ones))
                                    {
                                        Store (0x01, Local0)
                                        Store (0x10, Local2)
                                    }
                                    Else
                                    {
                                        Store (0x00, Local0)
                                        Store (0x10, Local2)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x10, Local2)
                            }
                        }

                        If (LNot (Local0))
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        Store (One, PSDC) /* \_SB_.PCI0.PB2_.PSDC */
                        Store (^VGA.DVID, Local7)
                        Sleep (0x0A)
                        Store (0x01, Local4)
                        Store (0x05, Local5)
                        While (LAnd (Local4, Local5))
                        {
                            Store (XPRD (0xA5), Local6)
                            And (Local6, 0x7F, Local6)
                            If (LLessEqual (Local6, 0x04))
                            {
                                Store (0x00, Local4)
                            }
                            Else
                            {
                                Store (^VGA.DVID, Local7)
                                Sleep (0x05)
                                Decrement (Local5)
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (PB3)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC0.LNKC, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xF8018100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Store (Zero, Local0)
                    If (And (VC0S, 0x00020000))
                    {
                        Store (Ones, Local0)
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    Store (Arg0, XPIR) /* \_SB_.PCI0.PB3_.XPIR */
                    Store (XPID, Local0)
                    Store (0x00, XPIR) /* \_SB_.PCI0.PB3_.XPIR */
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Store (Arg0, XPIR) /* \_SB_.PCI0.PB3_.XPIR */
                    Store (Arg1, XPID) /* \_SB_.PCI0.PB3_.XPID */
                    Store (0x00, XPIR) /* \_SB_.PCI0.PB3_.XPIR */
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Store (0x00, Local1)
                    Store (XPPB (), Local0)
                    If (LGreater (0x04, Local0))
                    {
                        Store (0x00, Local1)
                    }

                    If (LGreater (0x08, Local0))
                    {
                        Store (0x00010000, Local1)
                    }

                    If (LGreater (0x0B, Local0))
                    {
                        Store (0x00020000, Local1)
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Store (XPPB (), Local0)
                    Store (GPPX (), Local2)
                    Store (GFXM (), Local3)
                    Store (0x00, Local1)
                    If (LEqual (0x10, Local0))
                    {
                        Store (0xFFFF, Local1)
                        If (Local3)
                        {
                            Store (0x0F0F, Local1)
                        }
                    }

                    If (LEqual (0x18, Local0))
                    {
                        Store (0xF0F0, Local1)
                    }

                    If (LEqual (0x20, Local0))
                    {
                        Store (0x1010, Local1)
                    }

                    If (LEqual (0x28, Local0))
                    {
                        Store (0x2020, Local1)
                    }

                    If (LEqual (0x30, Local0))
                    {
                        Store (0x4040, Local1)
                    }

                    If (LEqual (0x38, Local0))
                    {
                        Store (0x8080, Local1)
                    }

                    If (LEqual (0x48, Local0))
                    {
                        Store (0x00, Local1)
                        If (LEqual (0x02, Local2))
                        {
                            Store (0x0303, Local1)
                        }

                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0101, Local1)
                        }
                    }

                    If (LEqual (0x50, Local0))
                    {
                        Store (0x00, Local1)
                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0202, Local1)
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Store (XPPD (), Local1)
                    If (LNotEqual (0x00, Local1))
                    {
                        Store (NBXR (Add (0x65, XPCN ())), Local2)
                        If (Arg0)
                        {
                            And (Local2, Not (Local1), Local2)
                        }
                        Else
                        {
                            Or (Local2, Local1, Local2)
                        }

                        NBXW (Add (0x65, XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB3_.LKCN */
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB3_.LKCN */
                    Store (0x64, Local1)
                    Store (0x01, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (0x01)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (0x00, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB3_.LKCN */
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Store (GFXM (), Local0)
                    Store (XPPB (), Local1)
                    Store (0x00, Local2)
                    If (LEqual (0x10, Local1))
                    {
                        Store (0x01, Local2)
                        Store (0x00770070, Local3)
                        If (Local0)
                        {
                            Store (0x00330030, Local3)
                        }
                    }

                    If (LAnd (LEqual (0x18, Local1), Local0))
                    {
                        Store (0x01, Local2)
                        Store (0x00440040, Local3)
                    }

                    Store (NBMR (0x07), Local0)
                    Store (NBXR (0x65), Local1)
                    If (LAnd (Local0, 0x0201F000))
                    {
                        Store (0x00440040, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0xF0F0))
                        {
                            Store (0x00, Local5)
                        }
                    }
                    Else
                    {
                        Store (0x00110010, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0x0F0F))
                        {
                            Store (0x00, Local5)
                        }
                    }

                    If (Local2)
                    {
                        Store (Or (Local3, Local4), Local6)
                        Store (And (Local5, Local4), Local0)
                        Store (Or (Local3, Local0), Local7)
                        Store (NBMR (0x2E), Local0)
                        If (Arg0)
                        {
                            And (Local0, Not (Local6), Local0)
                        }
                        Else
                        {
                            Or (Local0, Local7, Local0)
                        }

                        NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        XPTR (ShiftLeft (XPPB (), 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        XPTR (ShiftLeft (XPPB (), 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }

                    Name (ATIB, Buffer (0x0100) {})
                    Method (ATIF, 2, Serialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            Return (AF00 ())
                        }

                        If (LEqual (Arg0, 0x01))
                        {
                            Return (AF01 ())
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Return (AF02 ())
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Return (AF03 (DerefOf (Index (Arg1, 0x02)), DerefOf (Index (Arg1, 
                                0x04))))
                        }

                        If (LEqual (Arg0, 0x0F))
                        {
                            Return (AF15 ())
                        }
                        Else
                        {
                            CreateWordField (ATIB, 0x00, SSZE)
                            CreateWordField (ATIB, 0x02, VERN)
                            CreateDWordField (ATIB, 0x04, NMSK)
                            CreateDWordField (ATIB, 0x08, SFUN)
                            Store (0x00, SSZE) /* \_SB_.PCI0.PB3_.VGA_.ATIF.SSZE */
                            Store (0x00, VERN) /* \_SB_.PCI0.PB3_.VGA_.ATIF.VERN */
                            Store (0x00, NMSK) /* \_SB_.PCI0.PB3_.VGA_.ATIF.NMSK */
                            Store (0x00, SFUN) /* \_SB_.PCI0.PB3_.VGA_.ATIF.SFUN */
                            Return (ATIB) /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                        }
                    }

                    Method (AF00, 0, NotSerialized)
                    {
                        Store (0xF0, P80H) /* \P80H */
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        Store (0x0C, SSZE) /* \_SB_.PCI0.PB3_.VGA_.AF00.SSZE */
                        Store (0x01, VERN) /* \_SB_.PCI0.PB3_.VGA_.AF00.VERN */
                        If (LEqual (^^^VGA.PXEN, 0x80000000))
                        {
                            Store (0x01, NMSK) /* \_SB_.PCI0.PB3_.VGA_.AF00.NMSK */
                        }
                        Else
                        {
                            Store (0x41, NMSK) /* \_SB_.PCI0.PB3_.VGA_.AF00.NMSK */
                        }

                        If (LEqual (^^^VGA.AF7E, 0x80000001))
                        {
                            Or (NMSK, 0x80, NMSK) /* \_SB_.PCI0.PB3_.VGA_.AF00.NMSK */
                        }

                        Store (NMSK, MSKN) /* \_SB_.PCI0.PB3_.VGA_.MSKN */
                        Store (0x4007, SFUN) /* \_SB_.PCI0.PB3_.VGA_.AF00.SFUN */
                        Return (ATIB) /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                    }

                    Name (NCOD, 0x81)
                    Method (AF01, 0, NotSerialized)
                    {
                        Store (0xF1, P80H) /* \P80H */
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, VMSK)
                        CreateDWordField (ATIB, 0x06, FLGS)
                        Store (0x0B, VMSK) /* \_SB_.PCI0.PB3_.VGA_.AF01.VMSK */
                        Store (0x0A, SSZE) /* \_SB_.PCI0.PB3_.VGA_.AF01.SSZE */
                        Store (0x03, VMSK) /* \_SB_.PCI0.PB3_.VGA_.AF01.VMSK */
                        Store (0x01, FLGS) /* \_SB_.PCI0.PB3_.VGA_.AF01.FLGS */
                        Store (0x81, NCOD) /* \_SB_.PCI0.PB3_.VGA_.NCOD */
                        Return (ATIB) /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                    }

                    Name (PSBR, Buffer (0x04)
                    {
                         0x00, 0x00, 0x00, 0x00
                    })
                    Name (MSKN, 0x00)
                    Name (SEXM, 0x00)
                    Name (STHG, 0x00)
                    Name (STHI, 0x00)
                    Name (SFPG, 0x00)
                    Name (SFPI, 0x00)
                    Name (SSPS, 0x00)
                    Name (SSDM, 0x0A)
                    Name (SCDY, 0x00)
                    Name (SACT, Buffer (0x07)
                    {
                         0x01, 0x02, 0x08, 0x80, 0x03, 0x09, 0x81
                    })
                    Method (AF02, 0, NotSerialized)
                    {
                        Store (0xF2, P80H) /* \P80H */
                        CreateBitField (PSBR, 0x00, PDSW)
                        CreateBitField (PSBR, 0x01, PEXM)
                        CreateBitField (PSBR, 0x02, PTHR)
                        CreateBitField (PSBR, 0x03, PFPS)
                        CreateBitField (PSBR, 0x04, PSPS)
                        CreateBitField (PSBR, 0x05, PDCC)
                        CreateBitField (PSBR, 0x06, PXPS)
                        CreateBitField (PSBR, 0x07, PBRT)
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateDWordField (ATIB, 0x02, PSBI)
                        CreateByteField (ATIB, 0x06, EXPM)
                        CreateByteField (ATIB, 0x07, THRM)
                        CreateByteField (ATIB, 0x08, THID)
                        CreateByteField (ATIB, 0x09, FPWR)
                        CreateByteField (ATIB, 0x0A, FPID)
                        CreateByteField (ATIB, 0x0B, SPWR)
                        CreateByteField (ATIB, 0x0C, BRTL)
                        Store (0x0D, SSZE) /* \_SB_.PCI0.PB3_.VGA_.AF02.SSZE */
                        Store (PSBR, PSBI) /* \_SB_.PCI0.PB3_.VGA_.AF02.PSBI */
                        If (PDSW)
                        {
                            Store (0x82, P80H) /* \P80H */
                            Store (Zero, PDSW) /* \_SB_.PCI0.PB3_.VGA_.AF02.PDSW */
                        }

                        If (PEXM)
                        {
                            Store (SEXM, EXPM) /* \_SB_.PCI0.PB3_.VGA_.AF02.EXPM */
                            Store (Zero, SEXM) /* \_SB_.PCI0.PB3_.VGA_.SEXM */
                            Store (Zero, PEXM) /* \_SB_.PCI0.PB3_.VGA_.AF02.PEXM */
                        }

                        If (PTHR)
                        {
                            Store (STHG, THRM) /* \_SB_.PCI0.PB3_.VGA_.AF02.THRM */
                            Store (STHI, THID) /* \_SB_.PCI0.PB3_.VGA_.AF02.THID */
                            Store (Zero, STHG) /* \_SB_.PCI0.PB3_.VGA_.STHG */
                            Store (Zero, STHI) /* \_SB_.PCI0.PB3_.VGA_.STHI */
                            Store (Zero, PTHR) /* \_SB_.PCI0.PB3_.VGA_.AF02.PTHR */
                        }

                        If (PFPS)
                        {
                            Store (SFPG, FPWR) /* \_SB_.PCI0.PB3_.VGA_.AF02.FPWR */
                            Store (SFPI, FPWR) /* \_SB_.PCI0.PB3_.VGA_.AF02.FPWR */
                            Store (Zero, SFPG) /* \_SB_.PCI0.PB3_.VGA_.SFPG */
                            Store (Zero, SFPI) /* \_SB_.PCI0.PB3_.VGA_.SFPI */
                            Store (Zero, PFPS) /* \_SB_.PCI0.PB3_.VGA_.AF02.PFPS */
                        }

                        If (PSPS)
                        {
                            Store (SSPS, SPWR) /* \_SB_.PCI0.PB3_.VGA_.AF02.SPWR */
                            Store (Zero, PSPS) /* \_SB_.PCI0.PB3_.VGA_.AF02.PSPS */
                        }

                        If (PXPS)
                        {
                            Store (0xA2, P80H) /* \P80H */
                            Store (Zero, PXPS) /* \_SB_.PCI0.PB3_.VGA_.AF02.PXPS */
                        }

                        If (PBRT)
                        {
                            Store (0xF7, P80H) /* \P80H */
                            Store (Zero, PBRT) /* \_SB_.PCI0.PB3_.VGA_.AF02.PBRT */
                        }

                        Return (ATIB) /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                    }

                    Method (AF03, 2, NotSerialized)
                    {
                        Store (0xF3, P80H) /* \P80H */
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateWordField (ATIB, 0x02, SSDP)
                        CreateWordField (ATIB, 0x04, SCDP)
                        Store (Arg0, SSDP) /* \_SB_.PCI0.PB3_.VGA_.AF03.SSDP */
                        Store (Arg1, SCDP) /* \_SB_.PCI0.PB3_.VGA_.AF03.SCDP */
                        Name (NXTD, 0x06)
                        Name (CIDX, 0x06)
                        Store (SSDP, Local1)
                        And (Local1, 0x8B, Local1)
                        Store (SCDP, Local2)
                        If (0x00)
                        {
                            And (Local2, 0xFFFFFFFE, Local2)
                        }
                        Else
                        {
                            Or (Local2, 0x01, Local2)
                        }

                        Store (Local2, P80H) /* \P80H */
                        Store (Zero, Local0)
                        While (LLess (Local0, SizeOf (SACT)))
                        {
                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            If (LEqual (Local3, Local1))
                            {
                                Store (Local0, CIDX) /* \_SB_.PCI0.PB3_.VGA_.AF03.CIDX */
                                Store (SizeOf (SACT), Local0)
                            }
                            Else
                            {
                                Increment (Local0)
                            }
                        }

                        Store (CIDX, Local0)
                        While (LLess (Local0, SizeOf (SACT)))
                        {
                            Increment (Local0)
                            If (LEqual (Local0, SizeOf (SACT)))
                            {
                                Store (0x00, Local0)
                            }

                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            If (LEqual (And (Local3, Local2), Local3))
                            {
                                Store (Local0, NXTD) /* \_SB_.PCI0.PB3_.VGA_.AF03.NXTD */
                                Store (SizeOf (SACT), Local0)
                            }
                        }

                        If (LEqual (NXTD, SizeOf (SACT)))
                        {
                            Store (Zero, SSDP) /* \_SB_.PCI0.PB3_.VGA_.AF03.SSDP */
                        }
                        Else
                        {
                            Store (NXTD, Local0)
                            Store (DerefOf (Index (SACT, Local0)), Local3)
                            And (SSDP, 0xFFFFFF74, SSDP) /* \_SB_.PCI0.PB3_.VGA_.AF03.SSDP */
                            Or (SSDP, Local3, SSDP) /* \_SB_.PCI0.PB3_.VGA_.AF03.SSDP */
                        }

                        Store (0x04, SSZE) /* \_SB_.PCI0.PB3_.VGA_.AF03.SSZE */
                        Store (SSDP, P80H) /* \P80H */
                        Return (ATIB) /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                    }

                    Method (AFN0, 0, Serialized)
                    {
                        If (And (MSKN, 0x01))
                        {
                            CreateBitField (PSBR, 0x00, PDSW)
                            Store (One, PDSW) /* \_SB_.PCI0.PB3_.VGA_.AFN0.PDSW */
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN3, 2, Serialized)
                    {
                        If (And (MSKN, 0x08))
                        {
                            Store (Arg0, Local0)
                            Store (Local0, SFPI) /* \_SB_.PCI0.PB3_.VGA_.SFPI */
                            Store (Arg1, Local0)
                            Store (And (Local0, 0x03, Local0), SFPG) /* \_SB_.PCI0.PB3_.VGA_.SFPG */
                            CreateBitField (PSBR, 0x03, PFPS)
                            Store (One, PFPS) /* \_SB_.PCI0.PB3_.VGA_.AFN3.PFPS */
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN4, 1, Serialized)
                    {
                        If (And (MSKN, 0x10))
                        {
                            Store (Arg0, Local0)
                            Store (SSPS, Local1)
                            Store (Local0, SSPS) /* \_SB_.PCI0.PB3_.VGA_.SSPS */
                            If (LEqual (Local0, Local1)) {}
                            Else
                            {
                                CreateBitField (PSBR, 0x04, PSPS)
                                Store (One, PSPS) /* \_SB_.PCI0.PB3_.VGA_.AFN4.PSPS */
                                Notify (VGA, NCOD)
                            }
                        }
                    }

                    Method (AFN5, 0, Serialized)
                    {
                        If (And (MSKN, 0x20))
                        {
                            CreateBitField (PSBR, 0x05, PDCC)
                            Store (One, PDCC) /* \_SB_.PCI0.PB3_.VGA_.AFN5.PDCC */
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN6, 0, Serialized)
                    {
                        If (And (MSKN, 0x40))
                        {
                            CreateBitField (PSBR, 0x06, PXPS)
                            Store (One, PXPS) /* \_SB_.PCI0.PB3_.VGA_.AFN6.PXPS */
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AFN7, 1, Serialized)
                    {
                        If (And (MSKN, 0x80))
                        {
                            CreateBitField (PSBR, 0x07, PBRT)
                            Store (One, PBRT) /* \_SB_.PCI0.PB3_.VGA_.AFN7.PBRT */
                            CreateByteField (ATIB, 0x0C, BRTL)
                            Store (Arg0, BRTL) /* \_SB_.PCI0.PB3_.VGA_.AFN7.BRTL */
                            Notify (VGA, NCOD)
                        }
                    }

                    Method (AF15, 0, NotSerialized)
                    {
                        Store (0xFF, P80H) /* \P80H */
                        CreateWordField (ATIB, 0x00, DNUM)
                        CreateWordField (ATIB, 0x02, DSZE)
                        Store (0x08, DSZE) /* \_SB_.PCI0.PB3_.VGA_.AF15.DSZE */
                        ^^^LPC0.PHS3 (0x8D, 0x0F, ATIB)
                        Store (^^^LPC0.INFO, ATIB) /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                        Return (ATIB) /* \_SB_.PCI0.PB3_.VGA_.ATIB */
                    }

                    Name (AT00, Buffer (0xFF) {})
                    Name (AT01, Buffer (0x03) {})
                    Method (ATCS, 2, Serialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            ATC0 ()
                        }

                        If (LEqual (Arg0, 0x01))
                        {
                            ATC1 ()
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            ATC2 (Arg1)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            ATC3 ()
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            ATC4 (Arg1)
                        }

                        Return (AT00) /* \_SB_.PCI0.PB3_.VGA_.AT00 */
                    }

                    Method (ATC0, 0, NotSerialized)
                    {
                        CreateWordField (AT00, 0x00, SZZE)
                        CreateWordField (AT00, 0x02, INTF)
                        CreateDWordField (AT00, 0x04, SUPP)
                        Store (0x08, SZZE) /* \_SB_.PCI0.PB3_.VGA_.ATC0.SZZE */
                        Store (0x01, INTF) /* \_SB_.PCI0.PB3_.VGA_.ATC0.INTF */
                        Store (0x0F, SUPP) /* \_SB_.PCI0.PB3_.VGA_.ATC0.SUPP */
                    }

                    Method (ATC1, 0, Serialized)
                    {
                        CreateWordField (AT00, 0x00, SZZE)
                        CreateDWordField (AT00, 0x02, VFMK)
                        CreateDWordField (AT00, 0x06, FLAG)
                        CreateField (AT00, 0x30, 0x01, DOCK)
                        Store (0x0A, SZZE) /* \_SB_.PCI0.PB3_.VGA_.ATC1.SZZE */
                        Store (0x01, VFMK) /* \_SB_.PCI0.PB3_.VGA_.ATC1.VFMK */
                        Store (0x00, FLAG) /* \_SB_.PCI0.PB3_.VGA_.ATC1.FLAG */
                        Store (0x01, DOCK) /* \_SB_.PCI0.PB3_.VGA_.ATC1.DOCK */
                    }

                    Method (ATC2, 1, Serialized)
                    {
                        CreateField (Arg0, 0x10, 0x03, FUCC)
                        CreateField (Arg0, 0x13, 0x06, DEVV)
                        CreateByteField (Arg0, 0x03, BUSS)
                        CreateDWordField (Arg0, 0x04, VFMK)
                        CreateDWordField (Arg0, 0x06, FLAG)
                        CreateField (Arg0, 0x30, 0x01, ADVC)
                        CreateField (Arg0, 0x31, 0x01, WFCM)
                        CreateByteField (Arg0, 0x08, RQST)
                        CreateByteField (Arg0, 0x09, PFRQ)
                        CreateWordField (AT00, 0x00, SZZE)
                        CreateByteField (AT00, 0x02, RETV)
                        Store (0x03, SZZE) /* \_SB_.PCI0.PB3_.VGA_.ATC2.SZZE */
                        Store (0x01, RETV) /* \_SB_.PCI0.PB3_.VGA_.ATC2.RETV */
                        Store (ALIB (0x02, Arg0), AT00) /* \_SB_.PCI0.PB3_.VGA_.AT00 */
                    }

                    Method (ATC3, 0, Serialized)
                    {
                        CreateWordField (AT00, 0x00, SZZE)
                        CreateByteField (AT00, 0x02, RETV)
                        CreateWordField (AT01, 0x00, SZZB)
                        CreateByteField (AT01, 0x02, PSPP)
                        Store (0x03, SZZE) /* \_SB_.PCI0.PB3_.VGA_.ATC3.SZZE */
                        Store (0x01, RETV) /* \_SB_.PCI0.PB3_.VGA_.ATC3.RETV */
                        Store (0x03, SZZB) /* \_SB_.PCI0.PB3_.VGA_.ATC3.SZZB */
                        Store (0x01, PSPP) /* \_SB_.PCI0.PB3_.VGA_.ATC3.PSPP */
                        Store (ALIB (0x03, AT01), AT00) /* \_SB_.PCI0.PB3_.VGA_.AT00 */
                    }

                    Method (ATC4, 1, Serialized)
                    {
                        CreateField (Arg0, 0x10, 0x03, FUCC)
                        CreateField (Arg0, 0x13, 0x06, DEVV)
                        CreateByteField (Arg0, 0x03, BUSS)
                        CreateByteField (Arg0, 0x04, NULN)
                        CreateWordField (AT00, 0x00, SZZE)
                        CreateByteField (AT00, 0x02, NULM)
                        Store (0x03, SZZE) /* \_SB_.PCI0.PB3_.VGA_.ATC4.SZZE */
                        Store (0x01, NULM) /* \_SB_.PCI0.PB3_.VGA_.ATC4.NULM */
                        Store (ALIB (0x04, Arg0), AT00) /* \_SB_.PCI0.PB3_.VGA_.AT00 */
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        If (LNotEqual (^^^VGA.PXMX, 0x80000000))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            If (LEqual (0x18, XPPB ()))
                            {
                                If (LNotEqual (^^^VGA.PXEN, 0x80000000))
                                {
                                    Return (0x00)
                                }
                                Else
                                {
                                    Return (0x01)
                                }
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }
                    }
                }

                Device (HDAU)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x50)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        Offset (0x2C), 
                        SVID,   32, 
                        Offset (0x4C), 
                        SMID,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local2)
                        While (LLess (Local2, 0x0F))
                        {
                            Store (One, PSDC) /* \_SB_.PCI0.PB3_.PSDC */
                            Store (0x01, Local4)
                            Store (0xC8, Local5)
                            While (LAnd (Local4, Local5))
                            {
                                Store (XPRD (0xA5), Local6)
                                And (Local6, 0x7F, Local6)
                                If (LAnd (LGreaterEqual (Local6, 0x10), LNotEqual (Local6, 0x7F)))
                                {
                                    Store (0x00, Local4)
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Decrement (Local5)
                                }
                            }

                            If (LNot (Local4))
                            {
                                Store (XPDL (), Local5)
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Increment (Local2)
                                }
                                Else
                                {
                                    Store (ShiftLeft (XPPB (), 0x03), ^^LPC0.INFO) /* \_SB_.PCI0.LPC0.INFO */
                                    ^^LPC0.PHS1 (0x87)
                                    If (LEqual (XPR2 (), Ones))
                                    {
                                        Store (0x01, Local0)
                                        Store (0x10, Local2)
                                    }
                                    Else
                                    {
                                        Store (0x00, Local0)
                                        Store (0x10, Local2)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x10, Local2)
                            }
                        }

                        If (LNot (Local0))
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        Store (One, PSDC) /* \_SB_.PCI0.PB3_.PSDC */
                        Store (^VGA.DVID, Local7)
                        Sleep (0x0A)
                        Store (0x01, Local4)
                        Store (0x05, Local5)
                        While (LAnd (Local4, Local5))
                        {
                            Store (XPRD (0xA5), Local6)
                            And (Local6, 0x7F, Local6)
                            If (LLessEqual (Local6, 0x04))
                            {
                                Store (0x00, Local4)
                            }
                            Else
                            {
                                Store (^VGA.DVID, Local7)
                                Sleep (0x05)
                                Decrement (Local5)
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (PB4)
            {
                Name (_ADR, 0x00040000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC0.LNKD, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xF8020100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Store (Zero, Local0)
                    If (And (VC0S, 0x00020000))
                    {
                        Store (Ones, Local0)
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    Store (Arg0, XPIR) /* \_SB_.PCI0.PB4_.XPIR */
                    Store (XPID, Local0)
                    Store (0x00, XPIR) /* \_SB_.PCI0.PB4_.XPIR */
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Store (Arg0, XPIR) /* \_SB_.PCI0.PB4_.XPIR */
                    Store (Arg1, XPID) /* \_SB_.PCI0.PB4_.XPID */
                    Store (0x00, XPIR) /* \_SB_.PCI0.PB4_.XPIR */
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Store (0x00, Local1)
                    Store (XPPB (), Local0)
                    If (LGreater (0x04, Local0))
                    {
                        Store (0x00, Local1)
                    }

                    If (LGreater (0x08, Local0))
                    {
                        Store (0x00010000, Local1)
                    }

                    If (LGreater (0x0B, Local0))
                    {
                        Store (0x00020000, Local1)
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Store (XPPB (), Local0)
                    Store (GPPX (), Local2)
                    Store (GFXM (), Local3)
                    Store (0x00, Local1)
                    If (LEqual (0x10, Local0))
                    {
                        Store (0xFFFF, Local1)
                        If (Local3)
                        {
                            Store (0x0F0F, Local1)
                        }
                    }

                    If (LEqual (0x18, Local0))
                    {
                        Store (0xF0F0, Local1)
                    }

                    If (LEqual (0x20, Local0))
                    {
                        Store (0x1010, Local1)
                    }

                    If (LEqual (0x28, Local0))
                    {
                        Store (0x2020, Local1)
                    }

                    If (LEqual (0x30, Local0))
                    {
                        Store (0x4040, Local1)
                    }

                    If (LEqual (0x38, Local0))
                    {
                        Store (0x8080, Local1)
                    }

                    If (LEqual (0x48, Local0))
                    {
                        Store (0x00, Local1)
                        If (LEqual (0x02, Local2))
                        {
                            Store (0x0303, Local1)
                        }

                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0101, Local1)
                        }
                    }

                    If (LEqual (0x50, Local0))
                    {
                        Store (0x00, Local1)
                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0202, Local1)
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Store (XPPD (), Local1)
                    If (LNotEqual (0x00, Local1))
                    {
                        Store (NBXR (Add (0x65, XPCN ())), Local2)
                        If (Arg0)
                        {
                            And (Local2, Not (Local1), Local2)
                        }
                        Else
                        {
                            Or (Local2, Local1, Local2)
                        }

                        NBXW (Add (0x65, XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB4_.LKCN */
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB4_.LKCN */
                    Store (0x64, Local1)
                    Store (0x01, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (0x01)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (0x00, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB4_.LKCN */
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Store (GFXM (), Local0)
                    Store (XPPB (), Local1)
                    Store (0x00, Local2)
                    If (LEqual (0x10, Local1))
                    {
                        Store (0x01, Local2)
                        Store (0x00770070, Local3)
                        If (Local0)
                        {
                            Store (0x00330030, Local3)
                        }
                    }

                    If (LAnd (LEqual (0x18, Local1), Local0))
                    {
                        Store (0x01, Local2)
                        Store (0x00440040, Local3)
                    }

                    Store (NBMR (0x07), Local0)
                    Store (NBXR (0x65), Local1)
                    If (LAnd (Local0, 0x0201F000))
                    {
                        Store (0x00440040, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0xF0F0))
                        {
                            Store (0x00, Local5)
                        }
                    }
                    Else
                    {
                        Store (0x00110010, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0x0F0F))
                        {
                            Store (0x00, Local5)
                        }
                    }

                    If (Local2)
                    {
                        Store (Or (Local3, Local4), Local6)
                        Store (And (Local5, Local4), Local0)
                        Store (Or (Local3, Local0), Local7)
                        Store (NBMR (0x2E), Local0)
                        If (Arg0)
                        {
                            And (Local0, Not (Local6), Local0)
                        }
                        Else
                        {
                            Or (Local0, Local7, Local0)
                        }

                        NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        XPTR (ShiftLeft (XPPB (), 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        XPTR (ShiftLeft (XPPB (), 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0xFF)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0xDC), 
                        DISF,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local2)
                        While (LLess (Local2, 0x0F))
                        {
                            Store (One, PSDC) /* \_SB_.PCI0.PB4_.PSDC */
                            Store (0x01, Local4)
                            Store (0xC8, Local5)
                            While (LAnd (Local4, Local5))
                            {
                                Store (XPRD (0xA5), Local6)
                                And (Local6, 0x7F, Local6)
                                If (LAnd (LGreaterEqual (Local6, 0x10), LNotEqual (Local6, 0x7F)))
                                {
                                    Store (0x00, Local4)
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Decrement (Local5)
                                }
                            }

                            If (LNot (Local4))
                            {
                                Store (XPDL (), Local5)
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Increment (Local2)
                                }
                                Else
                                {
                                    Store (ShiftLeft (XPPB (), 0x03), ^^LPC0.INFO) /* \_SB_.PCI0.LPC0.INFO */
                                    ^^LPC0.PHS1 (0x87)
                                    If (LEqual (XPR2 (), Ones))
                                    {
                                        Store (0x01, Local0)
                                        Store (0x10, Local2)
                                    }
                                    Else
                                    {
                                        Store (0x00, Local0)
                                        Store (0x10, Local2)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x10, Local2)
                            }
                        }

                        If (LNot (Local0))
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        Store (One, PSDC) /* \_SB_.PCI0.PB4_.PSDC */
                        Store (^XPDV.DVID, Local7)
                        Sleep (0x0A)
                        Store (0x01, Local4)
                        Store (0x05, Local5)
                        While (LAnd (Local4, Local5))
                        {
                            Store (XPRD (0xA5), Local6)
                            And (Local6, 0x7F, Local6)
                            If (LLessEqual (Local6, 0x04))
                            {
                                Store (0x00, Local4)
                            }
                            Else
                            {
                                Store (^XPDV.DVID, Local7)
                                Sleep (0x05)
                                Decrement (Local5)
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (PB5)
            {
                Name (_ADR, 0x00050000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x10
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC0.LNKA, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xF8028100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Store (Zero, Local0)
                    If (And (VC0S, 0x00020000))
                    {
                        Store (Ones, Local0)
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    Store (Arg0, XPIR) /* \_SB_.PCI0.PB5_.XPIR */
                    Store (XPID, Local0)
                    Store (0x00, XPIR) /* \_SB_.PCI0.PB5_.XPIR */
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Store (Arg0, XPIR) /* \_SB_.PCI0.PB5_.XPIR */
                    Store (Arg1, XPID) /* \_SB_.PCI0.PB5_.XPID */
                    Store (0x00, XPIR) /* \_SB_.PCI0.PB5_.XPIR */
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Store (0x00, Local1)
                    Store (XPPB (), Local0)
                    If (LGreater (0x04, Local0))
                    {
                        Store (0x00, Local1)
                    }

                    If (LGreater (0x08, Local0))
                    {
                        Store (0x00010000, Local1)
                    }

                    If (LGreater (0x0B, Local0))
                    {
                        Store (0x00020000, Local1)
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Store (XPPB (), Local0)
                    Store (GPPX (), Local2)
                    Store (GFXM (), Local3)
                    Store (0x00, Local1)
                    If (LEqual (0x10, Local0))
                    {
                        Store (0xFFFF, Local1)
                        If (Local3)
                        {
                            Store (0x0F0F, Local1)
                        }
                    }

                    If (LEqual (0x18, Local0))
                    {
                        Store (0xF0F0, Local1)
                    }

                    If (LEqual (0x20, Local0))
                    {
                        Store (0x1010, Local1)
                    }

                    If (LEqual (0x28, Local0))
                    {
                        Store (0x2020, Local1)
                    }

                    If (LEqual (0x30, Local0))
                    {
                        Store (0x4040, Local1)
                    }

                    If (LEqual (0x38, Local0))
                    {
                        Store (0x8080, Local1)
                    }

                    If (LEqual (0x48, Local0))
                    {
                        Store (0x00, Local1)
                        If (LEqual (0x02, Local2))
                        {
                            Store (0x0303, Local1)
                        }

                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0101, Local1)
                        }
                    }

                    If (LEqual (0x50, Local0))
                    {
                        Store (0x00, Local1)
                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0202, Local1)
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Store (XPPD (), Local1)
                    If (LNotEqual (0x00, Local1))
                    {
                        Store (NBXR (Add (0x65, XPCN ())), Local2)
                        If (Arg0)
                        {
                            And (Local2, Not (Local1), Local2)
                        }
                        Else
                        {
                            Or (Local2, Local1, Local2)
                        }

                        NBXW (Add (0x65, XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB5_.LKCN */
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB5_.LKCN */
                    Store (0x64, Local1)
                    Store (0x01, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (0x01)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (0x00, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB5_.LKCN */
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Store (GFXM (), Local0)
                    Store (XPPB (), Local1)
                    Store (0x00, Local2)
                    If (LEqual (0x10, Local1))
                    {
                        Store (0x01, Local2)
                        Store (0x00770070, Local3)
                        If (Local0)
                        {
                            Store (0x00330030, Local3)
                        }
                    }

                    If (LAnd (LEqual (0x18, Local1), Local0))
                    {
                        Store (0x01, Local2)
                        Store (0x00440040, Local3)
                    }

                    Store (NBMR (0x07), Local0)
                    Store (NBXR (0x65), Local1)
                    If (LAnd (Local0, 0x0201F000))
                    {
                        Store (0x00440040, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0xF0F0))
                        {
                            Store (0x00, Local5)
                        }
                    }
                    Else
                    {
                        Store (0x00110010, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0x0F0F))
                        {
                            Store (0x00, Local5)
                        }
                    }

                    If (Local2)
                    {
                        Store (Or (Local3, Local4), Local6)
                        Store (And (Local5, Local4), Local0)
                        Store (Or (Local3, Local0), Local7)
                        Store (NBMR (0x2E), Local0)
                        If (Arg0)
                        {
                            And (Local0, Not (Local6), Local0)
                        }
                        Else
                        {
                            Or (Local0, Local7, Local0)
                        }

                        NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        XPTR (ShiftLeft (XPPB (), 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        XPTR (ShiftLeft (XPPB (), 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0xFF)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0xDC), 
                        DISF,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local2)
                        While (LLess (Local2, 0x0F))
                        {
                            Store (One, PSDC) /* \_SB_.PCI0.PB5_.PSDC */
                            Store (0x01, Local4)
                            Store (0xC8, Local5)
                            While (LAnd (Local4, Local5))
                            {
                                Store (XPRD (0xA5), Local6)
                                And (Local6, 0x7F, Local6)
                                If (LAnd (LGreaterEqual (Local6, 0x10), LNotEqual (Local6, 0x7F)))
                                {
                                    Store (0x00, Local4)
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Decrement (Local5)
                                }
                            }

                            If (LNot (Local4))
                            {
                                Store (XPDL (), Local5)
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Increment (Local2)
                                }
                                Else
                                {
                                    Store (ShiftLeft (XPPB (), 0x03), ^^LPC0.INFO) /* \_SB_.PCI0.LPC0.INFO */
                                    ^^LPC0.PHS1 (0x87)
                                    If (LEqual (XPR2 (), Ones))
                                    {
                                        Store (0x01, Local0)
                                        Store (0x10, Local2)
                                    }
                                    Else
                                    {
                                        Store (0x00, Local0)
                                        Store (0x10, Local2)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x10, Local2)
                            }
                        }

                        If (LNot (Local0))
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        Store (One, PSDC) /* \_SB_.PCI0.PB5_.PSDC */
                        Store (^XPDV.DVID, Local7)
                        Sleep (0x0A)
                        Store (0x01, Local4)
                        Store (0x05, Local5)
                        While (LAnd (Local4, Local5))
                        {
                            Store (XPRD (0xA5), Local6)
                            And (Local6, 0x7F, Local6)
                            If (LLessEqual (Local6, 0x04))
                            {
                                Store (0x00, Local4)
                            }
                            Else
                            {
                                Store (^XPDV.DVID, Local7)
                                Sleep (0x05)
                                Decrement (Local5)
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (PB6)
            {
                Name (_ADR, 0x00060000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC0.LNKB, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xF8030100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Store (Zero, Local0)
                    If (And (VC0S, 0x00020000))
                    {
                        Store (Ones, Local0)
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    Store (Arg0, XPIR) /* \_SB_.PCI0.PB6_.XPIR */
                    Store (XPID, Local0)
                    Store (0x00, XPIR) /* \_SB_.PCI0.PB6_.XPIR */
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Store (Arg0, XPIR) /* \_SB_.PCI0.PB6_.XPIR */
                    Store (Arg1, XPID) /* \_SB_.PCI0.PB6_.XPID */
                    Store (0x00, XPIR) /* \_SB_.PCI0.PB6_.XPIR */
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Store (0x00, Local1)
                    Store (XPPB (), Local0)
                    If (LGreater (0x04, Local0))
                    {
                        Store (0x00, Local1)
                    }

                    If (LGreater (0x08, Local0))
                    {
                        Store (0x00010000, Local1)
                    }

                    If (LGreater (0x0B, Local0))
                    {
                        Store (0x00020000, Local1)
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Store (XPPB (), Local0)
                    Store (GPPX (), Local2)
                    Store (GFXM (), Local3)
                    Store (0x00, Local1)
                    If (LEqual (0x10, Local0))
                    {
                        Store (0xFFFF, Local1)
                        If (Local3)
                        {
                            Store (0x0F0F, Local1)
                        }
                    }

                    If (LEqual (0x18, Local0))
                    {
                        Store (0xF0F0, Local1)
                    }

                    If (LEqual (0x20, Local0))
                    {
                        Store (0x1010, Local1)
                    }

                    If (LEqual (0x28, Local0))
                    {
                        Store (0x2020, Local1)
                    }

                    If (LEqual (0x30, Local0))
                    {
                        Store (0x4040, Local1)
                    }

                    If (LEqual (0x38, Local0))
                    {
                        Store (0x8080, Local1)
                    }

                    If (LEqual (0x48, Local0))
                    {
                        Store (0x00, Local1)
                        If (LEqual (0x02, Local2))
                        {
                            Store (0x0303, Local1)
                        }

                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0101, Local1)
                        }
                    }

                    If (LEqual (0x50, Local0))
                    {
                        Store (0x00, Local1)
                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0202, Local1)
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Store (XPPD (), Local1)
                    If (LNotEqual (0x00, Local1))
                    {
                        Store (NBXR (Add (0x65, XPCN ())), Local2)
                        If (Arg0)
                        {
                            And (Local2, Not (Local1), Local2)
                        }
                        Else
                        {
                            Or (Local2, Local1, Local2)
                        }

                        NBXW (Add (0x65, XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB6_.LKCN */
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB6_.LKCN */
                    Store (0x64, Local1)
                    Store (0x01, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (0x01)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (0x00, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB6_.LKCN */
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Store (GFXM (), Local0)
                    Store (XPPB (), Local1)
                    Store (0x00, Local2)
                    If (LEqual (0x10, Local1))
                    {
                        Store (0x01, Local2)
                        Store (0x00770070, Local3)
                        If (Local0)
                        {
                            Store (0x00330030, Local3)
                        }
                    }

                    If (LAnd (LEqual (0x18, Local1), Local0))
                    {
                        Store (0x01, Local2)
                        Store (0x00440040, Local3)
                    }

                    Store (NBMR (0x07), Local0)
                    Store (NBXR (0x65), Local1)
                    If (LAnd (Local0, 0x0201F000))
                    {
                        Store (0x00440040, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0xF0F0))
                        {
                            Store (0x00, Local5)
                        }
                    }
                    Else
                    {
                        Store (0x00110010, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0x0F0F))
                        {
                            Store (0x00, Local5)
                        }
                    }

                    If (Local2)
                    {
                        Store (Or (Local3, Local4), Local6)
                        Store (And (Local5, Local4), Local0)
                        Store (Or (Local3, Local0), Local7)
                        Store (NBMR (0x2E), Local0)
                        If (Arg0)
                        {
                            And (Local0, Not (Local6), Local0)
                        }
                        Else
                        {
                            Or (Local0, Local7, Local0)
                        }

                        NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        XPTR (ShiftLeft (XPPB (), 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        XPTR (ShiftLeft (XPPB (), 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0xFF)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0xDC), 
                        DISF,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local2)
                        While (LLess (Local2, 0x0F))
                        {
                            Store (One, PSDC) /* \_SB_.PCI0.PB6_.PSDC */
                            Store (0x01, Local4)
                            Store (0xC8, Local5)
                            While (LAnd (Local4, Local5))
                            {
                                Store (XPRD (0xA5), Local6)
                                And (Local6, 0x7F, Local6)
                                If (LAnd (LGreaterEqual (Local6, 0x10), LNotEqual (Local6, 0x7F)))
                                {
                                    Store (0x00, Local4)
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Decrement (Local5)
                                }
                            }

                            If (LNot (Local4))
                            {
                                Store (XPDL (), Local5)
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Increment (Local2)
                                }
                                Else
                                {
                                    Store (ShiftLeft (XPPB (), 0x03), ^^LPC0.INFO) /* \_SB_.PCI0.LPC0.INFO */
                                    ^^LPC0.PHS1 (0x87)
                                    If (LEqual (XPR2 (), Ones))
                                    {
                                        Store (0x01, Local0)
                                        Store (0x10, Local2)
                                    }
                                    Else
                                    {
                                        Store (0x00, Local0)
                                        Store (0x10, Local2)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x10, Local2)
                            }
                        }

                        If (LNot (Local0))
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        Store (One, PSDC) /* \_SB_.PCI0.PB6_.PSDC */
                        Store (^XPDV.DVID, Local7)
                        Sleep (0x0A)
                        Store (0x01, Local4)
                        Store (0x05, Local5)
                        While (LAnd (Local4, Local5))
                        {
                            Store (XPRD (0xA5), Local6)
                            And (Local6, 0x7F, Local6)
                            If (LLessEqual (Local6, 0x04))
                            {
                                Store (0x00, Local4)
                            }
                            Else
                            {
                                Store (^XPDV.DVID, Local7)
                                Sleep (0x05)
                                Decrement (Local5)
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (PB7)
            {
                Name (_ADR, 0x00070000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC0.LNKC, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (XPEX, SystemMemory, 0xF8038100, 0x0100)
                Field (XPEX, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x28), 
                    VC0S,   32
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x24)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PMES,   1
                }

                OperationRegion (XPRI, PCI_Config, 0xE0, 0x08)
                Field (XPRI, ByteAcc, NoLock, Preserve)
                {
                    XPIR,   32, 
                    XPID,   32
                }

                Method (XPDL, 0, NotSerialized)
                {
                    Store (Zero, Local0)
                    If (And (VC0S, 0x00020000))
                    {
                        Store (Ones, Local0)
                    }

                    Return (Local0)
                }

                Method (XPRD, 1, NotSerialized)
                {
                    Store (Arg0, XPIR) /* \_SB_.PCI0.PB7_.XPIR */
                    Store (XPID, Local0)
                    Store (0x00, XPIR) /* \_SB_.PCI0.PB7_.XPIR */
                    Return (Local0)
                }

                Method (XPWR, 2, NotSerialized)
                {
                    Store (Arg0, XPIR) /* \_SB_.PCI0.PB7_.XPIR */
                    Store (Arg1, XPID) /* \_SB_.PCI0.PB7_.XPID */
                    Store (0x00, XPIR) /* \_SB_.PCI0.PB7_.XPIR */
                }

                Method (XPRT, 0, NotSerialized)
                {
                    Store (XPRD (0xA2), Local0)
                    And (Local0, 0xFFFFFFF8, Local0)
                    ShiftRight (Local0, 0x04, Local1)
                    And (Local1, 0x07, Local1)
                    Or (Local0, Local1, Local0)
                    Or (Local0, 0x0100, Local0)
                    XPWR (0xA2, Local0)
                }

                Method (XPPB, 0, NotSerialized)
                {
                    Store (_ADR, Local0)
                    Store (ShiftRight (Local0, 0x10), Local1)
                    Store (ShiftLeft (Local1, 0x03), Local1)
                    Store (And (Local0, 0x0F), Local2)
                    Store (Or (Local1, Local2), Local3)
                    Return (Local3)
                }

                Method (XPCN, 0, NotSerialized)
                {
                    Store (0x00, Local1)
                    Store (XPPB (), Local0)
                    If (LGreater (0x04, Local0))
                    {
                        Store (0x00, Local1)
                    }

                    If (LGreater (0x08, Local0))
                    {
                        Store (0x00010000, Local1)
                    }

                    If (LGreater (0x0B, Local0))
                    {
                        Store (0x00020000, Local1)
                    }

                    Return (Local1)
                }

                Method (XPPD, 0, NotSerialized)
                {
                    Store (XPPB (), Local0)
                    Store (GPPX (), Local2)
                    Store (GFXM (), Local3)
                    Store (0x00, Local1)
                    If (LEqual (0x10, Local0))
                    {
                        Store (0xFFFF, Local1)
                        If (Local3)
                        {
                            Store (0x0F0F, Local1)
                        }
                    }

                    If (LEqual (0x18, Local0))
                    {
                        Store (0xF0F0, Local1)
                    }

                    If (LEqual (0x20, Local0))
                    {
                        Store (0x1010, Local1)
                    }

                    If (LEqual (0x28, Local0))
                    {
                        Store (0x2020, Local1)
                    }

                    If (LEqual (0x30, Local0))
                    {
                        Store (0x4040, Local1)
                    }

                    If (LEqual (0x38, Local0))
                    {
                        Store (0x8080, Local1)
                    }

                    If (LEqual (0x48, Local0))
                    {
                        Store (0x00, Local1)
                        If (LEqual (0x02, Local2))
                        {
                            Store (0x0303, Local1)
                        }

                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0101, Local1)
                        }
                    }

                    If (LEqual (0x50, Local0))
                    {
                        Store (0x00, Local1)
                        If (LEqual (0x03, Local2))
                        {
                            Store (0x0202, Local1)
                        }
                    }

                    Return (Local1)
                }

                Method (XPLP, 1, NotSerialized)
                {
                    Store (XPPD (), Local1)
                    If (LNotEqual (0x00, Local1))
                    {
                        Store (NBXR (Add (0x65, XPCN ())), Local2)
                        If (Arg0)
                        {
                            And (Local2, Not (Local1), Local2)
                        }
                        Else
                        {
                            Or (Local2, Local1, Local2)
                        }

                        NBXW (Add (0x65, XPCN ()), Local2)
                    }
                }

                Method (XPR2, 0, NotSerialized)
                {
                    Store (LKCN, Local0)
                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB7_.LKCN */
                    Or (Local0, 0x20, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB7_.LKCN */
                    Store (0x64, Local1)
                    Store (0x01, Local2)
                    While (LAnd (Local1, Local2))
                    {
                        Sleep (0x01)
                        Store (LKST, Local3)
                        If (And (Local3, 0x0800))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (0x00, Local2)
                        }
                    }

                    And (Local0, 0xFFFFFFDF, Local0)
                    Store (Local0, LKCN) /* \_SB_.PCI0.PB7_.LKCN */
                    If (LNot (Local2))
                    {
                        Return (Ones)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Method (XPLL, 1, NotSerialized)
                {
                    Store (GFXM (), Local0)
                    Store (XPPB (), Local1)
                    Store (0x00, Local2)
                    If (LEqual (0x10, Local1))
                    {
                        Store (0x01, Local2)
                        Store (0x00770070, Local3)
                        If (Local0)
                        {
                            Store (0x00330030, Local3)
                        }
                    }

                    If (LAnd (LEqual (0x18, Local1), Local0))
                    {
                        Store (0x01, Local2)
                        Store (0x00440040, Local3)
                    }

                    Store (NBMR (0x07), Local0)
                    Store (NBXR (0x65), Local1)
                    If (LAnd (Local0, 0x0201F000))
                    {
                        Store (0x00440040, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0xF0F0))
                        {
                            Store (0x00, Local5)
                        }
                    }
                    Else
                    {
                        Store (0x00110010, Local4)
                        Store (Local4, Local5)
                        If (LAnd (Not (Local1), 0x0F0F))
                        {
                            Store (0x00, Local5)
                        }
                    }

                    If (Local2)
                    {
                        Store (Or (Local3, Local4), Local6)
                        Store (And (Local5, Local4), Local0)
                        Store (Or (Local3, Local0), Local7)
                        Store (NBMR (0x2E), Local0)
                        If (Arg0)
                        {
                            And (Local0, Not (Local6), Local0)
                        }
                        Else
                        {
                            Or (Local0, Local7, Local0)
                        }

                        NBMW (0x2E, Local0)
                    }
                }

                Method (XPPR, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        XPLL (0x01)
                        XPLP (0x01)
                        Sleep (0xC8)
                        XPTR (ShiftLeft (XPPB (), 0x03), 0x01)
                        Sleep (0x14)
                    }
                    Else
                    {
                        XPTR (ShiftLeft (XPPB (), 0x03), 0x00)
                        XPLP (0x00)
                        XPLL (0x00)
                    }

                    Return (Ones)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0xFF)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32, 
                        Offset (0xDC), 
                        DISF,   32
                    }
                }

                Method (XPDT, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x00, Local0)
                        Store (0x00, Local2)
                        While (LLess (Local2, 0x0F))
                        {
                            Store (One, PSDC) /* \_SB_.PCI0.PB7_.PSDC */
                            Store (0x01, Local4)
                            Store (0xC8, Local5)
                            While (LAnd (Local4, Local5))
                            {
                                Store (XPRD (0xA5), Local6)
                                And (Local6, 0x7F, Local6)
                                If (LAnd (LGreaterEqual (Local6, 0x10), LNotEqual (Local6, 0x7F)))
                                {
                                    Store (0x00, Local4)
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Decrement (Local5)
                                }
                            }

                            If (LNot (Local4))
                            {
                                Store (XPDL (), Local5)
                                If (Local5)
                                {
                                    XPRT ()
                                    Sleep (0x05)
                                    Increment (Local2)
                                }
                                Else
                                {
                                    Store (ShiftLeft (XPPB (), 0x03), ^^LPC0.INFO) /* \_SB_.PCI0.LPC0.INFO */
                                    ^^LPC0.PHS1 (0x87)
                                    If (LEqual (XPR2 (), Ones))
                                    {
                                        Store (0x01, Local0)
                                        Store (0x10, Local2)
                                    }
                                    Else
                                    {
                                        Store (0x00, Local0)
                                        Store (0x10, Local2)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x10, Local2)
                            }
                        }

                        If (LNot (Local0))
                        {
                            XPDT (0x00)
                            XPPR (0x00)
                            Return (Zero)
                        }

                        Return (Ones)
                    }
                    Else
                    {
                        Store (One, PSDC) /* \_SB_.PCI0.PB7_.PSDC */
                        Store (^XPDV.DVID, Local7)
                        Sleep (0x0A)
                        Store (0x01, Local4)
                        Store (0x05, Local5)
                        While (LAnd (Local4, Local5))
                        {
                            Store (XPRD (0xA5), Local6)
                            And (Local6, 0x7F, Local6)
                            If (LLessEqual (Local6, 0x04))
                            {
                                Store (0x00, Local4)
                            }
                            Else
                            {
                                Store (^XPDV.DVID, Local7)
                                Sleep (0x05)
                                Decrement (Local5)
                            }
                        }

                        Return (Ones)
                    }
                }
            }

            Device (OHC1)
            {
                Name (_ADR, 0x00120000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (EHC1)
            {
                Name (_ADR, 0x00120002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00130000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (EHC2)
            {
                Name (_ADR, 0x00130002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (OHC3)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (EHC3)
            {
                Name (_ADR, 0x00160002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (OHC4)
            {
                Name (_ADR, 0x00140005)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x18, 
                    0x03
                })
            }

            Device (SBAZ)
            {
                Name (_ADR, 0x00140002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x19, 
                    0x03
                })
            }

            Device (GEC)
            {
                Name (_ADR, 0x00140006)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x1A, 
                    0x04
                })
                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        Store (0x01, ^^SMB.E26C) /* \_SB_.PCI0.SMB_.E26C */
                    }
                }
            }

            Scope (\_SB.PCI0)
            {
                OperationRegion (SATC, SystemMemory, 0xF8088000, 0x0100)
                Field (SATC, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x0A), 
                    STCL,   16, 
                    Offset (0xFC), 
                    RMBA,   32
                }

                OperationRegion (RMEM, SystemMemory, RMBA, 0x0200)
                Field (RMEM, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x04), 
                    RMLN,   32
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x00110000)  // _ADR: Address
                Name (B5EN, 0x00)
                Name (BA_5, 0x00)
                Name (SBAR, 0xF014A000)
                OperationRegion (SATX, PCI_Config, 0x00, 0x44)
                Field (SATX, AnyAcc, NoLock, Preserve)
                {
                    VIDI,   32, 
                    Offset (0x24), 
                    BA05,   32, 
                    Offset (0x40), 
                    WREN,   1, 
                    Offset (0x42), 
                    DISP,   6
                }

                Field (SATX, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x42), 
                    DIS0,   1, 
                    DIS1,   1, 
                    DIS2,   1, 
                    DIS3,   1, 
                    DIS4,   1, 
                    DIS5,   1
                }

                Method (GBAA, 0, Serialized)
                {
                    Store (BA05, BA_5) /* \_SB_.PCI0.SATA.BA_5 */
                    If (LOr (LEqual (BA_5, 0xFFFFFFFF), LNotEqual (STCL, 0x0101)))
                    {
                        Store (0x00, B5EN) /* \_SB_.PCI0.SATA.B5EN */
                        Return (SBAR) /* \_SB_.PCI0.SATA.SBAR */
                    }
                    Else
                    {
                        Store (0x01, B5EN) /* \_SB_.PCI0.SATA.B5EN */
                        Return (BA_5) /* \_SB_.PCI0.SATA.BA_5 */
                    }
                }

                OperationRegion (BAR5, SystemMemory, GBAA (), 0x1000)
                Field (BAR5, AnyAcc, NoLock, Preserve)
                {
                    NPOT,   5, 
                    Offset (0x0C), 
                    PI,     6, 
                    Offset (0x120), 
                        ,   7, 
                    BSY0,   1, 
                    Offset (0x128), 
                    DET0,   4, 
                    Offset (0x129), 
                    IPM0,   4, 
                    Offset (0x1A0), 
                        ,   7, 
                    BSY1,   1, 
                    Offset (0x1A8), 
                    DET1,   4, 
                    Offset (0x1A9), 
                    IPM1,   4, 
                    Offset (0x220), 
                        ,   7, 
                    BSY2,   1, 
                    Offset (0x228), 
                    DET2,   4, 
                    Offset (0x229), 
                    IPM2,   4, 
                    Offset (0x2A0), 
                        ,   7, 
                    BSY3,   1, 
                    Offset (0x2A8), 
                    DET3,   4, 
                    Offset (0x2A9), 
                    IPM3,   4, 
                    Offset (0x320), 
                        ,   7, 
                    BSY4,   1, 
                    Offset (0x328), 
                    DET4,   4, 
                    Offset (0x329), 
                    IPM4,   4, 
                    Offset (0x3A0), 
                        ,   7, 
                    BSY5,   1, 
                    Offset (0x3A8), 
                    DET5,   4, 
                    Offset (0x3A9), 
                    IPM5,   4
                }

                Field (BAR5, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x0C), 
                    PI0,    1, 
                    PI1,    1, 
                    PI2,    1, 
                    PI3,    1, 
                    PI4,    1, 
                    PI5,    1
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    GBAA ()
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0008 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0010 */   0x1F, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM) /* \_SB_.PCI0.SATA.PRID.SPTM */
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Store (Arg0, SPTM) /* \_SB_.PCI0.SATA.PRID.SPTM */
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        GBAA ()
                        If (LAnd (LOr (LGreaterEqual (TPOS, 0x40), LEqual (TPOS, 0x04)), 
                            B5EN))
                        {
                            If (IPM0)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY0, 0x01), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }

                            If (IPM2)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY2, 0x01), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (LEqual (DET0, 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Name (S12P, 0x00)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If (LAnd (LAnd (LLess (TPOS, 0x40), LNotEqual (TPOS, 0x04)), 
                                B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY0, 0x01), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (LEqual (DET2, 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Name (S12P, 0x00)
                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If (LAnd (LAnd (LLess (TPOS, 0x40), LNotEqual (TPOS, 0x04)), 
                                B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY2, 0x01), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                    Name (SPTM, Buffer (0x14)
                    {
                        /* 0000 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0008 */   0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00,
                        /* 0010 */   0x1F, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)  // _GTM: Get Timing Mode
                    {
                        Return (SPTM) /* \_SB_.PCI0.SATA.SECD.SPTM */
                    }

                    Method (_STM, 3, NotSerialized)  // _STM: Set Timing Mode
                    {
                        Store (Arg0, SPTM) /* \_SB_.PCI0.SATA.SECD.SPTM */
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        GBAA ()
                        If (LAnd (LOr (LGreaterEqual (TPOS, 0x40), LEqual (TPOS, 0x04)), 
                            B5EN))
                        {
                            If (IPM1)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY1, 0x01), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }

                            If (IPM3)
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY3, 0x01), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (LEqual (DET1, 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If (LAnd (LAnd (LLess (TPOS, 0x40), LNotEqual (TPOS, 0x04)), 
                                B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY1, 0x01), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            GBAA ()
                            If (LEqual (B5EN, 0x00))
                            {
                                Return (0x00)
                            }

                            If (LEqual (DET3, 0x03))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                        {
                            GBAA ()
                            If (LAnd (LAnd (LLess (TPOS, 0x40), LNotEqual (TPOS, 0x04)), 
                                B5EN))
                            {
                                Store (0x32, Local0)
                                While (LAnd (LEqual (BSY3, 0x01), Local0))
                                {
                                    Sleep (0xFA)
                                    Decrement (Local0)
                                }
                            }
                        }

                        Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                        {
                        }

                        Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
                        {
                            Store (Buffer (0x07)
                                {
                                     0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Method (ENP, 2, NotSerialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (Not (Arg1), DIS0) /* \_SB_.PCI0.SATA.DIS0 */
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Not (Arg1), DIS1) /* \_SB_.PCI0.SATA.DIS1 */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Not (Arg1), DIS2) /* \_SB_.PCI0.SATA.DIS2 */
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (Not (Arg1), DIS3) /* \_SB_.PCI0.SATA.DIS3 */
                                }
                                Else
                                {
                                    If (LEqual (Arg0, 0x04))
                                    {
                                        Store (Not (Arg1), DIS4) /* \_SB_.PCI0.SATA.DIS4 */
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg0, 0x05))
                                        {
                                            Store (Not (Arg1), DIS5) /* \_SB_.PCI0.SATA.DIS5 */
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Store (0x01, WREN) /* \_SB_.PCI0.SATA.WREN */
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (Arg1, PI0) /* \_SB_.PCI0.SATA.PI0_ */
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Arg1, PI1) /* \_SB_.PCI0.SATA.PI1_ */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Arg1, PI2) /* \_SB_.PCI0.SATA.PI2_ */
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (Arg1, PI3) /* \_SB_.PCI0.SATA.PI3_ */
                                }
                                Else
                                {
                                    If (LEqual (Arg0, 0x04))
                                    {
                                        Store (Arg1, PI4) /* \_SB_.PCI0.SATA.PI4_ */
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg0, 0x05))
                                        {
                                            Store (Arg1, PI5) /* \_SB_.PCI0.SATA.PI5_ */
                                        }
                                    }
                                }
                            }
                        }
                    }

                    If (LEqual (DISP, 0x3F))
                    {
                        Store (0x01, PI0) /* \_SB_.PCI0.SATA.PI0_ */
                    }
                    Else
                    {
                        If (LAnd (DIS0, XOr (And (DISP, 0x3E), 0x3E)))
                        {
                            Store (0x00, PI0) /* \_SB_.PCI0.SATA.PI0_ */
                        }
                    }

                    Store (PI, Local0)
                    Store (0x00, Local1)
                    While (Local0)
                    {
                        If (And (Local0, 0x01))
                        {
                            Increment (Local1)
                        }

                        ShiftRight (Local0, 0x01, Local0)
                    }

                    Store (Decrement (Local1), NPOT) /* \_SB_.PCI0.SATA.NPOT */
                    Store (0x00, WREN) /* \_SB_.PCI0.SATA.WREN */
                }

                Device (PRT1)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (^^^AFD.ODZP, 0x80000001))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Method (DIS, 0, NotSerialized)
                    {
                        ENP (0x01, 0x00)
                    }

                    Method (ENA, 0, NotSerialized)
                    {
                        ENP (0x01, 0x01)
                    }

                    Device (ODD)
                    {
                        Name (_ADR, 0x00)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (0x01)
                        }
                    }
                }
            }

            Device (SMB)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                OperationRegion (SBRV, PCI_Config, 0x08, 0x0100)
                Field (SBRV, AnyAcc, NoLock, Preserve)
                {
                    RVID,   8, 
                    Offset (0x0C), 
                    HPBS,   32, 
                    Offset (0x3B), 
                        ,   3, 
                    HIHP,   1, 
                    Offset (0x5A), 
                    I1F,    1, 
                    I12F,   1, 
                    Offset (0x5C), 
                        ,   10, 
                    HPET,   1, 
                    Offset (0x7A), 
                        ,   2, 
                    G31O,   1, 
                    Offset (0xD9), 
                        ,   6, 
                    ACIR,   1
                }

                OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                    INPM,   8, 
                    DAPM,   8
                }

                IndexField (INPM, DAPM, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x24), 
                    MMSO,   32, 
                    Offset (0x60), 
                    P1EB,   16
                }

                OperationRegion (ERMM, SystemMemory, MMSO, 0x1000)
                Field (ERMM, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x100), 
                        ,   5, 
                    P01E,   1, 
                    P01O,   1, 
                    P01I,   1, 
                    Offset (0x105), 
                        ,   5, 
                    P06E,   1, 
                    P06O,   1, 
                    P06I,   1, 
                        ,   5, 
                    P07E,   1, 
                    P07O,   1, 
                    P07I,   1, 
                    Offset (0x10A), 
                        ,   5, 
                    P0BE,   1, 
                    P0BO,   1, 
                    P0BI,   1, 
                        ,   5, 
                    P0CE,   1, 
                    P0CO,   1, 
                    P0CI,   1, 
                        ,   5, 
                    P0DE,   1, 
                    P0DO,   1, 
                    P0DI,   1, 
                        ,   5, 
                    P0EE,   1, 
                    P0EO,   1, 
                    P0EI,   1, 
                        ,   5, 
                    P0FE,   1, 
                    P0FO,   1, 
                    P0FI,   1, 
                        ,   5, 
                    P10E,   1, 
                    P10O,   1, 
                    P10I,   1, 
                    Offset (0x113), 
                        ,   5, 
                    P14E,   1, 
                    P14O,   1, 
                    P14I,   1, 
                        ,   5, 
                    P15E,   1, 
                    P15O,   1, 
                    P15I,   1, 
                        ,   5, 
                    P16E,   1, 
                    P16O,   1, 
                    P16I,   1, 
                        ,   5, 
                    P17E,   1, 
                    P17O,   1, 
                    P17I,   1, 
                    Offset (0x11A), 
                        ,   5, 
                    P1BE,   1, 
                    P1BO,   1, 
                    P1BI,   1, 
                        ,   5, 
                    P1CE,   1, 
                    P1CO,   1, 
                    P1CI,   1, 
                    Offset (0x11F), 
                        ,   5, 
                    P20E,   1, 
                    P20O,   1, 
                    P20I,   1, 
                        ,   5, 
                    P21E,   1, 
                    P21O,   1, 
                    P21I,   1, 
                        ,   5, 
                    P22E,   1, 
                    P22O,   1, 
                    P22I,   1, 
                        ,   5, 
                    P23E,   1, 
                    P23O,   1, 
                    P23I,   1, 
                    Offset (0x128), 
                        ,   1, 
                    P29H,   1, 
                    P29S,   1, 
                    P29U,   1, 
                    P29D,   1, 
                    P29E,   1, 
                    P29O,   1, 
                    P29I,   1, 
                    Offset (0x12B), 
                        ,   5, 
                    P2CE,   1, 
                    P2CO,   1, 
                    P2CI,   1, 
                        ,   5, 
                    P2DE,   1, 
                    P2DO,   1, 
                    P2DI,   1, 
                        ,   1, 
                    P2EH,   1, 
                    P2ES,   1, 
                    P2EU,   1, 
                    P2ED,   1, 
                    P2EE,   1, 
                    P2EO,   1, 
                    P2EI,   1, 
                    Offset (0x132), 
                        ,   5, 
                    P33E,   1, 
                    P33O,   1, 
                    P33I,   1, 
                    Offset (0x134), 
                        ,   5, 
                    P35E,   1, 
                    P35O,   1, 
                    P35I,   1, 
                    Offset (0x136), 
                        ,   5, 
                    P37E,   1, 
                    P37O,   1, 
                    P37I,   1, 
                    Offset (0x138), 
                        ,   5, 
                    P39E,   1, 
                    P39O,   1, 
                    P39I,   1, 
                    Offset (0x13A), 
                        ,   5, 
                    P3BE,   1, 
                    P3BO,   1, 
                    P3BI,   1, 
                    Offset (0x13C), 
                    PO3D,   8, 
                        ,   1, 
                    P3EH,   1, 
                    P3ES,   1, 
                    P3EU,   1, 
                    P3ED,   1, 
                    P3EE,   1, 
                    P3EO,   1, 
                    P3EI,   1, 
                        ,   1, 
                    P3FH,   1, 
                    P3FS,   1, 
                    P3FU,   1, 
                    P3FD,   1, 
                    P3FE,   1, 
                    P3FO,   1, 
                    P3FI,   1, 
                        ,   1, 
                    P40H,   1, 
                    P40S,   1, 
                    P40U,   1, 
                    P40D,   1, 
                    P40E,   1, 
                    P40O,   1, 
                    P40I,   1, 
                    Offset (0x141), 
                        ,   5, 
                    P42E,   1, 
                    P42O,   1, 
                    P42I,   1, 
                    Offset (0x164), 
                        ,   7, 
                    GE05,   1, 
                        ,   5, 
                    P66E,   1, 
                    P66O,   1, 
                    P66I,   1, 
                    Offset (0x16A), 
                    GE11,   8, 
                        ,   5, 
                    P6CE,   1, 
                    P6CO,   1, 
                    P6CI,   1, 
                    Offset (0x16E), 
                        ,   7, 
                    GE15,   1, 
                        ,   7, 
                    GE16,   1, 
                    Offset (0x174), 
                    GE21,   8, 
                        ,   7, 
                    GE22,   1, 
                    Offset (0x1A5), 
                    POA6,   8, 
                    Offset (0x1A9), 
                        ,   5, 
                    PAAE,   1, 
                    PAAO,   1, 
                    PAAI,   1, 
                    Offset (0x1AE), 
                        ,   5, 
                    PAFE,   1, 
                    PAFO,   1, 
                    PAFI,   1, 
                        ,   5, 
                    PB0E,   1, 
                    PB0O,   1, 
                    PB0I,   1, 
                        ,   5, 
                    PB1E,   1, 
                    PB1O,   1, 
                    PB1I,   1, 
                        ,   5, 
                    PB2E,   1, 
                    PB2O,   1, 
                    PB2I,   1, 
                        ,   5, 
                    PB3E,   1, 
                    PB3O,   1, 
                    PB3I,   1, 
                        ,   5, 
                    PB4E,   1, 
                    PB4O,   1, 
                    PB4I,   1, 
                        ,   5, 
                    PB5E,   1, 
                    PB5O,   1, 
                    PB5I,   1, 
                        ,   5, 
                    PB6E,   1, 
                    PB6O,   1, 
                    PB6I,   1, 
                    Offset (0x1C4), 
                        ,   5, 
                    PC5E,   1, 
                    PC5O,   1, 
                    PC5I,   1, 
                    Offset (0x1C6), 
                        ,   5, 
                    PC7E,   1, 
                    PC7O,   1, 
                    PC7I,   1, 
                        ,   5, 
                    PC8E,   1, 
                    PC8O,   1, 
                    PC8I,   1, 
                    Offset (0x1FF), 
                        ,   1, 
                    E01S,   1, 
                        ,   3, 
                    E05S,   1, 
                        ,   9, 
                    E15S,   1, 
                    E16S,   1, 
                        ,   5, 
                    E22S,   1, 
                    Offset (0x203), 
                        ,   1, 
                    E01E,   1, 
                        ,   3, 
                    E05E,   1, 
                        ,   9, 
                    E15E,   1, 
                    E16E,   1, 
                        ,   5, 
                    E22E,   1, 
                    Offset (0x207), 
                        ,   1, 
                    E01C,   1, 
                        ,   3, 
                    E05C,   1, 
                        ,   9, 
                    E15C,   1, 
                    E16C,   1, 
                        ,   5, 
                    E22C,   1, 
                        ,   3, 
                    E26C,   1, 
                    Offset (0x20B), 
                        ,   1, 
                    E01L,   1, 
                        ,   3, 
                    E05L,   1, 
                        ,   9, 
                    E15L,   1, 
                    E16L,   1, 
                        ,   5, 
                    E22L,   1, 
                    Offset (0x287), 
                        ,   1, 
                    CLPS,   1, 
                    Offset (0x298), 
                        ,   7, 
                    G15A,   1, 
                    Offset (0x2AB), 
                        ,   6, 
                    SRBT,   2, 
                    Offset (0x2AF), 
                        ,   2, 
                    SLPS,   2, 
                    Offset (0x2B1), 
                        ,   4, 
                    SPBT,   2, 
                    Offset (0x361), 
                        ,   6, 
                    MT3A,   1, 
                    Offset (0x376), 
                    EPNM,   1, 
                    DPPF,   1, 
                    Offset (0x3BA), 
                        ,   6, 
                    PWDE,   1, 
                    Offset (0x3BD), 
                        ,   5, 
                    ALLS,   1, 
                    Offset (0x3C7), 
                        ,   2, 
                    TFTE,   1, 
                    Offset (0x3DE), 
                    BLNK,   2, 
                    Offset (0x3EF), 
                    PHYD,   1, 
                        ,   1, 
                    RSTU,   1, 
                    US5R,   1, 
                    Offset (0x3FF), 
                    F0CT,   8, 
                    F0MS,   8, 
                    F0FQ,   8, 
                    F0LD,   8, 
                    F0MD,   8, 
                    F0MP,   8, 
                    LT0L,   8, 
                    LT0H,   8, 
                    MT0L,   8, 
                    MT0H,   8, 
                    HT0L,   8, 
                    HT0H,   8, 
                    LRG0,   8, 
                    LHC0,   8, 
                    Offset (0x40F), 
                    F1CT,   8, 
                    F1MS,   8, 
                    F1FQ,   8, 
                    F1LD,   8, 
                    F1MD,   8, 
                    F1MP,   8, 
                    LT1L,   8, 
                    LT1H,   8, 
                    MT1L,   8, 
                    MT1H,   8, 
                    HT1L,   8, 
                    HT1H,   8, 
                    LRG1,   8, 
                    LHC1,   8, 
                    Offset (0x41F), 
                    F2CT,   8, 
                    F2MS,   8, 
                    F2FQ,   8, 
                    F2LD,   8, 
                    F2MD,   8, 
                    F2MP,   8, 
                    LT2L,   8, 
                    LT2H,   8, 
                    MT2L,   8, 
                    MT2H,   8, 
                    HT2L,   8, 
                    HT2H,   8, 
                    LRG2,   8, 
                    LHC2,   8, 
                    Offset (0x42F), 
                    F3CT,   8, 
                    F3MS,   8, 
                    F3FQ,   8, 
                    F3LD,   8, 
                    F3MD,   8, 
                    F3MP,   8, 
                    LT3L,   8, 
                    LT3H,   8, 
                    MT3L,   8, 
                    MT3H,   8, 
                    HT3L,   8, 
                    HT3H,   8, 
                    LRG3,   8, 
                    LHC3,   8, 
                    Offset (0x6FF), 
                    SEC,    8, 
                    Offset (0x701), 
                    MIN,    8, 
                    Offset (0xD00), 
                    MX01,   8, 
                    Offset (0xD06), 
                    MX07,   8, 
                    Offset (0xD0D), 
                    MX14,   8, 
                    MX15,   8, 
                    MX16,   8, 
                    Offset (0xD14), 
                    MX21,   8, 
                    MX22,   8, 
                    MX23,   8, 
                    Offset (0xD1A), 
                    MX27,   8, 
                    MX28,   8, 
                    Offset (0xD1F), 
                    MX32,   8, 
                    MX33,   8, 
                    MX34,   8, 
                    Offset (0xD28), 
                    MX41,   8, 
                    Offset (0xD2B), 
                    MX44,   8, 
                    Offset (0xD34), 
                    MX53,   8, 
                    Offset (0xD38), 
                    MX57,   8, 
                    MX58,   8, 
                    MX59,   8, 
                    Offset (0xD41), 
                    MX66,   8, 
                    Offset (0xD65), 
                    M102,   8, 
                    Offset (0xD6B), 
                    M108,   8, 
                    Offset (0xDA9), 
                    M170,   8, 
                    Offset (0xDAE), 
                    M175,   8, 
                    M176,   8, 
                    Offset (0xDB3), 
                    M180,   8, 
                    M181,   8, 
                    M182,   8, 
                    Offset (0xDC4), 
                    M197,   8, 
                    Offset (0xDC6), 
                    M199,   8, 
                    M200,   8, 
                    Offset (0xDFF), 
                    MS00,   8, 
                    MS01,   8, 
                    MS02,   8, 
                    MS03,   8, 
                    MS04,   8, 
                    Offset (0xE3F), 
                    MS40,   8, 
                    Offset (0xE80), 
                        ,   2, 
                    ECES,   1
                }

                OperationRegion (P1E0, SystemIO, P1EB, 0x04)
                Field (P1E0, ByteAcc, NoLock, Preserve)
                {
                        ,   14, 
                    PEWS,   1, 
                    WSTA,   1, 
                        ,   14, 
                    PEWD,   1
                }

                Method (TRMD, 0, NotSerialized)
                {
                    Store (Zero, TFTE) /* \_SB_.PCI0.SMB_.TFTE */
                }

                Method (HTCD, 0, NotSerialized)
                {
                }

                OperationRegion (ABIO, SystemIO, 0x0CD8, 0x08)
                Field (ABIO, DWordAcc, NoLock, Preserve)
                {
                    INAB,   32, 
                    DAAB,   32
                }

                Method (RDAB, 1, NotSerialized)
                {
                    Store (Arg0, INAB) /* \_SB_.PCI0.SMB_.INAB */
                    Return (DAAB) /* \_SB_.PCI0.SMB_.DAAB */
                }

                Method (WTAB, 2, NotSerialized)
                {
                    Store (Arg0, INAB) /* \_SB_.PCI0.SMB_.INAB */
                    Store (Arg1, DAAB) /* \_SB_.PCI0.SMB_.DAAB */
                }

                Method (RWAB, 3, NotSerialized)
                {
                    And (RDAB (Arg0), Arg1, Local0)
                    Or (Local0, Arg2, Local1)
                    WTAB (Arg0, Local1)
                }

                Method (CABR, 3, NotSerialized)
                {
                    ShiftLeft (Arg0, 0x05, Local0)
                    Add (Local0, Arg1, Local1)
                    ShiftLeft (Local1, 0x18, Local2)
                    Add (Local2, Arg2, Local3)
                    Return (Local3)
                }
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)  // _ADR: Address
                OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
                Field (PIRQ, ByteAcc, NoLock, Preserve)
                {
                    PIID,   8, 
                    PIDA,   8
                }

                IndexField (PIID, PIDA, ByteAcc, NoLock, Preserve)
                {
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8, 
                    Offset (0x10), 
                    PIRS,   8, 
                    Offset (0x13), 
                    HDAD,   8, 
                    Offset (0x15), 
                    GEC,    8, 
                    Offset (0x30), 
                    USB1,   8, 
                    USB2,   8, 
                    USB3,   8, 
                    USB4,   8, 
                    USB5,   8, 
                    USB6,   8, 
                    USB7,   8, 
                    Offset (0x40), 
                    IDE,    8, 
                    SATA,   8, 
                    Offset (0x50), 
                    GPP0,   8, 
                    GPP1,   8, 
                    GPP2,   8, 
                    GPP3,   8
                }

                Name (IPRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {10,11}
                })
                Name (UPRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Exclusive, )
                        {3,4,5,7}
                })
                Method (DSPI, 0, NotSerialized)
                {
                    INTA (0x1F)
                    INTB (0x1F)
                    INTC (0x1F)
                    INTD (0x1F)
                    Store (0x1F, PIRE) /* \_SB_.PCI0.LPC0.PIRE */
                    Store (0x1F, PIRF) /* \_SB_.PCI0.LPC0.PIRF */
                    Store (0x1F, PIRG) /* \_SB_.PCI0.LPC0.PIRG */
                    Store (0x1F, PIRH) /* \_SB_.PCI0.LPC0.PIRH */
                }

                Method (INTA, 1, NotSerialized)
                {
                    Store (Arg0, PIRA) /* \_SB_.PCI0.LPC0.PIRA */
                    Store (Arg0, HDAD) /* \_SB_.PCI0.LPC0.HDAD */
                    Store (Arg0, GEC) /* \_SB_.PCI0.LPC0.GEC_ */
                    Store (Arg0, GPP0) /* \_SB_.PCI0.LPC0.GPP0 */
                }

                Method (INTB, 1, NotSerialized)
                {
                    Store (Arg0, PIRB) /* \_SB_.PCI0.LPC0.PIRB */
                    Store (Arg0, USB2) /* \_SB_.PCI0.LPC0.USB2 */
                    Store (Arg0, USB4) /* \_SB_.PCI0.LPC0.USB4 */
                    Store (Arg0, USB6) /* \_SB_.PCI0.LPC0.USB6 */
                    Store (Arg0, GPP1) /* \_SB_.PCI0.LPC0.GPP1 */
                    Store (Arg0, IDE) /* \_SB_.PCI0.LPC0.IDE_ */
                }

                Method (INTC, 1, NotSerialized)
                {
                    Store (Arg0, PIRC) /* \_SB_.PCI0.LPC0.PIRC */
                    Store (Arg0, USB1) /* \_SB_.PCI0.LPC0.USB1 */
                    Store (Arg0, USB3) /* \_SB_.PCI0.LPC0.USB3 */
                    Store (Arg0, USB5) /* \_SB_.PCI0.LPC0.USB5 */
                    Store (Arg0, USB7) /* \_SB_.PCI0.LPC0.USB7 */
                    Store (Arg0, GPP2) /* \_SB_.PCI0.LPC0.GPP2 */
                }

                Method (INTD, 1, NotSerialized)
                {
                    Store (Arg0, PIRD) /* \_SB_.PCI0.LPC0.PIRD */
                    Store (Arg0, SATA) /* \_SB_.PCI0.LPC0.SATA */
                    Store (Arg0, GPP3) /* \_SB_.PCI0.LPC0.GPP3 */
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x01)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRA)
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (0x09)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        INTA (0x1F)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRA, IRQ0) /* \_SB_.PCI0.LPC0.LNKA._CRS.IRQ0 */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        INTA (Local0)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRB)
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (0x09)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        INTB (0x1F)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRB, IRQ0) /* \_SB_.PCI0.LPC0.LNKB._CRS.IRQ0 */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        INTB (Local0)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x03)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRC)
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (0x09)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        INTC (0x1F)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRC, IRQ0) /* \_SB_.PCI0.LPC0.LNKC._CRS.IRQ0 */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        INTC (Local0)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x04)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRD)
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (0x09)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        INTD (0x1F)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRD, IRQ0) /* \_SB_.PCI0.LPC0.LNKD._CRS.IRQ0 */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        INTD (Local0)
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x05)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRE)
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (0x09)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Store (0x1F, PIRE) /* \_SB_.PCI0.LPC0.PIRE */
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRE, IRQ0) /* \_SB_.PCI0.LPC0.LNKE._CRS.IRQ0 */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRE) /* \_SB_.PCI0.LPC0.PIRE */
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x06)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRF)
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (0x09)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Store (0x1F, PIRF) /* \_SB_.PCI0.LPC0.PIRF */
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRF, IRQ0) /* \_SB_.PCI0.LPC0.LNKF._CRS.IRQ0 */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRF) /* \_SB_.PCI0.LPC0.PIRF */
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x07)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRG)
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (0x09)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Store (0x1F, PIRG) /* \_SB_.PCI0.LPC0.PIRG */
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRG, IRQ0) /* \_SB_.PCI0.LPC0.LNKG._CRS.IRQ0 */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRG) /* \_SB_.PCI0.LPC0.PIRG */
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
                    Name (_UID, 0x08)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (PIRH)
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (0x09)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (IPRS) /* \_SB_.PCI0.LPC0.IPRS */
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        Store (0x1F, PIRH) /* \_SB_.PCI0.LPC0.PIRH */
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRH, IRQ0) /* \_SB_.PCI0.LPC0.LNKH._CRS.IRQ0 */
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRH) /* \_SB_.PCI0.LPC0.PIRH */
                    }
                }

                OperationRegion (LPCR, PCI_Config, 0x04, 0x42)
                Field (LPCR, ByteAcc, NoLock, Preserve)
                {
                    PCMD,   2, 
                    Offset (0x40), 
                    CMA0,   1, 
                    CMA1,   1, 
                    CMA2,   1, 
                    CMA3,   1, 
                    CMA4,   1, 
                    CMA5,   1, 
                    CMA6,   1, 
                    CMA7,   1, 
                    CMB0,   1, 
                    CMB1,   1, 
                    CMB2,   1, 
                    CMB3,   1, 
                    CMB4,   1, 
                    CMB5,   1, 
                    CMB6,   1, 
                    CMB7,   1
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x1F,               // Length
                            )
                        IO (Decode16,
                            0x040B,             // Range Minimum
                            0x040B,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {13}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {2}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (TIME)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {0}
                    })
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0022,             // Range Minimum
                            0x0022,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0530,             // Range Minimum
                            0x0530,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0800,             // Range Minimum
                            0x0800,             // Range Maximum
                            0x01,               // Alignment
                            0x28,               // Length
                            )
                        IO (Decode16,
                            0x0830,             // Range Minimum
                            0x0830,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0840,             // Range Minimum
                            0x0840,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0B00,             // Range Minimum
                            0x0B00,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0B20,             // Range Minimum
                            0x0B20,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0CD0,             // Range Minimum
                            0x0CD0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD2,             // Range Minimum
                            0x0CD2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD4,             // Range Minimum
                            0x0CD4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD6,             // Range Minimum
                            0x0CD6,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD8,             // Range Minimum
                            0x0CD8,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0CF9,             // Range Minimum
                            0x0CF9,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0068,             // Range Minimum
                            0x0068,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x1200,             // Range Minimum
                            0x1200,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFF800000,         // Address Base
                            0x00010000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFF810000,         // Address Base
                            0x00000040,         // Address Length
                            )
                        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                            0x0000,             // Granularity
                            0x8100,             // Range Minimum
                            0x81FF,             // Range Maximum
                            0x0000,             // Translation Offset
                            0x0100,             // Length
                            ,, , TypeStatic)
                        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                            0x0000,             // Granularity
                            0x8200,             // Range Minimum
                            0x82FF,             // Range Maximum
                            0x0000,             // Translation Offset
                            0x0100,             // Length
                            ,, , TypeStatic)
                    })
                }

                OperationRegion (LPCS, PCI_Config, 0xA0, 0x04)
                Field (LPCS, DWordAcc, NoLock, Preserve)
                {
                    SPBA,   32
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                    Name (MSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFFE00000,         // Address Base
                            0x00200000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00000000,         // Address Length
                            _Y1C)
                        Memory32Fixed (ReadWrite,
                            0xFEC10000,         // Address Base
                            0x00000020,         // Address Length
                            _Y1D)
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED61000,         // Address Base
                            0x00000400,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFED80000,         // Address Base
                            0x00001000,         // Address Length
                            )
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1C._BAS, BARX)  // _BAS: Base Address
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1C._LEN, GALN)  // _LEN: Length
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1D._BAS, MB01)  // _BAS: Base Address
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y1D._LEN, ML01)  // _LEN: Length
                        Store (SPBA, Local0)
                        And (Local0, 0xFFFFFFE0, MB01) /* \_SB_.PCI0.LPC0.MEM_._CRS.MB01 */
                        Store (NBBA, Local0)
                        If (Local0)
                        {
                            Store (0x1000, GALN) /* \_SB_.PCI0.LPC0.MEM_._CRS.GALN */
                            And (Local0, 0xFFFFFFF0, BARX) /* \_SB_.PCI0.LPC0.MEM_._CRS.BARX */
                        }

                        Return (MSRC) /* \_SB_.PCI0.LPC0.MEM_.MSRC */
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }
                }

                Mutex (PSMX, 0x00)
                OperationRegion (SMI0, SystemIO, 0xB0, 0x01)
                Field (SMI0, AnyAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                OperationRegion (SMI1, SystemMemory, 0xBF236018, 0x00001000)
                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                    BCMD,   16, 
                    DID,    32, 
                    INFO,   1024
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x06), 
                    INF0,   8, 
                    INF1,   8, 
                    INF2,   8, 
                    INF3,   8, 
                    INF4,   8, 
                    INF5,   8, 
                    INF6,   8, 
                    INF7,   8
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x06), 
                    INFD,   32
                }

                Method (PHS1, 1, NotSerialized)
                {
                    Store (Arg0, BCMD) /* \_SB_.PCI0.LPC0.BCMD */
                    Store (0xAB, SMIC) /* \_SB_.PCI0.LPC0.SMIC */
                }

                Method (PHS2, 2, NotSerialized)
                {
                    Acquire (PSMX, 0xFFFF)
                    Store (0x00, DID) /* \_SB_.PCI0.LPC0.DID_ */
                    Store (Arg1, INFO) /* \_SB_.PCI0.LPC0.INFO */
                    Store (Arg0, BCMD) /* \_SB_.PCI0.LPC0.BCMD */
                    Store (0xAB, SMIC) /* \_SB_.PCI0.LPC0.SMIC */
                    Store (INFO, Local0)
                    Release (PSMX)
                    Store (0x00, BCMD) /* \_SB_.PCI0.LPC0.BCMD */
                    Return (Local0)
                }

                Method (PHS3, 3, NotSerialized)
                {
                    Acquire (PSMX, 0xFFFF)
                    Store (Arg0, BCMD) /* \_SB_.PCI0.LPC0.BCMD */
                    Store (Arg1, DID) /* \_SB_.PCI0.LPC0.DID_ */
                    Store (Arg2, INFO) /* \_SB_.PCI0.LPC0.INFO */
                    Store (0xAB, SMIC) /* \_SB_.PCI0.LPC0.SMIC */
                    Release (PSMX)
                }
            }

            Device (P2P)
            {
                Name (_ADR, 0x00140004)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x04, 
                    0x05
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x08)
                        {
                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                0x00, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x01, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x02, 
                                0x00, 
                                0x17
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x03, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                0x00, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x02, 
                                0x00, 
                                0x16
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x03, 
                                0x00, 
                                0x17
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x08)
                        {
                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                ^^LPC0.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x01, 
                                ^^LPC0.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x02, 
                                ^^LPC0.LNKH, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x03, 
                                ^^LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                ^^LPC0.LNKE, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                ^^LPC0.LNKF, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x02, 
                                ^^LPC0.LNKG, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x03, 
                                ^^LPC0.LNKH, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (SPB0)
            {
                Name (_ADR, 0x00150000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC0.LNKD, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x40)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x22), 
                    PMES,   1, 
                    Offset (0x30), 
                    TGLS,   4
                }

                Method (GPPB, 0, NotSerialized)
                {
                    Return (And (_ADR, 0x07))
                }

                Method (GHPS, 2, NotSerialized)
                {
                    Store (GPPB (), Local0)
                    If (LEqual (Arg0, 0x00))
                    {
                        If (LEqual (Local0, 0x00))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFEFFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFEFE, 0x00)
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFDFFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFDFD, 0x00)
                        }

                        If (LEqual (Local0, 0x02))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFBFFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFBFB, 0x00)
                        }

                        If (LEqual (Local0, 0x03))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFF7FFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFF7F7, 0x00)
                        }

                        Stall (0xC8)
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        If (LEqual (Local0, 0x00))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFEFFF, 0x1000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFEFE, 0x0101)
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFDFFF, 0x2000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFDFD, 0x0202)
                        }

                        If (LEqual (Local0, 0x02))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFBFFF, 0x4000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFBFB, 0x0404)
                        }

                        If (LEqual (Local0, 0x03))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFF7FFF, 0x8000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFF7F7, 0x0808)
                        }

                        Stall (0xC8)
                    }

                    If (LEqual (Arg0, 0x00))
                    {
                        GEN2 ()
                        Store (^^SMB.RDAB (^^SMB.CABR (0x03, Local0, 0xA5)), Local1)
                        And (Local1, 0xFF, Local1)
                        Store (0x01F4, Local2)
                        While (LAnd (LNotEqual (Local1, 0x10), LGreater (Local2, 0x00)))
                        {
                            Decrement (Local2)
                            Stall (0xC8)
                            Stall (0xC8)
                            Store (^^SMB.RDAB (^^SMB.CABR (0x03, Local0, 0xA5)), Local1)
                            And (Local1, 0xFF, Local1)
                        }

                        If (LNotEqual (Local1, 0x10))
                        {
                            GEN1 ()
                        }
                    }
                }

                Method (GEN2, 0, NotSerialized)
                {
                    Store (0x02, TGLS) /* \_SB_.PCI0.SPB0.TGLS */
                    Store (GPPB (), Local0)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA4), 0xFFFFFFFE, 0x01)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA2), 0xFFFFDFFF, 0x2000)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xC0), 0xFFFF7FFF, 0x8000)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA4), 0xDFFFFFFF, 0x20000000)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                Method (GEN1, 0, NotSerialized)
                {
                    Store (0x01, TGLS) /* \_SB_.PCI0.SPB0.TGLS */
                    Store (GPPB (), Local0)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA4), 0xFFFFFFFE, 0x00)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA2), 0xFFFFDFFF, 0x2000)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (SPB1)
            {
                Name (_ADR, 0x00150001)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x10
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC0.LNKA, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x40)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x22), 
                    PMES,   1, 
                    Offset (0x30), 
                    TGLS,   4
                }

                Method (GPPB, 0, NotSerialized)
                {
                    Return (And (_ADR, 0x07))
                }

                Method (GHPS, 2, NotSerialized)
                {
                    Store (GPPB (), Local0)
                    If (LEqual (Arg0, 0x00))
                    {
                        If (LEqual (Local0, 0x00))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFEFFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFEFE, 0x00)
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFDFFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFDFD, 0x00)
                        }

                        If (LEqual (Local0, 0x02))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFBFFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFBFB, 0x00)
                        }

                        If (LEqual (Local0, 0x03))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFF7FFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFF7F7, 0x00)
                        }

                        Stall (0xC8)
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        If (LEqual (Local0, 0x00))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFEFFF, 0x1000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFEFE, 0x0101)
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFDFFF, 0x2000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFDFD, 0x0202)
                        }

                        If (LEqual (Local0, 0x02))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFBFFF, 0x4000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFBFB, 0x0404)
                        }

                        If (LEqual (Local0, 0x03))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFF7FFF, 0x8000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFF7F7, 0x0808)
                        }

                        Stall (0xC8)
                    }

                    If (LEqual (Arg0, 0x00))
                    {
                        GEN2 ()
                        Store (^^SMB.RDAB (^^SMB.CABR (0x03, Local0, 0xA5)), Local1)
                        And (Local1, 0xFF, Local1)
                        Store (0x01F4, Local2)
                        While (LAnd (LNotEqual (Local1, 0x10), LGreater (Local2, 0x00)))
                        {
                            Decrement (Local2)
                            Stall (0xC8)
                            Stall (0xC8)
                            Store (^^SMB.RDAB (^^SMB.CABR (0x03, Local0, 0xA5)), Local1)
                            And (Local1, 0xFF, Local1)
                        }

                        If (LNotEqual (Local1, 0x10))
                        {
                            GEN1 ()
                        }
                    }
                }

                Method (GEN2, 0, NotSerialized)
                {
                    Store (0x02, TGLS) /* \_SB_.PCI0.SPB1.TGLS */
                    Store (GPPB (), Local0)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA4), 0xFFFFFFFE, 0x01)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA2), 0xFFFFDFFF, 0x2000)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xC0), 0xFFFF7FFF, 0x8000)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA4), 0xDFFFFFFF, 0x20000000)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                Method (GEN1, 0, NotSerialized)
                {
                    Store (0x01, TGLS) /* \_SB_.PCI0.SPB1.TGLS */
                    Store (GPPB (), Local0)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA4), 0xFFFFFFFE, 0x00)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA2), 0xFFFFDFFF, 0x2000)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (SPB2)
            {
                Name (_ADR, 0x00150002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC0.LNKB, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x40)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x22), 
                    PMES,   1, 
                    Offset (0x30), 
                    TGLS,   4
                }

                Method (GPPB, 0, NotSerialized)
                {
                    Return (And (_ADR, 0x07))
                }

                Method (GHPS, 2, NotSerialized)
                {
                    Store (GPPB (), Local0)
                    If (LEqual (Arg0, 0x00))
                    {
                        If (LEqual (Local0, 0x00))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFEFFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFEFE, 0x00)
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFDFFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFDFD, 0x00)
                        }

                        If (LEqual (Local0, 0x02))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFBFFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFBFB, 0x00)
                        }

                        If (LEqual (Local0, 0x03))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFF7FFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFF7F7, 0x00)
                        }

                        Stall (0xC8)
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        If (LEqual (Local0, 0x00))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFEFFF, 0x1000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFEFE, 0x0101)
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFDFFF, 0x2000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFDFD, 0x0202)
                        }

                        If (LEqual (Local0, 0x02))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFBFFF, 0x4000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFBFB, 0x0404)
                        }

                        If (LEqual (Local0, 0x03))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFF7FFF, 0x8000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFF7F7, 0x0808)
                        }

                        Stall (0xC8)
                    }

                    If (LEqual (Arg0, 0x00))
                    {
                        GEN2 ()
                        Store (^^SMB.RDAB (^^SMB.CABR (0x03, Local0, 0xA5)), Local1)
                        And (Local1, 0xFF, Local1)
                        Store (0x01F4, Local2)
                        While (LAnd (LNotEqual (Local1, 0x10), LGreater (Local2, 0x00)))
                        {
                            Decrement (Local2)
                            Stall (0xC8)
                            Stall (0xC8)
                            Store (^^SMB.RDAB (^^SMB.CABR (0x03, Local0, 0xA5)), Local1)
                            And (Local1, 0xFF, Local1)
                        }

                        If (LNotEqual (Local1, 0x10))
                        {
                            GEN1 ()
                        }
                    }
                }

                Method (GEN2, 0, NotSerialized)
                {
                    Store (0x02, TGLS) /* \_SB_.PCI0.SPB2.TGLS */
                    Store (GPPB (), Local0)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA4), 0xFFFFFFFE, 0x01)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA2), 0xFFFFDFFF, 0x2000)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xC0), 0xFFFF7FFF, 0x8000)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA4), 0xDFFFFFFF, 0x20000000)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                Method (GEN1, 0, NotSerialized)
                {
                    Store (0x01, TGLS) /* \_SB_.PCI0.SPB2.TGLS */
                    Store (GPPB (), Local0)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA4), 0xFFFFFFFE, 0x00)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA2), 0xFFFFDFFF, 0x2000)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (SPB3)
            {
                Name (_ADR, 0x00150003)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x08, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                ^^LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                ^^LPC0.LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                ^^LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                ^^LPC0.LNKC, 
                                0x00
                            }
                        })
                    }
                }

                OperationRegion (PCFG, PCI_Config, 0x00, 0x20)
                Field (PCFG, DWordAcc, NoLock, Preserve)
                {
                    DVID,   32, 
                    PCMS,   32, 
                    Offset (0x18), 
                    SBUS,   32
                }

                OperationRegion (XPCB, PCI_Config, 0x58, 0x40)
                Field (XPCB, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x10), 
                    LKCN,   16, 
                    LKST,   16, 
                    Offset (0x1A), 
                        ,   3, 
                    PSDC,   1, 
                        ,   2, 
                    PSDS,   1, 
                    Offset (0x1B), 
                    HPCS,   1, 
                    Offset (0x22), 
                    PMES,   1, 
                    Offset (0x30), 
                    TGLS,   4
                }

                Method (GPPB, 0, NotSerialized)
                {
                    Return (And (_ADR, 0x07))
                }

                Method (GHPS, 2, NotSerialized)
                {
                    Store (GPPB (), Local0)
                    If (LEqual (Arg0, 0x00))
                    {
                        If (LEqual (Local0, 0x00))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFEFFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFEFE, 0x00)
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFDFFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFDFD, 0x00)
                        }

                        If (LEqual (Local0, 0x02))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFBFFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFBFB, 0x00)
                        }

                        If (LEqual (Local0, 0x03))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFF7FFF, 0x00)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFF7F7, 0x00)
                        }

                        Stall (0xC8)
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        If (LEqual (Local0, 0x00))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFEFFF, 0x1000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFEFE, 0x0101)
                        }

                        If (LEqual (Local0, 0x01))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFDFFF, 0x2000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFDFD, 0x0202)
                        }

                        If (LEqual (Local0, 0x02))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFFBFFF, 0x4000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFFBFB, 0x0404)
                        }

                        If (LEqual (Local0, 0x03))
                        {
                            ^^SMB.RWAB (^^SMB.CABR (0x06, 0x00, 0xC0), 0xFFFF7FFF, 0x8000)
                            ^^SMB.RWAB (^^SMB.CABR (0x01, 0x00, 0x65), 0xFFFFF7F7, 0x0808)
                        }

                        Stall (0xC8)
                    }

                    If (LEqual (Arg0, 0x00))
                    {
                        GEN2 ()
                        Store (^^SMB.RDAB (^^SMB.CABR (0x03, Local0, 0xA5)), Local1)
                        And (Local1, 0xFF, Local1)
                        Store (0x01F4, Local2)
                        While (LAnd (LNotEqual (Local1, 0x10), LGreater (Local2, 0x00)))
                        {
                            Decrement (Local2)
                            Stall (0xC8)
                            Stall (0xC8)
                            Store (^^SMB.RDAB (^^SMB.CABR (0x03, Local0, 0xA5)), Local1)
                            And (Local1, 0xFF, Local1)
                        }

                        If (LNotEqual (Local1, 0x10))
                        {
                            GEN1 ()
                        }
                    }
                }

                Method (GEN2, 0, NotSerialized)
                {
                    Store (0x02, TGLS) /* \_SB_.PCI0.SPB3.TGLS */
                    Store (GPPB (), Local0)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA4), 0xFFFFFFFE, 0x01)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA2), 0xFFFFDFFF, 0x2000)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xC0), 0xFFFF7FFF, 0x8000)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA4), 0xDFFFFFFF, 0x20000000)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                Method (GEN1, 0, NotSerialized)
                {
                    Store (0x01, TGLS) /* \_SB_.PCI0.SPB3.TGLS */
                    Store (GPPB (), Local0)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA4), 0xFFFFFFFE, 0x00)
                    ^^SMB.RWAB (^^SMB.CABR (0x03, Local0, 0xA2), 0xFFFFDFFF, 0x2000)
                    Stall (0xC8)
                    Stall (0xC8)
                }

                Device (XPDV)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    OperationRegion (PCFG, PCI_Config, 0x00, 0x08)
                    Field (PCFG, DWordAcc, NoLock, Preserve)
                    {
                        DVID,   32, 
                        PCMS,   32
                    }
                }
            }

            Device (VGA)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Name (PXEN, 0x80000000)
                Name (PXID, 0x00020000)
                Name (PXMX, 0x80000000)
                Name (LCDT, 0x80000000)
                Name (DSCT, 0x80000000)
                Name (PXFX, 0x80000000)
                Name (PXDY, 0x80000001)
                Name (AF7E, 0x80000000)
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Name (ATIB, Buffer (0x0100) {})
                Method (ATIF, 2, Serialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Return (AF00 ())
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        Return (AF01 ())
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Return (AF02 ())
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Return (AF03 (DerefOf (Index (Arg1, 0x02)), DerefOf (Index (Arg1, 
                            0x04))))
                    }

                    If (LEqual (Arg0, 0x0F))
                    {
                        Return (AF15 ())
                    }
                    Else
                    {
                        CreateWordField (ATIB, 0x00, SSZE)
                        CreateWordField (ATIB, 0x02, VERN)
                        CreateDWordField (ATIB, 0x04, NMSK)
                        CreateDWordField (ATIB, 0x08, SFUN)
                        Store (0x00, SSZE) /* \_SB_.PCI0.VGA_.ATIF.SSZE */
                        Store (0x00, VERN) /* \_SB_.PCI0.VGA_.ATIF.VERN */
                        Store (0x00, NMSK) /* \_SB_.PCI0.VGA_.ATIF.NMSK */
                        Store (0x00, SFUN) /* \_SB_.PCI0.VGA_.ATIF.SFUN */
                        Return (ATIB) /* \_SB_.PCI0.VGA_.ATIB */
                    }
                }

                Method (AF00, 0, NotSerialized)
                {
                    Store (0xF0, P80H) /* \P80H */
                    CreateWordField (ATIB, 0x00, SSZE)
                    CreateWordField (ATIB, 0x02, VERN)
                    CreateDWordField (ATIB, 0x04, NMSK)
                    CreateDWordField (ATIB, 0x08, SFUN)
                    Store (0x0C, SSZE) /* \_SB_.PCI0.VGA_.AF00.SSZE */
                    Store (0x01, VERN) /* \_SB_.PCI0.VGA_.AF00.VERN */
                    If (LEqual (PXEN, 0x80000000))
                    {
                        Store (0x01, NMSK) /* \_SB_.PCI0.VGA_.AF00.NMSK */
                    }
                    Else
                    {
                        Store (0x41, NMSK) /* \_SB_.PCI0.VGA_.AF00.NMSK */
                    }

                    If (LEqual (AF7E, 0x80000001))
                    {
                        Or (NMSK, 0x80, NMSK) /* \_SB_.PCI0.VGA_.AF00.NMSK */
                    }

                    Store (NMSK, MSKN) /* \_SB_.PCI0.VGA_.MSKN */
                    Store (0x4007, SFUN) /* \_SB_.PCI0.VGA_.AF00.SFUN */
                    Return (ATIB) /* \_SB_.PCI0.VGA_.ATIB */
                }

                Name (NCOD, 0x81)
                Method (AF01, 0, NotSerialized)
                {
                    Store (0xF1, P80H) /* \P80H */
                    CreateWordField (ATIB, 0x00, SSZE)
                    CreateDWordField (ATIB, 0x02, VMSK)
                    CreateDWordField (ATIB, 0x06, FLGS)
                    Store (0x0B, VMSK) /* \_SB_.PCI0.VGA_.AF01.VMSK */
                    Store (0x0A, SSZE) /* \_SB_.PCI0.VGA_.AF01.SSZE */
                    Store (0x03, VMSK) /* \_SB_.PCI0.VGA_.AF01.VMSK */
                    Store (0x01, FLGS) /* \_SB_.PCI0.VGA_.AF01.FLGS */
                    Store (0x81, NCOD) /* \_SB_.PCI0.VGA_.NCOD */
                    Return (ATIB) /* \_SB_.PCI0.VGA_.ATIB */
                }

                Name (PSBR, Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00
                })
                Name (MSKN, 0x00)
                Name (SEXM, 0x00)
                Name (STHG, 0x00)
                Name (STHI, 0x00)
                Name (SFPG, 0x00)
                Name (SFPI, 0x00)
                Name (SSPS, 0x00)
                Name (SSDM, 0x0A)
                Name (SCDY, 0x00)
                Name (SACT, Buffer (0x07)
                {
                     0x01, 0x02, 0x08, 0x80, 0x03, 0x09, 0x81
                })
                Method (AF02, 0, NotSerialized)
                {
                    Store (0xF2, P80H) /* \P80H */
                    CreateBitField (PSBR, 0x00, PDSW)
                    CreateBitField (PSBR, 0x01, PEXM)
                    CreateBitField (PSBR, 0x02, PTHR)
                    CreateBitField (PSBR, 0x03, PFPS)
                    CreateBitField (PSBR, 0x04, PSPS)
                    CreateBitField (PSBR, 0x05, PDCC)
                    CreateBitField (PSBR, 0x06, PXPS)
                    CreateBitField (PSBR, 0x07, PBRT)
                    CreateWordField (ATIB, 0x00, SSZE)
                    CreateDWordField (ATIB, 0x02, PSBI)
                    CreateByteField (ATIB, 0x06, EXPM)
                    CreateByteField (ATIB, 0x07, THRM)
                    CreateByteField (ATIB, 0x08, THID)
                    CreateByteField (ATIB, 0x09, FPWR)
                    CreateByteField (ATIB, 0x0A, FPID)
                    CreateByteField (ATIB, 0x0B, SPWR)
                    CreateByteField (ATIB, 0x0C, BRTL)
                    Store (0x0D, SSZE) /* \_SB_.PCI0.VGA_.AF02.SSZE */
                    Store (PSBR, PSBI) /* \_SB_.PCI0.VGA_.AF02.PSBI */
                    If (PDSW)
                    {
                        Store (0x82, P80H) /* \P80H */
                        Store (Zero, PDSW) /* \_SB_.PCI0.VGA_.AF02.PDSW */
                    }

                    If (PEXM)
                    {
                        Store (SEXM, EXPM) /* \_SB_.PCI0.VGA_.AF02.EXPM */
                        Store (Zero, SEXM) /* \_SB_.PCI0.VGA_.SEXM */
                        Store (Zero, PEXM) /* \_SB_.PCI0.VGA_.AF02.PEXM */
                    }

                    If (PTHR)
                    {
                        Store (STHG, THRM) /* \_SB_.PCI0.VGA_.AF02.THRM */
                        Store (STHI, THID) /* \_SB_.PCI0.VGA_.AF02.THID */
                        Store (Zero, STHG) /* \_SB_.PCI0.VGA_.STHG */
                        Store (Zero, STHI) /* \_SB_.PCI0.VGA_.STHI */
                        Store (Zero, PTHR) /* \_SB_.PCI0.VGA_.AF02.PTHR */
                    }

                    If (PFPS)
                    {
                        Store (SFPG, FPWR) /* \_SB_.PCI0.VGA_.AF02.FPWR */
                        Store (SFPI, FPWR) /* \_SB_.PCI0.VGA_.AF02.FPWR */
                        Store (Zero, SFPG) /* \_SB_.PCI0.VGA_.SFPG */
                        Store (Zero, SFPI) /* \_SB_.PCI0.VGA_.SFPI */
                        Store (Zero, PFPS) /* \_SB_.PCI0.VGA_.AF02.PFPS */
                    }

                    If (PSPS)
                    {
                        Store (SSPS, SPWR) /* \_SB_.PCI0.VGA_.AF02.SPWR */
                        Store (Zero, PSPS) /* \_SB_.PCI0.VGA_.AF02.PSPS */
                    }

                    If (PXPS)
                    {
                        Store (0xA2, P80H) /* \P80H */
                        Store (Zero, PXPS) /* \_SB_.PCI0.VGA_.AF02.PXPS */
                    }

                    If (PBRT)
                    {
                        Store (0xF7, P80H) /* \P80H */
                        Store (Zero, PBRT) /* \_SB_.PCI0.VGA_.AF02.PBRT */
                    }

                    Return (ATIB) /* \_SB_.PCI0.VGA_.ATIB */
                }

                Method (AF03, 2, NotSerialized)
                {
                    Store (0xF3, P80H) /* \P80H */
                    CreateWordField (ATIB, 0x00, SSZE)
                    CreateWordField (ATIB, 0x02, SSDP)
                    CreateWordField (ATIB, 0x04, SCDP)
                    Store (Arg0, SSDP) /* \_SB_.PCI0.VGA_.AF03.SSDP */
                    Store (Arg1, SCDP) /* \_SB_.PCI0.VGA_.AF03.SCDP */
                    Name (NXTD, 0x06)
                    Name (CIDX, 0x06)
                    Store (SSDP, Local1)
                    And (Local1, 0x8B, Local1)
                    Store (SCDP, Local2)
                    If (0x00)
                    {
                        And (Local2, 0xFFFFFFFE, Local2)
                    }
                    Else
                    {
                        Or (Local2, 0x01, Local2)
                    }

                    Store (Local2, P80H) /* \P80H */
                    Store (Zero, Local0)
                    While (LLess (Local0, SizeOf (SACT)))
                    {
                        Store (DerefOf (Index (SACT, Local0)), Local3)
                        If (LEqual (Local3, Local1))
                        {
                            Store (Local0, CIDX) /* \_SB_.PCI0.VGA_.AF03.CIDX */
                            Store (SizeOf (SACT), Local0)
                        }
                        Else
                        {
                            Increment (Local0)
                        }
                    }

                    Store (CIDX, Local0)
                    While (LLess (Local0, SizeOf (SACT)))
                    {
                        Increment (Local0)
                        If (LEqual (Local0, SizeOf (SACT)))
                        {
                            Store (0x00, Local0)
                        }

                        Store (DerefOf (Index (SACT, Local0)), Local3)
                        If (LEqual (And (Local3, Local2), Local3))
                        {
                            Store (Local0, NXTD) /* \_SB_.PCI0.VGA_.AF03.NXTD */
                            Store (SizeOf (SACT), Local0)
                        }
                    }

                    If (LEqual (NXTD, SizeOf (SACT)))
                    {
                        Store (Zero, SSDP) /* \_SB_.PCI0.VGA_.AF03.SSDP */
                    }
                    Else
                    {
                        Store (NXTD, Local0)
                        Store (DerefOf (Index (SACT, Local0)), Local3)
                        And (SSDP, 0xFFFFFF74, SSDP) /* \_SB_.PCI0.VGA_.AF03.SSDP */
                        Or (SSDP, Local3, SSDP) /* \_SB_.PCI0.VGA_.AF03.SSDP */
                    }

                    Store (0x04, SSZE) /* \_SB_.PCI0.VGA_.AF03.SSZE */
                    Store (SSDP, P80H) /* \P80H */
                    Return (ATIB) /* \_SB_.PCI0.VGA_.ATIB */
                }

                Method (AFN0, 0, Serialized)
                {
                    If (And (MSKN, 0x01))
                    {
                        CreateBitField (PSBR, 0x00, PDSW)
                        Store (One, PDSW) /* \_SB_.PCI0.VGA_.AFN0.PDSW */
                        Notify (VGA, NCOD)
                    }
                }

                Method (AFN3, 2, Serialized)
                {
                    If (And (MSKN, 0x08))
                    {
                        Store (Arg0, Local0)
                        Store (Local0, SFPI) /* \_SB_.PCI0.VGA_.SFPI */
                        Store (Arg1, Local0)
                        Store (And (Local0, 0x03, Local0), SFPG) /* \_SB_.PCI0.VGA_.SFPG */
                        CreateBitField (PSBR, 0x03, PFPS)
                        Store (One, PFPS) /* \_SB_.PCI0.VGA_.AFN3.PFPS */
                        Notify (VGA, NCOD)
                    }
                }

                Method (AFN4, 1, Serialized)
                {
                    If (And (MSKN, 0x10))
                    {
                        Store (Arg0, Local0)
                        Store (SSPS, Local1)
                        Store (Local0, SSPS) /* \_SB_.PCI0.VGA_.SSPS */
                        If (LEqual (Local0, Local1)) {}
                        Else
                        {
                            CreateBitField (PSBR, 0x04, PSPS)
                            Store (One, PSPS) /* \_SB_.PCI0.VGA_.AFN4.PSPS */
                            Notify (VGA, NCOD)
                        }
                    }
                }

                Method (AFN5, 0, Serialized)
                {
                    If (And (MSKN, 0x20))
                    {
                        CreateBitField (PSBR, 0x05, PDCC)
                        Store (One, PDCC) /* \_SB_.PCI0.VGA_.AFN5.PDCC */
                        Notify (VGA, NCOD)
                    }
                }

                Method (AFN6, 0, Serialized)
                {
                    If (And (MSKN, 0x40))
                    {
                        CreateBitField (PSBR, 0x06, PXPS)
                        Store (One, PXPS) /* \_SB_.PCI0.VGA_.AFN6.PXPS */
                        Notify (VGA, NCOD)
                    }
                }

                Method (AFN7, 1, Serialized)
                {
                    If (And (MSKN, 0x80))
                    {
                        CreateBitField (PSBR, 0x07, PBRT)
                        Store (One, PBRT) /* \_SB_.PCI0.VGA_.AFN7.PBRT */
                        CreateByteField (ATIB, 0x0C, BRTL)
                        Store (Arg0, BRTL) /* \_SB_.PCI0.VGA_.AFN7.BRTL */
                        Notify (VGA, NCOD)
                    }
                }

                Method (AF15, 0, NotSerialized)
                {
                    Store (0xFF, P80H) /* \P80H */
                    CreateWordField (ATIB, 0x00, DNUM)
                    CreateWordField (ATIB, 0x02, DSZE)
                    Store (0x08, DSZE) /* \_SB_.PCI0.VGA_.AF15.DSZE */
                    ^^LPC0.PHS3 (0x8D, 0x0F, ATIB)
                    Store (^^LPC0.INFO, ATIB) /* \_SB_.PCI0.VGA_.ATIB */
                    Return (ATIB) /* \_SB_.PCI0.VGA_.ATIB */
                }

                Name (AT00, Buffer (0xFF) {})
                Name (AT01, Buffer (0x03) {})
                Method (ATCS, 2, Serialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        ATC0 ()
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        ATC1 ()
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        ATC2 (Arg1)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        ATC3 ()
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        ATC4 (Arg1)
                    }

                    Return (AT00) /* \_SB_.PCI0.VGA_.AT00 */
                }

                Method (ATC0, 0, NotSerialized)
                {
                    CreateWordField (AT00, 0x00, SZZE)
                    CreateWordField (AT00, 0x02, INTF)
                    CreateDWordField (AT00, 0x04, SUPP)
                    Store (0x08, SZZE) /* \_SB_.PCI0.VGA_.ATC0.SZZE */
                    Store (0x01, INTF) /* \_SB_.PCI0.VGA_.ATC0.INTF */
                    Store (0x0F, SUPP) /* \_SB_.PCI0.VGA_.ATC0.SUPP */
                }

                Method (ATC1, 0, Serialized)
                {
                    CreateWordField (AT00, 0x00, SZZE)
                    CreateDWordField (AT00, 0x02, VFMK)
                    CreateDWordField (AT00, 0x06, FLAG)
                    CreateField (AT00, 0x30, 0x01, DOCK)
                    Store (0x0A, SZZE) /* \_SB_.PCI0.VGA_.ATC1.SZZE */
                    Store (0x01, VFMK) /* \_SB_.PCI0.VGA_.ATC1.VFMK */
                    Store (0x00, FLAG) /* \_SB_.PCI0.VGA_.ATC1.FLAG */
                    Store (0x01, DOCK) /* \_SB_.PCI0.VGA_.ATC1.DOCK */
                }

                Method (ATC2, 1, Serialized)
                {
                    CreateField (Arg0, 0x10, 0x03, FUCC)
                    CreateField (Arg0, 0x13, 0x06, DEVV)
                    CreateByteField (Arg0, 0x03, BUSS)
                    CreateDWordField (Arg0, 0x04, VFMK)
                    CreateDWordField (Arg0, 0x06, FLAG)
                    CreateField (Arg0, 0x30, 0x01, ADVC)
                    CreateField (Arg0, 0x31, 0x01, WFCM)
                    CreateByteField (Arg0, 0x08, RQST)
                    CreateByteField (Arg0, 0x09, PFRQ)
                    CreateWordField (AT00, 0x00, SZZE)
                    CreateByteField (AT00, 0x02, RETV)
                    Store (0x03, SZZE) /* \_SB_.PCI0.VGA_.ATC2.SZZE */
                    Store (0x01, RETV) /* \_SB_.PCI0.VGA_.ATC2.RETV */
                    Store (ALIB (0x02, Arg0), AT00) /* \_SB_.PCI0.VGA_.AT00 */
                }

                Method (ATC3, 0, Serialized)
                {
                    CreateWordField (AT00, 0x00, SZZE)
                    CreateByteField (AT00, 0x02, RETV)
                    CreateWordField (AT01, 0x00, SZZB)
                    CreateByteField (AT01, 0x02, PSPP)
                    Store (0x03, SZZE) /* \_SB_.PCI0.VGA_.ATC3.SZZE */
                    Store (0x01, RETV) /* \_SB_.PCI0.VGA_.ATC3.RETV */
                    Store (0x03, SZZB) /* \_SB_.PCI0.VGA_.ATC3.SZZB */
                    Store (0x01, PSPP) /* \_SB_.PCI0.VGA_.ATC3.PSPP */
                    Store (ALIB (0x03, AT01), AT00) /* \_SB_.PCI0.VGA_.AT00 */
                }

                Method (ATC4, 1, Serialized)
                {
                    CreateField (Arg0, 0x10, 0x03, FUCC)
                    CreateField (Arg0, 0x13, 0x06, DEVV)
                    CreateByteField (Arg0, 0x03, BUSS)
                    CreateByteField (Arg0, 0x04, NULN)
                    CreateWordField (AT00, 0x00, SZZE)
                    CreateByteField (AT00, 0x02, NULM)
                    Store (0x03, SZZE) /* \_SB_.PCI0.VGA_.ATC4.SZZE */
                    Store (0x01, NULM) /* \_SB_.PCI0.VGA_.ATC4.NULM */
                    Store (ALIB (0x04, Arg0), AT00) /* \_SB_.PCI0.VGA_.AT00 */
                }
            }

            Scope (VGA)
            {
                Name (ATPB, Buffer (0x0100) {})
                Name (DSID, 0xFFFFFFFF)
                Name (GPFA, 0xFFFFFFFF)
                Name (HSID, 0xFFFFFFFF)
                Name (CNT0, Buffer (0x05)
                {
                     0x05, 0x00, 0x00, 0x10, 0x01
                })
                Name (CNT1, Buffer (0x05)
                {
                     0x05, 0x01, 0x00, 0x00, 0x01
                })
                Name (CNT2, Buffer (0x05)
                {
                     0x07, 0x03, 0x00, 0x10, 0x02
                })
                Name (CNT3, Buffer (0x05)
                {
                     0x07, 0x07, 0x00, 0x20, 0x02
                })
                Name (CNT4, Buffer (0x05)
                {
                     0x00, 0x09, 0x00, 0x30, 0x02
                })
                Name (CNT5, Buffer (0x05)
                {
                     0x01, 0x00, 0x01, 0x10, 0x01
                })
                Name (CNT6, Buffer (0x05)
                {
                     0x01, 0x01, 0x01, 0x00, 0x01
                })
                Name (CNT7, Buffer (0x05)
                {
                     0x03, 0x03, 0x01, 0x10, 0x02
                })
                Name (CNT8, Buffer (0x05)
                {
                     0x03, 0x07, 0x01, 0x20, 0x02
                })
                Name (CNT9, Buffer (0x05)
                {
                     0x00, 0x09, 0x01, 0x30, 0x02
                })
                Method (ATPX, 2, Serialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Return (PX00 ())
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        Return (PX01 ())
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        PX02 (DerefOf (Index (Arg1, 0x02)))
                        Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        PX03 (DerefOf (Index (Arg1, 0x02)))
                        Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        PX04 (DerefOf (Index (Arg1, 0x02)))
                        Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        Return (PX08 ())
                    }

                    If (LEqual (Arg0, 0x09))
                    {
                        Return (PX09 ())
                    }

                    CreateWordField (ATPB, 0x00, SSZE)
                    CreateWordField (ATPB, 0x02, VERN)
                    CreateDWordField (ATPB, 0x04, SFUN)
                    Store (0x00, SSZE) /* \_SB_.PCI0.VGA_.ATPX.SSZE */
                    Store (0x00, VERN) /* \_SB_.PCI0.VGA_.ATPX.VERN */
                    Store (0x00, SFUN) /* \_SB_.PCI0.VGA_.ATPX.SFUN */
                    Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
                }

                Method (PX00, 0, NotSerialized)
                {
                    Store (0xE0, P80H) /* \P80H */
                    CreateWordField (ATPB, 0x00, SSZE)
                    CreateWordField (ATPB, 0x02, VERN)
                    CreateDWordField (ATPB, 0x04, SFUN)
                    Store (0x08, SSZE) /* \_SB_.PCI0.VGA_.PX00.SSZE */
                    Store (0x01, VERN) /* \_SB_.PCI0.VGA_.PX00.VERN */
                    If (LEqual (PXEN, 0x80000000))
                    {
                        Store (0x00, SFUN) /* \_SB_.PCI0.VGA_.PX00.SFUN */
                        Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
                    }

                    If (LEqual (PXMX, 0x80000000))
                    {
                        Store (0x018F, SFUN) /* \_SB_.PCI0.VGA_.PX00.SFUN */
                    }
                    Else
                    {
                        Store (0x0183, SFUN) /* \_SB_.PCI0.VGA_.PX00.SFUN */
                    }

                    If (LEqual (PXDY, 0x80000001))
                    {
                        And (SFUN, 0xFFFFFFFD, SFUN) /* \_SB_.PCI0.VGA_.PX00.SFUN */
                    }

                    If (LAnd (LEqual (PXDY, 0x80000001), LEqual (PXFX, 0x80000001)))
                    {
                        Or (SFUN, 0x02, SFUN) /* \_SB_.PCI0.VGA_.PX00.SFUN */
                    }

                    Store (^^PB3.VGA.SVID, Local0)
                    Store (^^PB3.HDAU.SVID, Local1)
                    If (LNotEqual (Local0, 0xFFFFFFFF))
                    {
                        Store (Local0, DSID) /* \_SB_.PCI0.VGA_.DSID */
                    }

                    If (LNotEqual (Local1, 0xFFFFFFFF))
                    {
                        Store (Local1, HSID) /* \_SB_.PCI0.VGA_.HSID */
                    }

                    Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
                }

                Method (PX01, 0, NotSerialized)
                {
                    Store (0xE1, P80H) /* \P80H */
                    CreateWordField (ATPB, 0x00, SSZE)
                    CreateDWordField (ATPB, 0x02, VMSK)
                    CreateDWordField (ATPB, 0x06, FLGS)
                    Store (0x0A, SSZE) /* \_SB_.PCI0.VGA_.PX01.SSZE */
                    Store (0xFF, VMSK) /* \_SB_.PCI0.VGA_.PX01.VMSK */
                    If (LEqual (PXMX, 0x80000000))
                    {
                        Store (0x4B, FLGS) /* \_SB_.PCI0.VGA_.PX01.FLGS */
                    }
                    Else
                    {
                        Store (0x00, FLGS) /* \_SB_.PCI0.VGA_.PX01.FLGS */
                        If (LEqual (PXDY, 0x80000001))
                        {
                            Or (FLGS, 0x80, FLGS) /* \_SB_.PCI0.VGA_.PX01.FLGS */
                        }
                    }

                    Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
                }

                Method (PX02, 1, NotSerialized)
                {
                    CreateWordField (ATPB, 0x00, SSZE)
                    CreateByteField (ATPB, 0x02, PWST)
                    Store (0x03, SSZE) /* \_SB_.PCI0.VGA_.PX02.SSZE */
                    Store (Buffer (0x05) {}, Local7)
                    CreateWordField (Local7, 0x00, SZZE)
                    CreateField (Local7, 0x10, 0x03, FUCC)
                    CreateField (Local7, 0x13, 0x05, DEVV)
                    CreateByteField (Local7, 0x03, BUSS)
                    CreateByteField (Local7, 0x04, HPST)
                    Store (0x05, SZZE) /* \_SB_.PCI0.VGA_.PX02.SZZE */
                    Store (0x00, BUSS) /* \_SB_.PCI0.VGA_.PX02.BUSS */
                    Store (0x00, FUCC) /* \_SB_.PCI0.VGA_.PX02.FUCC */
                    Store (Buffer (0x04) {}, Local6)
                    CreateByteField (Local6, 0x02, HPOX)
                    And (Arg0, 0x01, PWST) /* \_SB_.PCI0.VGA_.PX02.PWST */
                    Name (HPOK, 0x00)
                    If (PWST)
                    {
                        Store (0x11E2, P80H) /* \P80H */
                        Store (Zero, ^^SMB.P2CO) /* \_SB_.PCI0.SMB_.P2CO */
                        Store (Zero, ^^SMB.P2CE) /* \_SB_.PCI0.SMB_.P2CE */
                        Store (Zero, ^^SMB.P2DO) /* \_SB_.PCI0.SMB_.P2DO */
                        Store (Zero, ^^SMB.P2DE) /* \_SB_.PCI0.SMB_.P2DE */
                        Sleep (0x0A)
                        Store (One, ^^SMB.P2DO) /* \_SB_.PCI0.SMB_.P2DO */
                        Store (Zero, ^^SMB.P2DE) /* \_SB_.PCI0.SMB_.P2DE */
                        Sleep (0x0A)
                        Store (One, ^^SMB.P37O) /* \_SB_.PCI0.SMB_.P37O */
                        Store (Zero, ^^SMB.P37E) /* \_SB_.PCI0.SMB_.P37E */
                        Sleep (0x0A)
                        Store (One, ^^SMB.MX28) /* \_SB_.PCI0.SMB_.MX28 */
                        While (LEqual (^^SMB.P1CI, 0x00)) {}
                        Store (One, ^^SMB.P2CO) /* \_SB_.PCI0.SMB_.P2CO */
                        Store (Zero, ^^SMB.P2CE) /* \_SB_.PCI0.SMB_.P2CE */
                        Store (0x12E2, P80H) /* \P80H */
                        Store (0x00, HPOK) /* \_SB_.PCI0.VGA_.PX02.HPOK */
                        Sleep (0x64)
                        Sleep (0x64)
                        Store (0x03, DEVV) /* \_SB_.PCI0.VGA_.PX02.DEVV */
                        Store (0x01, HPST) /* \_SB_.PCI0.VGA_.PX02.HPST */
                        Store (ALIB (0x06, Local7), Local6)
                        Sleep (0x14)
                        Store (0x00, Local2)
                        While (LLess (Local2, 0x0F))
                        {
                            Store (One, ^^PB3.PSDC) /* \_SB_.PCI0.PB3_.PSDC */
                            Store (0x01, Local4)
                            Store (0xC8, Local5)
                            While (LAnd (Local4, Local5))
                            {
                                Store (^^PB3.XPRD (0xA5), Local0)
                                And (Local0, 0x7F, Local0)
                                If (LAnd (LGreaterEqual (Local0, 0x10), LNotEqual (Local0, 0x7F)))
                                {
                                    Store (0x00, Local4)
                                }
                                Else
                                {
                                    Sleep (0x05)
                                    Decrement (Local5)
                                }
                            }

                            If (LNot (Local4))
                            {
                                Store (^^PB3.XPDL (), Local5)
                                If (Local5)
                                {
                                    ^^PB3.XPRT ()
                                    Sleep (0x05)
                                    Increment (Local2)
                                }
                                Else
                                {
                                    ShiftLeft (0x03, 0x03, GPFA) /* \_SB_.PCI0.VGA_.GPFA */
                                    Store (GPFA, ^^LPC0.INFO) /* \_SB_.PCI0.LPC0.INFO */
                                    ^^LPC0.PHS1 (0x87)
                                    Store (0x00, Local0)
                                    If (LEqual (^^PB3.XPR2 (), Ones))
                                    {
                                        Store (0x01, Local0)
                                    }

                                    If (Local0)
                                    {
                                        Store (0x01, HPOK) /* \_SB_.PCI0.VGA_.PX02.HPOK */
                                        Store (0x10, Local2)
                                    }
                                    Else
                                    {
                                        Store (0x00, HPOK) /* \_SB_.PCI0.VGA_.PX02.HPOK */
                                        Store (0x10, Local2)
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x10, Local2)
                            }
                        }

                        If (LNot (HPOK))
                        {
                            Store (0x13E2, P80H) /* \P80H */
                            Store (^^PB3.VGA.DVID, Local1)
                            Sleep (0x0A)
                            Store (0x01, Local4)
                            Store (0x05, Local5)
                            While (LAnd (Local4, Local5))
                            {
                                Store (^^PB3.XPRD (0xA5), Local0)
                                And (Local0, 0x7F, Local0)
                                If (LLessEqual (Local0, 0x04))
                                {
                                    Store (0x00, Local4)
                                }
                                Else
                                {
                                    Store (^^PB3.VGA.DVID, Local1)
                                    Sleep (0x05)
                                    Decrement (Local5)
                                }
                            }

                            Store (0x03, DEVV) /* \_SB_.PCI0.VGA_.PX02.DEVV */
                            Store (0x00, HPST) /* \_SB_.PCI0.VGA_.PX02.HPST */
                            ALIB (0x06, Local7)
                        }

                        Store (0x14E2, P80H) /* \P80H */
                    }
                    Else
                    {
                        Store (0x02E2, P80H) /* \P80H */
                        ShiftLeft (0x03, 0x03, GPFA) /* \_SB_.PCI0.VGA_.GPFA */
                        Store (GPFA, ^^LPC0.INFO) /* \_SB_.PCI0.LPC0.INFO */
                        ^^LPC0.PHS1 (0x84)
                        Store (Zero, ^^SMB.P2CO) /* \_SB_.PCI0.SMB_.P2CO */
                        Store (Zero, ^^SMB.P2CE) /* \_SB_.PCI0.SMB_.P2CE */
                        Store (Zero, ^^SMB.P37O) /* \_SB_.PCI0.SMB_.P37O */
                        Store (Zero, ^^SMB.P37E) /* \_SB_.PCI0.SMB_.P37E */
                        Sleep (0x0A)
                        Store (Zero, ^^SMB.P2DO) /* \_SB_.PCI0.SMB_.P2DO */
                        Store (Zero, ^^SMB.P2DE) /* \_SB_.PCI0.SMB_.P2DE */
                        Store (0x03E2, P80H) /* \P80H */
                        Store (One, ^^PB3.PSDC) /* \_SB_.PCI0.PB3_.PSDC */
                        Store (^^PB3.VGA.DVID, Local1)
                        Sleep (0x0A)
                        Store (0x01, Local4)
                        Store (0x05, Local5)
                        While (LAnd (Local4, Local5))
                        {
                            Store (^^PB3.XPRD (0xA5), Local0)
                            And (Local0, 0x7F, Local0)
                            If (LLessEqual (Local0, 0x04))
                            {
                                Store (0x00, Local4)
                            }
                            Else
                            {
                                Store (^^PB3.VGA.DVID, Local1)
                                Sleep (0x05)
                                Decrement (Local5)
                            }
                        }

                        Store (0x03, DEVV) /* \_SB_.PCI0.VGA_.PX02.DEVV */
                        Store (0x00, HPST) /* \_SB_.PCI0.VGA_.PX02.HPST */
                        ALIB (0x06, Local7)
                        Store (0x02, HPOK) /* \_SB_.PCI0.VGA_.PX02.HPOK */
                        Store (0x04E2, P80H) /* \P80H */
                    }

                    If (HPOK)
                    {
                        If (LAnd (LEqual (HPOK, 0x01), LNotEqual (DSID, 0xFFFFFFFF)))
                        {
                            Store (DSID, Local1)
                            Store (Local1, ^^PB3.VGA.SMID) /* \_SB_.PCI0.PB3_.VGA_.SMID */
                            Sleep (0x0A)
                            Store (HSID, Local1)
                            If (LNotEqual (Local1, 0xFFFFFFFF))
                            {
                                Store (Local1, ^^PB3.HDAU.SMID) /* \_SB_.PCI0.PB3_.HDAU.SMID */
                            }

                            Sleep (0x0A)
                        }

                        Notify (PB3, 0x00) // Bus Check
                    }
                }

                Method (PX03, 1, NotSerialized)
                {
                    CreateWordField (ATPB, 0x00, SSZE)
                    CreateWordField (ATPB, 0x02, DPSW)
                    Store (0x04, SSZE) /* \_SB_.PCI0.VGA_.PX03.SSZE */
                    And (Arg0, 0x01, DPSW) /* \_SB_.PCI0.VGA_.PX03.DPSW */
                    If (DPSW)
                    {
                        Store (0x02E3, P80H) /* \P80H */
                        Store (0x01, ^^SMB.P06O) /* \_SB_.PCI0.SMB_.P06O */
                        Store (0x00, ^^SMB.P06E) /* \_SB_.PCI0.SMB_.P06E */
                    }
                    Else
                    {
                        Store (0x01E3, P80H) /* \P80H */
                        Store (0x00, ^^SMB.P06O) /* \_SB_.PCI0.SMB_.P06O */
                        Store (0x00, ^^SMB.P06E) /* \_SB_.PCI0.SMB_.P06E */
                    }
                }

                Method (PX04, 1, NotSerialized)
                {
                    Store (0xE4, P80H) /* \P80H */
                    CreateWordField (ATPB, 0x00, SSZE)
                    CreateWordField (ATPB, 0x02, ICSW)
                    Store (0x04, SSZE) /* \_SB_.PCI0.VGA_.PX04.SSZE */
                    And (Arg0, 0x01, ICSW) /* \_SB_.PCI0.VGA_.PX04.ICSW */
                    If (ICSW)
                    {
                        Store (0x02E4, P80H) /* \P80H */
                        Store (0x01, ^^SMB.P14O) /* \_SB_.PCI0.SMB_.P14O */
                        Store (0x00, ^^SMB.P14E) /* \_SB_.PCI0.SMB_.P14E */
                    }
                    Else
                    {
                        Store (0x01E4, P80H) /* \P80H */
                        Store (0x00, ^^SMB.P14O) /* \_SB_.PCI0.SMB_.P14O */
                        Store (0x00, ^^SMB.P14E) /* \_SB_.PCI0.SMB_.P14E */
                    }
                }

                Method (PX08, 0, NotSerialized)
                {
                    Store (0xE8, P80H) /* \P80H */
                    CreateWordField (ATPB, 0x00, CNUM)
                    CreateWordField (ATPB, 0x02, CSSZ)
                    Store (0x0A, CNUM) /* \_SB_.PCI0.VGA_.PX08.CNUM */
                    Store (0x05, CSSZ) /* \_SB_.PCI0.VGA_.PX08.CSSZ */
                    CreateField (ATPB, 0x20, 0x28, CTI0)
                    Store (CNT0, CTI0) /* \_SB_.PCI0.VGA_.PX08.CTI0 */
                    CreateField (ATPB, 0x48, 0x28, CTI1)
                    Store (CNT1, CTI1) /* \_SB_.PCI0.VGA_.PX08.CTI1 */
                    CreateField (ATPB, 0x70, 0x28, CTI2)
                    CreateByteField (CNT2, 0x00, FLG2)
                    If (LEqual (LCDT, 0x80000001))
                    {
                        If (LEqual (DSCT, 0x80000001))
                        {
                            Store (0x00, FLG2) /* \_SB_.PCI0.VGA_.PX08.FLG2 */
                        }

                        If (LEqual (DSCT, 0x80000002))
                        {
                            Store (0x07, FLG2) /* \_SB_.PCI0.VGA_.PX08.FLG2 */
                        }
                    }

                    Store (CNT2, CTI2) /* \_SB_.PCI0.VGA_.PX08.CTI2 */
                    CreateField (ATPB, 0x98, 0x28, CTI3)
                    CreateByteField (CNT3, 0x00, FLG3)
                    If (LEqual (LCDT, 0x80000000))
                    {
                        Store (0x07, FLG3) /* \_SB_.PCI0.VGA_.PX08.FLG3 */
                    }

                    If (LEqual (LCDT, 0x80000001))
                    {
                        Store (0x00, FLG3) /* \_SB_.PCI0.VGA_.PX08.FLG3 */
                        If (LEqual (DSCT, 0x80000002))
                        {
                            Store (0x00, FLG3) /* \_SB_.PCI0.VGA_.PX08.FLG3 */
                        }
                    }

                    If (LEqual (LCDT, 0x80000002))
                    {
                        Store (0x00, FLG3) /* \_SB_.PCI0.VGA_.PX08.FLG3 */
                        If (LEqual (DSCT, 0x80000002))
                        {
                            Store (0x07, FLG3) /* \_SB_.PCI0.VGA_.PX08.FLG3 */
                        }
                    }

                    Store (CNT3, CTI3) /* \_SB_.PCI0.VGA_.PX08.CTI3 */
                    CreateField (ATPB, 0xC0, 0x28, CTI4)
                    Store (CNT4, CTI4) /* \_SB_.PCI0.VGA_.PX08.CTI4 */
                    CreateField (ATPB, 0xE8, 0x28, CTI5)
                    Store (CNT5, CTI5) /* \_SB_.PCI0.VGA_.PX08.CTI5 */
                    CreateField (ATPB, 0x0110, 0x28, CTI6)
                    Store (CNT6, CTI6) /* \_SB_.PCI0.VGA_.PX08.CTI6 */
                    CreateField (ATPB, 0x0138, 0x28, CTI7)
                    CreateByteField (CNT7, 0x00, FLG7)
                    If (LEqual (LCDT, 0x80000001))
                    {
                        If (LEqual (DSCT, 0x80000001))
                        {
                            Store (0x00, FLG7) /* \_SB_.PCI0.VGA_.PX08.FLG7 */
                        }

                        If (LEqual (DSCT, 0x80000002))
                        {
                            Store (0x07, FLG7) /* \_SB_.PCI0.VGA_.PX08.FLG7 */
                        }
                    }

                    Store (CNT7, CTI7) /* \_SB_.PCI0.VGA_.PX08.CTI7 */
                    CreateField (ATPB, 0x0160, 0x28, CTI8)
                    CreateByteField (CNT8, 0x00, FLG8)
                    If (LEqual (LCDT, 0x80000000))
                    {
                        Store (0x07, FLG8) /* \_SB_.PCI0.VGA_.PX08.FLG8 */
                    }

                    If (LEqual (LCDT, 0x80000001))
                    {
                        Store (0x00, FLG8) /* \_SB_.PCI0.VGA_.PX08.FLG8 */
                    }

                    If (LEqual (LCDT, 0x80000002))
                    {
                        Store (0x00, FLG8) /* \_SB_.PCI0.VGA_.PX08.FLG8 */
                    }

                    If (LEqual (DSCT, 0x80000002))
                    {
                        Store (0x07, FLG8) /* \_SB_.PCI0.VGA_.PX08.FLG8 */
                    }

                    Store (CNT8, CTI8) /* \_SB_.PCI0.VGA_.PX08.CTI8 */
                    CreateField (ATPB, 0x0188, 0x28, CTI9)
                    CreateByteField (CNT9, 0x00, FLG9)
                    If (LEqual (DSCT, 0x80000002))
                    {
                        Store (0x07, FLG9) /* \_SB_.PCI0.VGA_.PX08.FLG9 */
                    }

                    Store (CNT9, CTI9) /* \_SB_.PCI0.VGA_.PX08.CTI9 */
                    Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
                }

                Method (PX09, 0, NotSerialized)
                {
                    Store (0xE9, P80H) /* \P80H */
                    CreateWordField (ATPB, 0x00, CNUM)
                    CreateWordField (ATPB, 0x02, CSSZ)
                    Store (0x00, CNUM) /* \_SB_.PCI0.VGA_.PX09.CNUM */
                    Store (0x00, CSSZ) /* \_SB_.PCI0.VGA_.PX09.CSSZ */
                    CreateByteField (ATPB, 0x04, ATI0)
                    CreateByteField (ATPB, 0x05, HPD0)
                    CreateByteField (ATPB, 0x06, DDC0)
                    Store (0x00, ATI0) /* \_SB_.PCI0.VGA_.PX09.ATI0 */
                    Store (0x00, HPD0) /* \_SB_.PCI0.VGA_.PX09.HPD0 */
                    Store (0x00, DDC0) /* \_SB_.PCI0.VGA_.PX09.DDC0 */
                    CreateByteField (ATPB, 0x07, ATI1)
                    CreateByteField (ATPB, 0x08, HPD1)
                    CreateByteField (ATPB, 0x09, DDC1)
                    Store (0x00, ATI1) /* \_SB_.PCI0.VGA_.PX09.ATI1 */
                    Store (0x00, HPD1) /* \_SB_.PCI0.VGA_.PX09.HPD1 */
                    Store (0x00, DDC1) /* \_SB_.PCI0.VGA_.PX09.DDC1 */
                    Return (ATPB) /* \_SB_.PCI0.VGA_.ATPB */
                }
            }

            Scope (VGA)
            {
                OperationRegion (REVD, SystemMemory, 0xBF479D98, 0x00000008)
                Field (REVD, AnyAcc, NoLock, Preserve)
                {
                    SROM,   32, 
                    VROM,   32
                }

                Name (TVGA, Buffer (0x0004)
                {
                     0x00
                })
                Method (XTRM, 2, Serialized)
                {
                    Add (Arg0, Arg1, Local0)
                    If (LLessEqual (Local0, SROM))
                    {
                        Multiply (Arg1, 0x08, Local1)
                        Multiply (Arg0, 0x08, Local2)
                        Store (VROM, TVGA) /* \_SB_.PCI0.VGA_.TVGA */
                        CreateField (TVGA, Local2, Local1, TEMP)
                        Name (RETB, Buffer (Arg1) {})
                        Store (TEMP, RETB) /* \_SB_.PCI0.VGA_.XTRM.RETB */
                        Return (RETB) /* \_SB_.PCI0.VGA_.XTRM.RETB */
                    }
                    Else
                    {
                        If (LLess (Arg0, SROM))
                        {
                            Subtract (SROM, Arg0, Local3)
                            Multiply (Local3, 0x08, Local1)
                            Multiply (Arg0, 0x08, Local2)
                            Store (VROM, TVGA) /* \_SB_.PCI0.VGA_.TVGA */
                            CreateField (TVGA, Local2, Local1, TEM)
                            Name (RETC, Buffer (Local3) {})
                            Store (TEM, RETC) /* \_SB_.PCI0.VGA_.XTRM.RETC */
                            Return (RETC) /* \_SB_.PCI0.VGA_.XTRM.RETC */
                        }
                        Else
                        {
                            Name (RETD, Buffer (0x01) {})
                            Return (RETD) /* \_SB_.PCI0.VGA_.XTRM.RETD */
                        }
                    }
                }
            }

            Name (AFCB, Buffer (0xB8) {})
            Name (CALB, Buffer (0x05) {})
            Device (AFD)
            {
                Name (_HID, "AFD0001")  // _HID: Hardware ID
                Name (AFEN, 0x80000000)
                Name (FU3E, 0x80000000)
                Name (HDD0, 0x80000000)
                Name (ODZP, 0x80000000)
                Name (DAT3, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x03, 0x0C, 0x03, 0x00, 0x00, 0x00,
                    /* 0008 */   0x92, 0x00, 0x03, 0x00, 0x00, 0x00
                })
                Name (DAT4, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x11, 0x0D, 0x03, 0x00, 0x00, 0x00,
                    /* 0008 */   0xA5, 0x00, 0x02, 0x00, 0x00, 0x00
                })
                Name (DAT5, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DAT6, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DAT7, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x03, 0x0C, 0x03, 0x00, 0x00, 0x00,
                    /* 0008 */   0x00, 0xFF, 0x00, 0x00, 0x00, 0x00
                })
                Name (DAT8, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DAT9, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DATA, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DATB, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Name (DATC, Buffer (0x0E)
                {
                    /* 0000 */   0x0E, 0x00, 0x01, 0x04, 0x00, 0x00, 0x00, 0xFF,
                    /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (LEqual (AFEN, 0x80000000))
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Method (AFCM, 3, NotSerialized)
                {
                    And (Arg0, 0xFF, Arg0)
                    If (LEqual (Arg0, 0x00))
                    {
                        Return (AFC0 ())
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        Return (AFC1 ())
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Return (AFC2 (Arg1, Arg2))
                    }
                    Else
                    {
                        CreateWordField (AFCB, 0x00, SSZE)
                        CreateWordField (AFCB, 0x02, VERN)
                        CreateDWordField (AFCB, 0x04, SFUN)
                        Store (0x00, SSZE) /* \_SB_.PCI0.AFD_.AFCM.SSZE */
                        Store (0x00, VERN) /* \_SB_.PCI0.AFD_.AFCM.VERN */
                        Store (0x00, SFUN) /* \_SB_.PCI0.AFD_.AFCM.SFUN */
                        Return (AFCB) /* \_SB_.PCI0.AFCB */
                    }
                }

                Method (AFC0, 0, NotSerialized)
                {
                    Store (0xAF00, P80H) /* \P80H */
                    CreateWordField (AFCB, 0x00, SSZE)
                    CreateWordField (AFCB, 0x02, VERN)
                    CreateDWordField (AFCB, 0x04, SFUN)
                    Store (0x08, SSZE) /* \_SB_.PCI0.AFD_.AFC0.SSZE */
                    Store (0x01, VERN) /* \_SB_.PCI0.AFD_.AFC0.VERN */
                    Store (0x03, SFUN) /* \_SB_.PCI0.AFD_.AFC0.SFUN */
                    Store (0xAE00, P80H) /* \P80H */
                    Return (AFCB) /* \_SB_.PCI0.AFCB */
                }

                Method (AFC1, 0, NotSerialized)
                {
                    Store (0xAF01, P80H) /* \P80H */
                    CreateWordField (AFCB, 0x00, SSZE)
                    CreateWordField (AFCB, 0x02, ESZ0)
                    CreateWordField (AFCB, 0x04, CCD0)
                    CreateWordField (AFCB, 0x06, EBU0)
                    CreateWordField (AFCB, 0x08, CFG0)
                    CreateWordField (AFCB, 0x0A, PCA0)
                    CreateWordField (AFCB, 0x0C, DCP0)
                    CreateWordField (AFCB, 0x0E, DRA0)
                    Store (0x0E, ESZ0) /* \_SB_.PCI0.AFD_.AFC1.ESZ0 */
                    Store (0x02, EBU0) /* \_SB_.PCI0.AFD_.AFC1.EBU0 */
                    Store (0x00, CFG0) /* \_SB_.PCI0.AFD_.AFC1.CFG0 */
                    Store (0x88, PCA0) /* \_SB_.PCI0.AFD_.AFC1.PCA0 */
                    If (LEqual (^^SATA.VIDI, 0x78001022))
                    {
                        Store (0x01, EBU0) /* \_SB_.PCI0.AFD_.AFC1.EBU0 */
                        Store (0x0101, CCD0) /* \_SB_.PCI0.AFD_.AFC1.CCD0 */
                        Store (0x00, DCP0) /* \_SB_.PCI0.AFD_.AFC1.DCP0 */
                        Store (0x00, DRA0) /* \_SB_.PCI0.AFD_.AFC1.DRA0 */
                    }

                    If (LEqual (^^SATA.VIDI, 0x78011022))
                    {
                        Store (0x0106, CCD0) /* \_SB_.PCI0.AFD_.AFC1.CCD0 */
                        Store (0x00, DCP0) /* \_SB_.PCI0.AFD_.AFC1.DCP0 */
                        Store (0x00, DRA0) /* \_SB_.PCI0.AFD_.AFC1.DRA0 */
                    }

                    If (LEqual (^^SATA.VIDI, 0x78021022))
                    {
                        Store (0x0104, CCD0) /* \_SB_.PCI0.AFD_.AFC1.CCD0 */
                        Store (0x00, DCP0) /* \_SB_.PCI0.AFD_.AFC1.DCP0 */
                        Store (0x00, DRA0) /* \_SB_.PCI0.AFD_.AFC1.DRA0 */
                    }

                    If (LEqual (^^SATA.VIDI, 0x78031022))
                    {
                        Store (0x0104, CCD0) /* \_SB_.PCI0.AFD_.AFC1.CCD0 */
                        Store (0x00, DCP0) /* \_SB_.PCI0.AFD_.AFC1.DCP0 */
                        Store (0x00, DRA0) /* \_SB_.PCI0.AFD_.AFC1.DRA0 */
                    }

                    If (LEqual (^^SATA.VIDI, 0x78041022))
                    {
                        Store (0x0106, CCD0) /* \_SB_.PCI0.AFD_.AFC1.CCD0 */
                        Store (0x00, DCP0) /* \_SB_.PCI0.AFD_.AFC1.DCP0 */
                        Store (0x00, DRA0) /* \_SB_.PCI0.AFD_.AFC1.DRA0 */
                    }

                    CreateWordField (AFCB, 0x10, ESZ1)
                    CreateWordField (AFCB, 0x12, CCD1)
                    CreateWordField (AFCB, 0x14, EBU1)
                    CreateWordField (AFCB, 0x16, CFG1)
                    CreateWordField (AFCB, 0x18, PCA1)
                    CreateWordField (AFCB, 0x1A, DCP1)
                    CreateWordField (AFCB, 0x1C, DRA1)
                    Store (0x0E, ESZ1) /* \_SB_.PCI0.AFD_.AFC1.ESZ1 */
                    Store (0x02, EBU1) /* \_SB_.PCI0.AFD_.AFC1.EBU1 */
                    Store (0x00, CFG1) /* \_SB_.PCI0.AFD_.AFC1.CFG1 */
                    Store (0x88, PCA1) /* \_SB_.PCI0.AFD_.AFC1.PCA1 */
                    If (LEqual (^^SATA.VIDI, 0x78001022))
                    {
                        Store (0x01, EBU1) /* \_SB_.PCI0.AFD_.AFC1.EBU1 */
                        Store (0x0101, CCD1) /* \_SB_.PCI0.AFD_.AFC1.CCD1 */
                        Store (0x01, DCP1) /* \_SB_.PCI0.AFD_.AFC1.DCP1 */
                        Store (0x01, DRA1) /* \_SB_.PCI0.AFD_.AFC1.DRA1 */
                    }

                    If (LEqual (^^SATA.VIDI, 0x78011022))
                    {
                        Store (0x0106, CCD1) /* \_SB_.PCI0.AFD_.AFC1.CCD1 */
                        Store (0x01, DCP1) /* \_SB_.PCI0.AFD_.AFC1.DCP1 */
                        Store (0x00, DRA1) /* \_SB_.PCI0.AFD_.AFC1.DRA1 */
                    }

                    If (LEqual (^^SATA.VIDI, 0x78021022))
                    {
                        Store (0x0104, CCD1) /* \_SB_.PCI0.AFD_.AFC1.CCD1 */
                        Store (0x00, DCP1) /* \_SB_.PCI0.AFD_.AFC1.DCP1 */
                        Store (0x00, DRA1) /* \_SB_.PCI0.AFD_.AFC1.DRA1 */
                    }

                    If (LEqual (^^SATA.VIDI, 0x78031022))
                    {
                        Store (0x0104, CCD1) /* \_SB_.PCI0.AFD_.AFC1.CCD1 */
                        Store (0x00, DCP1) /* \_SB_.PCI0.AFD_.AFC1.DCP1 */
                        Store (0x00, DRA1) /* \_SB_.PCI0.AFD_.AFC1.DRA1 */
                    }

                    If (LEqual (^^SATA.VIDI, 0x78041022))
                    {
                        Store (0x0106, CCD1) /* \_SB_.PCI0.AFD_.AFC1.CCD1 */
                        Store (0x01, DCP1) /* \_SB_.PCI0.AFD_.AFC1.DCP1 */
                        Store (0x00, DRA1) /* \_SB_.PCI0.AFD_.AFC1.DRA1 */
                    }

                    CreateWordField (AFCB, 0x1E, ESZ2)
                    CreateWordField (AFCB, 0x20, CCD2)
                    CreateWordField (AFCB, 0x22, EBU2)
                    CreateWordField (AFCB, 0x24, CFG2)
                    CreateWordField (AFCB, 0x26, PCA2)
                    CreateWordField (AFCB, 0x28, DCP2)
                    CreateWordField (AFCB, 0x2A, DRA2)
                    Store (0x0E, ESZ2) /* \_SB_.PCI0.AFD_.AFC1.ESZ2 */
                    Store (0x02, EBU2) /* \_SB_.PCI0.AFD_.AFC1.EBU2 */
                    Store (0x00, CFG2) /* \_SB_.PCI0.AFD_.AFC1.CFG2 */
                    Store (0x88, PCA2) /* \_SB_.PCI0.AFD_.AFC1.PCA2 */
                    If (LEqual (^^SATA.VIDI, 0x78001022))
                    {
                        Store (0x01, EBU2) /* \_SB_.PCI0.AFD_.AFC1.EBU2 */
                        Store (0x0101, CCD2) /* \_SB_.PCI0.AFD_.AFC1.CCD2 */
                        Store (0x00, DCP2) /* \_SB_.PCI0.AFD_.AFC1.DCP2 */
                        Store (0x01, DRA2) /* \_SB_.PCI0.AFD_.AFC1.DRA2 */
                    }

                    If (LEqual (^^SATA.VIDI, 0x78011022))
                    {
                        Store (0x0106, CCD2) /* \_SB_.PCI0.AFD_.AFC1.CCD2 */
                        Store (0x02, DCP2) /* \_SB_.PCI0.AFD_.AFC1.DCP2 */
                        Store (0x00, DRA2) /* \_SB_.PCI0.AFD_.AFC1.DRA2 */
                    }

                    If (LEqual (^^SATA.VIDI, 0x78021022))
                    {
                        Store (0x0104, CCD2) /* \_SB_.PCI0.AFD_.AFC1.CCD2 */
                        Store (0x00, DCP2) /* \_SB_.PCI0.AFD_.AFC1.DCP2 */
                        Store (0x00, DRA2) /* \_SB_.PCI0.AFD_.AFC1.DRA2 */
                    }

                    If (LEqual (^^SATA.VIDI, 0x78031022))
                    {
                        Store (0x0104, CCD2) /* \_SB_.PCI0.AFD_.AFC1.CCD2 */
                        Store (0x00, DCP2) /* \_SB_.PCI0.AFD_.AFC1.DCP2 */
                        Store (0x00, DRA2) /* \_SB_.PCI0.AFD_.AFC1.DRA2 */
                    }

                    If (LEqual (^^SATA.VIDI, 0x78041022))
                    {
                        Store (0x0106, CCD2) /* \_SB_.PCI0.AFD_.AFC1.CCD2 */
                        Store (0x02, DCP2) /* \_SB_.PCI0.AFD_.AFC1.DCP2 */
                        Store (0x00, DRA2) /* \_SB_.PCI0.AFD_.AFC1.DRA2 */
                    }

                    CreateField (AFCB, 0x0160, 0x70, IDX3)
                    Store (DAT3, IDX3) /* \_SB_.PCI0.AFD_.AFC1.IDX3 */
                    CreateField (AFCB, 0x01D0, 0x70, IDX4)
                    Store (DAT4, IDX4) /* \_SB_.PCI0.AFD_.AFC1.IDX4 */
                    CreateField (AFCB, 0x0240, 0x70, IDX5)
                    CreateByteField (DAT5, 0x07, BUS5)
                    If (LEqual (^^VGA.PXEN, 0x80000000))
                    {
                        Store (0xFF, BUS5) /* \_SB_.PCI0.AFD_.AFC1.BUS5 */
                    }
                    Else
                    {
                        If (LEqual (^^VGA.PXID, ^^PB2._ADR))
                        {
                            Store (^^PB2.SBUS, Local0)
                        }

                        If (LEqual (^^VGA.PXID, ^^PB3._ADR))
                        {
                            Store (^^PB3.SBUS, Local0)
                        }

                        ShiftRight (Local0, 0x08, Local0)
                        And (Local0, 0xFF, Local0)
                        Store (Local0, BUS5) /* \_SB_.PCI0.AFD_.AFC1.BUS5 */
                    }

                    Store (DAT5, IDX5) /* \_SB_.PCI0.AFD_.AFC1.IDX5 */
                    CreateField (AFCB, 0x02B0, 0x70, IDX6)
                    CreateByteField (DAT6, 0x07, BUS6)
                    Store (^^PB7.SBUS, Local0)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, BUS6) /* \_SB_.PCI0.AFD_.AFC1.BUS6 */
                    Store (DAT6, IDX6) /* \_SB_.PCI0.AFD_.AFC1.IDX6 */
                    CreateField (AFCB, 0x0320, 0x70, IDX7)
                    If (LNotEqual (FU3E, 0x80000000))
                    {
                        CreateByteField (DAT7, 0x09, BUS7)
                        Store (^^SPB1.SBUS, Local0)
                        ShiftRight (Local0, 0x08, Local0)
                        And (Local0, 0xFF, Local0)
                        Store (Local0, BUS7) /* \_SB_.PCI0.AFD_.AFC1.BUS7 */
                    }

                    Store (DAT7, IDX7) /* \_SB_.PCI0.AFD_.AFC1.IDX7 */
                    CreateField (AFCB, 0x0390, 0x70, IDX8)
                    CreateByteField (DAT8, 0x07, BUS8)
                    Store (^^PB4.SBUS, Local0)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, BUS8) /* \_SB_.PCI0.AFD_.AFC1.BUS8 */
                    Store (DAT8, IDX8) /* \_SB_.PCI0.AFD_.AFC1.IDX8 */
                    CreateField (AFCB, 0x0400, 0x70, IDX9)
                    CreateByteField (DAT9, 0x07, BUS9)
                    Store (^^PB6.SBUS, Local0)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, BUS9) /* \_SB_.PCI0.AFD_.AFC1.BUS9 */
                    Store (DAT9, IDX9) /* \_SB_.PCI0.AFD_.AFC1.IDX9 */
                    CreateField (AFCB, 0x0470, 0x70, IDXA)
                    CreateByteField (DATA, 0x07, BUSA)
                    Store (^^SPB0.SBUS, Local0)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, BUSA) /* \_SB_.PCI0.AFD_.AFC1.BUSA */
                    Store (DATA, IDXA) /* \_SB_.PCI0.AFD_.AFC1.IDXA */
                    CreateField (AFCB, 0x04E0, 0x70, IDXB)
                    CreateByteField (DATB, 0x07, BUSB)
                    Store (^^PB5.SBUS, Local0)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, BUSB) /* \_SB_.PCI0.AFD_.AFC1.BUSB */
                    Store (DATB, IDXB) /* \_SB_.PCI0.AFD_.AFC1.IDXB */
                    CreateField (AFCB, 0x0550, 0x70, IDXC)
                    CreateByteField (DATC, 0x07, BUSC)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local0, BUSC) /* \_SB_.PCI0.AFD_.AFC1.BUSC */
                    Store (DATC, IDXC) /* \_SB_.PCI0.AFD_.AFC1.IDXC */
                    Store (0xB8, SSZE) /* \_SB_.PCI0.AFD_.AFC1.SSZE */
                    Store (0xAE01, P80H) /* \P80H */
                    Return (AFCB) /* \_SB_.PCI0.AFCB */
                }

                Method (AFC2, 2, NotSerialized)
                {
                    Store (0xAF02, P80H) /* \P80H */
                    CreateDWordField (AFCB, 0x00, FLAG)
                    CreateByteField (AFCB, 0x04, PWST)
                    CreateByteField (AFCB, 0x05, DIND)
                    CreateWordField (CALB, 0x00, SZZE)
                    CreateField (CALB, 0x10, 0x03, FUCC)
                    CreateField (CALB, 0x13, 0x05, DEVV)
                    CreateField (CALB, 0x18, 0x08, BUSS)
                    CreateByteField (CALB, 0x04, HPST)
                    Store (0x05, SZZE) /* \_SB_.PCI0.AFD_.AFC2.SZZE */
                    And (Arg0, 0xFF, PWST) /* \_SB_.PCI0.AFD_.AFC2.PWST */
                    And (Arg1, 0xFF, DIND) /* \_SB_.PCI0.AFD_.AFC2.DIND */
                    If (LEqual (DIND, 0x00))
                    {
                        If (LOr (LEqual (^^SATA.VIDI, 0x78021022), LEqual (^^SATA.VIDI, 0x78031022)))
                        {
                            Or (FLAG, 0x80, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            Return (FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        Store (0x01, ^^SMB.MX57) /* \_SB_.PCI0.SMB_.MX57 */
                        Store (0x01, ^^SMB.M170) /* \_SB_.PCI0.SMB_.M170 */
                        If (LEqual (PWST, 0x00))
                        {
                            If (LEqual (^^SATA.VIDI, 0x78001022))
                            {
                                Notify (^^SATA.PRID.P_D0, 0x03) // Eject Request
                            }

                            If (LOr (LEqual (^^SATA.VIDI, 0x78011022), LEqual (^^SATA.VIDI, 0x78041022)))
                            {
                                Notify (^^SATA.PRID, 0x03) // Eject Request
                            }

                            Store (0x00, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0x01))
                        {
                            Store (0x00, ^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                            Store (0x00, ^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                            Store (0x01, ^^SMB.P39O) /* \_SB_.PCI0.SMB_.P39O */
                            Store (0x00, ^^SMB.P39E) /* \_SB_.PCI0.SMB_.P39E */
                            Sleep (0x03E8)
                            If (LEqual (^^SATA.VIDI, 0x78001022))
                            {
                                Notify (^^SATA.PRID.P_D0, 0x01) // Device Check
                            }

                            If (LOr (LEqual (^^SATA.VIDI, 0x78011022), LEqual (^^SATA.VIDI, 0x78041022)))
                            {
                                Notify (^^SATA.PRID, 0x01) // Device Check
                            }

                            Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMB.P39O, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }
                    }

                    If (LEqual (DIND, 0x01))
                    {
                        If (LOr (LEqual (^^SATA.VIDI, 0x78021022), LEqual (^^SATA.VIDI, 0x78031022)))
                        {
                            Or (FLAG, 0x80, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            Return (FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        Store (0x01, ^^SMB.MX53) /* \_SB_.PCI0.SMB_.MX53 */
                        Store (0x01, ^^SMB.M170) /* \_SB_.PCI0.SMB_.M170 */
                        If (LEqual (ODZP, 0x80000000))
                        {
                            If (LEqual (PWST, 0x00))
                            {
                                If (LEqual (^^SATA.VIDI, 0x78001022))
                                {
                                    Notify (^^SATA.PRT1.ODD, 0x03) // Eject Request
                                }

                                If (LOr (LEqual (^^SATA.VIDI, 0x78011022), LEqual (^^SATA.VIDI, 0x78041022)))
                                {
                                    If (LEqual (HDD0, 0x01))
                                    {
                                        Notify (^^SATA.PRT1, 0x03) // Eject Request
                                    }
                                    Else
                                    {
                                        If (LGreaterEqual (TPOS, 0x50))
                                        {
                                            Notify (^^SATA.PRT1, 0x03) // Eject Request
                                        }
                                        Else
                                        {
                                            Notify (^^SATA.PRID, 0x03) // Eject Request
                                        }
                                    }
                                }

                                Store (0x00, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            }

                            If (LEqual (PWST, 0x01))
                            {
                                Store (0x00, ^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                                Store (0x00, ^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                                Store (0x01, ^^SMB.P39O) /* \_SB_.PCI0.SMB_.P39O */
                                Store (0x00, ^^SMB.P39E) /* \_SB_.PCI0.SMB_.P39E */
                                Sleep (0x03E8)
                                If (LEqual (^^SATA.VIDI, 0x78001022))
                                {
                                    Notify (^^SATA.PRT1.ODD, 0x01) // Device Check
                                }

                                If (LOr (LEqual (^^SATA.VIDI, 0x78011022), LEqual (^^SATA.VIDI, 0x78041022)))
                                {
                                    If (LEqual (HDD0, 0x01))
                                    {
                                        Notify (^^SATA.PRT1, 0x01) // Device Check
                                    }
                                    Else
                                    {
                                        If (LGreaterEqual (TPOS, 0x50))
                                        {
                                            Notify (^^SATA.PRT1, 0x01) // Device Check
                                        }
                                        Else
                                        {
                                            Notify (^^SATA.PRID, 0x01) // Device Check
                                        }
                                    }
                                }

                                Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            }

                            If (LEqual (PWST, 0xFF))
                            {
                                Store (^^SMB.P35O, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            }
                        }
                        Else
                        {
                            If (LEqual (^^SATA.VIDI, 0x78041022))
                            {
                                Store (^^SMB.P35O, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                                Or (FLAG, 0xC0, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                                Return (FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            }

                            If (LEqual (PWST, 0x00))
                            {
                                If (LEqual (^^SATA.VIDI, 0x78001022))
                                {
                                    Notify (^^SATA.ODDZ.ODD, 0x03) // Eject Request
                                }

                                If (LEqual (^^SATA.VIDI, 0x78011022))
                                {
                                    If (LEqual (HDD0, 0x01))
                                    {
                                        Notify (^^SATA.ODDZ.ODD, 0x03) // Eject Request
                                    }
                                    Else
                                    {
                                        If (LGreaterEqual (TPOS, 0x50))
                                        {
                                            Notify (^^SATA.ODDZ.ODD, 0x03) // Eject Request
                                        }
                                        Else
                                        {
                                            Notify (^^SATA.PRID, 0x03) // Eject Request
                                        }
                                    }
                                }

                                Store (0x00, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            }

                            If (LEqual (PWST, 0x01))
                            {
                                Store (0x00, ^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                                Store (0x00, ^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                                Store (0x01, ^^SMB.P35O) /* \_SB_.PCI0.SMB_.P35O */
                                Store (0x00, ^^SMB.P35E) /* \_SB_.PCI0.SMB_.P35E */
                                Sleep (0x03E8)
                                If (LEqual (^^SATA.VIDI, 0x78001022))
                                {
                                    Notify (^^SATA.ODDZ.ODD, 0x01) // Device Check
                                }

                                If (LEqual (^^SATA.VIDI, 0x78011022))
                                {
                                    If (LEqual (HDD0, 0x01))
                                    {
                                        Notify (^^SATA.ODDZ.ODD, 0x01) // Device Check
                                    }
                                    Else
                                    {
                                        If (LGreaterEqual (TPOS, 0x50))
                                        {
                                            Notify (^^SATA.ODDZ.ODD, 0x01) // Device Check
                                        }
                                        Else
                                        {
                                            Notify (^^SATA.PRID, 0x01) // Device Check
                                        }
                                    }
                                }

                                Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            }

                            If (LEqual (PWST, 0xFF))
                            {
                                Store (^^SMB.P35O, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                                If (LOr (LEqual (^^SATA.VIDI, 0x78001022), LEqual (^^SATA.VIDI, 0x78011022)))
                                {
                                    And (FLAG, 0x7F, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                                }
                                Else
                                {
                                    Or (FLAG, 0x80, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                                }

                                Or (FLAG, 0x40, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            }
                        }
                    }

                    If (LEqual (DIND, 0x02))
                    {
                        If (LOr (LEqual (^^SATA.VIDI, 0x78021022), LEqual (^^SATA.VIDI, 0x78031022)))
                        {
                            Or (FLAG, 0x80, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            Return (FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        Store (0x01, ^^SMB.MX58) /* \_SB_.PCI0.SMB_.MX58 */
                        Store (0x01, ^^SMB.M170) /* \_SB_.PCI0.SMB_.M170 */
                        If (LEqual (PWST, 0x00))
                        {
                            If (LEqual (^^SATA.VIDI, 0x78001022))
                            {
                                Notify (^^SATA.PRID.P_D1, 0x03) // Eject Request
                            }

                            If (LOr (LEqual (^^SATA.VIDI, 0x78011022), LEqual (^^SATA.VIDI, 0x78041022)))
                            {
                                Notify (^^SATA.SECD, 0x03) // Eject Request
                            }

                            Store (0x00, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0x01))
                        {
                            Store (0x00, ^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                            Store (0x00, ^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                            Sleep (0x03E8)
                            Store (0x01, ^^SMB.P35O) /* \_SB_.PCI0.SMB_.P35O */
                            Store (0x00, ^^SMB.P35E) /* \_SB_.PCI0.SMB_.P35E */
                            Sleep (0x03E8)
                            Store (0x01, ^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                            Store (0x00, ^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                            If (LEqual (^^SATA.VIDI, 0x78001022))
                            {
                                Notify (^^SATA.PRID.P_D1, 0x01) // Device Check
                            }

                            If (LOr (LEqual (^^SATA.VIDI, 0x78011022), LEqual (^^SATA.VIDI, 0x78041022)))
                            {
                                Notify (^^SATA.SECD, 0x01) // Device Check
                            }

                            Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMB.P35O, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }
                    }

                    If (LEqual (DIND, 0x03))
                    {
                        Store (0x01, ^^SMB.MX66) /* \_SB_.PCI0.SMB_.MX66 */
                        If (LEqual (PWST, 0x00))
                        {
                            Store (One, ^^SMB.P42O) /* \_SB_.PCI0.SMB_.P42O */
                            Store (Zero, ^^SMB.P42E) /* \_SB_.PCI0.SMB_.P42E */
                            Store (0x00, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0x01))
                        {
                            Store (Zero, ^^SMB.P42O) /* \_SB_.PCI0.SMB_.P42O */
                            Store (Zero, ^^SMB.P42E) /* \_SB_.PCI0.SMB_.P42E */
                            Sleep (0x28)
                            Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMB.P42O, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }
                    }

                    If (LEqual (DIND, 0x05))
                    {
                        If (LEqual (^^VGA.PXEN, 0x80000000))
                        {
                            Store (^^SMB.P2DO, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            Or (FLAG, 0x80, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            Return (FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0x00))
                        {
                            Notify (^^PB3.VGA, 0x03) // Eject Request
                            Store (0x00, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0x01))
                        {
                            If (^^SMB.P2DO)
                            {
                                Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                                Return (FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            }
                            Else
                            {
                                ^^VGA.PX02 (0x01)
                                Notify (^^PB3.VGA, 0x01) // Device Check
                                Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            }
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMB.P2DO, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }
                    }

                    If (LEqual (DIND, 0x06))
                    {
                        Store (0x02, ^^SMB.MX59) /* \_SB_.PCI0.SMB_.MX59 */
                        Store (0x01, ^^SMB.MX27) /* \_SB_.PCI0.SMB_.MX27 */
                        If (LEqual (PWST, 0x00))
                        {
                            Notify (^^PB7.XPDV, 0x03) // Eject Request
                            Store (0x00, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            Store (0xAF60, P80H) /* \P80H */
                        }

                        If (LEqual (PWST, 0x01))
                        {
                            Store (0x00, ^^SMB.P1BO) /* \_SB_.PCI0.SMB_.P1BO */
                            Store (0x00, ^^SMB.P1BE) /* \_SB_.PCI0.SMB_.P1BE */
                            Sleep (0x28)
                            Store (0x01, ^^SMB.P3BO) /* \_SB_.PCI0.SMB_.P3BO */
                            Store (0x00, ^^SMB.P3BE) /* \_SB_.PCI0.SMB_.P3BE */
                            Sleep (0x28)
                            Store (^^SMB.MS04, Local0)
                            Or (Local0, 0x0F, Local1)
                            Store (Local1, ^^SMB.MS04) /* \_SB_.PCI0.SMB_.MS04 */
                            Sleep (0x28)
                            Store (0x01, ^^SMB.P1BO) /* \_SB_.PCI0.SMB_.P1BO */
                            Store (0x00, ^^SMB.P1BE) /* \_SB_.PCI0.SMB_.P1BE */
                            Sleep (0x28)
                            Store (One, ^^SMB.P29H) /* \_SB_.PCI0.SMB_.P29H */
                            Store (One, ^^SMB.P29S) /* \_SB_.PCI0.SMB_.P29S */
                            Store (Zero, ^^SMB.P29U) /* \_SB_.PCI0.SMB_.P29U */
                            Sleep (0x28)
                            Store (0x00, FUCC) /* \_SB_.PCI0.AFD_.AFC2.FUCC */
                            Store (0x07, DEVV) /* \_SB_.PCI0.AFD_.AFC2.DEVV */
                            Store (0x00, BUSS) /* \_SB_.PCI0.AFD_.AFC2.BUSS */
                            Store (0x01, HPST) /* \_SB_.PCI0.AFD_.AFC2.HPST */
                            ALIB (0x06, CALB)
                            Sleep (0x28)
                            Store (^^PB7.XPDV.DISF, Local0)
                            And (Local0, 0xFFFFFFF9, Local0)
                            Store (Local0, ^^PB7.XPDV.DISF) /* \_SB_.PCI0.PB7_.XPDV.DISF */
                            Notify (^^PB7.XPDV, 0x01) // Device Check
                            Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            Store (0xAF61, P80H) /* \P80H */
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMB.P3BO, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }
                    }

                    If (LEqual (DIND, 0x07))
                    {
                        Store (0x02, ^^SMB.M200) /* \_SB_.PCI0.SMB_.M200 */
                        If (LEqual (PWST, 0x00))
                        {
                            Notify (^^SPB1.XPDV, 0x03) // Eject Request
                            Store (0x00, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            Store (0xAE70, P80H) /* \P80H */
                        }

                        If (LEqual (PWST, 0x01))
                        {
                            Store (0x01, ^^SMB.PC8O) /* \_SB_.PCI0.SMB_.PC8O */
                            Store (0x00, ^^SMB.PC8E) /* \_SB_.PCI0.SMB_.PC8E */
                            Sleep (0x28)
                            Store (^^SMB.MS03, Local0)
                            Or (Local0, 0xF0, Local1)
                            Store (Local1, ^^SMB.MS03) /* \_SB_.PCI0.SMB_.MS03 */
                            Store (One, ^^SMB.P2EH) /* \_SB_.PCI0.SMB_.P2EH */
                            Store (One, ^^SMB.P2ES) /* \_SB_.PCI0.SMB_.P2ES */
                            Store (Zero, ^^SMB.P2EU) /* \_SB_.PCI0.SMB_.P2EU */
                            Sleep (0x28)
                            Notify (^^SPB1.XPDV, 0x01) // Device Check
                            Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                            Store (0xAE71, P80H) /* \P80H */
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMB.PC8O, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }
                    }

                    If (LEqual (DIND, 0x08))
                    {
                        Store (0x02, ^^SMB.M197) /* \_SB_.PCI0.SMB_.M197 */
                        If (LEqual (PWST, 0x00))
                        {
                            Notify (^^PB4.XPDV, 0x03) // Eject Request
                            Store (0x00, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0x01))
                        {
                            Store (0x01, ^^SMB.PC5O) /* \_SB_.PCI0.SMB_.PC5O */
                            Store (0x00, ^^SMB.PC5E) /* \_SB_.PCI0.SMB_.PC5E */
                            Sleep (0xC8)
                            Store (^^SMB.MS01, Local0)
                            Or (Local0, 0xF0, Local1)
                            Store (Local1, ^^SMB.MS01) /* \_SB_.PCI0.SMB_.MS01 */
                            Store (One, ^^SMB.P3FH) /* \_SB_.PCI0.SMB_.P3FH */
                            Store (One, ^^SMB.P3FS) /* \_SB_.PCI0.SMB_.P3FS */
                            Store (Zero, ^^SMB.P3FU) /* \_SB_.PCI0.SMB_.P3FU */
                            Sleep (0xC8)
                            Store (0x00, FUCC) /* \_SB_.PCI0.AFD_.AFC2.FUCC */
                            Store (0x04, DEVV) /* \_SB_.PCI0.AFD_.AFC2.DEVV */
                            Store (0x00, BUSS) /* \_SB_.PCI0.AFD_.AFC2.BUSS */
                            Store (0x01, HPST) /* \_SB_.PCI0.AFD_.AFC2.HPST */
                            ALIB (0x06, CALB)
                            Notify (^^PB4.XPDV, 0x01) // Device Check
                            Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMB.PC5O, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }
                    }

                    If (LEqual (DIND, 0x09))
                    {
                        Store (0x01, ^^SMB.M176) /* \_SB_.PCI0.SMB_.M176 */
                        If (LEqual (PWST, 0x00))
                        {
                            Notify (^^PB6.XPDV, 0x03) // Eject Request
                            Store (0x00, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0x01))
                        {
                            Sleep (0x28)
                            Store (0x01, ^^SMB.P0EO) /* \_SB_.PCI0.SMB_.P0EO */
                            Store (0x00, ^^SMB.P0EE) /* \_SB_.PCI0.SMB_.P0EE */
                            Store (0x00, ^^SMB.PB0O) /* \_SB_.PCI0.SMB_.PB0O */
                            Store (0x00, ^^SMB.PB0E) /* \_SB_.PCI0.SMB_.PB0E */
                            Sleep (0xC8)
                            Store (^^SMB.MS02, Local0)
                            Or (Local0, 0x0F, Local1)
                            Store (Local1, ^^SMB.MS02) /* \_SB_.PCI0.SMB_.MS02 */
                            Sleep (0x28)
                            Store (One, ^^SMB.P40H) /* \_SB_.PCI0.SMB_.P40H */
                            Store (One, ^^SMB.P40S) /* \_SB_.PCI0.SMB_.P40S */
                            Store (Zero, ^^SMB.P40U) /* \_SB_.PCI0.SMB_.P40U */
                            Sleep (0xC8)
                            Store (0x00, FUCC) /* \_SB_.PCI0.AFD_.AFC2.FUCC */
                            Store (0x06, DEVV) /* \_SB_.PCI0.AFD_.AFC2.DEVV */
                            Store (0x00, BUSS) /* \_SB_.PCI0.AFD_.AFC2.BUSS */
                            Store (0x01, HPST) /* \_SB_.PCI0.AFD_.AFC2.HPST */
                            ALIB (0x06, CALB)
                            Notify (^^PB6.XPDV, 0x01) // Device Check
                            Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMB.PB0O, Local0)
                            And (Local0, 0x01, Local0)
                            XOr (Local0, 0x01, Local0)
                            Store (Local0, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }
                    }

                    If (LEqual (DIND, 0x0A))
                    {
                        Store (0x01, ^^SMB.M175) /* \_SB_.PCI0.SMB_.M175 */
                        If (LEqual (PWST, 0x00))
                        {
                            Notify (^^SPB0.XPDV, 0x03) // Eject Request
                            Store (0x00, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0x01))
                        {
                            Store (0x01, ^^SMB.P0CO) /* \_SB_.PCI0.SMB_.P0CO */
                            Store (0x00, ^^SMB.P0CE) /* \_SB_.PCI0.SMB_.P0CE */
                            Sleep (0x28)
                            Store (0x00, ^^SMB.PAFO) /* \_SB_.PCI0.SMB_.PAFO */
                            Store (0x00, ^^SMB.PAFE) /* \_SB_.PCI0.SMB_.PAFE */
                            Sleep (0xC8)
                            Notify (^^SPB0.XPDV, 0x01) // Device Check
                            Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMB.PAFO, Local0)
                            And (Local0, 0x01, Local0)
                            XOr (Local0, 0x01, Local0)
                            Store (Local0, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }
                    }

                    If (LEqual (DIND, 0x0B))
                    {
                        Store (0x01, ^^SMB.PB1O) /* \_SB_.PCI0.SMB_.PB1O */
                        If (LEqual (PWST, 0x00))
                        {
                            Notify (^^PB5.XPDV, 0x03) // Eject Request
                            Store (0x00, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0x01))
                        {
                            Sleep (0x28)
                            Store (0x01, ^^SMB.P0DO) /* \_SB_.PCI0.SMB_.P0DO */
                            Store (0x00, ^^SMB.P0DE) /* \_SB_.PCI0.SMB_.P0DE */
                            Store (0x00, ^^SMB.PB1O) /* \_SB_.PCI0.SMB_.PB1O */
                            Store (0x00, ^^SMB.PB1E) /* \_SB_.PCI0.SMB_.PB1E */
                            Sleep (0xC8)
                            Store (^^SMB.MS01, Local0)
                            Or (Local0, 0x0F, Local1)
                            Store (Local1, ^^SMB.MS01) /* \_SB_.PCI0.SMB_.MS01 */
                            Sleep (0x28)
                            Store (One, ^^SMB.P3EH) /* \_SB_.PCI0.SMB_.P3EH */
                            Store (One, ^^SMB.P3ES) /* \_SB_.PCI0.SMB_.P3ES */
                            Store (Zero, ^^SMB.P3EU) /* \_SB_.PCI0.SMB_.P3EU */
                            Sleep (0xC8)
                            Store (0x00, FUCC) /* \_SB_.PCI0.AFD_.AFC2.FUCC */
                            Store (0x05, DEVV) /* \_SB_.PCI0.AFD_.AFC2.DEVV */
                            Store (0x00, BUSS) /* \_SB_.PCI0.AFD_.AFC2.BUSS */
                            Store (0x01, HPST) /* \_SB_.PCI0.AFD_.AFC2.HPST */
                            ALIB (0x06, CALB)
                            Notify (^^PB5.XPDV, 0x01) // Device Check
                            Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMB.PB1O, Local0)
                            And (Local0, 0x01, Local0)
                            XOr (Local0, 0x01, Local0)
                            Store (Local0, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }
                    }

                    If (LEqual (DIND, 0x0C))
                    {
                        Store (0x01, ^^SMB.MX23) /* \_SB_.PCI0.SMB_.MX23 */
                        If (LEqual (PWST, 0x00))
                        {
                            Store (0x00, ^^SMB.P17O) /* \_SB_.PCI0.SMB_.P17O */
                            Store (0x00, ^^SMB.P17E) /* \_SB_.PCI0.SMB_.P17E */
                            Store (0x00, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0x01))
                        {
                            Store (0x01, ^^SMB.P17O) /* \_SB_.PCI0.SMB_.P17O */
                            Store (0x00, ^^SMB.P17E) /* \_SB_.PCI0.SMB_.P17E */
                            Sleep (0xC8)
                            Store (0x01, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }

                        If (LEqual (PWST, 0xFF))
                        {
                            Store (^^SMB.P17O, FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                        }
                    }

                    Store (0xAE02, P80H) /* \P80H */
                    Return (FLAG) /* \_SB_.PCI0.AFD_.AFC2.FLAG */
                }
            }

            Scope (SATA.PRID)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    Store (0x00, ^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                    If (LEqual (^^^AFD.HDD0, 0x01))
                    {
                        Store (0x00, ^^^SMB.P39O) /* \_SB_.PCI0.SMB_.P39O */
                        Store (0x00, ^^^SMB.P39E) /* \_SB_.PCI0.SMB_.P39E */
                    }
                    Else
                    {
                        Store (0x00, ^^^SMB.P35O) /* \_SB_.PCI0.SMB_.P35O */
                        Store (0x00, ^^^SMB.P35E) /* \_SB_.PCI0.SMB_.P35E */
                    }

                    Sleep (0x28)
                    Store (0x01, ^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                }
            }

            Scope (SATA.PRID.P_D0)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    Store (0x00, ^^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                    Store (0x00, ^^^^SMB.P39O) /* \_SB_.PCI0.SMB_.P39O */
                    Store (0x00, ^^^^SMB.P39E) /* \_SB_.PCI0.SMB_.P39E */
                    Sleep (0x28)
                    Store (0x01, ^^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                }
            }

            Scope (SATA.PRT1)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    Store (0x00, ^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                    Store (0x00, ^^^SMB.P39O) /* \_SB_.PCI0.SMB_.P39O */
                    Store (0x00, ^^^SMB.P39E) /* \_SB_.PCI0.SMB_.P39E */
                    Sleep (0x28)
                    Store (0x01, ^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                }
            }

            Scope (SATA.PRT1.ODD)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    Store (0x00, ^^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                    Store (0x00, ^^^^SMB.P39O) /* \_SB_.PCI0.SMB_.P39O */
                    Store (0x00, ^^^^SMB.P39E) /* \_SB_.PCI0.SMB_.P39E */
                    Sleep (0x28)
                    Store (0x01, ^^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                }
            }

            Scope (SATA.SECD)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    Store (0x00, ^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                    Store (0x00, ^^^SMB.P39O) /* \_SB_.PCI0.SMB_.P39O */
                    Store (0x00, ^^^SMB.P39E) /* \_SB_.PCI0.SMB_.P39E */
                    Sleep (0x28)
                    Store (0x01, ^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                }
            }

            Scope (SATA.PRID.P_D1)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    Store (0x00, ^^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                    Store (0x00, ^^^^SMB.P39O) /* \_SB_.PCI0.SMB_.P39O */
                    Store (0x00, ^^^^SMB.P39E) /* \_SB_.PCI0.SMB_.P39E */
                    Sleep (0x28)
                    Store (0x01, ^^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                }
            }

            Scope (PB2.VGA)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    Sleep (0x28)
                    ^^^VGA.PX02 (0x00)
                    Sleep (0x28)
                }
            }

            Scope (PB3.VGA)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    Sleep (0x28)
                    ^^^VGA.PX02 (0x00)
                    Sleep (0x28)
                }
            }

            Scope (PB7.XPDV)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    CreateWordField (CALB, 0x00, SZZE)
                    CreateField (CALB, 0x10, 0x03, FUCC)
                    CreateField (CALB, 0x13, 0x05, DEVV)
                    CreateField (CALB, 0x18, 0x08, BUSS)
                    CreateByteField (CALB, 0x04, HPST)
                    Store (0x05, SZZE) /* \_SB_.PCI0.PB7_.XPDV._EJX.SZZE */
                    Store (0x00, FUCC) /* \_SB_.PCI0.PB7_.XPDV._EJX.FUCC */
                    Store (0x07, DEVV) /* \_SB_.PCI0.PB7_.XPDV._EJX.DEVV */
                    Store (0x00, BUSS) /* \_SB_.PCI0.PB7_.XPDV._EJX.BUSS */
                    Store (0x00, HPST) /* \_SB_.PCI0.PB7_.XPDV._EJX.HPST */
                    ALIB (0x06, CALB)
                    Sleep (0x28)
                    Store (One, ^^^SMB.P29H) /* \_SB_.PCI0.SMB_.P29H */
                    Store (One, ^^^SMB.P29S) /* \_SB_.PCI0.SMB_.P29S */
                    Store (One, ^^^SMB.P29U) /* \_SB_.PCI0.SMB_.P29U */
                    Sleep (0x28)
                    Store (^^^SMB.MS04, Local0)
                    And (Local0, 0xFFFFFFF0, Local1)
                    Store (Local1, ^^^SMB.MS04) /* \_SB_.PCI0.SMB_.MS04 */
                    Sleep (0x28)
                    Store (0x00, ^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                    Store (0x00, ^^^SMB.P3BO) /* \_SB_.PCI0.SMB_.P3BO */
                    Store (0x00, ^^^SMB.P3BE) /* \_SB_.PCI0.SMB_.P3BE */
                    Sleep (0x28)
                    Store (0x01, ^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                    Store (0x00, ^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                    Sleep (0x28)
                }
            }

            Scope (SPB1.XPDV)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    Store (One, ^^^SMB.P2EH) /* \_SB_.PCI0.SMB_.P2EH */
                    Store (One, ^^^SMB.P2ES) /* \_SB_.PCI0.SMB_.P2ES */
                    Store (One, ^^^SMB.P2EU) /* \_SB_.PCI0.SMB_.P2EU */
                    Sleep (0x28)
                    Store (^^^SMB.MS03, Local0)
                    And (Local0, 0xFFFFFF0F, Local1)
                    Store (Local1, ^^^SMB.MS03) /* \_SB_.PCI0.SMB_.MS03 */
                    Store (0x00, ^^^SMB.PC8O) /* \_SB_.PCI0.SMB_.PC8O */
                    Store (0x00, ^^^SMB.PC8E) /* \_SB_.PCI0.SMB_.PC8E */
                    Sleep (0x28)
                }
            }

            Scope (SPB0.XPDV)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    Store (0x01, ^^^SMB.PAFO) /* \_SB_.PCI0.SMB_.PAFO */
                    Store (0x00, ^^^SMB.PAFE) /* \_SB_.PCI0.SMB_.PAFE */
                    Store (0x00, ^^^SMB.P0CO) /* \_SB_.PCI0.SMB_.P0CO */
                    Store (0x00, ^^^SMB.P0CE) /* \_SB_.PCI0.SMB_.P0CE */
                    Sleep (0x28)
                }
            }

            Scope (PB4.XPDV)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    CreateWordField (CALB, 0x00, SZZE)
                    CreateField (CALB, 0x10, 0x03, FUCC)
                    CreateField (CALB, 0x13, 0x05, DEVV)
                    CreateField (CALB, 0x18, 0x08, BUSS)
                    CreateByteField (CALB, 0x04, HPST)
                    Store (0x05, SZZE) /* \_SB_.PCI0.PB4_.XPDV._EJX.SZZE */
                    Store (0x00, FUCC) /* \_SB_.PCI0.PB4_.XPDV._EJX.FUCC */
                    Store (0x04, DEVV) /* \_SB_.PCI0.PB4_.XPDV._EJX.DEVV */
                    Store (0x00, BUSS) /* \_SB_.PCI0.PB4_.XPDV._EJX.BUSS */
                    Store (0x00, HPST) /* \_SB_.PCI0.PB4_.XPDV._EJX.HPST */
                    ALIB (0x06, CALB)
                    Sleep (0x28)
                    Store (One, ^^^SMB.P3FH) /* \_SB_.PCI0.SMB_.P3FH */
                    Store (One, ^^^SMB.P3FS) /* \_SB_.PCI0.SMB_.P3FS */
                    Store (One, ^^^SMB.P3FU) /* \_SB_.PCI0.SMB_.P3FU */
                    Sleep (0x28)
                    Store (^^^SMB.MS01, Local0)
                    And (Local0, 0xFFFFFF0F, Local1)
                    Store (Local1, ^^^SMB.MS01) /* \_SB_.PCI0.SMB_.MS01 */
                    Sleep (0x28)
                    Store (0x00, ^^^SMB.PC5O) /* \_SB_.PCI0.SMB_.PC5O */
                    Store (0x00, ^^^SMB.PC5E) /* \_SB_.PCI0.SMB_.PC5E */
                    Sleep (0x28)
                }
            }

            Scope (PB5.XPDV)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    CreateWordField (CALB, 0x00, SZZE)
                    CreateField (CALB, 0x10, 0x03, FUCC)
                    CreateField (CALB, 0x13, 0x05, DEVV)
                    CreateField (CALB, 0x18, 0x08, BUSS)
                    CreateByteField (CALB, 0x04, HPST)
                    Store (0x05, SZZE) /* \_SB_.PCI0.PB5_.XPDV._EJX.SZZE */
                    Store (0x00, FUCC) /* \_SB_.PCI0.PB5_.XPDV._EJX.FUCC */
                    Store (0x05, DEVV) /* \_SB_.PCI0.PB5_.XPDV._EJX.DEVV */
                    Store (0x00, BUSS) /* \_SB_.PCI0.PB5_.XPDV._EJX.BUSS */
                    Store (0x00, HPST) /* \_SB_.PCI0.PB5_.XPDV._EJX.HPST */
                    ALIB (0x06, CALB)
                    Sleep (0x28)
                    Store (One, ^^^SMB.P3EH) /* \_SB_.PCI0.SMB_.P3EH */
                    Store (One, ^^^SMB.P3ES) /* \_SB_.PCI0.SMB_.P3ES */
                    Store (One, ^^^SMB.P3EU) /* \_SB_.PCI0.SMB_.P3EU */
                    Sleep (0x28)
                    Store (^^^SMB.MS01, Local0)
                    And (Local0, 0xFFFFFFF0, Local1)
                    Store (Local1, ^^^SMB.MS01) /* \_SB_.PCI0.SMB_.MS01 */
                    Sleep (0x28)
                    Store (0x01, ^^^SMB.PB1O) /* \_SB_.PCI0.SMB_.PB1O */
                    Store (0x00, ^^^SMB.PB1E) /* \_SB_.PCI0.SMB_.PB1E */
                    Sleep (0x28)
                    Store (0x00, ^^^SMB.P0DO) /* \_SB_.PCI0.SMB_.P0DO */
                    Store (0x00, ^^^SMB.P0DE) /* \_SB_.PCI0.SMB_.P0DE */
                    Sleep (0x28)
                }
            }

            Scope (PB6.XPDV)
            {
                Method (_EJX, 1, NotSerialized)
                {
                    CreateWordField (CALB, 0x00, SZZE)
                    CreateField (CALB, 0x10, 0x03, FUCC)
                    CreateField (CALB, 0x13, 0x05, DEVV)
                    CreateField (CALB, 0x18, 0x08, BUSS)
                    CreateByteField (CALB, 0x04, HPST)
                    Store (0x05, SZZE) /* \_SB_.PCI0.PB6_.XPDV._EJX.SZZE */
                    Store (0x00, FUCC) /* \_SB_.PCI0.PB6_.XPDV._EJX.FUCC */
                    Store (0x06, DEVV) /* \_SB_.PCI0.PB6_.XPDV._EJX.DEVV */
                    Store (0x00, BUSS) /* \_SB_.PCI0.PB6_.XPDV._EJX.BUSS */
                    Store (0x00, HPST) /* \_SB_.PCI0.PB6_.XPDV._EJX.HPST */
                    ALIB (0x06, CALB)
                    Sleep (0x28)
                    Store (One, ^^^SMB.P40H) /* \_SB_.PCI0.SMB_.P40H */
                    Store (One, ^^^SMB.P40S) /* \_SB_.PCI0.SMB_.P40S */
                    Store (One, ^^^SMB.P40U) /* \_SB_.PCI0.SMB_.P40U */
                    Sleep (0x28)
                    Store (^^^SMB.MS02, Local0)
                    And (Local0, 0xFFFFFFF0, Local1)
                    Store (Local1, ^^^SMB.MS02) /* \_SB_.PCI0.SMB_.MS02 */
                    Sleep (0x28)
                    Store (0x01, ^^^SMB.PB0O) /* \_SB_.PCI0.SMB_.PB0O */
                    Store (0x00, ^^^SMB.PB0E) /* \_SB_.PCI0.SMB_.PB0E */
                    Sleep (0x28)
                    Store (0x00, ^^^SMB.P0EO) /* \_SB_.PCI0.SMB_.P0EO */
                    Store (0x00, ^^^SMB.P0EE) /* \_SB_.PCI0.SMB_.P0EE */
                    Sleep (0x28)
                }
            }

            Scope (SATA)
            {
                Device (ODDZ)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                    Name (ODPS, 0x00)
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (^^^AFD.ODZP, 0x80000000))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                    {
                        Store (0xDF00, P80H) /* \P80H */
                        If (LEqual (^^^AFD.ODZP, 0x80000001))
                        {
                            If (LEqual (VIDI, 0x78041022))
                            {
                                Store (0x00, DIS1) /* \_SB_.PCI0.SATA.DIS1 */
                                Store (0x01, WREN) /* \_SB_.PCI0.SATA.WREN */
                                Store (0x01, PI1) /* \_SB_.PCI0.SATA.PI1_ */
                                Store (0x00, WREN) /* \_SB_.PCI0.SATA.WREN */
                                Sleep (0x28)
                                Store (0x00, ^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                                Store (0x00, ^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                                Store (0x01, ^^^SMB.P35O) /* \_SB_.PCI0.SMB_.P35O */
                                Store (0x00, ^^^SMB.P35E) /* \_SB_.PCI0.SMB_.P35E */
                                Sleep (0x28)
                            }
                        }

                        Store (0x00, ODPS) /* \_SB_.PCI0.SATA.ODDZ.ODPS */
                    }

                    Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                    {
                        Store (0xDF03, P80H) /* \P80H */
                        If (LEqual (^^^AFD.ODZP, 0x80000001))
                        {
                            If (LEqual (VIDI, 0x78041022))
                            {
                                Sleep (0x28)
                                Store (0x00, ^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                                Store (0x00, ^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                                Store (0x00, ^^^SMB.P35O) /* \_SB_.PCI0.SMB_.P35O */
                                Store (0x00, ^^^SMB.P35E) /* \_SB_.PCI0.SMB_.P35E */
                                Sleep (0x28)
                                Store (0x01, DIS1) /* \_SB_.PCI0.SATA.DIS1 */
                                Store (0x01, WREN) /* \_SB_.PCI0.SATA.WREN */
                                Store (0x00, PI1) /* \_SB_.PCI0.SATA.PI1_ */
                                Store (0x00, WREN) /* \_SB_.PCI0.SATA.WREN */
                            }
                        }

                        Store (0x03, ODPS) /* \_SB_.PCI0.SATA.ODDZ.ODPS */
                    }

                    Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
                    {
                        Return (ODPS) /* \_SB_.PCI0.SATA.ODDZ.ODPS */
                    }

                    Device (ODD)
                    {
                        Name (_ADR, 0x00)  // _ADR: Address
                        Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                        {
                            Return (0x01)
                        }

                        Method (_EJX, 1, NotSerialized)
                        {
                            Sleep (0x28)
                            Store (0x00, ^^^^SMB.PAAO) /* \_SB_.PCI0.SMB_.PAAO */
                            Store (0x00, ^^^^SMB.PAAE) /* \_SB_.PCI0.SMB_.PAAE */
                            Store (0x00, ^^^^SMB.P35O) /* \_SB_.PCI0.SMB_.P35O */
                            Store (0x00, ^^^^SMB.P35E) /* \_SB_.PCI0.SMB_.P35E */
                            Sleep (0x28)
                        }
                    }
                }
            }
        }
    }

    Scope (\)
    {
        Name (HPDT, Package (0x09)
        {
            "LEGACYHP", 
            0x80000000, 
            0x80000000, 
            "NATIVEHP", 
            0x80000000, 
            0x80000000, 
            "THERMALX", 
            0x80000000, 
            0x80000000
        })
        Name (DDB0, 0x00)
        Name (DDB1, 0x00)
        Name (DDB2, 0x00)
    }

    Scope (_GPE)
    {
        Method (TRIG, 0, NotSerialized)
        {
            TRIE ()
            TRIC ()
            TRIZ ()
        }

        Method (_L1C, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store (0xFFFF, Local1)
            Store (\_SB.PCI0.SMB.MIN, Local2)
            ShiftLeft (Local2, 0x08, Local1)
            Store (\_SB.PCI0.SMB.SEC, Local2)
            Or (Local1, Local2, Local1)
            Store (Local1, P80H) /* \P80H */
        }

        Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.PB3, 0x02) // Device Wake
            Notify (\_SB.PCI0.PB4, 0x02) // Device Wake
            Notify (\_SB.PCI0.PB5, 0x02) // Device Wake
            Notify (\_SB.PCI0.PB6, 0x02) // Device Wake
            Notify (\_SB.PCI0.PB7, 0x02) // Device Wake
            Notify (\_SB.PCI0.SPB0, 0x02) // Device Wake
            Notify (\_SB.PCI0.SPB1, 0x02) // Device Wake
            Notify (\_SB.PCI0.SPB2, 0x02) // Device Wake
            Notify (\_SB.PCI0.SPB3, 0x02) // Device Wake
        }

        Method (_L18, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.OHC1, 0x02) // Device Wake
            Notify (\_SB.PCI0.OHC2, 0x02) // Device Wake
            Notify (\_SB.PCI0.OHC3, 0x02) // Device Wake
            Notify (\_SB.PCI0.OHC4, 0x02) // Device Wake
            Notify (\_SB.PCI0.EHC1, 0x02) // Device Wake
            Notify (\_SB.PCI0.EHC2, 0x02) // Device Wake
            Notify (\_SB.PCI0.EHC3, 0x02) // Device Wake
        }

        Method (TRIC, 0, NotSerialized)
        {
            Store (Not (\_SB.PCI0.SMB.GE15), \_SB.PCI0.SMB.E15C)
        }

        Method (TRIE, 0, NotSerialized)
        {
            Store (Not (\_SB.PCI0.SMB.GE05), \_SB.PCI0.SMB.E05C)
        }

        Method (TRIZ, 0, NotSerialized)
        {
            Store (Not (\_SB.PCI0.SMB.GE16), \_SB.PCI0.SMB.E16C)
        }

        Method (_L10, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            If (LEqual (\_SB.PCI0.AFD.ODZP, 0x80000001))
            {
                If (\_SB.PCI0.SMB.E16C)
                {
                    Sleep (0x14)
                    If (\_SB.PCI0.SMB.E16C)
                    {
                        If (\_SB.PCI0.SMB.GE16)
                        {
                            Store (Zero, \_SB.PCI0.SMB.E16C)
                            If (LOr (LEqual (\_SB.PCI0.SATA.VIDI, 0x78001022), LEqual (\_SB.PCI0.SATA.VIDI, 0x78011022)))
                            {
                                Notify (\_SB.PCI0.AFD, 0x80) // Status Change
                            }

                            If (LEqual (\_SB.PCI0.SATA.VIDI, 0x78041022))
                            {
                                If (LEqual (\_SB.PCI0.AFD.HDD0, 0x01))
                                {
                                    Notify (\_SB.PCI0.SATA.ODDZ, 0x80) // Status Change
                                }
                                Else
                                {
                                    Notify (\_SB.PCI0.SATA.ODDZ, 0x80) // Status Change
                                }
                            }

                            Store (0xDF15, P80H) /* \P80H */
                        }
                    }
                }
                Else
                {
                    Sleep (0x14)
                    If (LNot (\_SB.PCI0.SMB.GE16))
                    {
                        Store (One, \_SB.PCI0.SMB.E16C)
                        If (LOr (LEqual (\_SB.PCI0.SATA.VIDI, 0x78001022), LEqual (\_SB.PCI0.SATA.VIDI, 0x78011022)))
                        {
                            Notify (\_SB.PCI0.AFD, 0x80) // Status Change
                        }

                        If (LEqual (\_SB.PCI0.SATA.VIDI, 0x78041022))
                        {
                            If (LEqual (\_SB.PCI0.AFD.HDD0, 0x01))
                            {
                                Notify (\_SB.PCI0.SATA.ODDZ, 0x80) // Status Change
                            }
                            Else
                            {
                                Notify (\_SB.PCI0.SATA.ODDZ, 0x80) // Status Change
                            }
                        }

                        Store (0xDF14, P80H) /* \P80H */
                    }
                }

                TRIZ ()
            }
        }
    }

    Scope (_SB.PCI0.SMB)
    {
        Mutex (SBX0, 0x00)
        OperationRegion (SMB0, SystemIO, 0x0B00, 0x10)
        Field (SMB0, ByteAcc, NoLock, Preserve)
        {
            HST0,   8, 
            SLV0,   8, 
            CNT0,   8, 
            CMD0,   8, 
            ADD0,   8, 
            DT00,   8, 
            DT10,   8, 
            BLK0,   8
        }

        Method (WBD0, 1, NotSerialized)
        {
            Store (Arg0, Local0)
            Store (0x00, Local2)
            Store (HST0, Local3)
            Store (And (Local3, 0x80), Local1)
            While (LNotEqual (Local1, 0x80))
            {
                If (LLess (Local0, 0x0A))
                {
                    Store (0x18, Local2)
                    Store (0x00, Local1)
                }
                Else
                {
                    Sleep (0x0A)
                    Subtract (Local0, 0x0A, Local0)
                    Store (HST0, Local3)
                    Store (And (Local3, 0x80), Local1)
                }
            }

            If (LNotEqual (Local2, 0x18))
            {
                Store (And (HST0, 0x1C), Local1)
                If (Local1)
                {
                    Store (0x07, Local2)
                }
            }

            Return (Local2)
        }

        Method (WTC0, 1, NotSerialized)
        {
            Store (Arg0, Local0)
            Store (0x07, Local2)
            Store (0x01, Local1)
            While (LEqual (Local1, 0x01))
            {
                Store (And (HST0, 0x1D), Local3)
                If (LNotEqual (Local3, 0x00))
                {
                    If (LEqual (Local3, 0x01))
                    {
                        If (LLess (Local0, 0x0A))
                        {
                            Store (0x18, Local2)
                            Store (0x00, Local1)
                        }
                        Else
                        {
                            Sleep (0x0A)
                            Subtract (Local0, 0x0A, Local0)
                        }
                    }
                    Else
                    {
                        Store (0x07, Local2)
                        Store (0x00, Local1)
                    }
                }
                Else
                {
                    Store (0x00, Local2)
                    Store (0x00, Local1)
                }
            }

            Store (Or (HST0, 0x1F), HST0) /* \_SB_.PCI0.SMB_.HST0 */
            Return (Local2)
        }

        Method (SBR0, 3, NotSerialized)
        {
            Store (Package (0x22)
                {
                    0x07, 
                    0x00, 
                    0x00
                }, Local0)
            Store (And (Arg0, 0x5F), Local4)
            If (LNotEqual (Local4, 0x03))
            {
                If (LNotEqual (Local4, 0x05))
                {
                    If (LNotEqual (Local4, 0x07))
                    {
                        If (LNotEqual (Local4, 0x09))
                        {
                            If (LNotEqual (Local4, 0x0B))
                            {
                                Store (0x19, Index (Local0, 0x00))
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            If (LEqual (Acquire (SBX0, 0xFFFF), 0x00))
            {
                Store (Or (ShiftLeft (Arg1, 0x01), 0x01), ADD0) /* \_SB_.PCI0.SMB_.ADD0 */
                Store (Arg2, CMD0) /* \_SB_.PCI0.SMB_.CMD0 */
                Store (Or (HST0, 0x1F), HST0) /* \_SB_.PCI0.SMB_.HST0 */
                Store (And (Arg0, 0xA0), Local1)
                Store (Or (And (CNT0, 0x5F), Local1), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                If (LEqual (Local4, 0x03))
                {
                    Store (Or (And (CNT0, 0xA0), 0x40), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                }

                If (LEqual (Local4, 0x05))
                {
                    Store (Or (And (CNT0, 0xA0), 0x44), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                }

                If (LEqual (Local4, 0x07))
                {
                    Store (Or (And (CNT0, 0xA0), 0x48), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                }

                If (LEqual (Local4, 0x09))
                {
                    Store (Or (And (CNT0, 0xA0), 0x4C), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                }

                If (LEqual (Local4, 0x0B))
                {
                    Store (Or (HST0, 0x80), HST0) /* \_SB_.PCI0.SMB_.HST0 */
                    Store (0x00, DT00) /* \_SB_.PCI0.SMB_.DT00 */
                    Store (Or (And (CNT0, 0xA0), 0x54), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                }

                Store (WTC0 (0x03E8), Local1)
                Store (Local1, Index (Local0, 0x00))
                If (LEqual (Local1, 0x00))
                {
                    If (LEqual (Local4, 0x05))
                    {
                        Store (0x01, Index (Local0, 0x01))
                        Store (DT00, Index (Local0, 0x02))
                    }

                    If (LEqual (Local4, 0x07))
                    {
                        Store (0x01, Index (Local0, 0x01))
                        Store (DT00, Index (Local0, 0x02))
                    }

                    If (LEqual (Local4, 0x09))
                    {
                        Store (0x02, Index (Local0, 0x01))
                        Store (DT10, Local2)
                        ShiftLeft (Local2, 0x08, Local2)
                        Add (Local2, DT00, Local2)
                        Store (Local2, Index (Local0, 0x02))
                    }

                    If (LEqual (Local4, 0x0B))
                    {
                        Store (WBD0 (0x01F4), Local1)
                        If (LNotEqual (Local1, 0x00))
                        {
                            Store (Local1, Index (Local0, 0x00))
                        }
                        Else
                        {
                            Store (DT00, Index (Local0, 0x01))
                            Store (DT00, Local1)
                            Store (CNT0, Local2)
                            Store (0x00, Local2)
                            While (LLess (Local2, Local1))
                            {
                                Add (0x02, Local2, Local3)
                                Store (BLK0, Index (Local0, Local3))
                                Add (0x01, Local2, Local2)
                            }

                            Store (Or (HST0, 0x80), HST0) /* \_SB_.PCI0.SMB_.HST0 */
                        }
                    }
                }

                Store (And (CNT0, 0x5F), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                Release (SBX0)
            }

            Return (Local0)
        }

        Method (SBW0, 5, NotSerialized)
        {
            Store (Package (0x01)
                {
                    0x07
                }, Local0)
            Store (And (Arg0, 0x5F), Local4)
            If (LNotEqual (Local4, 0x02))
            {
                If (LNotEqual (Local4, 0x04))
                {
                    If (LNotEqual (Local4, 0x06))
                    {
                        If (LNotEqual (Local4, 0x08))
                        {
                            If (LNotEqual (Local4, 0x0A))
                            {
                                Store (0x19, Index (Local0, 0x00))
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            If (LEqual (Acquire (SBX0, 0xFFFF), 0x00))
            {
                Store (ShiftLeft (Arg1, 0x01), ADD0) /* \_SB_.PCI0.SMB_.ADD0 */
                Store (Arg2, CMD0) /* \_SB_.PCI0.SMB_.CMD0 */
                Store (Or (HST0, 0x1F), HST0) /* \_SB_.PCI0.SMB_.HST0 */
                Store (And (Arg0, 0xA0), Local1)
                Store (Or (And (CNT0, 0x5F), Local1), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                If (LEqual (Local4, 0x02))
                {
                    Store (Or (And (CNT0, 0xA0), 0x40), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                }

                If (LEqual (Local4, 0x04))
                {
                    Store (Or (And (CNT0, 0xA0), 0x44), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                }

                If (LEqual (Local4, 0x06))
                {
                    Store (Arg4, DT00) /* \_SB_.PCI0.SMB_.DT00 */
                    Store (Or (And (CNT0, 0xA0), 0x48), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                }

                If (LEqual (Local4, 0x08))
                {
                    And (Arg4, 0xFF, DT00) /* \_SB_.PCI0.SMB_.DT00 */
                    ShiftRight (Arg4, 0x08, DT10) /* \_SB_.PCI0.SMB_.DT10 */
                    Store (Or (And (CNT0, 0xA0), 0x4C), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                }

                If (LEqual (Local4, 0x0A))
                {
                    Store (Or (HST0, 0x80), HST0) /* \_SB_.PCI0.SMB_.HST0 */
                    Store (CNT0, Local1)
                    Store (Arg3, DT00) /* \_SB_.PCI0.SMB_.DT00 */
                    Store (0x00, Local2)
                    While (LLess (Local2, Arg3))
                    {
                        Store (Index (Arg4, Local2), BLK0) /* \_SB_.PCI0.SMB_.BLK0 */
                        Add (0x01, Local2, Local2)
                    }

                    Store (Or (And (CNT0, 0xA0), 0x54), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                }

                Store (WTC0 (0x03E8), Index (Local0, 0x00))
                Store (And (CNT0, 0x5F), CNT0) /* \_SB_.PCI0.SMB_.CNT0 */
                Release (SBX0)
            }

            Return (Local0)
        }
    }

    Scope (\)
    {
        OperationRegion (CNVS, SystemMemory, 0xBF49A018, 0x00000800)
        Field (CNVS, AnyAcc, Lock, Preserve)
        {
            SFUN,   8, 
            SPR0,   8, 
            SPR1,   8, 
            SPR2,   8, 
            WNVA,   32, 
            WNVB,   32, 
            WNVC,   32, 
            WNVD,   32, 
            WFLG,   32, 
            WNVS,   32, 
            WNVI,   32, 
            TSMI,   8, 
            Offset (0x400), 
            WDBA,   32, 
            Offset (0x408), 
            SGSD,   32, 
            CDST,   16, 
            NDST,   16, 
            Offset (0x411), 
            Offset (0x412), 
            SKUT,   8, 
            MOID,   8, 
            GPUT,   8, 
            PMDP,   8, 
            VNTR,   8, 
            TRBO,   8, 
            Offset (0x419), 
            Offset (0x41A), 
            Offset (0x420), 
            Offset (0x440), 
            Offset (0x600), 
            Offset (0x640), 
            WLPS,   1, 
            WRST,   1, 
            Offset (0x641), 
            BTPS,   1, 
            BTST,   1, 
            Offset (0x642), 
            WNPS,   1, 
            WNST,   1, 
            Offset (0x643), 
            WIMX,   1, 
            Offset (0x644), 
            CENS,   1, 
            Offset (0x645), 
            GCCR,   8, 
            SZPO,   8, 
            Offset (0x650), 
            TCNT,   8, 
            PSMV,   8
        }

        Method (TRPS, 2, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            Store (Arg1, SPR0) /* \SPR0 */
            Store (Arg0, SFUN) /* \SFUN */
            Store (TSMI, SSMP) /* \SSMP */
            Store (SPR0, Local0)
            Release (MSMI)
            Return (Local0)
        }
    }

    Scope (\)
    {
        OperationRegion (SPRT, SystemIO, 0xB0, 0x02)
        Field (SPRT, ByteAcc, Lock, Preserve)
        {
            SSMP,   8
        }

        Mutex (MSMI, 0x07)
        Method (WSMI, 1, NotSerialized)
        {
            Store (Arg0, SFUN) /* \SFUN */
            Store (TSMI, SSMP) /* \SSMP */
        }

        Method (HKEY, 1, NotSerialized)
        {
            TRPS (0x14, Arg0)
        }

        Method (LAMN, 1, NotSerialized)
        {
            If (\_SB.AMW0.WLMP)
            {
                Store (Arg0, \_SB.AMW0.WLID)
                Notify (\_SB.AMW0, 0xB0) // Device-Specific
            }
            Else
            {
                TRPS (0x13, Arg0)
            }
        }

        Method (RBEC, 1, NotSerialized)
        {
            Return (TRPS (0x10, Arg0))
        }

        Method (WBEC, 2, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            Store (Arg1, SPR1) /* \SPR1 */
            Store (Arg0, SPR0) /* \SPR0 */
            Store (0x11, SFUN) /* \SFUN */
            Store (TSMI, SSMP) /* \SSMP */
            Release (MSMI)
        }

        Method (MBEC, 3, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            Store (Arg2, SPR2) /* \SPR2 */
            Store (Arg1, SPR1) /* \SPR1 */
            Store (Arg0, SPR0) /* \SPR0 */
            Store (0x12, SFUN) /* \SFUN */
            Store (TSMI, SSMP) /* \SSMP */
            Release (MSMI)
        }
    }

    Scope (\)
    {
        Name (BCEN, 0x01)
        Name (BCVE, 0x00)
        Name (SGEN, 0x00)
        Name (PSBN, 0x00)
        Name (ECON, 0x00)
        Name (VDSS, 0x00)
        Name (DSEN, 0x00)
        Name (CADL, 0x00)
        Name (PADL, 0x00)
    }

    Scope (_SB.PCI0.LPC0)
    {
        Device (EC0)
        {
            Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
            Name (_GPE, 0x03)  // _GPE: General Purpose Events
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0062,             // Range Minimum
                    0x0062,             // Range Maximum
                    0x00,               // Alignment
                    0x01,               // Length
                    )
                IO (Decode16,
                    0x0066,             // Range Minimum
                    0x0066,             // Range Maximum
                    0x00,               // Alignment
                    0x01,               // Length
                    )
            })
            OperationRegion (ECO1, SystemIO, 0x62, 0x01)
            Field (ECO1, ByteAcc, Lock, Preserve)
            {
                PX62,   8
            }

            OperationRegion (ECO2, SystemIO, 0x66, 0x01)
            Field (ECO2, ByteAcc, Lock, Preserve)
            {
                PX66,   8
            }

            OperationRegion (ECMB, SystemMemory, 0xFF802000, 0x0200)
            OperationRegion (RAM, EmbeddedControl, 0x00, 0xFF)
            Field (RAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x0A), 
                    ,   1, 
                BLNK,   1, 
                Offset (0x0B), 
                Offset (0x10), 
                    ,   1, 
                KTEE,   1, 
                Offset (0x11), 
                KPPS,   1, 
                Offset (0x13), 
                URTB,   8, 
                Offset (0x4E), 
                SCID,   8, 
                Offset (0x53), 
                PNID,   8, 
                Offset (0x5C), 
                OSTP,   8, 
                Offset (0x71), 
                WLEN,   1, 
                BTEN,   1, 
                    ,   1, 
                MUTE,   1, 
                KBID,   3, 
                USBP,   1, 
                    ,   2, 
                KEYW,   1, 
                RTCW,   1, 
                LIDW,   1, 
                BL2W,   1, 
                TPDW,   1, 
                Offset (0x75), 
                SWBL,   1, 
                Offset (0x76), 
                SYSC,   4, 
                SYSO,   4, 
                Offset (0x90), 
                SCPM,   1, 
                Offset (0x91), 
                TTID,   8, 
                KTAF,   8
            }

            Field (RAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x7F), 
                BNEN,   1, 
                BNCM,   1, 
                BNDM,   1, 
                BNVE,   1, 
                Offset (0x83), 
                BNAC,   4, 
                BNDC,   4, 
                Offset (0x87), 
                BNVA,   8
            }

            Method (RDEC, 1, Serialized)
            {
                If (ECON)
                {
                    OperationRegion (ECRM, EmbeddedControl, Arg0, 0x01)
                    Field (ECRM, ByteAcc, Lock, Preserve)
                    {
                        ECRB,   8
                    }

                    Store (ECRB, Local0)
                }
                Else
                {
                    Store (RBEC (Arg0), Local0)
                }

                Return (Local0)
            }

            Field (RAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x50), 
                LBBM,   1, 
                BNBM,   1, 
                CSBM,   1, 
                OPBM,   1, 
                ROBM,   1, 
                Offset (0x51), 
                DCTL,   8, 
                GWSS,   1, 
                GWHC,   1, 
                HDPR,   1, 
                DGPU,   1, 
                TVEC,   1, 
                    ,   2, 
                ASPL,   1, 
                Offset (0x54), 
                CAMC,   1, 
                OTBP,   1, 
                    ,   1, 
                GFXL,   1, 
                OPEH,   1, 
                OPSE,   1, 
                Offset (0x55), 
                CBST,   8, 
                Offset (0x57), 
                    ,   1, 
                SMBM,   1, 
                    ,   1, 
                RSBM,   1, 
                Offset (0x58), 
                LSEN,   8, 
                Offset (0x61), 
                MBNG,   1, 
                SBNG,   1, 
                Offset (0x62), 
                BLTM,   8, 
                ODPS,   8, 
                Offset (0x66), 
                ZPOF,   1, 
                Offset (0x6F), 
                SNBT,   8, 
                Offset (0x73), 
                WWAN,   1, 
                Offset (0x74), 
                CRLW,   1, 
                PS2K,   1, 
                PS2M,   1, 
                TPEN,   1, 
                CHGE,   1, 
                INTK,   1, 
                Offset (0x75), 
                    ,   1, 
                    ,   1, 
                    ,   1, 
                    ,   1, 
                    ,   1, 
                    ,   1, 
                BLST,   1, 
                Offset (0x76), 
                Offset (0x82), 
                BMAC,   4, 
                BMDC,   4, 
                Offset (0x95), 
                FANS,   8, 
                Offset (0xBA), 
                ICPU,   8
            }

            Field (RAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x92), 
                KCSS,   1, 
                KCTT,   1, 
                KDTT,   1, 
                KOSD,   1, 
                KVTP,   1
            }

            Field (RAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x01), 
                TIID,   8, 
                Offset (0xD0), 
                TMH0,   8, 
                Offset (0xD2), 
                TMH1,   8, 
                Offset (0xD4), 
                TMH2,   8, 
                Offset (0xD6), 
                TMH3,   8, 
                Offset (0xD8), 
                TMH4,   8, 
                Offset (0xDA), 
                TMH5,   8, 
                Offset (0xDC), 
                TMH6,   8, 
                TMH7,   8
            }

            Method (WREC, 2, Serialized)
            {
                If (ECON)
                {
                    OperationRegion (ECRM, EmbeddedControl, Arg0, 0x01)
                    Field (ECRM, ByteAcc, Lock, Preserve)
                    {
                        ECRB,   8
                    }

                    Store (Arg1, ECRB) /* \_SB_.PCI0.LPC0.EC0_.WREC.ECRB */
                }
                Else
                {
                    WBEC (Arg0, Arg1)
                }
            }

            Method (MDEC, 3, Serialized)
            {
                If (ECON)
                {
                    OperationRegion (ECRM, EmbeddedControl, Arg0, 0x01)
                    Field (ECRM, ByteAcc, Lock, Preserve)
                    {
                        ECRB,   8
                    }

                    Store (ECRB, Local0)
                    And (Local0, Arg1, Local0)
                    Or (Local0, Arg2, Local0)
                    Store (Local0, ECRB) /* \_SB_.PCI0.LPC0.EC0_.MDEC.ECRB */
                }
                Else
                {
                    MBEC (Arg0, Arg1, Arg2)
                }
            }

            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If (LEqual (Arg0, 0x03))
                {
                    Store (Arg1, ECON) /* \ECON */
                    TINI ()
                    Store (0x05, SYSO) /* \_SB_.PCI0.LPC0.EC0_.SYSO */
                    If (LGreaterEqual (TPOS, 0x40))
                    {
                        Store (0x00, BNEN) /* \_SB_.PCI0.LPC0.EC0_.BNEN */
                    }

                    Store (BNEN, BCEN) /* \BCEN */
                    Store (BNVE, BCVE) /* \BCVE */
                    Store (GOST (), OSTP) /* \_SB_.PCI0.LPC0.EC0_.OSTP */
                }
            }

            Method (TINI, 0, NotSerialized)
            {
                If (ECON)
                {
                    Store (0x00, KTAF) /* \_SB_.PCI0.LPC0.EC0_.KTAF */
                    Store (0x01, KTEE) /* \_SB_.PCI0.LPC0.EC0_.KTEE */
                }
                Else
                {
                    WBEC (0x92, 0x00)
                    MBEC (0x10, 0xFD, 0x02)
                }
            }

            Method (ECPS, 1, NotSerialized)
            {
                ShiftLeft (Arg0, 0x00, Local0)
                Store (Arg0, SYSC) /* \_SB_.PCI0.LPC0.EC0_.SYSC */
                Store (0x01, MUTE) /* \_SB_.PCI0.LPC0.EC0_.MUTE */
                If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04))) {}
                If (LEqual (Arg0, 0x04))
                {
                    Store (0x01, BLNK) /* \_SB_.PCI0.LPC0.EC0_.BLNK */
                }
            }

            Method (ECWK, 1, NotSerialized)
            {
                Store (Arg0, SYSO) /* \_SB_.PCI0.LPC0.EC0_.SYSO */
                Store (0x00, MUTE) /* \_SB_.PCI0.LPC0.EC0_.MUTE */
                TINI ()
                Notify (BAT0, 0x81) // Information Change
                If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
                {
                    Store (BCEN, BNEN) /* \_SB_.PCI0.LPC0.EC0_.BNEN */
                    Store (BCVE, BNVE) /* \_SB_.PCI0.LPC0.EC0_.BNVE */
                    If (LOr (LEqual (GOST (), 0x01), LEqual (GOST (), 0x40)))
                    {
                        HKEY (0x1C)
                    }
                }

                If (LEqual (Arg0, 0x03)) {}
                If (LEqual (Arg0, 0x04))
                {
                    Store (GOST (), OSTP) /* \_SB_.PCI0.LPC0.EC0_.OSTP */
                }

                If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x05))) {}
            }

            Scope (\_GPE)
            {
                Method (_L06, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
                {
                    Store (0x06, P80H) /* \P80H */
                }
            }
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        Field (ECMB, ByteAcc, Lock, Preserve)
        {
            Offset (0x02), 
                ,   5, 
            KACS,   1
        }

        Name (ACST, 0x01)
        Device (ADP1)
        {
            Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Store (KACS, Local0)
                If (Local0)
                {
                    Store (0x01, ACST) /* \_SB_.PCI0.LPC0.EC0_.ACST */
                }
                Else
                {
                    Store (0x00, ACST) /* \_SB_.PCI0.LPC0.EC0_.ACST */
                }

                Return (ACST) /* \_SB_.PCI0.LPC0.EC0_.ACST */
            }

            Method (_PCL, 0, NotSerialized)  // _PCL: Power Consumer List
            {
                Return (_SB) /* \_SB_ */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        Field (ECMB, ByteAcc, Lock, Preserve)
        {
            Offset (0x08), 
            NB0S,   8, 
            NB1S,   8, 
            Offset (0x80), 
            BSRC,   16, 
            BSFC,   16, 
            BSPE,   16, 
            BSAC,   16, 
            BSVO,   16, 
                ,   15, 
            BSCM,   1, 
            BSCU,   16, 
            BSTV,   16, 
            BSDC,   16, 
            BSDV,   16, 
            BSSN,   16, 
            Offset (0xC0), 
            BSMN,   128, 
            BSDN,   256, 
            BSCH,   128
        }

        Method (GBIF, 3, NotSerialized)
        {
            If (Arg2)
            {
                Store (0xFFFFFFFF, Index (Arg1, 0x01))
                Store (0xFFFFFFFF, Index (Arg1, 0x02))
                Store (0xFFFFFFFF, Index (Arg1, 0x04))
                Store (0x00, Index (Arg1, 0x05))
                Store (0x00, Index (Arg1, 0x06))
            }
            Else
            {
                Store (BSCM, Local0)
                XOr (Local0, 0x01, Index (Arg1, 0x00))
                If (Local0)
                {
                    Multiply (BSDC, 0x0A, Local1)
                }
                Else
                {
                    Store (BSDC, Local1)
                }

                Store (Local1, Index (Arg1, 0x01))
                If (Local0)
                {
                    Multiply (BSFC, 0x0A, Local2)
                }
                Else
                {
                    Store (BSFC, Local2)
                }

                Store (Local2, Index (Arg1, 0x02))
                Store (BSDV, Index (Arg1, 0x04))
                Divide (Local2, 0x64, Local7, Local6)
                Multiply (Local6, 0x07, Local3)
                Store (Local3, Index (Arg1, 0x05))
                Multiply (0x03, 0x02, Local4)
                Add (Local4, 0x01, Local4)
                Multiply (Local6, Local4, Local4)
                Divide (Local4, 0x02, Local7, Local4)
                Store (Local4, Index (Arg1, 0x06))
                Subtract (Local3, Local4, Index (Arg1, 0x07))
                Subtract (Local2, Local3, Index (Arg1, 0x08))
                Store (BSSN, Local7)
                Name (SERN, Buffer (0x06)
                {
                    "     "
                })
                Store (0x04, Local6)
                While (Local7)
                {
                    Divide (Local7, 0x0A, Local5, Local7)
                    Add (Local5, 0x30, Index (SERN, Local6))
                    Decrement (Local6)
                }

                Store (SERN, Index (Arg1, 0x0A))
                Store (BSDN, Index (Arg1, 0x09))
                Store (BSCH, Index (Arg1, 0x0B))
                Store (BSMN, Index (Arg1, 0x0C))
            }

            Return (Arg1)
        }

        Method (GBST, 4, NotSerialized)
        {
            If (And (Arg1, 0x02))
            {
                Store (0x02, Local0)
                If (And (Arg1, 0x20))
                {
                    Store (0x00, Local0)
                }
            }
            Else
            {
                If (And (Arg1, 0x04))
                {
                    Store (0x01, Local0)
                }
                Else
                {
                    Store (0x00, Local0)
                }
            }

            If (And (Arg1, 0x10))
            {
                Or (Local0, 0x04, Local0)
            }

            If (And (Arg1, 0x01))
            {
                Store (BSAC, Local1)
                Store (BSRC, Local2)
                If (ACST)
                {
                    If (And (Arg1, 0x20))
                    {
                        Store (BSFC, Local2)
                    }
                }

                If (Arg2)
                {
                    Multiply (Local2, 0x0A, Local2)
                }

                Store (BSVO, Local3)
                If (LGreaterEqual (Local1, 0x8000))
                {
                    If (And (Local0, 0x01))
                    {
                        Subtract (0x00010000, Local1, Local1)
                    }
                    Else
                    {
                        Store (0x00, Local1)
                    }
                }
                Else
                {
                    If (LEqual (And (Local0, 0x02), 0x00))
                    {
                        Store (0x00, Local1)
                    }
                }

                If (Arg2)
                {
                    Multiply (Local3, Local1, Local1)
                    Divide (Local1, 0x03E8, Local7, Local1)
                }
            }
            Else
            {
                Store (0x00, Local0)
                Store (0xFFFFFFFF, Local1)
                Store (0xFFFFFFFF, Local2)
                Store (0xFFFFFFFF, Local3)
            }

            Store (Local0, Index (Arg3, 0x00))
            Store (Local1, Index (Arg3, 0x01))
            Store (Local2, Index (Arg3, 0x02))
            Store (Local3, Index (Arg3, 0x03))
            Return (Arg3)
        }

        Name (B0ST, 0x00)
        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, 0x01)  // _UID: Unique ID
            Method (_PCL, 0, NotSerialized)  // _PCL: Power Consumer List
            {
                Return (_SB) /* \_SB_ */
            }

            Name (B0IP, Package (0x0D)
            {
                0x01, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x01, 
                0xFFFFFFFF, 
                0x00, 
                0x00, 
                0x5A, 
                0x5A, 
                "", 
                "100", 
                "Lion", 
                0x00
            })
            Name (B0SP, Package (0x04)
            {
                0x00, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Store (NB0S, Local1)
                And (Local1, 0x01, Local0)
                If (And (Local1, 0x40))
                {
                    Store (0x00, Local0)
                }

                Store (Local0, B0ST) /* \_SB_.PCI0.LPC0.EC0_.B0ST */
                If (Local0)
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Store (B0ST, Local6)
                Store (0x14, Local7)
                While (LAnd (Local6, Local7))
                {
                    Store (NB0S, Local1)
                    If (And (Local1, 0x08))
                    {
                        Store (0x00, Local6)
                    }
                    Else
                    {
                        Sleep (0x01F4)
                        Decrement (Local7)
                    }
                }

                Return (GBIF (0x00, B0IP, Local6))
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                XOr (DerefOf (Index (B0IP, 0x00)), 0x01, Local0)
                Store (NB0S, Local1)
                Return (GBST (0x00, Local1, Local0, B0SP))
            }
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        Field (ECMB, ByteAcc, Lock, Preserve)
        {
            Offset (0x06), 
            TPTP,   8, 
            Offset (0x58), 
            PJID,   8
        }
    }

    Scope (_SB.PCI0.LPC0)
    {
        Device (KBD0)
        {
            Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0060,             // Range Minimum
                    0x0060,             // Range Maximum
                    0x01,               // Alignment
                    0x01,               // Length
                    )
                IO (Decode16,
                    0x0064,             // Range Minimum
                    0x0064,             // Range Maximum
                    0x01,               // Alignment
                    0x01,               // Length
                    )
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {1}
            })
        }

        Device (PS2M)
        {
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Store (^^EC0.TPTP, Local0)
                If (LEqual (Local0, 0x01))
                {
                    Return (0x26032E4F)
                }

                If (LEqual (Local0, 0x02))
                {
                    Return (0x04068416)
                }

                Return (0x04068416)
            }

            Method (_CID, 0, NotSerialized)  // _CID: Compatible ID
            {
                Store (^^EC0.TPTP, Local0)
                If (LEqual (Local0, 0x01))
                {
                    Return (Package (0x03)
                    {
                        0x00032E4F, 
                        0x02002E4F, 
                        0x130FD041
                    })
                }

                If (LEqual (Local0, 0x02))
                {
                    Return (Package (0x03)
                    {
                        0x01008416, 
                        0x02008416, 
                        0x130FD041
                    })
                }

                Return (Package (0x03)
                {
                    0x01008416, 
                    0x02008416, 
                    0x130FD041
                })
            }

            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {12}
            })
        }
    }

    Scope (\)
    {
        Mutex (MSGF, 0x07)
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        Method (_Q17, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x17, P80H) /* \P80H */
            Notify (SLPB, 0x80) // Status Change
        }

        Method (_Q1C, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x1C, P80H) /* \P80H */
            If (BCEN)
            {
                If (BCVE)
                {
                    HKEY (0x1C)
                }

                LAMN (0x73)
            }
            Else
            {
                Acquire (MSGF, 0xFFFF)
                Notify (^^^VGA.LCD, 0x86) // Device-Specific
                Notify (^^^PB3.VGA.LCD, 0x86) // Device-Specific
                Release (MSGF)
            }

            Sleep (0x64)
            Or (VP1D, 0x10, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q1D, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x1D, P80H) /* \P80H */
            If (BCEN)
            {
                If (BCVE)
                {
                    HKEY (0x1D)
                }

                LAMN (0x74)
            }
            Else
            {
                Acquire (MSGF, 0xFFFF)
                Notify (^^^VGA.LCD, 0x87) // Device-Specific
                Notify (^^^PB3.VGA.LCD, 0x87) // Device-Specific
                Release (MSGF)
            }

            Sleep (0x64)
            Or (VP1D, 0x10, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q32, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x32, P80H) /* \P80H */
            HKEY (0x32)
            Store (0x00, KCTT) /* \_SB_.PCI0.LPC0.EC0_.KCTT */
        }

        Method (_Q35, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x35, P80H) /* \P80H */
            HKEY (0x35)
            Store (0x01, KCTT) /* \_SB_.PCI0.LPC0.EC0_.KCTT */
        }

        Method (_Q36, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x36, P80H) /* \P80H */
            Store (0x01, KOSD) /* \_SB_.PCI0.LPC0.EC0_.KOSD */
            Sleep (0x01F4)
            NTMR ()
        }

        Method (_Q40, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x40, P80H) /* \P80H */
            Notify (BAT0, 0x81) // Information Change
        }

        Method (_Q41, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x41, P80H) /* \P80H */
            Notify (BAT0, 0x81) // Information Change
        }

        Method (_Q48, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x48, P80H) /* \P80H */
            Notify (BAT0, 0x80) // Status Change
        }

        Method (_Q4C, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x4C, P80H) /* \P80H */
            If (B0ST)
            {
                Notify (BAT0, 0x80) // Status Change
            }
        }

        Method (_Q4D, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x4D, P80H) /* \P80H */
        }

        Method (_Q50, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x50, P80H) /* \P80H */
            Store (0x81, SMIC) /* \_SB_.PCI0.LPC0.SMIC */
            ^VPC0.SODD (0x01)
            Notify (ADP1, 0x80) // Status Change
            PSKY (0x01)
        }

        Method (_Q51, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x51, P80H) /* \P80H */
            Store (0x82, SMIC) /* \_SB_.PCI0.LPC0.SMIC */
            Notify (ADP1, 0x80) // Status Change
            PSKY (0x02)
        }

        Method (_Q52, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x52, P80H) /* \P80H */
            Notify (LID0, 0x80) // Status Change
        }

        Method (_Q53, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x53, P80H) /* \P80H */
            Notify (LID0, 0x80) // Status Change
        }

        Method (NTMR, 0, NotSerialized)
        {
            Notify (\_TZ.TZS0, 0x80) // Thermal Status Change
            Notify (\_TZ.TZS1, 0x80) // Thermal Status Change
        }

        Method (SGV3, 1, NotSerialized)
        {
            If (LGreater (Arg0, 0x64))
            {
                Store (PSMV, Local0)
            }
            Else
            {
                Store (Arg0, Local0)
            }

            Store (Local0, \_PR.C000._PPC) /* External reference */
            Notify (\_PR.C000, 0x80) // Performance Capability Change
            If (LGreaterEqual (TCNT, 0x02))
            {
                Store (Local0, \_PR.C001._PPC) /* External reference */
                Notify (\_PR.C001, 0x80) // Performance Capability Change
            }

            If (LGreaterEqual (TCNT, 0x03))
            {
                Store (Local0, \_PR.C002._PPC) /* External reference */
                Notify (\_PR.C002, 0x80) // Performance Capability Change
            }

            If (LGreaterEqual (TCNT, 0x04))
            {
                Store (Local0, \_PR.C003._PPC) /* External reference */
                Notify (\_PR.C003, 0x80) // Performance Capability Change
            }
        }

        Method (SBNL, 2, NotSerialized)
        {
            If (BCEN)
            {
                If (BCVE)
                {
                    HKEY (0x1C)
                }
            }
        }

        Method (SGSW, 1, NotSerialized)
        {
        }

        Method (PSKY, 1, NotSerialized)
        {
            If (PSBN)
            {
                Store (0x01, Local1)
                If (Local1)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (KACS, Local2)
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        Store (0x01, Local2)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (0x00, Local2)
                        Store (0x01, Local3)
                    }

                    Sleep (0x32)
                    If (Local2)
                    {
                        SGSW (0x01)
                        SBNL (BNVA, 0x09)
                    }
                    Else
                    {
                        If (Local3)
                        {
                            SGSW (0x02)
                            SBNL (BNVA, 0x02)
                        }
                        Else
                        {
                            SGSW (0x01)
                            SBNL (BNVA, 0x04)
                        }
                    }
                }
            }
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        Method (HKDS, 1, NotSerialized)
        {
            If (LEqual (0x00, DSEN))
            {
                Store (0x01, Local2)
                If (Local2)
                {
                    Store (TRPS (0xEE, 0x00), Local0)
                    Store (0x00, CADL) /* \CADL */
                    If (And (Local0, 0x08))
                    {
                        Or (CADL, 0x0808, CADL) /* \CADL */
                    }

                    If (And (Local0, 0x01))
                    {
                        Or (CADL, 0x0101, CADL) /* \CADL */
                    }

                    If (And (Local0, 0x02))
                    {
                        Or (CADL, 0x0202, CADL) /* \CADL */
                    }

                    If (And (Local0, 0x04))
                    {
                        Or (CADL, 0x0404, CADL) /* \CADL */
                    }
                }

                If (LNotEqual (CADL, PADL))
                {
                    Store (CADL, PADL) /* \PADL */
                    If (LOr (LGreater (TPOS, 0x04), LLess (TPOS, 0x40)))
                    {
                        Notify (PCI0, 0x00) // Bus Check
                    }
                    Else
                    {
                        If (LEqual (VGPU, ^^^VGA._ADR))
                        {
                            Notify (VGA, 0x00) // Bus Check
                        }
                    }

                    Sleep (0x02EE)
                }

                If (LEqual (Arg0, 0x10))
                {
                    Store (0x01, Local2)
                    If (Local2)
                    {
                        Store (TRPS (0xE8, 0x00), Local0)
                        And (Local0, 0x0F, Local0)
                        Store (Local0, CDST) /* \CDST */
                        Or (CDST, ShiftLeft (Local0, 0x08), CDST) /* \CDST */
                    }

                    Store (GNDI (), Local0)
                }
                Else
                {
                    Store (Arg0, Local0)
                }

                SNDI (Local0)
                If (LEqual (VGPU, ^^^VGA._ADR))
                {
                    Notify (VGA, 0x80) // Status Change
                }
            }

            If (LEqual (0x01, DSEN)) {}
        }

        Method (GNDI, 0, NotSerialized)
        {
            Store (0x01, Local1)
            Store (CADL, Local2)
            If (LEqual (CDST, 0x0808))
            {
                If (And (0x0101, Local2))
                {
                    Store (0x02, Local1)
                }
                Else
                {
                    If (And (0x0404, Local2))
                    {
                        Store (0x03, Local1)
                    }
                }
            }

            If (LEqual (CDST, 0x0101))
            {
                If (And (0x0404, Local2))
                {
                    Store (0x05, Local1)
                }
                Else
                {
                    Store (0x01, Local1)
                }
            }

            If (LEqual (CDST, 0x0404))
            {
                Store (0x01, Local1)
            }

            If (LEqual (CDST, 0x0909))
            {
                If (And (0x0404, Local2))
                {
                    Store (0x03, Local1)
                }
                Else
                {
                    Store (0x04, Local1)
                }
            }

            If (LEqual (CDST, 0x0C0C))
            {
                If (And (0x0101, Local2))
                {
                    Store (0x04, Local1)
                }
                Else
                {
                    Store (0x05, Local1)
                }
            }

            Return (Local1)
        }

        Method (SNDI, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x04))
            {
                Store (0x0101, NDST) /* \NDST */
            }

            If (LEqual (Arg0, 0x01))
            {
                Store (0x0808, NDST) /* \NDST */
            }

            If (LEqual (Arg0, 0x02))
            {
                Store (0x0909, NDST) /* \NDST */
            }

            If (LEqual (Arg0, 0x05))
            {
                Store (0x0404, NDST) /* \NDST */
            }

            If (LEqual (Arg0, 0x06))
            {
                Store (0x0202, NDST) /* \NDST */
            }

            If (LEqual (Arg0, 0x03))
            {
                Store (0x0C0C, NDST) /* \NDST */
            }

            If (LEqual (Arg0, 0x07))
            {
                Store (0x0A0A, NDST) /* \NDST */
            }

            If (LEqual (Arg0, 0x08))
            {
                Store (0x0505, NDST) /* \NDST */
            }
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        Field (ECMB, ByteAcc, Lock, Preserve)
        {
            Offset (0x20), 
            THS0,   8, 
            THS1,   8, 
            THS2,   8, 
            THS3,   8, 
            THS4,   8, 
            THS5,   8, 
            THS6,   8, 
            THS7,   8, 
            Offset (0x54), 
            TSP0,   8, 
            TSC0,   8, 
            TSP1,   8, 
            TSC1,   8
        }
    }

    Scope (_TZ)
    {
        Name (TBSE, 0x0AAC)
        Name (CRT0, 0x00)
        Name (PSV0, 0x00)
        ThermalZone (TZS0)
        {
            Method (_TMP, 0, NotSerialized)  // _TMP: Temperature
            {
                Store (\_SB.PCI0.LPC0.EC0.THS0, Local0)
                Store (\_SB.PCI0.LPC0.EC0.KCSS, Local1)
                Store (\_SB.PCI0.LPC0.EC0.KOSD, Local2)
                If (Local2)
                {
                    If (LLessEqual (Local0, CRT0))
                    {
                        Add (CRT0, 0x02, Local0)
                    }
                }

                Return (C2K (Local0))
            }

            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Store (\_SB.PCI0.LPC0.EC0.TSC0, Local0)
                If (LOr (LGreaterEqual (Local0, 0x80), LLess (Local0, 0x1E)))
                {
                    Store (0x78, Local0)
                }

                Store (Local0, CRT0) /* \_TZ_.CRT0 */
                Return (C2K (Local0))
            }

            Method (_SCP, 1, Serialized)  // _SCP: Set Cooling Policy
            {
                \_SB.PCI0.LPC0.EC0.MDEC (0x90, 0xFE, Arg0)
            }
        }

        ThermalZone (TZS1)
        {
            Method (_TMP, 0, NotSerialized)  // _TMP: Temperature
            {
                Store (\_SB.PCI0.LPC0.EC0.THS1, Local0)
                Return (C2K (Local0))
            }

            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Store (\_SB.PCI0.LPC0.EC0.TSC1, Local0)
                If (LOr (LGreaterEqual (Local0, 0x80), LLess (Local0, 0x1E)))
                {
                    Store (0x78, Local0)
                }

                Return (C2K (Local0))
            }
        }

        Method (C2K, 1, NotSerialized)
        {
            Store (Arg0, Local0)
            If (LLessEqual (Local0, 0x10))
            {
                Store (0x1E, Local0)
            }

            If (LGreaterEqual (Local0, 0x7F))
            {
                Store (0x1E, Local0)
            }

            Add (Multiply (Local0, 0x0A), TBSE, Local0)
            Return (Local0)
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        Field (ECMB, ByteAcc, Lock, Preserve)
        {
            Offset (0x02), 
                ,   1, 
            KLID,   1
        }
    }

    Scope (_SB)
    {
        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                Store (^^PCI0.LPC0.EC0.KLID, Local0)
                If (Local0)
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
                If (ECON)
                {
                    Store (Arg0, ^^PCI0.LPC0.EC0.LIDW) /* \_SB_.PCI0.LPC0.EC0_.LIDW */
                }
                Else
                {
                    If (Arg0)
                    {
                        MBEC (0x72, 0xEF, 0x10)
                    }
                    Else
                    {
                        MBEC (0x72, 0xEF, 0x00)
                    }
                }
            }

            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x06, 
                0x03
            })
        }
    }

    Scope (_SB)
    {
        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x06, 
                0x03
            })
        }
    }

    Scope (\)
    {
        Name (B2ED, Buffer (0x1C)
        {
            /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            /* 0010 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            /* 0018 */   0x00, 0x00, 0x00, 0x00
        })
        Method (WH15, 2, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            CreateDWordField (Arg1, 0x00, DEAX)
            CreateDWordField (Arg1, 0x04, DEBX)
            CreateDWordField (Arg1, 0x08, DECX)
            CreateDWordField (Arg1, 0x0C, DEDX)
            CreateDWordField (B2ED, 0x00, OEAX)
            CreateDWordField (B2ED, 0x04, OEBX)
            CreateDWordField (B2ED, 0x08, OECX)
            CreateDWordField (B2ED, 0x0C, OEDX)
            CreateDWordField (B2ED, 0x10, OFLG)
            Store (DECX, OECX) /* \WH15.OECX */
            Store (DEDX, OEDX) /* \WH15.OEDX */
            If (LEqual (\_SB.AMW0.WMID, 0x01))
            {
                CreateDWordField (Arg1, 0x10, DESI)
                CreateDWordField (Arg1, 0x14, DEDI)
                CreateDWordField (B2ED, 0x14, OESI)
                CreateDWordField (B2ED, 0x18, OEDI)
                Store (DESI, OESI) /* \WH15.OESI */
                Store (DEDI, OEDI) /* \WH15.OEDI */
            }

            If (LEqual (And (DEAX, 0xFFFF), 0x9630))
            {
                If (LEqual (And (DEBX, 0xFF), 0x06))
                {
                    WB15 (B2ED, DEBX, DECX, DEDX, DESI, DEDI)
                    Release (MSMI)
                    Return (B2ED) /* \B2ED */
                }
            }

            Store (DEAX, WNVA) /* \WNVA */
            Store (DEBX, WNVB) /* \WNVB */
            Store (DECX, WNVC) /* \WNVC */
            Store (DEDX, WNVD) /* \WNVD */
            If (LEqual (\_SB.AMW0.WMID, 0x01))
            {
                Store (DESI, WNVS) /* \WNVS */
                Store (DEDI, WNVI) /* \WNVI */
            }

            WSMI (0x01)
            Store (WNVA, OEAX) /* \WH15.OEAX */
            Store (WNVB, OEBX) /* \WH15.OEBX */
            Store (WNVC, OECX) /* \WH15.OECX */
            Store (WNVD, OEDX) /* \WH15.OEDX */
            Store (WFLG, OFLG) /* \WH15.OFLG */
            If (LEqual (\_SB.AMW0.WMID, 0x01))
            {
                Store (WNVS, OESI) /* \WH15.OESI */
                Store (WNVI, OEDI) /* \WH15.OEDI */
            }

            Release (MSMI)
            Return (B2ED) /* \B2ED */
        }
    }

    Scope (_SB)
    {
        Device (AMW0)
        {
            Name (_HID, EisaId ("PNP0C14") /* Windows Management Instrumentation Device */)  // _HID: Hardware ID
            Name (_UID, 0x00)  // _UID: Unique ID
            Name (WLMP, 0x00)
            Name (WMID, 0x00)
            Name (B0ED, Buffer (0x04)
            {
                 0x00, 0x00, 0x00, 0x00
            })
            CreateDWordField (B0ED, 0x00, WLID)
            Name (B1ED, Buffer (0x04)
            {
                 0x00, 0x00, 0x00, 0x00
            })
            Name (_WDG, Buffer (0x64)
            {
                /* 0000 */   0x81, 0x17, 0xF4, 0xD9, 0x33, 0xF6, 0x00, 0x44,
                /* 0008 */   0x93, 0x55, 0x60, 0x17, 0x70, 0xBE, 0xC5, 0x10,
                /* 0010 */   0x41, 0x41, 0x01, 0x00, 0x1D, 0x37, 0xC3, 0x67,
                /* 0018 */   0xA3, 0x95, 0x37, 0x4C, 0xBB, 0x61, 0xDD, 0x47,
                /* 0020 */   0xB4, 0x91, 0xDA, 0xAB, 0x41, 0x42, 0x01, 0x02,
                /* 0028 */   0xED, 0x16, 0x1F, 0x43, 0x2B, 0x0C, 0x4C, 0x44,
                /* 0030 */   0xB2, 0x67, 0x27, 0xDE, 0xB1, 0x40, 0xCF, 0x9C,
                /* 0038 */   0x41, 0x43, 0x01, 0x02, 0x71, 0xBF, 0xD1, 0x40,
                /* 0040 */   0x2D, 0xA8, 0x59, 0x4E, 0xA1, 0x68, 0x39, 0x85,
                /* 0048 */   0xE0, 0x3B, 0x2E, 0x87, 0xB0, 0x00, 0x01, 0x08,
                /* 0050 */   0x21, 0x12, 0x90, 0x05, 0x66, 0xD5, 0xD1, 0x11,
                /* 0058 */   0xB2, 0xF0, 0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10,
                /* 0060 */   0x44, 0x44, 0x01, 0x00
            })
            Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event
            {
                Store (Arg0, P80H) /* \P80H */
                If (LEqual (Arg0, 0xB0))
                {
                    Return (B0ED) /* \_SB_.AMW0.B0ED */
                }
            }

            Method (WQAA, 1, NotSerialized)
            {
                Store (0xAA, P80H) /* \P80H */
                Return (B1ED) /* \_SB_.AMW0.B1ED */
            }

            Method (WSAA, 2, NotSerialized)
            {
                Store (0xA1, P80H) /* \P80H */
                CreateDWordField (Arg1, 0x00, DDD0)
                If (LEqual (DDD0, 0x01))
                {
                    Add (DDD0, 0x02, DDD0) /* \_SB_.AMW0.WSAA.DDD0 */
                    Store (DDD0, Index (B1ED, 0x00))
                }
            }

            Method (WMAB, 3, NotSerialized)
            {
                Store (0xAB, P80H) /* \P80H */
                Store (0x01, WLMP) /* \_SB_.AMW0.WLMP */
                Store (0x00, WMID) /* \_SB_.AMW0.WMID */
                Return (WH15 (Arg1, Arg2))
            }

            Method (WMAC, 3, NotSerialized)
            {
                Store (0xAC, P80H) /* \P80H */
                Store (0x01, WLMP) /* \_SB_.AMW0.WLMP */
                Store (0x01, WMID) /* \_SB_.AMW0.WMID */
                Return (WH15 (Arg1, Arg2))
            }
        }
    }

    Scope (_SB.AMW0)
    {
        Name (WQDD, Buffer (0x0560)
        {
            /* 0000 */   0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,
            /* 0008 */   0x50, 0x05, 0x00, 0x00, 0x70, 0x1D, 0x00, 0x00,
            /* 0010 */   0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,
            /* 0018 */   0x18, 0xCB, 0x8D, 0x00, 0x01, 0x06, 0x18, 0x42,
            /* 0020 */   0x10, 0x09, 0x10, 0x8A, 0xE7, 0x80, 0x42, 0x04,
            /* 0028 */   0x0A, 0x0D, 0xA1, 0x40, 0x30, 0x28, 0x38, 0x4B,
            /* 0030 */   0x82, 0x90, 0x0B, 0x26, 0x26, 0x40, 0x08, 0x84,
            /* 0038 */   0x24, 0x0A, 0x30, 0x2F, 0x40, 0xB7, 0x00, 0xC3,
            /* 0040 */   0x02, 0x6C, 0x0B, 0x30, 0x2D, 0xC0, 0x31, 0x90,
            /* 0048 */   0xFA, 0xF7, 0x87, 0x28, 0x0D, 0x44, 0x22, 0x20,
            /* 0050 */   0xA9, 0x14, 0x08, 0x09, 0x15, 0xA0, 0x5C, 0x80,
            /* 0058 */   0x6F, 0x01, 0xDA, 0x11, 0x25, 0x59, 0x80, 0x65,
            /* 0060 */   0x18, 0x11, 0xD8, 0x2B, 0x32, 0x41, 0xE3, 0x04,
            /* 0068 */   0xE5, 0x0C, 0x03, 0x05, 0x6F, 0xC0, 0x36, 0x05,
            /* 0070 */   0x98, 0x1C, 0x04, 0x95, 0x3D, 0x08, 0x94, 0x0C,
            /* 0078 */   0x08, 0x79, 0x14, 0x60, 0x15, 0x4E, 0xD3, 0x49,
            /* 0080 */   0x60, 0xF7, 0x73, 0x91, 0x30, 0x18, 0x19, 0x13,
            /* 0088 */   0xA0, 0x50, 0x80, 0x46, 0x01, 0xDE, 0x40, 0x64,
            /* 0090 */   0x4B, 0x80, 0x41, 0x01, 0xE2, 0x04, 0x28, 0x83,
            /* 0098 */   0x12, 0x4A, 0xB8, 0x83, 0x69, 0x4D, 0x80, 0x39,
            /* 00A0 */   0x28, 0x82, 0x56, 0x1B, 0x98, 0x50, 0x3A, 0x03,
            /* 00A8 */   0x12, 0x48, 0xAC, 0x16, 0xC1, 0x05, 0x13, 0x3B,
            /* 00B0 */   0x6A, 0x94, 0x40, 0xD1, 0xDB, 0x1F, 0x04, 0x09,
            /* 00B8 */   0xA7, 0x00, 0xA2, 0x06, 0x10, 0x45, 0x1A, 0x0D,
            /* 00C0 */   0x6A, 0x44, 0x09, 0x0E, 0xCC, 0xA3, 0x39, 0xD5,
            /* 00C8 */   0xCE, 0x05, 0x48, 0x9F, 0xAB, 0x40, 0x8E, 0xF5,
            /* 00D0 */   0x34, 0xEA, 0x1C, 0x2E, 0x01, 0x49, 0x60, 0xAC,
            /* 00D8 */   0x04, 0xB7, 0xEE, 0x21, 0xE2, 0x5D, 0x03, 0x6A,
            /* 00E0 */   0xE2, 0x87, 0xC8, 0x04, 0xC1, 0xA1, 0x86, 0xE8,
            /* 00E8 */   0xF1, 0x86, 0x3B, 0x81, 0xA3, 0x3E, 0x12, 0x06,
            /* 00F0 */   0x71, 0x50, 0x47, 0x83, 0x39, 0x07, 0xD8, 0xE1,
            /* 00F8 */   0x64, 0x34, 0xE3, 0x52, 0x05, 0x98, 0x1D, 0xBA,
            /* 0100 */   0x46, 0x96, 0xE0, 0x78, 0x0C, 0x7D, 0xF6, 0xE7,
            /* 0108 */   0xD3, 0x33, 0x24, 0x91, 0x3F, 0x08, 0xD4, 0xC8,
            /* 0110 */   0x0C, 0xED, 0xA1, 0x9E, 0x56, 0xCC, 0x90, 0x4F,
            /* 0118 */   0x01, 0x87, 0xC5, 0xC4, 0x42, 0x68, 0x93, 0x1A,
            /* 0120 */   0x0F, 0xC4, 0xFF, 0xFF, 0x78, 0xC0, 0xA3, 0xF8,
            /* 0128 */   0x68, 0x20, 0x84, 0x57, 0x82, 0xD8, 0x1E, 0x50,
            /* 0130 */   0x82, 0x01, 0x21, 0xE4, 0x64, 0x3C, 0xA8, 0x51,
            /* 0138 */   0x18, 0x35, 0xDC, 0x61, 0x1C, 0xB5, 0x8F, 0x0F,
            /* 0140 */   0x3A, 0x3C, 0x50, 0x51, 0xC3, 0xA6, 0x67, 0x06,
            /* 0148 */   0x7E, 0x5C, 0x60, 0xE7, 0x82, 0x98, 0x8F, 0x00,
            /* 0150 */   0x1E, 0xC9, 0x09, 0xF9, 0x38, 0xE1, 0x81, 0xC1,
            /* 0158 */   0x07, 0xC4, 0x7B, 0x9F, 0x32, 0x19, 0xC1, 0x99,
            /* 0160 */   0x7A, 0x80, 0xE0, 0xB0, 0x3E, 0x7C, 0x02, 0xFC,
            /* 0168 */   0xB2, 0xF0, 0xB0, 0x90, 0xC0, 0xF7, 0x07, 0x03,
            /* 0170 */   0xE3, 0x46, 0x68, 0xBF, 0x02, 0x10, 0x82, 0x97,
            /* 0178 */   0x79, 0x02, 0x90, 0x53, 0x04, 0x8D, 0xCD, 0xD0,
            /* 0180 */   0x4F, 0x03, 0x2F, 0x0E, 0xE1, 0x83, 0x47, 0x38,
            /* 0188 */   0xDF, 0x03, 0x38, 0x85, 0xC7, 0x00, 0x0F, 0xC1,
            /* 0190 */   0x04, 0x16, 0x39, 0x02, 0x94, 0x98, 0x11, 0xA0,
            /* 0198 */   0x8E, 0x0D, 0x27, 0x70, 0x3C, 0x61, 0x8F, 0xE0,
            /* 01A0 */   0x78, 0xA2, 0x9C, 0xC4, 0x01, 0xF9, 0xA8, 0x61,
            /* 01A8 */   0x84, 0xE0, 0xE5, 0x9E, 0x38, 0x88, 0xE6, 0x71,
            /* 01B0 */   0x6A, 0x16, 0xEF, 0x00, 0x87, 0xC0, 0xC6, 0x84,
            /* 01B8 */   0x3B, 0x40, 0x78, 0x08, 0x7C, 0x00, 0x8F, 0x1A,
            /* 01C0 */   0xE7, 0x67, 0xA5, 0xB3, 0x42, 0x9E, 0x3B, 0xF8,
            /* 01C8 */   0x98, 0xB0, 0x03, 0xE0, 0xD2, 0x0F, 0x27, 0x28,
            /* 01D0 */   0xB1, 0xE7, 0x13, 0x50, 0xFC, 0xFF, 0xCF, 0x27,
            /* 01D8 */   0xC0, 0x1E, 0xE4, 0x99, 0xE4, 0xED, 0xE4, 0x68,
            /* 01E0 */   0x9E, 0x4B, 0x1E, 0x48, 0x9E, 0x48, 0x9E, 0x4F,
            /* 01E8 */   0x8C, 0xF3, 0x66, 0xF2, 0x64, 0x10, 0xE1, 0xF9,
            /* 01F0 */   0xC4, 0xD7, 0x14, 0x23, 0x44, 0x09, 0x19, 0xE8,
            /* 01F8 */   0xE1, 0x24, 0x42, 0x94, 0x70, 0x81, 0xC2, 0x1A,
            /* 0200 */   0x21, 0xC8, 0x63, 0xC1, 0x09, 0x1F, 0x76, 0xAC,
            /* 0208 */   0x40, 0x61, 0x9E, 0x4F, 0x98, 0xF0, 0xA7, 0x86,
            /* 0210 */   0x2C, 0x9C, 0x4F, 0x00, 0xBA, 0xFC, 0xFF, 0xCF,
            /* 0218 */   0x27, 0x80, 0x33, 0x81, 0xE7, 0x13, 0x90, 0x0E,
            /* 0220 */   0x8F, 0x1F, 0x4F, 0x80, 0xC9, 0x08, 0xB8, 0x16,
            /* 0228 */   0x13, 0x87, 0x2F, 0xD4, 0xE3, 0xC0, 0xA7, 0x11,
            /* 0230 */   0x40, 0xCE, 0x09, 0xE4, 0xFD, 0xE3, 0x38, 0x9F,
            /* 0238 */   0x44, 0x7C, 0xF7, 0xF2, 0xFF, 0xFF, 0xE6, 0xE5,
            /* 0240 */   0x83, 0xC8, 0x1B, 0xC8, 0xC1, 0x3E, 0x8D, 0xB0,
            /* 0248 */   0x51, 0x05, 0x33, 0xCA, 0xE9, 0x47, 0x88, 0xFA,
            /* 0250 */   0x52, 0x62, 0xC4, 0x08, 0xC1, 0x42, 0x05, 0x8A,
            /* 0258 */   0x11, 0x35, 0xB2, 0x61, 0x23, 0xC4, 0x79, 0xF8,
            /* 0260 */   0xA2, 0x0F, 0x06, 0x0D, 0xD5, 0xA7, 0x11, 0x80,
            /* 0268 */   0x1F, 0xA7, 0x09, 0xDC, 0xE9, 0x02, 0x4C, 0x93,
            /* 0270 */   0x38, 0x80, 0x28, 0x45, 0xC3, 0x68, 0x3A, 0x8F,
            /* 0278 */   0x03, 0x01, 0x9F, 0x2F, 0x80, 0x89, 0xE2, 0x97,
            /* 0280 */   0x9E, 0xCE, 0x27, 0xFE, 0xFF, 0xAB, 0x05, 0x91,
            /* 0288 */   0x8D, 0xB5, 0x7A, 0x58, 0x34, 0xF3, 0x03, 0x48,
            /* 0290 */   0xF0, 0xC5, 0x03, 0x6B, 0xD8, 0x27, 0x79, 0x16,
            /* 0298 */   0x27, 0x99, 0x60, 0x56, 0x28, 0xC1, 0x7A, 0xD8,
            /* 02A0 */   0x4E, 0x09, 0xA3, 0x04, 0x24, 0x1A, 0x8E, 0xA1,
            /* 02A8 */   0xAD, 0x19, 0x46, 0x70, 0x06, 0xF1, 0x79, 0xC8,
            /* 02B0 */   0x21, 0xCE, 0x31, 0x50, 0x8E, 0x0C, 0x1E, 0xC5,
            /* 02B8 */   0x59, 0x3D, 0x07, 0x78, 0x8C, 0x8F, 0x0B, 0x6C,
            /* 02C0 */   0x7C, 0x3E, 0x08, 0xF0, 0xC3, 0xA0, 0x6F, 0x06,
            /* 02C8 */   0x46, 0xB6, 0x9A, 0xD3, 0x0C, 0x0A, 0xCC, 0xC7,
            /* 02D0 */   0x0B, 0x4E, 0x50, 0xD7, 0xCD, 0x05, 0x64, 0x43,
            /* 02D8 */   0x82, 0x79, 0x10, 0x38, 0x24, 0x30, 0x4F, 0xD5,
            /* 02E0 */   0x43, 0x02, 0x1E, 0xE0, 0x87, 0x04, 0xE6, 0x2B,
            /* 02E8 */   0x81, 0x87, 0x04, 0x2C, 0xFE, 0xFF, 0xA8, 0x07,
            /* 02F0 */   0x71, 0x48, 0x60, 0x46, 0xF2, 0x90, 0xC0, 0xA6,
            /* 02F8 */   0xEF, 0xC8, 0x01, 0x0A, 0x20, 0xDF, 0x30, 0x7C,
            /* 0300 */   0xDC, 0x7B, 0xCA, 0x60, 0x63, 0x78, 0xE2, 0x33,
            /* 0308 */   0x9A, 0xD1, 0xB9, 0xC4, 0xE5, 0xE8, 0x42, 0xC1,
            /* 0310 */   0x45, 0xC1, 0xE8, 0x58, 0x60, 0x10, 0x4F, 0xCB,
            /* 0318 */   0x51, 0xA6, 0x8A, 0x9E, 0x89, 0x7D, 0x9E, 0x42,
            /* 0320 */   0xC8, 0x89, 0x82, 0x5F, 0xDD, 0x74, 0x9F, 0x81,
            /* 0328 */   0x76, 0xF7, 0x08, 0xEA, 0x8B, 0x0A, 0x83, 0xF3,
            /* 0330 */   0x64, 0x39, 0x9C, 0xAF, 0x14, 0xFC, 0xAE, 0xE3,
            /* 0338 */   0xCB, 0x15, 0xF8, 0x46, 0x05, 0xF7, 0x50, 0xC1,
            /* 0340 */   0x46, 0x05, 0xF6, 0xEB, 0x88, 0x47, 0x05, 0xD6,
            /* 0348 */   0xFF, 0xFF, 0xA8, 0x60, 0x9D, 0x2B, 0xD8, 0xA8,
            /* 0350 */   0xC0, 0x7E, 0x26, 0xF0, 0xA8, 0x80, 0xCB, 0xD1,
            /* 0358 */   0x82, 0x8D, 0x0A, 0xEC, 0x1E, 0x46, 0x05, 0xCA,
            /* 0360 */   0x20, 0xD7, 0x0F, 0x28, 0xD0, 0x8F, 0x96, 0xAF,
            /* 0368 */   0x40, 0x0F, 0x41, 0x8F, 0x51, 0x1E, 0x14, 0xB8,
            /* 0370 */   0x61, 0x7C, 0xDF, 0x03, 0x4E, 0x17, 0x10, 0x98,
            /* 0378 */   0xF0, 0x18, 0xC1, 0x47, 0x18, 0xF2, 0xFF, 0x27,
            /* 0380 */   0x28, 0x6B, 0x5C, 0xA8, 0xFB, 0x8A, 0xAF, 0x72,
            /* 0388 */   0xEC, 0x3A, 0x85, 0xBB, 0x2A, 0x62, 0x60, 0x3D,
            /* 0390 */   0x52, 0x0E, 0x6B, 0xB4, 0xB0, 0x07, 0xFC, 0xA6,
            /* 0398 */   0xE5, 0x63, 0x9A, 0x67, 0x66, 0x8C, 0xB0, 0x1E,
            /* 03A0 */   0xAD, 0x95, 0x92, 0xD2, 0x2B, 0x9F, 0x23, 0xDD,
            /* 03A8 */   0xFA, 0x00, 0x41, 0x73, 0x79, 0x10, 0x78, 0xCE,
            /* 03B0 */   0x7B, 0x4B, 0x78, 0x73, 0xF7, 0x59, 0xC2, 0xC7,
            /* 03B8 */   0xBD, 0xC7, 0x82, 0x97, 0x80, 0x97, 0x81, 0xF7,
            /* 03C0 */   0x92, 0x57, 0x5A, 0x76, 0xED, 0xF3, 0xAD, 0xCF,
            /* 03C8 */   0x48, 0x0F, 0x80, 0x46, 0x09, 0x12, 0x23, 0xE6,
            /* 03D0 */   0xFB, 0x89, 0x91, 0x1F, 0x6D, 0x7D, 0x69, 0xF0,
            /* 03D8 */   0xBD, 0x2F, 0xC6, 0x5B, 0x1F, 0x8B, 0x77, 0xEB,
            /* 03E0 */   0x03, 0x44, 0xFD, 0xFF, 0x6F, 0x7D, 0xC0, 0xFE,
            /* 03E8 */   0x72, 0xF1, 0xD6, 0x07, 0x1C, 0x30, 0x23, 0xBE,
            /* 03F0 */   0xF6, 0x01, 0x93, 0x34, 0x2B, 0xD0, 0x59, 0xC3,
            /* 03F8 */   0x49, 0x40, 0x74, 0xED, 0xC3, 0xE9, 0x01, 0xD2,
            /* 0400 */   0xB5, 0x0F, 0xAF, 0x03, 0x96, 0x8E, 0xDB, 0x0A,
            /* 0408 */   0x60, 0x94, 0xE4, 0x58, 0x85, 0xD2, 0x7E, 0xAC,
            /* 0410 */   0xA2, 0x20, 0x3E, 0xCE, 0xF8, 0xDA, 0x07, 0x58,
            /* 0418 */   0xF9, 0xFF, 0x5F, 0xFB, 0x00, 0x26, 0x0E, 0x09,
            /* 0420 */   0xE6, 0xF5, 0xE2, 0x09, 0xC7, 0x43, 0x02, 0xEB,
            /* 0428 */   0x8D, 0xC6, 0x43, 0x82, 0xFB, 0xFF, 0x1F, 0x34,
            /* 0430 */   0xD8, 0x86, 0x04, 0xE6, 0x8B, 0x9D, 0xAF, 0x8E,
            /* 0438 */   0xC0, 0x59, 0xF6, 0x82, 0x75, 0x29, 0xE1, 0x42,
            /* 0440 */   0x61, 0x74, 0xB4, 0x30, 0x88, 0x01, 0x7D, 0x75,
            /* 0448 */   0x04, 0x7E, 0x17, 0x3E, 0xE0, 0x73, 0x75, 0x04,
            /* 0450 */   0x0E, 0x17, 0x3E, 0xFC, 0xFF, 0xFF, 0xEA, 0x08,
            /* 0458 */   0x38, 0xB8, 0xF1, 0x81, 0xF3, 0xEA, 0x08, 0xFC,
            /* 0460 */   0x4C, 0x5C, 0x1D, 0x01, 0x1D, 0x2A, 0x46, 0x0E,
            /* 0468 */   0x74, 0x4E, 0x31, 0x8C, 0xE0, 0xFF, 0x7F, 0x54,
            /* 0470 */   0xE0, 0x06, 0xF6, 0xF1, 0x00, 0xD8, 0x8C, 0x0A,
            /* 0478 */   0x18, 0x9C, 0x06, 0x7C, 0x09, 0x05, 0xBC, 0x2A,
            /* 0480 */   0xB4, 0xE9, 0x53, 0xA3, 0x51, 0xAB, 0x06, 0x65,
            /* 0488 */   0x6A, 0x94, 0x69, 0x50, 0xAB, 0x4F, 0xA5, 0xC6,
            /* 0490 */   0x8C, 0x5D, 0x29, 0x13, 0x8C, 0xB1, 0x02, 0x8D,
            /* 0498 */   0xC5, 0x22, 0x96, 0x23, 0x10, 0x87, 0x04, 0xA1,
            /* 04A0 */   0x22, 0x1F, 0x43, 0x02, 0x71, 0x44, 0x10, 0x1A,
            /* 04A8 */   0xE1, 0x4D, 0x23, 0x10, 0xC7, 0x5B, 0x9B, 0x40,
            /* 04B0 */   0x2C, 0xEE, 0xA1, 0x21, 0x10, 0xFF, 0xFF, 0x83,
            /* 04B8 */   0x3C, 0x23, 0x64, 0x04, 0x44, 0xA9, 0x40, 0x74,
            /* 04C0 */   0x4B, 0x22, 0x6B, 0x12, 0x90, 0x95, 0x81, 0x08,
            /* 04C8 */   0xC8, 0x81, 0x80, 0x68, 0x3A, 0x20, 0x2A, 0xEA,
            /* 04D0 */   0x21, 0x20, 0x20, 0x2B, 0x04, 0x11, 0x90, 0xD5,
            /* 04D8 */   0xD8, 0x00, 0x62, 0xDA, 0x40, 0x04, 0xE4, 0x5C,
            /* 04E0 */   0x40, 0x34, 0x25, 0x10, 0x55, 0xA8, 0x03, 0x88,
            /* 04E8 */   0xE9, 0x05, 0x11, 0x90, 0xB3, 0x02, 0xD1, 0xE4,
            /* 04F0 */   0x40, 0x54, 0xB3, 0x0F, 0x20, 0x96, 0x00, 0x44,
            /* 04F8 */   0x40, 0x4E, 0x4A, 0x23, 0x10, 0xEB, 0x54, 0x02,
            /* 0500 */   0xC2, 0x52, 0xBD, 0x1D, 0x04, 0xE8, 0x88, 0x20,
            /* 0508 */   0x02, 0xB2, 0xB2, 0x2F, 0xAB, 0x80, 0x2C, 0x13,
            /* 0510 */   0x44, 0x40, 0x4E, 0x07, 0x44, 0xA3, 0x02, 0x51,
            /* 0518 */   0x85, 0x56, 0x80, 0x98, 0x5C, 0x10, 0x01, 0x39,
            /* 0520 */   0x25, 0x10, 0x8D, 0x0C, 0x44, 0x95, 0x6A, 0x01,
            /* 0528 */   0x62, 0xB2, 0x41, 0x04, 0x64, 0x89, 0x5E, 0x80,
            /* 0530 */   0x98, 0x60, 0x10, 0x01, 0x39, 0x2C, 0x10, 0x8D,
            /* 0538 */   0x0E, 0x44, 0x65, 0xBF, 0x0A, 0x04, 0xE4, 0x10,
            /* 0540 */   0x20, 0x3A, 0x25, 0x10, 0x33, 0x40, 0x4C, 0x0E,
            /* 0548 */   0x88, 0x0E, 0x00, 0x04, 0x88, 0xC6, 0x02, 0xA2,
            /* 0550 */   0x92, 0xFE, 0x5B, 0x02, 0xB2, 0x40, 0x10, 0x01,
            /* 0558 */   0x39, 0x1C, 0x10, 0x8D, 0x0A, 0x44, 0xFF, 0xFF
        })
    }

    Scope (\)
    {
        OperationRegion (CMIO, SystemIO, 0x72, 0x02)
        Field (CMIO, ByteAcc, Lock, Preserve)
        {
            CINX,   8, 
            CDAT,   8
        }

        IndexField (CINX, CDAT, ByteAcc, NoLock, Preserve)
        {
            Offset (0x90), 
            CMX0,   32, 
            CMX1,   32, 
            CMX2,   32, 
            CMX3,   32, 
            CMX4,   32, 
            CMX5,   32, 
            CMX6,   32, 
            CMX7,   32
        }

        Method (WB15, 6, NotSerialized)
        {
            CreateDWordField (Arg0, 0x00, OEAX)
            CreateDWordField (Arg0, 0x04, OEBX)
            CreateDWordField (Arg0, 0x08, OECX)
            CreateDWordField (Arg0, 0x0C, OEDX)
            CreateDWordField (Arg0, 0x10, OFLG)
            CreateDWordField (Arg0, 0x14, OESI)
            CreateDWordField (Arg0, 0x18, OEDI)
            Store (0x01, OFLG) /* \WB15.OFLG */
            ShiftRight (Arg1, 0x08, Local6)
            And (Local6, 0xFF, Local6)
            If (LEqual (Local6, 0x00))
            {
                Store (CMX0, OECX) /* \WB15.OECX */
                Store (CMX1, OEDX) /* \WB15.OEDX */
                Store (CMX2, OESI) /* \WB15.OESI */
                Store (CMX3, OEDI) /* \WB15.OEDI */
                Store (0x00, OFLG) /* \WB15.OFLG */
                Return (0x00)
            }

            If (LEqual (Local6, 0x10))
            {
                Store (CMX4, OECX) /* \WB15.OECX */
                Store (CMX5, OEDX) /* \WB15.OEDX */
                Store (CMX6, OESI) /* \WB15.OESI */
                Store (CMX7, OEDI) /* \WB15.OEDI */
                Store (0x00, OFLG) /* \WB15.OFLG */
                Return (0x00)
            }

            If (LEqual (Local6, 0x01))
            {
                Store (Arg2, CMX0) /* \CMX0 */
                Store (Arg3, CMX1) /* \CMX1 */
                Store (Arg4, CMX2) /* \CMX2 */
                Store (Arg5, CMX3) /* \CMX3 */
                Store (0x00, OFLG) /* \WB15.OFLG */
                Return (0x00)
            }

            If (LEqual (Local6, 0x11))
            {
                Store (Arg2, CMX4) /* \CMX4 */
                Store (Arg3, CMX5) /* \CMX5 */
                Store (Arg4, CMX6) /* \CMX6 */
                Store (Arg5, CMX7) /* \CMX7 */
                Store (0x00, OFLG) /* \WB15.OFLG */
                Return (0x00)
            }
        }
    }

    Scope (\)
    {
        Name (BCLP, Package (0x0D)
        {
            0x64, 
            0x3C, 
            0x14, 
            0x1C, 
            0x24, 
            0x2C, 
            0x34, 
            0x3C, 
            0x44, 
            0x4C, 
            0x54, 
            0x5C, 
            0x64
        })
        Name (MAXL, 0x0C)
    }

    Scope (_SB.PCI0.VGA)
    {
        Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
        {
            Store (And (Arg0, 0x03), DSEN) /* \DSEN */
        }

        Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
        {
            Return (Package (0x03)
            {
                0x00010110, 
                0x00010100, 
                0x00010210
            })
        }

        Device (CRT)
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                Return (0x0100)
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If (And (CDST, 0x0101))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x1D)
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If (And (NDST, 0x0101))
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                {
                    Store (NDST, CDST) /* \CDST */
                }
            }
        }

        Device (LCD)
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                Return (0x0110)
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If (And (CDST, 0x0808))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x1D)
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If (And (NDST, 0x0808))
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                {
                    Store (NDST, CDST) /* \CDST */
                }
            }

            Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
            {
                Return (BCLP) /* \BCLP */
            }

            Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
            {
                Store (0x01, Local0)
                Store (0x02, Local1)
                While (Local0)
                {
                    If (LEqual (Arg0, DerefOf (Index (BCLP, Local1))))
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        Increment (Local1)
                        If (LEqual (0x0C, Local1))
                        {
                            Store (0x00, Local0)
                        }
                    }
                }

                Decrement (Local1)
                Decrement (Local1)
                If (And (^^^LPC0.EC0.RDEC (0x7F), 0x02))
                {
                    If (^^^LPC0.EC0.ACST)
                    {
                        ShiftLeft (Local1, 0x00, Local1)
                        ^^^LPC0.EC0.MDEC (0x83, 0xF0, Local1)
                    }
                    Else
                    {
                        ShiftLeft (Local1, 0x04, Local1)
                        ^^^LPC0.EC0.MDEC (0x83, 0x0F, Local1)
                    }
                }
                Else
                {
                    ShiftLeft (Local1, 0x00, Local1)
                    ^^^LPC0.EC0.MDEC (0x83, 0xF0, Local1)
                }

                If (BCVE)
                {
                    If (LEqual (AF7E, 0x80000001))
                    {
                        Store (^^^LPC0.EC0.RDEC (0x87), Local3)
                        ^^^AFN7 (Local3)
                    }
                    Else
                    {
                        HKEY (0x1C)
                    }
                }
            }

            Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
            {
                If (And (^^^LPC0.EC0.RDEC (0x7F), 0x02))
                {
                    If (^^^LPC0.EC0.ACST)
                    {
                        And (^^^LPC0.EC0.RDEC (0x83), 0x0F, Local1)
                        ShiftRight (Local1, 0x00, Local1)
                    }
                    Else
                    {
                        And (^^^LPC0.EC0.RDEC (0x83), 0xF0, Local1)
                        ShiftRight (Local1, 0x04, Local1)
                    }
                }
                Else
                {
                    And (^^^LPC0.EC0.RDEC (0x83), 0x0F, Local1)
                    ShiftRight (Local1, 0x00, Local1)
                }

                Increment (Local1)
                Increment (Local1)
                Store (DerefOf (Index (BCLP, Local1)), Local0)
                Return (Local0)
            }
        }

        Device (TV0)
        {
            Name (_ADR, 0x0200)  // _ADR: Address
            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If (And (CDST, 0x0202))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x1D)
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If (And (NDST, 0x0202))
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                {
                    Store (NDST, CDST) /* \CDST */
                }
            }
        }

        Device (HDMI)
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                Return (0x0210)
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If (And (CDST, 0x0404))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x1D)
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If (And (NDST, 0x0404))
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                {
                    Store (NDST, CDST) /* \CDST */
                }
            }
        }
    }

    Scope (_SB.PCI0.PB3.VGA)
    {
        Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
        {
            Store (And (Arg0, 0x03), DSEN) /* \DSEN */
        }

        Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
        {
            Return (Package (0x03)
            {
                0x00010110, 
                0x00010100, 
                0x00010210
            })
        }

        Device (CRT)
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                Return (0x0100)
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If (And (CDST, 0x0101))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x1D)
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If (And (NDST, 0x0101))
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                {
                    Store (NDST, CDST) /* \CDST */
                }
            }
        }

        Device (LCD)
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                Return (0x0110)
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If (And (CDST, 0x0808))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x1D)
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If (And (NDST, 0x0808))
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                {
                    Store (NDST, CDST) /* \CDST */
                }
            }

            Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
            {
                Return (BCLP) /* \BCLP */
            }

            Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
            {
                Store (0x01, Local0)
                Store (0x02, Local1)
                While (Local0)
                {
                    If (LEqual (Arg0, DerefOf (Index (BCLP, Local1))))
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        Increment (Local1)
                        If (LEqual (0x0C, Local1))
                        {
                            Store (0x00, Local0)
                        }
                    }
                }

                Decrement (Local1)
                Decrement (Local1)
                If (And (^^^^LPC0.EC0.RDEC (0x7F), 0x02))
                {
                    If (^^^^LPC0.EC0.ACST)
                    {
                        ShiftLeft (Local1, 0x00, Local1)
                        ^^^^LPC0.EC0.MDEC (0x83, 0xF0, Local1)
                    }
                    Else
                    {
                        ShiftLeft (Local1, 0x04, Local1)
                        ^^^^LPC0.EC0.MDEC (0x83, 0x0F, Local1)
                    }
                }
                Else
                {
                    ShiftLeft (Local1, 0x00, Local1)
                    ^^^^LPC0.EC0.MDEC (0x83, 0xF0, Local1)
                }

                If (BCVE)
                {
                    If (LEqual (^^^^VGA.AF7E, 0x80000001))
                    {
                        Store (^^^^LPC0.EC0.RDEC (0x87), Local3)
                        ^^^^AFN7 (Local3)
                    }
                    Else
                    {
                        HKEY (0x1C)
                    }
                }
            }

            Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
            {
                If (And (^^^^LPC0.EC0.RDEC (0x7F), 0x02))
                {
                    If (^^^^LPC0.EC0.ACST)
                    {
                        And (^^^^LPC0.EC0.RDEC (0x83), 0x0F, Local1)
                        ShiftRight (Local1, 0x00, Local1)
                    }
                    Else
                    {
                        And (^^^^LPC0.EC0.RDEC (0x83), 0xF0, Local1)
                        ShiftRight (Local1, 0x04, Local1)
                    }
                }
                Else
                {
                    And (^^^^LPC0.EC0.RDEC (0x83), 0x0F, Local1)
                    ShiftRight (Local1, 0x00, Local1)
                }

                Increment (Local1)
                Increment (Local1)
                Store (DerefOf (Index (BCLP, Local1)), Local0)
                Return (Local0)
            }
        }

        Device (TV0)
        {
            Name (_ADR, 0x0200)  // _ADR: Address
            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If (And (CDST, 0x0202))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x1D)
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If (And (NDST, 0x0202))
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                {
                    Store (NDST, CDST) /* \CDST */
                }
            }
        }

        Device (HDMI)
        {
            Method (_ADR, 0, NotSerialized)  // _ADR: Address
            {
                Return (0x0210)
            }

            Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
            {
                If (And (CDST, 0x0404))
                {
                    Return (0x1F)
                }
                Else
                {
                    Return (0x1D)
                }
            }

            Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
            {
                If (And (NDST, 0x0404))
                {
                    Return (0x01)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
            {
                If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                {
                    Store (NDST, CDST) /* \CDST */
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Method (GOST, 0, NotSerialized)
        {
            Store (0x00, Local0)
            If (LOr (LGreater (TPOS, 0x04), LLess (TPOS, 0x40)))
            {
                Store (0x01, Local0)
            }

            If (LEqual (TPOS, 0x40))
            {
                Store (0x02, Local0)
            }

            If (LEqual (TPOS, 0x50))
            {
                Store (0x03, Local0)
            }

            If (LEqual (TPOS, 0x80))
            {
                Store (0x40, Local0)
            }

            Return (Local0)
        }
    }

    Scope (_SB.PCI0.EHC1)
    {
        Device (RHUB)
        {
            Name (_ADR, 0x00)  // _ADR: Address
            Device (PRT3)
            {
                Name (_ADR, 0x04)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, Buffer (0x10)  // _PLD: Physical Location of Device
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                    /*           Revision : 01     */
                    /*        IgnoreColor : 01     */
                    /*              Color : 000000 */
                    /*              Width : 0000   */
                    /*             Height : 0000   */
                    /*        UserVisible : 00     */
                    /*               Dock : 00     */
                    /*                Lid : 00     */
                    /*              Panel : 06     */
                    /*   VerticalPosition : 00     */
                    /* HorizontalPosition : 00     */
                    /*              Shape : 00     */
                    /*   GroupOrientation : 00     */
                    /*         GroupToken : 00     */
                    /*      GroupPosition : 00     */
                    /*                Bay : 00     */
                    /*          Ejectable : 00     */
                    /*  OspmEjectRequired : 00     */
                    /*      CabinetNumber : 00     */
                    /*     CardCageNumber : 00     */
                    /*          Reference : 00     */
                    /*           Rotation : 00     */
                    /*              Order : 00     */
                    /*     VerticalOffset : 0000   */
                    /*   HorizontalOffset : 0000   */
                })
            }

            Device (PRT4)
            {
                Name (_ADR, 0x05)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, Buffer (0x10)  // _PLD: Physical Location of Device
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                    /*           Revision : 01     */
                    /*        IgnoreColor : 01     */
                    /*              Color : 000000 */
                    /*              Width : 0000   */
                    /*             Height : 0000   */
                    /*        UserVisible : 00     */
                    /*               Dock : 00     */
                    /*                Lid : 00     */
                    /*              Panel : 06     */
                    /*   VerticalPosition : 00     */
                    /* HorizontalPosition : 00     */
                    /*              Shape : 00     */
                    /*   GroupOrientation : 00     */
                    /*         GroupToken : 00     */
                    /*      GroupPosition : 00     */
                    /*                Bay : 00     */
                    /*          Ejectable : 00     */
                    /*  OspmEjectRequired : 00     */
                    /*      CabinetNumber : 00     */
                    /*     CardCageNumber : 00     */
                    /*          Reference : 00     */
                    /*           Rotation : 00     */
                    /*              Order : 00     */
                    /*     VerticalOffset : 0000   */
                    /*   HorizontalOffset : 0000   */
                })
            }
        }
    }

    Scope (_SB.PCI0.EHC2)
    {
        Device (RHUB)
        {
            Name (_ADR, 0x00)  // _ADR: Address
            Device (PRT2)
            {
                Name (_ADR, 0x03)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, Buffer (0x10)  // _PLD: Physical Location of Device
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                    /*           Revision : 01     */
                    /*        IgnoreColor : 01     */
                    /*              Color : 000000 */
                    /*              Width : 0000   */
                    /*             Height : 0000   */
                    /*        UserVisible : 00     */
                    /*               Dock : 00     */
                    /*                Lid : 00     */
                    /*              Panel : 06     */
                    /*   VerticalPosition : 00     */
                    /* HorizontalPosition : 00     */
                    /*              Shape : 00     */
                    /*   GroupOrientation : 00     */
                    /*         GroupToken : 00     */
                    /*      GroupPosition : 00     */
                    /*                Bay : 00     */
                    /*          Ejectable : 00     */
                    /*  OspmEjectRequired : 00     */
                    /*      CabinetNumber : 00     */
                    /*     CardCageNumber : 00     */
                    /*          Reference : 00     */
                    /*           Rotation : 00     */
                    /*              Order : 00     */
                    /*     VerticalOffset : 0000   */
                    /*   HorizontalOffset : 0000   */
                })
            }
        }
    }

    Scope (_SB.PCI0.EHC3)
    {
        Device (RHUB)
        {
            Name (_ADR, 0x00)  // _ADR: Address
        }
    }

    Scope (_SB.PCI0.OHC1)
    {
        Device (RHUB)
        {
            Name (_ADR, 0x00)  // _ADR: Address
            Device (PRT3)
            {
                Name (_ADR, 0x04)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, Buffer (0x10)  // _PLD: Physical Location of Device
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                    /*           Revision : 01     */
                    /*        IgnoreColor : 01     */
                    /*              Color : 000000 */
                    /*              Width : 0000   */
                    /*             Height : 0000   */
                    /*        UserVisible : 00     */
                    /*               Dock : 00     */
                    /*                Lid : 00     */
                    /*              Panel : 06     */
                    /*   VerticalPosition : 00     */
                    /* HorizontalPosition : 00     */
                    /*              Shape : 00     */
                    /*   GroupOrientation : 00     */
                    /*         GroupToken : 00     */
                    /*      GroupPosition : 00     */
                    /*                Bay : 00     */
                    /*          Ejectable : 00     */
                    /*  OspmEjectRequired : 00     */
                    /*      CabinetNumber : 00     */
                    /*     CardCageNumber : 00     */
                    /*          Reference : 00     */
                    /*           Rotation : 00     */
                    /*              Order : 00     */
                    /*     VerticalOffset : 0000   */
                    /*   HorizontalOffset : 0000   */
                })
            }

            Device (PRT4)
            {
                Name (_ADR, 0x05)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, Buffer (0x10)  // _PLD: Physical Location of Device
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                    /*           Revision : 01     */
                    /*        IgnoreColor : 01     */
                    /*              Color : 000000 */
                    /*              Width : 0000   */
                    /*             Height : 0000   */
                    /*        UserVisible : 00     */
                    /*               Dock : 00     */
                    /*                Lid : 00     */
                    /*              Panel : 06     */
                    /*   VerticalPosition : 00     */
                    /* HorizontalPosition : 00     */
                    /*              Shape : 00     */
                    /*   GroupOrientation : 00     */
                    /*         GroupToken : 00     */
                    /*      GroupPosition : 00     */
                    /*                Bay : 00     */
                    /*          Ejectable : 00     */
                    /*  OspmEjectRequired : 00     */
                    /*      CabinetNumber : 00     */
                    /*     CardCageNumber : 00     */
                    /*          Reference : 00     */
                    /*           Rotation : 00     */
                    /*              Order : 00     */
                    /*     VerticalOffset : 0000   */
                    /*   HorizontalOffset : 0000   */
                })
            }
        }
    }

    Scope (_SB.PCI0.OHC2)
    {
        Device (RHUB)
        {
            Name (_ADR, 0x00)  // _ADR: Address
            Device (PRT4)
            {
                Name (_ADR, 0x05)  // _ADR: Address
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    0xFF, 
                    0xFF, 
                    0x00, 
                    0x00
                })
                Name (_PLD, Buffer (0x10)  // _PLD: Physical Location of Device
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                    /*           Revision : 01     */
                    /*        IgnoreColor : 01     */
                    /*              Color : 000000 */
                    /*              Width : 0000   */
                    /*             Height : 0000   */
                    /*        UserVisible : 00     */
                    /*               Dock : 00     */
                    /*                Lid : 00     */
                    /*              Panel : 06     */
                    /*   VerticalPosition : 00     */
                    /* HorizontalPosition : 00     */
                    /*              Shape : 00     */
                    /*   GroupOrientation : 00     */
                    /*         GroupToken : 00     */
                    /*      GroupPosition : 00     */
                    /*                Bay : 00     */
                    /*          Ejectable : 00     */
                    /*  OspmEjectRequired : 00     */
                    /*      CabinetNumber : 00     */
                    /*     CardCageNumber : 00     */
                    /*          Reference : 00     */
                    /*           Rotation : 00     */
                    /*              Order : 00     */
                    /*     VerticalOffset : 0000   */
                    /*   HorizontalOffset : 0000   */
                })
            }
        }
    }

    Scope (_SB.PCI0.OHC3)
    {
        Device (RHUB)
        {
            Name (_ADR, 0x00)  // _ADR: Address
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        OperationRegion (CMOS, SystemIO, 0x72, 0x02)
        Field (CMOS, ByteAcc, Lock, Preserve)
        {
            INDX,   8, 
            DATA,   8
        }

        IndexField (INDX, DATA, ByteAcc, Lock, Preserve)
        {
            Offset (0x80), 
            R00H,   8, 
            R01H,   8, 
            R02H,   8, 
            R03H,   8, 
            R04H,   8, 
            R05H,   8, 
            R06H,   8, 
            R07H,   8, 
            R08H,   8, 
            R09H,   8, 
            R0AH,   8, 
            R0BH,   8, 
            R0CH,   8, 
            R0DH,   8, 
            R0EH,   8, 
            R0FH,   8
        }

        IndexField (INDX, DATA, ByteAcc, Lock, Preserve)
        {
            Offset (0x80), 
            R00W,   16, 
            R02W,   16, 
            R04W,   16, 
            R06W,   16, 
            R08D,   32
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        Method (LVKI, 0, NotSerialized)
        {
        }

        Method (_Q5C, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x5C, P80H) /* \P80H */
            Notify (ADP1, 0x80) // Status Change
            Or (VP1D, 0x04, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q28, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x28, P80H) /* \P80H */
            If (One)
            {
                Or (VP2D, 0x20, VP2D) /* \_SB_.PCI0.LPC0.EC0_.VP2D */
                Notify (VPC0, 0x80) // Status Change
            }
            Else
            {
            }
        }

        Method (_Q22, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x22, P80H) /* \P80H */
            Or (VP1D, 0x20, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q2B, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x2B, P80H) /* \P80H */
            If (LEqual (GWSS, 0x00)) {}
            Else
            {
                If (WLPS)
                {
                    Store (WRST, WLEN) /* \_SB_.PCI0.LPC0.EC0_.WLEN */
                }

                If (BTPS)
                {
                    Store (BTST, BTEN) /* \_SB_.PCI0.LPC0.EC0_.BTEN */
                }

                If (WNPS)
                {
                    Store (WNST, WWAN) /* \_SB_.PCI0.LPC0.EC0_.WWAN */
                }
            }

            Or (VP2D, 0x02, VP2D) /* \_SB_.PCI0.LPC0.EC0_.VP2D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q2E, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x2E, P80H) /* \P80H */
            If (CAMC)
            {
                Store (Zero, CAMC) /* \_SB_.PCI0.LPC0.EC0_.CAMC */
            }
            Else
            {
                Store (One, CAMC) /* \_SB_.PCI0.LPC0.EC0_.CAMC */
            }

            Or (VP1D, 0x80, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q70, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x70, P80H) /* \P80H */
            LAMN (0x7A)
        }

        Method (_Q71, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x71, P80H) /* \P80H */
            LAMN (0x7B)
        }

        Method (_Q72, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x72, P80H) /* \P80H */
            LAMN (0x7C)
        }

        Method (_Q73, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x73, P80H) /* \P80H */
            LAMN (0x7D)
        }

        Method (_Q74, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x74, P80H) /* \P80H */
            LAMN (0x7E)
        }

        Method (_Q75, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x75, P80H) /* \P80H */
            LAMN (0x7F)
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        Name (VCMD, 0x00)
        Name (VDAT, 0x00)
        Name (NOVS, 0x00)
        Name (VP1D, 0x00)
        Name (VP2D, 0x00)
        Name (GSPS, 0x00)
        Name (APDT, 0x00)
        Name (OKAD, 0x00)
        Name (ZPOS, 0x00)
        Device (VPC0)
        {
            Name (_HID, "VPC2004")  // _HID: Hardware ID
            Name (_UID, 0x00)  // _UID: Unique ID
            Name (VCFG, 0x000D0400)
            Name (VPCD, 0x00)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CFG, 0, NotSerialized)
            {
                Store (0x00080000, Local0)
                If (LEqual (CENS, 0x01))
                {
                    Or (Local0, 0x00800000, Local0)
                }

                Or (Local0, 0x00700000, Local0)
                If (LEqual (WLPS, 0x01))
                {
                    Or (Local0, 0x00040000, Local0)
                }

                If (LEqual (BTPS, 0x01))
                {
                    Or (Local0, 0x00010000, Local0)
                }

                If (LEqual (WNPS, 0x01))
                {
                    Or (Local0, 0x00020000, Local0)
                }

                Or (Local0, 0x02, Local0)
                Return (Local0)
            }

            Method (APPC, 1, Serialized)
            {
                Return (0x01)
            }

            Method (DBSL, 0, NotSerialized)
            {
                Return (Package (0x0B)
                {
                    0x64, 
                    0x5C, 
                    0x54, 
                    0x4C, 
                    0x44, 
                    0x3C, 
                    0x34, 
                    0x2C, 
                    0x24, 
                    0x1C, 
                    0x14
                })
            }

            Method (SBSL, 0, NotSerialized)
            {
            }

            Method (STHT, 1, Serialized)
            {
                If (Arg0) {}
                Else
                {
                }
            }

            Method (SHDC, 1, Serialized)
            {
                If (Arg0) {}
                Else
                {
                }
            }

            Method (SVCR, 1, Serialized)
            {
            }

            Method (VPCR, 1, Serialized)
            {
                If (LEqual (Arg0, 0x01))
                {
                    Store (VCMD, VPCD) /* \_SB_.PCI0.LPC0.EC0_.VPC0.VPCD */
                }
                Else
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (VDAT, VPCD) /* \_SB_.PCI0.LPC0.EC0_.VPC0.VPCD */
                    }
                    Else
                    {
                        Store (0x00, VPCD) /* \_SB_.PCI0.LPC0.EC0_.VPC0.VPCD */
                    }
                }

                Return (VPCD) /* \_SB_.PCI0.LPC0.EC0_.VPC0.VPCD */
            }

            Method (VPCW, 2, Serialized)
            {
                Store (One, VCMD) /* \_SB_.PCI0.LPC0.EC0_.VCMD */
                If (LEqual (Arg0, 0x01))
                {
                    XCMD (Arg1)
                }
                Else
                {
                    Store (Arg1, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                }

                Store (Zero, VCMD) /* \_SB_.PCI0.LPC0.EC0_.VCMD */
                Return (Zero)
            }

            Method (XCMD, 1, Serialized)
            {
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                Store (Arg0, _T_0) /* \_SB_.PCI0.LPC0.EC0_.VPC0.XCMD._T_0 */
                If (LEqual (_T_0, 0x10))
                {
                    Store (VP1D, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                    Store (0x00, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
                }
                Else
                {
                    If (LEqual (_T_0, 0x1A))
                    {
                        Store (VP2D, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                        Store (0x00, VP2D) /* \_SB_.PCI0.LPC0.EC0_.VP2D */
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x11))
                        {
                            Store (BMAC, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x12))
                            {
                                Store (BNAC, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x13))
                                {
                                    Store (VDAT, BNAC) /* \_SB_.PCI0.LPC0.EC0_.BNAC */
                                    If (BCVE)
                                    {
                                        If (LEqual (^^^^VGA.AF7E, 0x80000001))
                                        {
                                            Store (BNVA, Local3)
                                            AFN7 (Local3)
                                        }
                                        Else
                                        {
                                            HKEY (0x1C)
                                        }
                                    }
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x14))
                                    {
                                        Store (WLEN, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                        Store (VDAT, WRST) /* \WRST */
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x15))
                                        {
                                            Store (VDAT, WLEN) /* \_SB_.PCI0.LPC0.EC0_.WLEN */
                                            Store (VDAT, WRST) /* \WRST */
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x16))
                                            {
                                                Store (BTEN, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                Store (VDAT, BTST) /* \BTST */
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x17))
                                                {
                                                    Store (VDAT, BTEN) /* \_SB_.PCI0.LPC0.EC0_.BTEN */
                                                    Store (VDAT, BTST) /* \BTST */
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x18))
                                                    {
                                                        Store (BLST, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x33))
                                                        {
                                                            Store (VDAT, SWBL) /* \_SB_.PCI0.LPC0.EC0_.SWBL */
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (_T_0, 0x19))
                                                            {
                                                                Store (NOVS, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (_T_0, 0x1B))
                                                                {
                                                                    Store (TPEN, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (_T_0, 0x1C)) {}
                                                                    Else
                                                                    {
                                                                        If (LEqual (_T_0, 0x1D))
                                                                        {
                                                                            Store (CAMC, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (_T_0, 0x1E))
                                                                            {
                                                                                Store (VDAT, CAMC) /* \_SB_.PCI0.LPC0.EC0_.CAMC */
                                                                            }
                                                                            Else
                                                                            {
                                                                                If (LEqual (_T_0, 0x1F))
                                                                                {
                                                                                    Store (WWAN, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                                                    Store (VDAT, WNST) /* \WNST */
                                                                                }
                                                                                Else
                                                                                {
                                                                                    If (LEqual (_T_0, 0x20))
                                                                                    {
                                                                                        Store (VDAT, WWAN) /* \_SB_.PCI0.LPC0.EC0_.WWAN */
                                                                                        Store (VDAT, WNST) /* \WNST */
                                                                                    }
                                                                                    Else
                                                                                    {
                                                                                        If (LEqual (_T_0, 0x21))
                                                                                        {
                                                                                            Store (ZPOS, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                                                            Store (Zero, ZPOS) /* \_SB_.PCI0.LPC0.EC0_.ZPOS */
                                                                                        }
                                                                                        Else
                                                                                        {
                                                                                            If (LEqual (_T_0, 0x22))
                                                                                            {
                                                                                                Store (VDAT, SNBT) /* \_SB_.PCI0.LPC0.EC0_.SNBT */
                                                                                            }
                                                                                            Else
                                                                                            {
                                                                                                If (LEqual (_T_0, 0x23))
                                                                                                {
                                                                                                    Store (GWSS, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                                                                }
                                                                                                Else
                                                                                                {
                                                                                                    If (LEqual (_T_0, 0x24))
                                                                                                    {
                                                                                                        Store (VDAT, BTEN) /* \_SB_.PCI0.LPC0.EC0_.BTEN */
                                                                                                        Store (VDAT, BTST) /* \BTST */
                                                                                                        Store (VDAT, WWAN) /* \_SB_.PCI0.LPC0.EC0_.WWAN */
                                                                                                        Store (VDAT, WNST) /* \WNST */
                                                                                                        Store (VDAT, WLEN) /* \_SB_.PCI0.LPC0.EC0_.WLEN */
                                                                                                        Store (VDAT, WRST) /* \WRST */
                                                                                                    }
                                                                                                    Else
                                                                                                    {
                                                                                                        If (LEqual (_T_0, 0x25))
                                                                                                        {
                                                                                                            Store (0x01, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                                                                        }
                                                                                                        Else
                                                                                                        {
                                                                                                            If (LEqual (_T_0, 0x27))
                                                                                                            {
                                                                                                                Store (CBST, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                                                                            }
                                                                                                            Else
                                                                                                            {
                                                                                                                If (LEqual (_T_0, 0x29))
                                                                                                                {
                                                                                                                    Store (GSPS, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                                                                                }
                                                                                                                Else
                                                                                                                {
                                                                                                                    If (LEqual (_T_0, 0x2B))
                                                                                                                    {
                                                                                                                        Store (SNBT, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                                                                                    }
                                                                                                                    Else
                                                                                                                    {
                                                                                                                        If (LEqual (_T_0, 0x2F))
                                                                                                                        {
                                                                                                                            If (LEqual (RSBM, 0x00))
                                                                                                                            {
                                                                                                                                Store (0x04, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                                                                                            }
                                                                                                                        }
                                                                                                                        Else
                                                                                                                        {
                                                                                                                            If (LEqual (_T_0, 0x31))
                                                                                                                            {
                                                                                                                                Store (OKAD, VDAT) /* \_SB_.PCI0.LPC0.EC0_.VDAT */
                                                                                                                                Store (Zero, OKAD) /* \_SB_.PCI0.LPC0.EC0_.OKAD */
                                                                                                                            }
                                                                                                                            Else
                                                                                                                            {
                                                                                                                                Noop
                                                                                                                            }
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Method (_Q29, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x29, P80H) /* \P80H */
            Store (One, NOVS) /* \_SB_.PCI0.LPC0.EC0_.NOVS */
            Or (VP1D, 0x08, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q76, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x76, P80H) /* \P80H */
            Store (Zero, NOVS) /* \_SB_.PCI0.LPC0.EC0_.NOVS */
            Or (VP1D, 0x08, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (MNOV, 0, NotSerialized)
        {
            LAMN (0x76)
        }

        Method (_Q2F, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x2F, P80H) /* \P80H */
            Or (VP2D, 0x04, VP2D) /* \_SB_.PCI0.LPC0.EC0_.VP2D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q77, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x77, P80H) /* \P80H */
            Or (VP2D, 0x08, VP2D) /* \_SB_.PCI0.LPC0.EC0_.VP2D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q19, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x19, P80H) /* \P80H */
            If (LLessEqual (TPOS, 0x07D2))
            {
                HKDS (0x10)
            }
            Else
            {
                Or (VP1D, 0x40, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
                Notify (VPC0, 0x80) // Status Change
            }
        }

        Method (_Q66, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x66, P80H) /* \P80H */
            Or (OKAD, 0x10, OKAD) /* \_SB_.PCI0.LPC0.EC0_.OKAD */
            Or (VP1D, 0x01, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q67, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x67, P80H) /* \P80H */
            Or (VP1D, 0x02, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q68, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x68, P80H) /* \P80H */
            Or (OKAD, 0x40, OKAD) /* \_SB_.PCI0.LPC0.EC0_.OKAD */
            Or (VP1D, 0x01, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q69, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x69, P80H) /* \P80H */
            Or (OKAD, 0x08, OKAD) /* \_SB_.PCI0.LPC0.EC0_.OKAD */
            Or (VP1D, 0x01, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q6A, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x6A, P80H) /* \P80H */
            Or (OKAD, 0x02, OKAD) /* \_SB_.PCI0.LPC0.EC0_.OKAD */
            Or (VP1D, 0x01, VP1D) /* \_SB_.PCI0.LPC0.EC0_.VP1D */
            Notify (VPC0, 0x80) // Status Change
        }

        Method (_Q21, 0, NotSerialized)  // _Qxx: EC Query
        {
            Store (0x21, P80H) /* \P80H */
            Store (0x01, ZPOS) /* \_SB_.PCI0.LPC0.EC0_.ZPOS */
            Sleep (0x32)
            Or (VP2D, 0x80, VP2D) /* \_SB_.PCI0.LPC0.EC0_.VP2D */
            Notify (VPC0, 0x80) // Status Change
            Store (0x01, OPSE) /* \_SB_.PCI0.LPC0.EC0_.OPSE */
            Store (^^^SMB.P35O, Local0)
            If (LEqual (Local0, 0x01))
            {
                Store (0x88, ODPS) /* \_SB_.PCI0.LPC0.EC0_.ODPS */
            }
            Else
            {
                Or (^^^SMB.P35O, 0x01, ^^^SMB.P35O) /* \_SB_.PCI0.SMB_.P35O */
                Notify (^^^SATA, 0x84) // Device-Specific
                Store (0x56, ODPS) /* \_SB_.PCI0.LPC0.EC0_.ODPS */
            }

            Store (0x03, ZPOS) /* \_SB_.PCI0.LPC0.EC0_.ZPOS */
        }
    }

    Scope (_SB.PCI0.LPC0.EC0.VPC0)
    {
        Method (MHST, 1, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            Name (FANX, 0x00)
            If (LGreaterEqual (Arg0, 0x01))
            {
                Store (Arg0, FANX) /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHST.FANX */
            }

            Store (0x01010000, Local0)
            Store (FANX, _T_0) /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHST._T_0 */
            If (LEqual (_T_0, 0x00))
            {
                If (LGreaterEqual (FANS, 0xFA))
                {
                    Store (0x00, Local1)
                }
                Else
                {
                    Store (FANS, Local1)
                    Decrement (Local1)
                    Divide (0x00078000, Local1, , Local1)
                    If (LGreaterEqual (Local1, 0xFFFF))
                    {
                        Store (0xFFFF, Local1)
                    }
                }

                Or (Local0, Local1, Local0)
            }
            Else
            {
                If (LEqual (_T_0, 0x01)) {}
                Else
                {
                    If (LEqual (_T_0, 0x02)) {}
                    Else
                    {
                        If (LEqual (_T_0, 0x03)) {}
                        Else
                        {
                            If (LEqual (_T_0, 0x04)) {}
                            Else
                            {
                                If (LEqual (_T_0, 0x05)) {}
                                Else
                                {
                                    If (LEqual (_T_0, 0x06)) {}
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x07)) {}
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x40))
                                            {
                                                Store (0x01010001, Local0)
                                                Return (Local0)
                                            }
                                            Else
                                            {
                                                Store (Zero, Local0)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Return (Local0)
        }

        Method (MHTT, 1, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            Name (SENX, 0x00)
            Store (ToInteger (Arg0), SENX) /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHTT.SENX */
            Store (SENX, _T_0) /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHTT._T_0 */
            If (LEqual (_T_0, 0x00))
            {
                Store (Zero, Local0)
                ShiftLeft (Local0, 0x08, Local0)
                Or (Local0, 0x00, Local0)
                ShiftLeft (Local0, 0x08, Local0)
                Or (Local0, 0x00, Local0)
                ShiftLeft (Local0, 0x08, Local0)
                Or (Local0, THS0, Local0)
                Return (Local0)
            }
            Else
            {
                If (LEqual (_T_0, 0x01))
                {
                    Store (THS0, Local0)
                    Return (Local0)
                }
                Else
                {
                    Store (0x00, Local0)
                }
            }

            Return (Local0)
        }

        Method (MHBT, 1, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            Name (RBUF, Buffer (0x10)
            {
                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0008 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Store (Arg0, _T_0) /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHBT._T_0 */
            If (LEqual (_T_0, 0x00))
            {
                Store (0x00, TIID) /* \_SB_.PCI0.LPC0.EC0_.TIID */
                Store (TSP0, Index (RBUF, 0x00))
                Store (TSC0, Index (RBUF, 0x01))
                Store (TSP1, Index (RBUF, 0x02))
                Store (TSC1, Index (RBUF, 0x03))
            }
            Else
            {
                If (LEqual (_T_0, 0x01))
                {
                    Store (0x00, TIID) /* \_SB_.PCI0.LPC0.EC0_.TIID */
                    Store (0x08, Index (RBUF, 0x00))
                    Store (TMH0, Index (RBUF, 0x01))
                    Store (TMH1, Index (RBUF, 0x02))
                    Store (TMH2, Index (RBUF, 0x03))
                    Store (TMH3, Index (RBUF, 0x04))
                    Store (TMH4, Index (RBUF, 0x05))
                    Store (TMH5, Index (RBUF, 0x06))
                    Store (TMH6, Index (RBUF, 0x07))
                    Store (TMH7, Index (RBUF, 0x08))
                    Return (RBUF) /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHBT.RBUF */
                }
                Else
                {
                    If (LEqual (_T_0, 0x40))
                    {
                        Store (0x05, TIID) /* \_SB_.PCI0.LPC0.EC0_.TIID */
                        Store (0x01, Index (RBUF, 0x00))
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x41)) {}
                        Else
                        {
                        }
                    }
                }
            }

            Return (RBUF) /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHBT.RBUF */
        }

        Method (MHFT, 1, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            Store (Arg0, _T_0) /* \_SB_.PCI0.LPC0.EC0_.VPC0.MHFT._T_0 */
            If (LEqual (_T_0, 0x00)) {}
            Else
            {
                If (LEqual (_T_0, 0x80)) {}
                Else
                {
                    If (LEqual (_T_0, 0xFF)) {}
                    Else
                    {
                    }
                }
            }

            Return (0x01)
        }

        Method (MHCT, 1, Serialized)
        {
            If (LEqual (Arg0, 0xFFFFFFFF))
            {
                Store (PSMV, Local0)
                Add (Local0, 0x01, Local0)
                ShiftLeft (Local0, 0x08, Local0)
                TRPS (0xC1, 0x00)
                Store (GCCR, Local4)
                Or (Local0, Local4, Local0)
                ShiftLeft (Local0, 0x10, Local0)
                Or (Local0, 0xC0, Local0)
                Return (Local0)
            }
            Else
            {
                And (Arg0, 0x00FF0000, Local1)
                ShiftRight (Local1, 0x10, Local1)
                If (LGreater (Local1, PSMV))
                {
                    Store (PSMV, Local1)
                }

                SGV3 (Local1)
            }
        }
    }

    Scope (_SB.PCI0.LPC0.EC0.VPC0)
    {
        OperationRegion (ERAM, EmbeddedControl, 0x00, 0xFF)
        Field (RAM, ByteAcc, Lock, Preserve)
        {
            Offset (0x58), 
            ALSD,   8
        }

        Method (HALS, 0, NotSerialized)
        {
            Store (ALSD, Local0)
            Return (Local0)
        }

        Method (SALS, 1, Serialized)
        {
            If (LEqual (Arg0, 0x00))
            {
                Store (ALSD, Local0)
                And (Local0, 0xFE, Local0)
                Store (Local0, ALSD) /* \_SB_.PCI0.LPC0.EC0_.VPC0.ALSD */
            }

            If (LEqual (Arg0, 0x01))
            {
                Store (ALSD, Local0)
                Or (Local0, 0x01, Local0)
                Store (Local0, ALSD) /* \_SB_.PCI0.LPC0.EC0_.VPC0.ALSD */
            }
        }
    }

    Scope (_SB.PCI0.LPC0.EC0.VPC0)
    {
        Name (KSBM, 0x00)
        Method (GBMD, 0, NotSerialized)
        {
            Store (0x10000000, Local0)
            If (LEqual (RSBM, 0x01))
            {
                Or (Local0, 0x01, Local0)
            }

            If (LEqual (SMBM, 0x01))
            {
                Or (Local0, 0x20, Local0)
            }

            If (LEqual (MBNG, 0x01))
            {
                Or (Local0, 0x08, Local0)
            }

            If (LEqual (SBNG, 0x01))
            {
                Or (Local0, 0x10, Local0)
            }

            If (LEqual (LBBM, 0x01))
            {
                Or (Local0, 0x80, Local0)
            }

            If (LEqual (BNBM, 0x01))
            {
                Or (Local0, 0x0100, Local0)
            }

            If (LEqual (CSBM, 0x01))
            {
                Or (Local0, 0x0200, Local0)
            }

            If (LEqual (OPBM, 0x01))
            {
                Or (Local0, 0x0400, Local0)
            }

            If (LEqual (ROBM, 0x01))
            {
                Or (Local0, 0x0800, Local0)
            }

            Return (Local0)
        }

        Method (SBMC, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x00))
            {
                Store (0x00, RSBM) /* \_SB_.PCI0.LPC0.EC0_.RSBM */
            }

            If (LEqual (Arg0, 0x01))
            {
                Store (0x01, RSBM) /* \_SB_.PCI0.LPC0.EC0_.RSBM */
            }

            If (LEqual (Arg0, 0x02)) {}
            If (LEqual (Arg0, 0x03)) {}
            If (LEqual (Arg0, 0x04))
            {
                Store (0x01, SMBM) /* \_SB_.PCI0.LPC0.EC0_.SMBM */
            }

            If (LEqual (Arg0, 0x05))
            {
                Store (0x00, SMBM) /* \_SB_.PCI0.LPC0.EC0_.SMBM */
                Store (0x00, RSBM) /* \_SB_.PCI0.LPC0.EC0_.RSBM */
            }

            If (LEqual (Arg0, 0x06)) {}
        }
    }

    Scope (_SB.PCI0.LPC0.EC0.VPC0)
    {
        Method (HODD, 0, NotSerialized)
        {
            If (LEqual (SZPO, 0x00))
            {
                Store (0x00, ZPOF) /* \_SB_.PCI0.LPC0.EC0_.ZPOF */
                Return (0xFF)
            }
            Else
            {
                Store (0x01, ZPOF) /* \_SB_.PCI0.LPC0.EC0_.ZPOF */
            }

            Store (^^^^SMB.P35O, Local0)
            If (LEqual (Local0, 0x01))
            {
                Return (0x01)
            }
            Else
            {
                Return (0x00)
            }
        }

        Method (SODD, 1, Serialized)
        {
            If (Arg0)
            {
                Store (0x02, ZPOS) /* \_SB_.PCI0.LPC0.EC0_.ZPOS */
                Store (0x01, OPEH) /* \_SB_.PCI0.LPC0.EC0_.OPEH */
                Sleep (0x14)
                Or (^^^^SMB.P35O, 0x01, ^^^^SMB.P35O) /* \_SB_.PCI0.SMB_.P35O */
                Notify (^^^^SATA, 0x84) // Device-Specific
            }
            Else
            {
                And (^^^^SMB.P35O, 0x00, ^^^^SMB.P35O) /* \_SB_.PCI0.SMB_.P35O */
            }
        }
    }
}

