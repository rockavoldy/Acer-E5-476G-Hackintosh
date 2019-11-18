/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (64-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-PS2KBD.aml, Fri Nov 15 15:13:40 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000B3 (179)
 *     Revision         0x02
 *     Checksum         0x28
 *     OEM ID           "hack"
 *     OEM Table ID     "_PS2KBD"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "PS2K", 0x00000000)
{
    External (_SB.PCI0.LPCB.PS2K, DeviceObj)
    Name (_SB.PCI0.LPCB.PS2K.RMCF, Package ()
    {
        "Keyboard", 
        Package ()
        {
            "Custom ADB Map", 
            Package ()
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

