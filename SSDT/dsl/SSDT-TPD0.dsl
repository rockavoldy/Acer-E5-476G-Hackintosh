/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-TPD0.aml, Fri Jun 26 22:16:03 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000018C (396)
 *     Revision         0x02
 *     Checksum         0xB0
 *     OEM ID           "ACDT"
 *     OEM Table ID     "TPD0"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "TPD0", 0x00000000)
{
    External (_SB_.PCI0.I2C0, DeviceObj)

    Scope (_SB.PCI0.I2C0)
    {
        Device (TPD0)
        {
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return ("ELAN0501")
            }

            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg0, ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */))
                {
                    If (LEqual (Arg2, Zero))
                    {
                        If (LEqual (Arg1, One))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                        Else
                        {
                            Return (Buffer (One)
                            {
                                 0x00                                             // .
                            })
                        }
                    }

                    If (LEqual (Arg2, One))
                    {
                        Return (One)
                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
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
            
            Name (SBFI, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C0",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })
            
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Return (ConcatenateResTemplate (SBFI, SBFZ))
            }
        }
    }
}

