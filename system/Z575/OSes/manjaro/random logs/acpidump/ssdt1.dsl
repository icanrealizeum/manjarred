/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140424-64 [May  4 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of ssdt1.dat, Wed Jul 16 15:33:07 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000E34 (3636)
 *     Revision         0x01
 *     Checksum         0x62
 *     OEM ID           "AMD   "
 *     OEM Table ID     "POWERNOW"
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "AMD "
 *     Compiler Version 0x00000001 (1)
 */
DefinitionBlock ("ssdt1.aml", "SSDT", 1, "AMD   ", "POWERNOW", 0x00000001)
{

    External (_PR_.C000, ProcessorObj)
    External (_PR_.C001, ProcessorObj)
    External (_PR_.C002, ProcessorObj)
    External (_PR_.C003, ProcessorObj)

    Scope (\_PR.C000)
    {
        Name (_PCT, Package (0x02)  // _PCT: Performance Control
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000C0010062, // Address
                    ,)
            }, 

            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }
        })
        Name (_PSS, Package (0x07)  // _PSS: Performance Supported States
        {
            Package (0x06)
            {
                0x00000578, 
                0x00001A90, 
                0x00000000, 
                0x00000000, 
                0x00000000, 
                0x00000000
            }, 

            Package (0x06)
            {
                0x00000514, 
                0x00001605, 
                0x00000000, 
                0x00000000, 
                0x00000001, 
                0x00000001
            }, 

            Package (0x06)
            {
                0x000004B0, 
                0x00001349, 
                0x00000000, 
                0x00000000, 
                0x00000002, 
                0x00000002
            }, 

            Package (0x06)
            {
                0x0000044C, 
                0x00001185, 
                0x00000000, 
                0x00000000, 
                0x00000003, 
                0x00000003
            }, 

            Package (0x06)
            {
                0x000003E8, 
                0x0000102A, 
                0x00000000, 
                0x00000000, 
                0x00000004, 
                0x00000004
            }, 

            Package (0x06)
            {
                0x00000384, 
                0x00000E79, 
                0x00000000, 
                0x00000000, 
                0x00000005, 
                0x00000005
            }, 

            Package (0x06)
            {
                0x00000320, 
                0x00000D5E, 
                0x00000000, 
                0x00000000, 
                0x00000006, 
                0x00000006
            }
        })
        Name (XPSS, Package (0x07)
        {
            Package (0x08)
            {
                0x00000578, 
                0x00001A90, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000514, 
                0x00001605, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x000004B0, 
                0x00001349, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x0000044C, 
                0x00001185, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x000003E8, 
                0x0000102A, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000384, 
                0x00000E79, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000320, 
                0x00000D5E, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }
        })
        Name (_PSD, Package (0x01)  // _PSD: Power State Dependencies
        {
            Package (0x05)
            {
                0x05, 
                0x00, 
                0x00000000, 
                0x000000FC, 
                0x00000004
            }
        })
        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilites
        {
            Return (0x00)
        }

        Name (_CST, Package (0x02)  // _CST: C-States
        {
            0x01, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000841, // Address
                        0x01,               // Access Size
                        )
                }, 

                0x02, 
                0x0064, 
                0x00000000
            }
        })
    }

    Scope (\_PR.C001)
    {
        Name (_PCT, Package (0x02)  // _PCT: Performance Control
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000C0010062, // Address
                    ,)
            }, 

            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }
        })
        Name (_PSS, Package (0x07)  // _PSS: Performance Supported States
        {
            Package (0x06)
            {
                0x00000578, 
                0x00001A90, 
                0x00000000, 
                0x00000000, 
                0x00000000, 
                0x00000000
            }, 

            Package (0x06)
            {
                0x00000514, 
                0x00001605, 
                0x00000000, 
                0x00000000, 
                0x00000001, 
                0x00000001
            }, 

            Package (0x06)
            {
                0x000004B0, 
                0x00001349, 
                0x00000000, 
                0x00000000, 
                0x00000002, 
                0x00000002
            }, 

            Package (0x06)
            {
                0x0000044C, 
                0x00001185, 
                0x00000000, 
                0x00000000, 
                0x00000003, 
                0x00000003
            }, 

            Package (0x06)
            {
                0x000003E8, 
                0x0000102A, 
                0x00000000, 
                0x00000000, 
                0x00000004, 
                0x00000004
            }, 

            Package (0x06)
            {
                0x00000384, 
                0x00000E79, 
                0x00000000, 
                0x00000000, 
                0x00000005, 
                0x00000005
            }, 

            Package (0x06)
            {
                0x00000320, 
                0x00000D5E, 
                0x00000000, 
                0x00000000, 
                0x00000006, 
                0x00000006
            }
        })
        Name (XPSS, Package (0x07)
        {
            Package (0x08)
            {
                0x00000578, 
                0x00001A90, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000514, 
                0x00001605, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x000004B0, 
                0x00001349, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x0000044C, 
                0x00001185, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x000003E8, 
                0x0000102A, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000384, 
                0x00000E79, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000320, 
                0x00000D5E, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }
        })
        Name (_PSD, Package (0x01)  // _PSD: Power State Dependencies
        {
            Package (0x05)
            {
                0x05, 
                0x00, 
                0x00000000, 
                0x000000FC, 
                0x00000004
            }
        })
        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilites
        {
            Return (0x00)
        }

        Name (_CST, Package (0x02)  // _CST: C-States
        {
            0x01, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000841, // Address
                        0x01,               // Access Size
                        )
                }, 

                0x02, 
                0x0064, 
                0x00000000
            }
        })
    }

    Scope (\_PR.C002)
    {
        Name (_PCT, Package (0x02)  // _PCT: Performance Control
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000C0010062, // Address
                    ,)
            }, 

            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }
        })
        Name (_PSS, Package (0x07)  // _PSS: Performance Supported States
        {
            Package (0x06)
            {
                0x00000578, 
                0x00001A90, 
                0x00000000, 
                0x00000000, 
                0x00000000, 
                0x00000000
            }, 

            Package (0x06)
            {
                0x00000514, 
                0x00001605, 
                0x00000000, 
                0x00000000, 
                0x00000001, 
                0x00000001
            }, 

            Package (0x06)
            {
                0x000004B0, 
                0x00001349, 
                0x00000000, 
                0x00000000, 
                0x00000002, 
                0x00000002
            }, 

            Package (0x06)
            {
                0x0000044C, 
                0x00001185, 
                0x00000000, 
                0x00000000, 
                0x00000003, 
                0x00000003
            }, 

            Package (0x06)
            {
                0x000003E8, 
                0x0000102A, 
                0x00000000, 
                0x00000000, 
                0x00000004, 
                0x00000004
            }, 

            Package (0x06)
            {
                0x00000384, 
                0x00000E79, 
                0x00000000, 
                0x00000000, 
                0x00000005, 
                0x00000005
            }, 

            Package (0x06)
            {
                0x00000320, 
                0x00000D5E, 
                0x00000000, 
                0x00000000, 
                0x00000006, 
                0x00000006
            }
        })
        Name (XPSS, Package (0x07)
        {
            Package (0x08)
            {
                0x00000578, 
                0x00001A90, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000514, 
                0x00001605, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x000004B0, 
                0x00001349, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x0000044C, 
                0x00001185, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x000003E8, 
                0x0000102A, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000384, 
                0x00000E79, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000320, 
                0x00000D5E, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }
        })
        Name (_PSD, Package (0x01)  // _PSD: Power State Dependencies
        {
            Package (0x05)
            {
                0x05, 
                0x00, 
                0x00000000, 
                0x000000FC, 
                0x00000004
            }
        })
        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilites
        {
            Return (0x00)
        }

        Name (_CST, Package (0x02)  // _CST: C-States
        {
            0x01, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000841, // Address
                        0x01,               // Access Size
                        )
                }, 

                0x02, 
                0x0064, 
                0x00000000
            }
        })
    }

    Scope (\_PR.C003)
    {
        Name (_PCT, Package (0x02)  // _PCT: Performance Control
        {
            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x00000000C0010062, // Address
                    ,)
            }, 

            ResourceTemplate ()
            {
                Register (FFixedHW, 
                    0x40,               // Bit Width
                    0x00,               // Bit Offset
                    0x0000000000000000, // Address
                    ,)
            }
        })
        Name (_PSS, Package (0x07)  // _PSS: Performance Supported States
        {
            Package (0x06)
            {
                0x00000578, 
                0x00001A90, 
                0x00000000, 
                0x00000000, 
                0x00000000, 
                0x00000000
            }, 

            Package (0x06)
            {
                0x00000514, 
                0x00001605, 
                0x00000000, 
                0x00000000, 
                0x00000001, 
                0x00000001
            }, 

            Package (0x06)
            {
                0x000004B0, 
                0x00001349, 
                0x00000000, 
                0x00000000, 
                0x00000002, 
                0x00000002
            }, 

            Package (0x06)
            {
                0x0000044C, 
                0x00001185, 
                0x00000000, 
                0x00000000, 
                0x00000003, 
                0x00000003
            }, 

            Package (0x06)
            {
                0x000003E8, 
                0x0000102A, 
                0x00000000, 
                0x00000000, 
                0x00000004, 
                0x00000004
            }, 

            Package (0x06)
            {
                0x00000384, 
                0x00000E79, 
                0x00000000, 
                0x00000000, 
                0x00000005, 
                0x00000005
            }, 

            Package (0x06)
            {
                0x00000320, 
                0x00000D5E, 
                0x00000000, 
                0x00000000, 
                0x00000006, 
                0x00000006
            }
        })
        Name (XPSS, Package (0x07)
        {
            Package (0x08)
            {
                0x00000578, 
                0x00001A90, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000514, 
                0x00001605, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x000004B0, 
                0x00001349, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x0000044C, 
                0x00001185, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x000003E8, 
                0x0000102A, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000384, 
                0x00000E79, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }, 

            Package (0x08)
            {
                0x00000320, 
                0x00000D5E, 
                0x00000000, 
                0x00000000, 
                Buffer (0x08)
                {
                     0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }, 

                Buffer (0x08)
                {
                     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                }
            }
        })
        Name (_PSD, Package (0x01)  // _PSD: Power State Dependencies
        {
            Package (0x05)
            {
                0x05, 
                0x00, 
                0x00000000, 
                0x000000FC, 
                0x00000004
            }
        })
        Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilites
        {
            Return (0x00)
        }

        Name (_CST, Package (0x02)  // _CST: C-States
        {
            0x01, 
            Package (0x04)
            {
                ResourceTemplate ()
                {
                    Register (SystemIO, 
                        0x08,               // Bit Width
                        0x00,               // Bit Offset
                        0x0000000000000841, // Address
                        0x01,               // Access Size
                        )
                }, 

                0x02, 
                0x0064, 
                0x00000000
            }
        })
    }
}

