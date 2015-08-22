/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140424-64 [May  4 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of ssdt2.dat, Wed Jul 16 15:33:07 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000193D (6461)
 *     Revision         0x02
 *     Checksum         0x4E
 *     OEM ID           "AMD"
 *     OEM Table ID     "ALIB"
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "MSFT"
 *     Compiler Version 0x04000000 (67108864)
 */
DefinitionBlock ("ssdt2.aml", "SSDT", 2, "AMD", "ALIB", 0x00000001)
{
    /*
     * iASL Warning: There were 1 external control methods found during
     * disassembly, but only 0 was resolved (1 unresolved). Additional
     * ACPI tables may be required to properly disassemble the code. This
     * resulting disassembler output file may not compile because the
     * disassembler did not know how many arguments to assign to the
     * unresolved methods.
     *
     * If necessary, the -fe option can be used to specify a file containing
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
    External (_SB_.ALIC, MethodObj)    // Warning: Unresolved method, guessing 6 arguments


    Scope (\_SB)
    {
        Name (A001, 0x06)
        Name (AD02, 0x03)
        Alias (AD02, A018)
        Name (AD03, 0x03)
        Alias (AD03, A019)
        Name (AD04, 0x00)
        Alias (AD04, A020)
        Name (AD05, 0x01)
        Alias (AD05, A021)
        Name (AD06, Package (0x08)
        {
            0x00, 
            0x00, 
            0x02, 
            0x00, 
            0x00, 
            0x00, 
            0x02, 
            0x00
        })
        Alias (AD06, A022)
        Name (AD08, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Alias (AD08, A023)
        Name (A024, 0x00)
        Name (A025, 0x00)
        Name (A026, 0x01)
        Name (A027, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (A028, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (A029, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (AD09, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Alias (AD09, A030)
        Name (A031, Package (0x08)
        {
            0x01, 
            0x01, 
            0x01, 
            0x01, 
            0x01, 
            0x01, 
            0x01, 
            0x01
        })
        Name (A032, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (A034, 0x00)
        Name (AD10, Package (0x04)
        {
            0x35, 
            0x2D, 
            0x2D, 
            0x2D
        })
        Alias (AD10, A035)
        Method (A036, 1, Serialized)
        {
            Store (DerefOf (Index (Arg0, 0x02)), Local1)
            Store (A013 (), Local0)
            Store (Local1, A025) /* \_SB_.A025 */
            Or (ShiftLeft (0x01, 0x05), ShiftLeft (0x01, 0x06), Local2)
            Or (ShiftLeft (A025, 0x05), ShiftLeft (A026, 0x06), Local3)
            A017 (0x00, 0x60, 0xF4, Not (Local2), And (Local2, Local3
                ))
            If (LEqual (Local1, Local0))
            {
                Return (0x00)
            }

            A006 (A025)
            If (LEqual (A018, 0x04))
            {
                A012 (0x01)
                A014 (0x01)
            }

            If (LOr (LLessEqual (A018, 0x01), LGreaterEqual (A018, 0x04)))
            {
                Return (0x00)
            }

            If (LEqual (A024, 0x00))
            {
                Return (0x00)
            }

            A037 ()
            Return (0x00)
        }

        Method (A038, 1, NotSerialized)
        {
            Store (A039 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x02)), Local0)
            If (LNotEqual (Local0, 0x02))
            {
                Return (Local7)
            }

            A037 ()
            Return (Local7)
        }

        Method (A039, 1, NotSerialized)
        {
            Name (A040, 0x00)
            Store (0x00, A034) /* \_SB_.A034 */
            Store (Buffer (0x0A) {}, Local7)
            CreateWordField (Local7, 0x00, A041)
            Store (0x03, A041) /* \_SB_.A039.A041 */
            CreateByteField (Local7, 0x02, A042)
            Store (0x01, A042) /* \_SB_.A039.A042 */
            If (LOr (LLessEqual (A018, 0x01), LGreaterEqual (A018, 0x04)))
            {
                Return (Local7)
            }

            If (LEqual (A024, 0x00))
            {
                Return (Local7)
            }

            CreateWordField (Arg0, 0x02, A043)
            CreateWordField (Arg0, 0x04, A044)
            CreateWordField (Arg0, 0x06, A045)
            CreateByteField (Arg0, 0x08, A046)
            CreateByteField (Arg0, 0x09, A047)
            And (ShiftRight (A043, 0x08), 0xFF, A040) /* \_SB_.A039.A040 */
            While (LLessEqual (A034, A001))
            {
                If (LEqual (A048 (A034), 0x01))
                {
                    Store (A008 (ShiftLeft (Add (A034, 0x02), 0x03), 0x18), 
                        Local1)
                    And (ShiftRight (Local1, 0x10), 0xFF, Local2)
                    And (ShiftRight (Local1, 0x08), 0xFF, Local1)
                    If (LAnd (LGreaterEqual (A040, Local1), LLessEqual (A040, Local2)))
                    {
                        Break
                    }
                }

                Increment (A034)
            }

            If (LGreater (A034, A001))
            {
                Return (Local7)
            }

            If (LEqual (DerefOf (Index (A027, A034)), 0x00))
            {
                Store (A043, Index (A027, A034))
            }
            Else
            {
                If (LNotEqual (DerefOf (Index (A027, A034)), A043))
                {
                    Return (Local7)
                }
            }

            Store (0x00, Index (A032, A034))
            If (LEqual (A047, 0x00))
            {
                Store (0x00, Index (A027, A034))
            }

            If (LEqual (A047, 0x01))
            {
                Store (0x01, Index (A032, A034))
            }

            If (LEqual (A047, 0x02))
            {
                Store (0x01, Index (A029, A034))
            }

            If (LEqual (A047, 0x03))
            {
                Store (0x02, Index (A029, A034))
            }

            If (LEqual (And (A044, A045), 0x01))
            {
                Store (DerefOf (Index (A022, A034)), Index (A029, A034))
            }

            Store (0x02, A042) /* \_SB_.A039.A042 */
            Return (Local7)
        }

        Method (A048, 1, Serialized)
        {
            If (LEqual (DerefOf (Index (A022, Arg0)), 0x00))
            {
                Return (0x00)
            }

            Return (0x01)
        }

        Method (A049, 1, Serialized)
        {
            Store (Buffer (0x0100) {}, Local7)
            Store (0x03, Index (Local7, 0x00))
            Store (0x00, Index (Local7, 0x01))
            Store (0x00, Index (Local7, 0x02))
            Store (DerefOf (Index (Arg0, 0x02)), A024) /* \_SB_.A024 */
            Store (A016 (0x00, 0x60, 0xF4), Local0)
            If (LEqual (A024, 0x01))
            {
                If (LEqual (And (Local0, 0x01), 0x01))
                {
                    Return (Local7)
                }

                Or (Local0, 0x01, Local0)
            }

            If (LEqual (A024, 0x00))
            {
                If (LEqual (And (Local0, 0x01), 0x00))
                {
                    Return (Local7)
                }

                And (Local0, Not (0x01), Local0)
            }

            Or (Local0, ShiftLeft (A018, 0x01), Local0)
            A050 (0x00, 0x60, 0xF4, Local0)
            A051 (RefOf (A028), RefOf (A027))
            A006 (A025)
            If (LEqual (A018, 0x04))
            {
                A012 (0x01)
                A014 (0x01)
            }

            If (LAnd (LGreater (A018, 0x01), LLess (A018, 0x04)))
            {
                If (LEqual (A018, 0x02))
                {
                    A051 (RefOf (A022), RefOf (A030))
                    Store (0x00, A034) /* \_SB_.A034 */
                    While (LLessEqual (A034, A001))
                    {
                        If (LNotEqual (DerefOf (Index (A023, A034)), 0x00))
                        {
                            Store (DerefOf (Index (A023, A034)), Index (A030, A034))
                        }

                        Increment (A034)
                    }
                }
                Else
                {
                    A051 (RefOf (A031), RefOf (A030))
                }

                A037 ()
            }

            Return (Local7)
        }

        Name (A052, Package (0x08)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Method (A037, 0, Serialized)
        {
            Store (0x00, A034) /* \_SB_.A034 */
            A051 (RefOf (A031), RefOf (A052))
            While (LLessEqual (A034, A001))
            {
                If (LEqual (A048 (A034), 0x01))
                {
                    Store (A053 (A034), Index (A052, A034))
                }

                Increment (A034)
            }

            If (LNotEqual (Match (A032, MEQ, 0x01, MTR, 0x00, 0x00), 
                Ones))
            {
                A051 (RefOf (A031), RefOf (A052))
            }

            If (LNotEqual (Match (A052, MEQ, 0x02, MTR, 0x00, 0x00), 
                Ones))
            {
                A014 (0x02)
                A054 (A019, 0x01)
                A012 (0x02)
            }

            Store (0x00, A034) /* \_SB_.A034 */
            While (LLessEqual (A034, A001))
            {
                If (LEqual (A048 (A034), 0x00))
                {
                    Increment (A034)
                    Continue
                }

                Store (DerefOf (Index (A030, A034)), Local0)
                Store (DerefOf (Index (A052, A034)), Local2)
                If (LEqual (Local0, Local2))
                {
                    Increment (A034)
                    Continue
                }

                Store (Local2, Index (A030, A034))
                A055 (A034, Local2)
                Increment (A034)
            }

            If (LEqual (Match (A052, MEQ, 0x02, MTR, 0x00, 0x00), Ones))
            {
                A012 (0x01)
                A054 (A020, 0x00)
                A014 (0x01)
            }
        }

        Method (A053, 1, NotSerialized)
        {
            Store (0x02, Local0)
            If (LEqual (DerefOf (Index (A027, Arg0)), 0x00))
            {
                If (LOr (LEqual (A013 (), 0x01), LEqual (A018, 0x03)))
                {
                    Store (0x01, Local0)
                }

                If (LNotEqual (DerefOf (Index (A023, Arg0)), 0x00))
                {
                    Store (DerefOf (Index (A023, Arg0)), Local0)
                }
            }
            Else
            {
                Store (DerefOf (Index (A029, Arg0)), Local0)
            }

            Return (Local0)
        }

        Method (A055, 2, NotSerialized)
        {
            If (LEqual (Arg0, 0x06))
            {
                A017 (0x00, 0x60, 0x80, Not (0x40), 0x40)
            }

            A056 (Arg0, Arg1)
            If (LNotEqual (DerefOf (Index (A027, Arg0)), 0x00))
            {
                A057 (Arg0, 0xA1, Not (0x1000), 0x00)
            }
            Else
            {
                A057 (Arg0, 0xA1, Not (0x1000), 0x1000)
            }

            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local1)
            And (A008 (Local1, 0x70), 0x00400000, Local3)
            If (LNotEqual (Local3, 0x00))
            {
                A058 (Arg0)
                Store (0x01, Local2)
                While (Local2)
                {
                    A059 (Local1, 0x68, Not (0x00), 0x20)
                    Sleep (0x1E)
                    While (And (A008 (Local1, 0x68), 0x08000000))
                    {
                        Sleep (0x0A)
                    }

                    Store (0x00, Local2)
                    If (LEqual (Arg1, 0x01))
                    {
                        Store (A060 (Arg0, 0xA4), Local4)
                        If (LNotEqual (And (Local4, 0x0800), 0x00))
                        {
                            Store (0x01, Local2)
                        }
                    }
                }

                A061 (Arg0)
            }
            Else
            {
            }

            If (LEqual (Arg0, 0x06))
            {
                A017 (0x00, 0x60, 0x80, Not (0x40), 0x00)
            }
        }

        Name (A062, Package (0x09)
        {
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00, 
            0x00
        })
        Name (A063, 0x00)
        Name (A064, 0x00)
        Method (A058, 1, Serialized)
        {
            Store (0x00, A063) /* \_SB_.A063 */
            Store (0x00, A064) /* \_SB_.A064 */
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local1)
            If (LEqual (Arg0, 0x06))
            {
                Store (A065 (0x00, 0x00), Index (A062, 0x00))
                A065 (0x00, 0x01)
                Return (0x00)
            }

            Store (A008 (Local1, 0x18), Local3)
            Store (And (ShiftRight (Local3, 0x08), 0xFF), Local3)
            Store (ShiftLeft (Local3, 0x08), Local2)
            Store (A008 (Local2, 0x0C), Local3)
            Store (And (ShiftRight (Local3, 0x10), 0xFF), Local3)
            If (LNotEqual (And (Local3, 0x80), 0x00))
            {
                Store (0x07, Local0)
            }
            Else
            {
                Store (0x00, Local0)
            }

            Store (0x00, Local4)
            While (LLessEqual (Local4, Local0))
            {
                Store (A066 (Add (Local2, Local4), 0x10), A063) /* \_SB_.A063 */
                If (LEqual (A063, 0x00))
                {
                    Increment (Local4)
                    Continue
                }

                Add (A063, 0x10, A063) /* \_SB_.A063 */
                Store (A008 (Add (Local2, Local4), A063), A064) /* \_SB_.A064 */
                Store (And (A064, 0x03), Index (A062, Local4))
                A059 (Add (Local2, Local4), A063, Not (0x03), 0x00)
                Increment (Local4)
            }
        }

        Method (A061, 1, Serialized)
        {
            Store (0x00, A063) /* \_SB_.A063 */
            Store (0x00, A064) /* \_SB_.A064 */
            If (LEqual (Arg0, 0x06))
            {
                A065 (DerefOf (Index (A062, 0x00)), 0x01)
                Return (0x00)
            }

            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local1)
            Store (A008 (Local1, 0x18), Local3)
            Store (And (ShiftRight (Local3, 0x08), 0xFF), Local3)
            Store (ShiftLeft (Local3, 0x08), Local2)
            Store (A008 (Local2, 0x0C), Local3)
            Store (And (ShiftRight (Local3, 0x10), 0xFF), Local3)
            If (LNotEqual (And (Local3, 0x80), 0x00))
            {
                Store (0x07, Local0)
            }
            Else
            {
                Store (0x00, Local0)
            }

            Store (0x00, Local4)
            While (LLessEqual (Local4, Local0))
            {
                Store (A066 (Add (Local2, Local4), 0x10), A063) /* \_SB_.A063 */
                If (LEqual (A063, 0x00))
                {
                    Increment (Local4)
                    Continue
                }

                Add (A063, 0x10, A063) /* \_SB_.A063 */
                A009 (Add (Local2, Local4), A063, DerefOf (Index (A062, Local4
                    )))
                Increment (Local4)
            }
        }

        Method (A056, 2, NotSerialized)
        {
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local0)
            If (LEqual (Arg1, 0x01))
            {
                A059 (Local0, 0x88, Not (0x2F), 0x21)
                A057 (Arg0, 0xA4, Not (0x20000001), 0x00)
            }
            Else
            {
                A057 (Arg0, 0xA4, Not (0x20000001), 0x20000001)
                A059 (Local0, 0x88, Not (0x2F), 0x02)
            }
        }

        Method (A051, 2, NotSerialized)
        {
            Store (SizeOf (Arg0), Local1)
            Store (0x00, Local0)
            While (LLess (Local0, Local1))
            {
                Store (DerefOf (Index (DerefOf (Arg0), Local0)), Index (DerefOf (Arg1), 
                    Local0))
                Increment (Local0)
            }
        }

        Method (A013, 0, NotSerialized)
        {
            Return (And (A025, A026))
        }

        Name (A067, 0x00)
        Name (A068, 0x00)
        Name (A069, 0x00)
        Name (A070, 0x00)
        Name (A071, 0x00)
        Name (A072, 0x00)
        Name (A073, Buffer (0x10)
        {
            /* 0000 */   0x01, 0x02, 0x04, 0x04, 0x08, 0x08, 0x08, 0x08,
            /* 0008 */   0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10
        })
        Method (A074, 1, NotSerialized)
        {
            Name (A040, 0x00)
            Name (A075, 0x00)
            Store (0x00, A034) /* \_SB_.A034 */
            Store (Buffer (0x0A) {}, Local7)
            Store (DerefOf (Index (Arg0, 0x03)), A040) /* \_SB_.A074.A040 */
            Store (DerefOf (Index (Arg0, 0x04)), A075) /* \_SB_.A074.A075 */
            Store (0x03, Index (Local7, 0x00))
            Store (0x00, Index (Local7, 0x01))
            Store (A075, Index (Local7, 0x02))
            While (LLessEqual (A034, A001))
            {
                If (LEqual (A048 (A034), 0x01))
                {
                    Store (A008 (ShiftLeft (Add (A034, 0x02), 0x03), 0x18), 
                        Local1)
                    And (ShiftRight (Local1, 0x10), 0xFF, Local2)
                    And (ShiftRight (Local1, 0x08), 0xFF, Local1)
                    If (LAnd (LGreaterEqual (A040, Local1), LLessEqual (A040, Local2)))
                    {
                        Break
                    }
                }

                Increment (A034)
            }

            If (LGreater (A034, A001))
            {
                Return (Local7)
            }

            If (LLessEqual (A076 (A034, 0x01), A075))
            {
                Return (Local7)
            }

            Store (DerefOf (Index (A073, A075)), Local1)
            A077 (A034, 0x01, 0x00)
            A077 (A034, 0x02, Local1)
            Store (Local1, Index (Local7, 0x02))
            Return (Local7)
        }

        Method (A078, 1, Serialized)
        {
            Store (DerefOf (Index (Arg0, 0x04)), Local0)
            Store (DerefOf (Index (Arg0, 0x02)), Local1)
            Subtract (ShiftRight (Local1, 0x03), 0x02, Local1)
            If (LEqual (Local0, 0x01))
            {
                Store (0x06, Local2)
            }
            Else
            {
                Store (0x04, Local2)
            }

            Store (A079 (Local1, Local2), Local0)
            Store (Buffer (0x0A) {}, Local7)
            CreateWordField (Local7, 0x00, A041)
            CreateByteField (Local7, 0x02, A042)
            CreateByteField (Local7, 0x03, A080)
            Store (0x04, A041) /* \_SB_.A078.A041 */
            Store (0x00, A042) /* \_SB_.A078.A042 */
            Store (Local0, A080) /* \_SB_.A078.A080 */
            Return (Local7)
        }

        Name (A081, Buffer (0x0A)
        {
            /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            /* 0008 */   0x00, 0x00
        })
        Method (A079, 2, Serialized)
        {
            Store (0x00, Local4)
            Store (A082 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x07)), Local1)
            If (LNotEqual (Local1, 0x01))
            {
                Return (Local4)
            }

            Store (Arg1, Local2)
            While (LNotEqual (Local2, 0x08))
            {
                If (LEqual (Local2, 0x06))
                {
                    Store (0x00, Index (A023, Arg0))
                    A057 (Arg0, 0xA2, Not (0x2000), 0x00)
                    Store (0x00, A026) /* \_SB_.A026 */
                    A037 ()
                    A077 (Arg0, 0x01, 0x00)
                    A083 (Arg0, 0x00)
                    Store (0x01, Local2)
                    Store (0x00, Local3)
                }

                If (LEqual (Local2, 0x01))
                {
                    And (A060 (Arg0, 0xA5), 0x3F, Local1)
                    If (LGreater (Local1, 0x04))
                    {
                        Store (0x02, Local2)
                        Store (0x00, Local3)
                        Continue
                    }

                    If (LLess (Local3, 0x50))
                    {
                        Sleep (0x01)
                        Increment (Local3)
                    }
                    Else
                    {
                        Store (0x04, Local2)
                    }
                }

                If (LEqual (Local2, 0x02))
                {
                    Store (A060 (Arg0, 0xA5), Local1)
                    And (Local1, 0x3F, Local1)
                    If (LEqual (Local1, 0x10))
                    {
                        Store (0x05, Local2)
                        Continue
                    }

                    If (LLess (Local3, 0x50))
                    {
                        Sleep (0x01)
                        Increment (Local3)
                        Continue
                    }

                    Store (0x04, Local2)
                    If (LEqual (DerefOf (Index (A023, Arg0)), 0x01))
                    {
                        Continue
                    }

                    If (LEqual (A084 (Arg0), 0x01))
                    {
                        A057 (Arg0, 0xA2, Not (0x2000), 0x2000)
                        Store (0x01, Index (A023, Arg0))
                        A056 (Arg0, 0x01)
                        Store (0x07, Local2)
                    }
                }

                If (LEqual (Local2, 0x04))
                {
                    A083 (Arg0, 0x01)
                    A077 (Arg0, 0x00, 0x00)
                    Store (0x01, Index (A023, Arg0))
                    Store (0x00, Local2)
                }

                If (LEqual (Local2, 0x07))
                {
                    If (CondRefOf (\_SB.ALIC, Local6))
                    {
                        Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local1)
                        \_SB.ALIC (Local1, 0x00, Sleep (0x02), \_SB.ALIC (Local1, 0x01, Store (0x00, 
                            Local3), Store (0x01, Local2), Continue, Store (0x04, Local2)), If (LEqual (Local2, 
                            0x05))
                            {
                                Store (0x01, Local4)
                                Store (0x00, Local2)
                            }, If (LEqual (Local2, 0x00))
                            {
                                Store (0x01, A026) /* \_SB_.A026 */
                                A037 ()
                                Store (0x08, Local2)
                            })
                    }
                }
            }

            Return (Local4)
        }

        Method (A077, 3, Serialized)
        {
            Store (A082 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x02)), A069) /* \_SB_.A069 */
            Store (DerefOf (Index (Local7, 0x03)), A070) /* \_SB_.A070 */
            If (LEqual (Arg1, 0x00))
            {
                A085 (Arg0, A069, A070, 0x01)
            }

            If (LEqual (Arg1, 0x01))
            {
                A085 (Arg0, A069, A070, 0x00)
            }

            If (LNotEqual (Arg1, 0x02))
            {
                Return (0x00)
            }

            If (LEqual (Arg2, 0x00))
            {
                Store (A076 (Arg0, 0x00), Local2)
            }
            Else
            {
                Store (Arg2, Local2)
            }

            If (LLessEqual (A076 (Arg0, 0x01), Local2))
            {
                Return (0x00)
            }

            Store (A086 (Arg0), Local1)
            If (LEqual (Local1, 0x00))
            {
                Add (A069, Local2, Local3)
                Store (A070, Local4)
            }
            Else
            {
                Subtract (A070, Local2, Local4)
                Store (A069, Local3)
            }

            A085 (Arg0, Local3, Local4, 0x01)
            Return (0x00)
        }

        Method (A084, 1, NotSerialized)
        {
            Store (Buffer (0x10) {}, Local1)
            Store (0x00, Local0)
            While (LLessEqual (Local0, 0x03))
            {
                Store (A060 (Arg0, Add (Local0, 0xA5)), Local2)
                Store (Local2, Index (Local1, Multiply (Local0, 0x04)))
                Store (ShiftRight (Local2, 0x08), Index (Local1, Add (Multiply (Local0, 
                    0x04), 0x01)))
                Store (ShiftRight (Local2, 0x10), Index (Local1, Add (Multiply (Local0, 
                    0x04), 0x02)))
                Store (ShiftRight (Local2, 0x18), Index (Local1, Add (Multiply (Local0, 
                    0x04), 0x03)))
                Increment (Local0)
            }

            Store (0x00, Local0)
            While (LLess (Local0, 0x0F))
            {
                If (LAnd (LEqual (DerefOf (Index (Local1, Local0)), 0x2A), LEqual (
                    DerefOf (Index (Local1, Add (Local0, 0x01))), 0x09)))
                {
                    Return (0x01)
                }

                Increment (Local0)
            }

            Return (0x00)
        }

        Method (A086, 1, Serialized)
        {
            Store (A082 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x00)), A067) /* \_SB_.A067 */
            Store (DerefOf (Index (Local7, 0x01)), A068) /* \_SB_.A068 */
            Store (0x00, Local0)
            If (LGreater (A067, A068))
            {
                Store (0x01, Local0)
            }

            And (A060 (Arg0, 0x50), 0x01, Local1)
            Return (And (XOr (Local0, Local1), 0x01))
        }

        Method (A083, 2, NotSerialized)
        {
            Store (A082 (Arg0), Local7)
            Store (DerefOf (Index (Local7, 0x04)), A072) /* \_SB_.A072 */
            Store (Or (ShiftLeft (DerefOf (Index (Local7, Add (0x05, 0x01)
                )), 0x08), DerefOf (Index (Local7, 0x05))), A071) /* \_SB_.A071 */
            A017 (0x00, 0xE0, Or (ShiftLeft (A071, 0x10), Add (0x0800, 
                Multiply (0x0100, A072))), Not (0x01), Arg1)
        }

        Name (A087, Buffer (0x07)
        {
             0x00, 0x01, 0x02, 0x04, 0x08, 0x0C, 0x10
        })
        Method (A076, 2, NotSerialized)
        {
            If (LEqual (Arg1, 0x00))
            {
                And (ShiftRight (A060 (Arg0, 0xA2), 0x04), 0x07, Local0)
                Store (DerefOf (Index (A087, Local0)), Local1)
            }
            Else
            {
                Store (A082 (Arg0), Local7)
                Store (DerefOf (Index (Local7, 0x00)), A067) /* \_SB_.A067 */
                Store (DerefOf (Index (Local7, 0x01)), A068) /* \_SB_.A068 */
                If (LGreater (A067, A068))
                {
                    Subtract (A067, A068, Local1)
                }
                Else
                {
                    Subtract (A068, A067, Local1)
                }

                Increment (Local1)
            }

            Return (Local1)
        }

        Method (A085, 4, Serialized)
        {
            Store (A082 (Arg0), Local7)
            Store (Arg1, A069) /* \_SB_.A069 */
            Store (Arg2, A070) /* \_SB_.A070 */
            Store (Or (ShiftLeft (DerefOf (Index (Local7, Add (0x05, 0x01)
                )), 0x08), DerefOf (Index (Local7, 0x05))), A071) /* \_SB_.A071 */
            If (LGreater (A069, A070))
            {
                Subtract (A069, A070, Local1)
                Store (A070, Local2)
            }
            Else
            {
                Subtract (A070, A069, Local1)
                Store (A069, Local2)
            }

            ShiftLeft (Subtract (ShiftLeft (0x01, Add (Local1, 0x01)), 0x01
                ), Local2, Local3)
            Store (Not (Local3), Local4)
            If (LEqual (Arg3, 0x01))
            {
                Store (0x00, Local3)
            }

            A017 (0x00, 0xE0, Or (ShiftLeft (A071, 0x10), 0x8023), 
                Local4, Local3)
            Stall (0x0A)
        }

        Name (AD01, 0xF8000000)
        Alias (AD01, A088)
        Name (AD07, Package (0x08)
        {
            Buffer (0x0A)
            {
                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0008 */   0x00, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x10, 0x17, 0x08, 0x0F, 0x01, 0x31, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x04, 0x04, 0x04, 0x04, 0x01, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x05, 0x05, 0x05, 0x05, 0x02, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x06, 0x06, 0x06, 0x06, 0x03, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x07, 0x07, 0x07, 0x07, 0x04, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x00, 0x03, 0x00, 0x03, 0x00, 0x30, 0x01, 0x00,
                /* 0008 */   0x02, 0x00
            }, 

            Buffer (0x0A)
            {
                /* 0000 */   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                /* 0008 */   0x00, 0x00
            }
        })
        Alias (AD07, A089)
        Method (A082, 1, NotSerialized)
        {
            Return (DerefOf (Index (A089, Arg0)))
        }

        Method (A008, 2, Serialized)
        {
            Add (A088, ShiftLeft (Arg0, 0x0C), Local0)
            Add (Arg1, Local0, Local0)
            OperationRegion (A090, SystemMemory, Local0, 0x04)
            Field (A090, DWordAcc, NoLock, Preserve)
            {
                A091,   32
            }

            Return (A091) /* \_SB_.A008.A091 */
        }

        Method (A009, 3, Serialized)
        {
            Add (A088, ShiftLeft (Arg0, 0x0C), Local0)
            Add (Arg1, Local0, Local0)
            OperationRegion (A090, SystemMemory, Local0, 0x04)
            Field (A090, DWordAcc, NoLock, Preserve)
            {
                A091,   32
            }

            Store (Arg2, A091) /* \_SB_.A009.A091 */
        }

        Method (A059, 4, Serialized)
        {
            Store (A008 (Arg0, Arg1), Local0)
            Or (And (Local0, Arg2), Arg3, Local0)
            A009 (Arg0, Arg1, Local0)
        }

        Mutex (A092, 0x00)
        Method (A060, 2, NotSerialized)
        {
            Acquire (A092, 0xFFFF)
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local0)
            A009 (Local0, 0xE0, Arg1)
            Store (A008 (Local0, 0xE4), Local0)
            Release (A092)
            Return (Local0)
        }

        Method (A093, 3, NotSerialized)
        {
            Acquire (A092, 0xFFFF)
            Store (ShiftLeft (Add (Arg0, 0x02), 0x03), Local0)
            A009 (Local0, 0xE0, Arg1)
            A009 (Local0, 0xE4, Arg2)
            Release (A092)
        }

        Method (A057, 4, NotSerialized)
        {
            Store (A060 (Arg0, Arg1), Local0)
            Or (And (Local0, Arg2), Arg3, Local0)
            A093 (Arg0, Arg1, Local0)
        }

        Mutex (A094, 0x00)
        Method (A016, 3, NotSerialized)
        {
            Acquire (A094, 0xFFFF)
            A009 (Arg0, Arg1, Arg2)
            Store (A008 (Arg0, Add (Arg1, 0x04)), Local0)
            Release (A094)
            Return (Local0)
        }

        Method (A050, 4, NotSerialized)
        {
            Acquire (A094, 0xFFFF)
            A009 (Arg0, Arg1, Arg2)
            A009 (Arg0, Add (Arg1, 0x04), Arg3)
            Release (A094)
        }

        Method (A017, 5, NotSerialized)
        {
            Store (A016 (Arg0, Arg1, Arg2), Local0)
            Or (And (Local0, Arg3), Arg4, Local0)
            A050 (Arg0, Arg1, Arg2, Local0)
        }

        Method (A066, 2, NotSerialized)
        {
            Store (0x34, Local1)
            If (LEqual (A008 (Arg0, 0x00), 0xFFFFFFFF))
            {
                Return (0x00)
            }

            Store (0x01, Local0)
            While (LEqual (Local0, 0x01))
            {
                Store (And (A008 (Arg0, Local1), 0xFF), Local1)
                If (LEqual (Local1, 0x00))
                {
                    Break
                }

                If (LEqual (And (A008 (Arg0, Local1), 0xFF), Arg1))
                {
                    Store (0x00, Local0)
                }
                Else
                {
                    Increment (Local1)
                }
            }

            Return (Local1)
        }

        Method (A065, 2, Serialized)
        {
            OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
            Field (PMIO, ByteAcc, NoLock, Preserve)
            {
                PMRI,   8, 
                PMRD,   8
            }

            IndexField (PMRI, PMRD, ByteAcc, NoLock, Preserve)
            {
                Offset (0xE0), 
                ABAR,   32
            }

            OperationRegion (ACFG, SystemIO, ABAR, 0x08)
            Field (ACFG, DWordAcc, NoLock, Preserve)
            {
                ABIX,   32, 
                ABDA,   32
            }

            Store (0x00, Local0)
            If (LEqual (Arg1, 0x00))
            {
                Store (0x80000068, ABIX) /* \_SB_.A065.ABIX */
                Store (ABDA, Local0)
                Return (Local0)
            }
            Else
            {
                Store (0x80000068, ABIX) /* \_SB_.A065.ABIX */
                Store (ABDA, Local0)
                Or (And (Local0, 0xFFFFFFFC), Arg0, Local0)
                Store (Local0, ABDA) /* \_SB_.A065.ABDA */
            }
        }

        Name (A095, Buffer (0x0100) {})
        Method (A096, 1, NotSerialized)
        {
            Store (A016 (0x00, 0x60, 0xCD), Local0)
            Increment (Arg0)
            Or (And (Local0, 0xFEFFFFFF), And (Not (And (Local0, 0x01000000
                )), 0x01000000), Local0)
            Or (And (Local0, 0xFD00FFFF), ShiftLeft (Arg0, 0x10), Local0)
            A050 (0x00, 0x60, 0xCD, Local0)
            Store (A016 (0x00, 0x60, 0xCE), Local0)
            Return (Local0)
        }

        Method (A097, 3, NotSerialized)
        {
            Store (A016 (0x00, 0x60, 0xCD), Local0)
            Store (And (Arg1, 0xFFFF), Local1)
            Or (And (Local0, 0xFEFFFFFF), And (Not (And (Local0, 0x01000000
                )), 0x01000000), Local0)
            Or (And (Local0, 0xFD000000), ShiftLeft (Arg0, 0x10), Local0)
            Or (Local0, 0x02000000, Local0)
            Or (Local0, Local1, Local0)
            A050 (0x00, 0x60, 0xCD, Local0)
            If (LEqual (Arg2, 0x01))
            {
                Store (ShiftRight (Arg1, 0x10), Local1)
                Or (And (Local0, 0xFEFFFFFF), And (Not (And (Local0, 0x01000000
                    )), 0x01000000), Local0)
                Or (And (Local0, 0xFF000000), ShiftLeft (Add (Arg0, 0x01), 
                    0x10), Local0)
                Or (Local0, Local1, Local0)
                A050 (0x00, 0x60, 0xCD, Local0)
            }
        }

        Method (A011, 2, NotSerialized)
        {
            Or (ShiftLeft (Arg0, 0x03), 0x01, Local0)
            A097 (0x03, Local0, 0x01)
            If (LAnd (Arg1, 0x01))
            {
                While (LNotEqual (And (A096 (0x03), 0x02), 0x02)) {}
            }

            If (LAnd (Arg1, 0x02))
            {
                While (LNotEqual (And (A096 (0x03), 0x04), 0x04)) {}
            }

            A097 (0x03, 0x00, 0x01)
        }

        Method (A010, 2, NotSerialized)
        {
            A097 (0x0B, Arg0, 0x00)
            A097 (0x05, Arg1, 0x01)
        }

        Method (A007, 1, NotSerialized)
        {
            A097 (0x0B, Arg0, 0x00)
            Store (A096 (0x05), Local0)
            Return (Local0)
        }

        Method (A098, 1, NotSerialized)
        {
            Store (Or (And (Arg0, 0xFF), 0x01865000), Local0)
            Store (Or (And (Arg0, 0xFFFFFF00), 0x04), Local1)
            Store (Or (ShiftLeft (0x03, 0x1E), ShiftLeft (0x01, 0x12)
                ), Local2)
            A010 (0x8600, Local0)
            A010 (0x8604, Local1)
            A010 (0x8608, Local2)
            If (LEqual (ShiftRight (Arg0, 0x10), 0xFE00))
            {
                A011 (0x0D, 0x03)
            }

            If (LEqual (ShiftRight (Arg0, 0x10), 0xFE30))
            {
                A011 (0x0B, 0x03)
            }

            Return (A007 (0x8650))
        }

        Method (A099, 2, NotSerialized)
        {
            Store (Or (And (Arg0, 0xFF), 0x01865000), Local0)
            Store (Or (And (Arg0, 0xFFFFFF00), 0x04), Local1)
            Store (Or (ShiftLeft (0x03, 0x1E), ShiftLeft (0x01, 0x12)
                ), Local2)
            Or (Local2, ShiftLeft (0x01, 0x10), Local2)
            A010 (0x8600, Local0)
            A010 (0x8604, Local1)
            A010 (0x8608, Local2)
            A010 (0x8650, Arg1)
            A011 (0x0B, 0x03)
        }

        Method (A054, 2, Serialized)
        {
            Store (A016 (0x00, 0x60, 0xEA), Local1)
            Or (Local1, 0x02, Local1)
            A050 (0x00, 0x60, 0xEA, Local1)
            And (Local1, Not (ShiftLeft (0x03, 0x03)), Local1)
            Or (Local1, ShiftLeft (Arg0, 0x03), Local1)
            And (Not (Local1), 0x04, Local2)
            Or (And (Local1, Not (0x04)), Local2, Local1)
            A050 (0x00, 0x60, 0xEA, Local1)
            If (LNotEqual (Arg1, 0x00))
            {
                While (LNotEqual (ShiftLeft (Local1, 0x02), Local2))
                {
                    And (A016 (0x00, 0x60, 0xEB), 0x01, Local1)
                }
            }
        }

        Method (ALIB, 2, NotSerialized)
        {
            If (LEqual (Arg0, 0x01))
            {
                Return (A036 (Arg1))
            }

            If (LEqual (Arg0, 0x02))
            {
                Return (A038 (Arg1))
            }

            If (LEqual (Arg0, 0x03))
            {
                Return (A049 (Arg1))
            }

            If (LEqual (Arg0, 0x04))
            {
                Return (A074 (Arg1))
            }

            If (LEqual (Arg0, 0x05))
            {
                Return (A100 ())
            }

            If (LEqual (Arg0, 0x06))
            {
                Return (A078 (Arg1))
            }

            Return (0x00)
        }

        Method (A100, 0, Serialized)
        {
            Return (0x00)
        }

        Name (A002, 0x00)
        Name (A003, 0x00)
        Name (A004, 0x00)
        Name (A005, 0x00)
        Method (A006, 1, NotSerialized)
        {
            Store (Or (ShiftLeft (0x18, 0x03), 0x04), Local1)
            If (LEqual (A005, 0x00))
            {
                Store (A007 (0x8580), A003) /* \_SB_.A003 */
                Store (A008 (Local1, 0x015C), A002) /* \_SB_.A002 */
                Store (A008 (Local1, 0x01A4), A004) /* \_SB_.A004 */
                Store (0x01, A005) /* \_SB_.A005 */
            }

            Store (A007 (0x8580), Local0)
            Store (Or (ShiftLeft (0x18, 0x03), 0x04), Local1)
            Store (A008 (Local1, 0x015C), Local2)
            Store (A008 (Local1, 0x01A4), Local3)
            If (LEqual (Arg0, 0x01))
            {
                And (Local0, 0xFFFFFFFE, Local0)
                And (Local2, 0xFFFFFFFC, Local2)
                Or (Local3, 0x03, Local3)
            }
            Else
            {
                Or (Local0, And (A003, 0x01), Local0)
                Or (Local2, And (A002, 0x03), Local2)
                And (Local3, Or (0xFFFFFFFC, A004), Local3)
            }

            A009 (Local1, 0x01A4, Local3)
            A009 (Local1, 0x015C, Local2)
            A010 (0x8580, Local0)
            A011 (0x12, 0x03)
        }

        Method (A012, 1, NotSerialized)
        {
            Store (A013 (), Local1)
            Store (A007 (0x8490), Local0)
            If (LNotEqual (And (Local0, 0xF0), 0x00))
            {
                If (LEqual (Arg0, 0x02))
                {
                    And (Local0, 0xFFFFFFA0, Local0)
                    Or (Local0, 0xA0, Local0)
                }
                Else
                {
                    If (LEqual (Local1, 0x00))
                    {
                        And (Local0, 0xFFFFFF60, Local0)
                        Or (Local0, 0x60, Local0)
                    }
                    Else
                    {
                        And (Local0, 0xFFFFFF20, Local0)
                        Or (Local0, 0x20, Local0)
                    }
                }

                A010 (0x8490, Local0)
            }
        }

        Name (AD0A, 0x01)
        Method (A014, 1, NotSerialized)
        {
            If (LEqual (AD0A, 0x01))
            {
                Store (A013 (), Local1)
                Store (A007 (0x842C), Local0)
                And (Local0, 0xFFFFFFFE, Local0)
                If (LAnd (LEqual (Arg0, 0x01), LEqual (Local1, 0x01)))
                {
                    Or (Local0, 0x01, Local0)
                }

                A010 (0x842C, Local0)
                A011 (0x1B, 0x03)
            }
        }

        Method (A015, 1, NotSerialized)
        {
            Store (Arg0, Local0)
            If (LEqual (Arg0, 0x02))
            {
                Store (0x00, Local0)
            }

            If (LNotEqual (A016 (0x00, 0xE0, 0x01308023), 0x00))
            {
                A017 (0x00, 0xE0, 0x01308016, Not (0x1000), ShiftLeft (Local0, 0x0C
                    ))
                While (LNotEqual (And (A016 (0x00, 0xE0, 0x01308016), 0x2000), 
                    ShiftLeft (Local0, 0x0D)))
                {
                    Stall (0x0A)
                }
            }

            If (LNotEqual (A016 (0x00, 0xE0, 0x01318023), 0x00))
            {
                A017 (0x00, 0xE0, 0x01318016, Not (0x1000), ShiftLeft (Local0, 0x0C
                    ))
                While (LNotEqual (And (A016 (0x00, 0xE0, 0x01318016), 0x2000), 
                    ShiftLeft (Local0, 0x0D)))
                {
                    Stall (0x0A)
                }
            }
        }

        Method (AWAK, 1, NotSerialized)
        {
        }

        Method (APTS, 1, NotSerialized)
        {
            If (LEqual (Arg0, 0x03))
            {
                A006 (0x01)
            }
        }
    }
}

