/*
 * AppleUsbPower compatibility table for legacy hardware.
 *
 * Be warned that power supply values can be different
 * for different systems. Depending on the configuration
 * the values must be present in injected IOKitPersonalities
 * for com.apple.driver.AppleUSBMergeNub. iPad remains being
 * the most reliable device for testing USB port charging.
 *
 * Try NOT to rename EC0, H_EC, etc. to EC.
 * These devices are incompatible with macOS and may break
 * at any time. AppleACPIEC kext must NOT load.
 * See the disable code below.
 *
 * Reference USB: https://applelife.ru/posts/550233
 * Reference EC: https://applelife.ru/posts/807985
 */
DefinitionBlock ("", "SSDT", 2, "hack", "_EC", 0x00001000)
{
    External (_SB_.PCI0.LPCB, DeviceObj)

    /*
     * Uncomment replacing EC0 with your own value in case your
     * motherboard has an existing embedded controller of PNP0C09 type.
     *
     * While renaming EC0 to EC might potentially work initially,
     * it connects an incompatible driver (AppleACPIEC) to your hardware.
     * This can make your system unbootable at any time or hide bugs that
     * could trigger randomly.
     */

    External (_SB_.PCI0.LPCB.EC0, DeviceObj)
    External (SMST)
    External (SMAA)
    External (SELE, MethodObj)
    External (ECEV)
    External (BAT1)
    External (BINH, MethodObj)
    External (ACAD)
    External (HKEV, MethodObj)
    External (AINH, MethodObj)
    External (BATD)
    External (BATO)
    External (_SB_.BAT1.RCAP)

    Scope (\_SB.PCI0.LPCB.EC0)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0)
            }
            Else
            {
                Return (0x0F)
            }
        }
    }

    Scope (\_SB.PCI0.LPCB)
    {
        Device (EC)
        {
            Name (_HID, "ACID0001")  // _HID: Hardware ID
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
            Scope (\_SB)
            {
                OperationRegion (EROM, SystemMemory, 0xFE708900, 0x0100)
                Field (EROM, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x29), 
                    SPRG,   8, 
                    Offset (0x40), 
                    BCL0,   8, 
                    BCL1,   8, 
                    BCL2,   8, 
                    BCL3,   8, 
                    BCL4,   8, 
                    BCL5,   8, 
                    BCL6,   8, 
                    BCL7,   8, 
                    BCL8,   8, 
                    BCL9,   8, 
                    Offset (0xF6), 
                    C6SW,   8, 
                    Offset (0xFC), 
                    TPVD,   8, 
                    SIMU,   8, 
                    Offset (0xFF), 
                    PJNA,   8
                }
            }
            
            Method (_Q20, 0, NotSerialized)  // _Qxx: EC Query
            {
                If (And (SMST, 0x40))
                {
                    Store (SMAA, Local0)
                    If (LEqual (Local0, 0x14))
                    {
                        SELE ()
                        If (And (0x40, ECEV))
                        {
                            Notify (BAT1, 0x81)
                            BINH ()
                        }

                        If (And (0x02, ECEV))
                        {
                            Notify (ACAD, Zero)
                            HKEV (0x08, Zero)
                            AINH ()
                        }

                        Store (Zero, ^^^^BAT1.RCAP)
                        Notify (BAT1, 0x80)
                        Store (BATD, BATO)
                        And (SMST, 0xBF, SMST)
                    }
                }
            }
        }
    }
}