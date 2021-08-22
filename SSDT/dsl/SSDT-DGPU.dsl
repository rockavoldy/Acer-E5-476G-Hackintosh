DefinitionBlock ("", "SSDT", 2, "ADHT", "DDGPU", 0x00000000)
{
External (_SB_.PCI0.RP01.PXSX._OFF, MethodObj)
External (_SB_.PCI0.RP01.PXSX._ON_, MethodObj)
External (_SB_.PCI0.RP01.PXSX._PS0, MethodObj)
External (_SB_.PCI0.RP01.PXSX._PS3, MethodObj)
External (_SB_.PCI0.RP01.PXSX.SGOF, MethodObj)
External (_SB_.PCI0.RP01.PXSX.SGON, MethodObj)
External (ZPTS, MethodObj)
External (ZWAK, MethodObj)

Method (M_ON, 0, NotSerialized)
{
 If (CondRefOf (\_SB.PCI0.RP01.PXSX._ON))
  {
   \_SB.PCI0.RP01.PXSX._ON ()
  }
 If (CondRefOf (\_SB.PCI0.RP01.PXSX._PS0))
  {
   \_SB.PCI0.RP01.PXSX._PS0 ()
  }
 If (CondRefOf (\_SB.PCI0.RP01.PXSX.SGON))
  {
   \_SB.PCI0.RP01.PXSX.SGON ()
  }
}

Method (M_OF, 0, NotSerialized)
{
 If (CondRefOf (\_SB.PCI0.RP01.PXSX._OFF))
  {
   \_SB.PCI0.RP01.PXSX._OFF ()
  }
 If (CondRefOf (\_SB.PCI0.RP01.PXSX._PS3))
  {
   \_SB.PCI0.RP01.PXSX._PS3 ()
  }
 If (CondRefOf (\_SB.PCI0.RP01.PXSX.SGOF))
  {
   \_SB.PCI0.RP01.PXSX.SGOF ()
  }
}
Method (_WAK, 1, NotSerialized)
{
 Local0 = ZWAK (Arg0)
 If (_OSI ("Darwin"))
  {
   M_OF ()
  }
 Return (Local0)
}

Method (_INI, 0, NotSerialized)
{
 If (_OSI ("Darwin"))
 {
  M_OF ()
 }
}
Method (_PTS, 1, NotSerialized)
{
 If (_OSI ("Darwin"))
 {
  M_ON ()
 }
 ZPTS (Arg0)
}
}

