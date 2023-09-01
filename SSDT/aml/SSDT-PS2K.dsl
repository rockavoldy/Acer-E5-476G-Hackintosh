/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of /Users/adhitore/Documents/GitHub/Acer-E5-476G-Hackintosh/SSDT/aml/SSDT-PS2K.aml, Tue Dec  7 17:08:21 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000CC (204)
 *     Revision         0x02
 *     Checksum         0x7F
 *     OEM ID           "ACDT"
 *     OEM Table ID     "PS2K"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
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

