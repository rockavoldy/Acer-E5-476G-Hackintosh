// SSDT patch to mapping key
// F1 = F1 - F12 = F12
// Fn+F11 = Vol down, Fn+F12 = Vol up
// PrtScr = Brightness down, Pause Break = Brightness up
// Media key as is
// disable Fn+up and Fn+down for Vol
// By rockavoldy
DefinitionBlock ("", "SSDT", 2, "hack", "_PS2KBD", 0)
{
    Name(_SB.PCI0.LPCB.PS2K.RMCF, Package()
    {
        "Keyboard", Package()
        {
            "Custom ADB Map", Package()
            {
                Package(){},
                "e045=71", // Pause Break to Brightness up
                "45=49", // Num lock to vol down
                "46=48", // Scroll lock to vol up
                "e030=80", // Fn+up not work
                "e02e=80", // Fn+down not work
            },
            
            "Custom PS2 Map", Package()
            {
                Package(){},
                "e028=0", // disable trackpad toggle
                "e037=65", // PrtScr to Brightness down
            },
        },
    })
}
//EOF