/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-PS2K.aml, Fri Jun 26 22:16:03 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000CC (204)
 *     Revision         0x02
 *     Checksum         0x89
 *     OEM ID           "ACDT"
 *     OEM Table ID     "PS2K"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190509 (538510601)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "PS2K", 0x00000000)
{
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)

    Name (_SB.PCI0.LPCB.PS2K.RMCF, Package (0x02)
    {
        "Keyboard", 
        Package (0x04)
        {
            "Custom ADB Map", 
            Package (0x06)
            {
                Package (0x00){}, 
                "e045=71", 
                "45=49", 
                "46=48", 
                "e030=80", 
                "e02e=80"
            }, 

            "Custom PS2 Map", 
            Package (0x03)
            {
                Package (0x00){}, 
                "e028=0", 
                "e037=65"
            }
        }
    })
}

