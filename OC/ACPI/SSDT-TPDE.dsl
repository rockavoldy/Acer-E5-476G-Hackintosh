/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20190703 (64-bit version)
 * Copyright (c) 2000 - 2019 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-TPDE.aml, Fri Nov 15 14:44:57 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000F6 (246)
 *     Revision         0x02
 *     Checksum         0xE6
 *     OEM ID           "hack"
 *     OEM Table ID     "I2Cpatch"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20190405 (538510341)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "TPDE", 0x00000000)
{
    External (_SB_.PCI0.I2C0.TPDE, DeviceObj)

    Scope (_SB.PCI0.I2C0.TPDE)
    {
        Name (SSCN, Package (0x03)
        {
            0x01B0, 
            0x01FB, 
            0x1E
        })
        Name (FMCN, Package (0x03)
        {
            0x48, 
            0xA0, 
            0x1E
        })
        Name (SBFZ, ResourceTemplate ()
        {
            GpioInt (Level, ActiveLow, Exclusive, PullUp, 0x0000,
                "\\ _SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x003A
                }
        })
        Name (SBFX, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
            {
                0x00000052,
            }
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            Name (SBFI, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C0",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })
            Return (ConcatenateResTemplate (SBFI, SBFZ))
        }
    }
}

