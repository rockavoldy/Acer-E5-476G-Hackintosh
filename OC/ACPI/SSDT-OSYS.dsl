/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (64-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-OSYS.aml, Fri Nov 15 14:44:57 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000001EA (490)
 *     Revision         0x02
 *     Checksum         0xDA
 *     OEM ID           "ACDT"
 *     OEM Table ID     "OSYS"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190509 (538510601)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "OSYS", 0x00000000)
{
    External (LINX, IntObj)
    External (OSYS, FieldUnitObj)

    Scope (_SB)
    {
        Device (PCI1)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (CondRefOf (\OSYS))
                {
                    If (_OSI ("Linux"))
                    {
                        Store (0x03E8, OSYS) /* External reference */
                        Store (One, LINX) /* External reference */
                    }

                    If (_OSI ("Windows 2001"))
                    {
                        Store (0x07D1, OSYS) /* External reference */
                    }

                    If (_OSI ("Windows 2001 SP1"))
                    {
                        Store (0x07D1, OSYS) /* External reference */
                    }

                    If (_OSI ("Windows 2001 SP2"))
                    {
                        Store (0x07D2, OSYS) /* External reference */
                    }

                    If (_OSI ("Windows 2001.1"))
                    {
                        Store (0x07D3, OSYS) /* External reference */
                    }

                    If (_OSI ("Windows 2006"))
                    {
                        Store (0x07D6, OSYS) /* External reference */
                    }

                    If (_OSI ("Windows 2009"))
                    {
                        Store (0x07D9, OSYS) /* External reference */
                    }

                    If (_OSI ("Windows 2012"))
                    {
                        Store (0x07DC, OSYS) /* External reference */
                    }

                    If (_OSI ("Windows 2013"))
                    {
                        Store (0x07DD, OSYS) /* External reference */
                    }

                    If (_OSI ("Windows 2015"))
                    {
                        Store (0x07DF, OSYS) /* External reference */
                    }

                    If (_OSI ("Windows 2017"))
                    {
                        Store (0x07E1, OSYS) /* External reference */
                    }

                    If (_OSI ("Windows 2018"))
                    {
                        Store (0x07E2, OSYS) /* External reference */
                    }

                    If (_OSI ("Darwin"))
                    {
                        Store (0x07DF, OSYS) /* External reference */
                    }
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}

