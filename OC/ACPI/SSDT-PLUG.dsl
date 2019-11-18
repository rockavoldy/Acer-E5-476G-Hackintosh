/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (64-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-PLUG.aml, Fri Nov 15 14:44:57 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000A7 (167)
 *     Revision         0x02
 *     Checksum         0xA8
 *     OEM ID           "CpuRef"
 *     OEM Table ID     "CpuPlug"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190215 (538509845)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "PLUG", 0x00003000)
{
    External (_PR_.CPU0, ProcessorObj)

    Scope (\_PR.CPU0)
    {
        Method (DTGP, 5, NotSerialized)
        {
            If (LEqual (Arg0, ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
            {
                If (LEqual (Arg1, One))
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Store (Buffer (One)
                            {
                                 0x03                                             // .
                            }, Arg4)
                        Return (One)
                    }

                    If (LEqual (Arg2, One))
                    {
                        Return (One)
                    }
                }
            }

            Store (Buffer (One)
                {
                     0x00                                             // .
                }, Arg4)
            Return (Zero)
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            Store (Package (0x02)
                {
                    "plugin-type", 
                    One
                }, Local0)
            DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
            Return (Local0)
        }
    }
}

