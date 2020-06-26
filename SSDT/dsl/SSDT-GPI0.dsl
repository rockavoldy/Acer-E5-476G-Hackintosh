/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-GPI0.aml, Fri Jun 26 22:16:03 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000047 (71)
 *     Revision         0x02
 *     Checksum         0xEE
 *     OEM ID           "ACDT"
 *     OEM Table ID     "GPI0"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "GPI0", 0x00000000)
{
    External (GPEN, FieldUnitObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            Store (One, GPEN) /* External reference */
        }
    }
}

