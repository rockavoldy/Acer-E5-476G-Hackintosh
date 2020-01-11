DefinitionBlock ("", "SSDT", 2, "ACDT", "EC", 0x00000000)
{
    Device (_SB.EC)
    {
        Name (_HID, "EC000000")  // _HID: Hardware ID
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
    
    Device (_SB.USBX)
    {
        Name (_ADR, Zero)
        Method (_DSM, 4, NotSerialized)
        {
            If (LNot (Arg2))
            {
                Return (Buffer (One)
                {
                    0x03
                })
            }
        
            Return (Package (0x08)
            {
                "kUSBSleepPortCurrentLimit", 
                0x0834, 
                "kUSBSleepPowerSupply", 
                0x0A28, 
                "kUSBWakePortCurrentLimit", 
                0x0834, 
                "kUSBWakePowerSupply", 
                0x0C80
            })
        }
    }
}

