/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20161210-64(RM)
 * Copyright (c) 2000 - 2016 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASL9cxaPb.aml, Sat Dec 14 12:22:12 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000008D (141)
 *     Revision         0x02
 *     Checksum         0x04
 *     OEM ID           "ACDT"
 *     OEM Table ID     "GPI0"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "GPI0", 0x00000000)
{
    External (_SB_.PCI0.GPI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.GPI0.XSTA, MethodObj)    // 0 Arguments (from opcode)

    Scope (_SB.PCI0.GPI0)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (\_SB.PCI0.GPI0.XSTA ())
            }
        }
    }
}

