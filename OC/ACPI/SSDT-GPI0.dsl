/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (64-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-GPI0.aml, Fri Nov 15 14:44:57 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000053 (83)
 *     Revision         0x02
 *     Checksum         0x96
 *     OEM ID           "hack"
 *     OEM Table ID     "GPI0"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190405 (538510341)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "GPI0", 0x00000000)
{
    External (_SB_.PCI0.GPI0, DeviceObj)

    Scope (_SB.PCI0.GPI0)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }
}

