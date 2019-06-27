# Acer E5-476G

## Specifications
- Processor: Intel Core i3-6006U @2.0GHz
- Memory: 8GB DDR4 Dual Channel @2133MHz
- Integrated GPU: Intel HD 520
- Discrete GPU: Nvidia MX130
- Audio: Realtek ALC255
- Storage: Samsung 860 EVO 500GB (replaced from WDC 1TB)
- Ethernet: Realtek RTL8111
- Wireless Combo: DW1820A M.2 NGFF key A/E (replaced from Intel NGW 3168)
- Wifi Adapter: BCM94350ZAE
- Bluetooth Adapter: BCM2045A0 USB
- Touchpad: ELAN0501 I2C
- Keyboard: PS2 Keyboard
- Resolution: 1366x768@60Hz
- Clover: Clover v2.4 r4920
- OS Version: OS X Mojave 10.14.5
- SMBIOS: MacBook Air 13" Early 2015 (MacBookAir7,2)

## What's Work?
- Power Management, idle @700-900MHz
- Shutdown, Restart, Sleep
- QE/CI Intel HD 520
- Brightness
- Battery up to 5 hours
- TRIM SSD
- Ethernet
- 2,4GHz and 5GHz
- Bluetooth
- Touchpad
- Keyboard
- USB 3.0
- VGA Port
- HDMI Port
- Audio + Combo Jack headphone

## What's Not Work?
- Nvidia MX130 (Optimus)
- Combo Jack Microphone
- SD Card reader
- Facetime, iMessage
- etc.

## What's Disabled?
- Nvidia MX130, disabled with DSDT
- Webcam, disabled with USBInjectAll
- SD Card, disabled with USBInjectAll

## What's Patched and used kext?
- Power Management using ssdtPRGen and CPUFriend.kext + Lilu.kext
- Battery using SMCBatteryManager.kext with VirtualSMC.kext + Lilu.kext
- IGPU using WhateverGreen.kext + Lilu.kext and inject ig-platform-id 0x19160000
- DGPU using DSDT patch and disable-external-gpu on IGPU device-properties
- 5GHz wifi using AirportBrcmFixup.kext + Lilu.kext
- Bluetooth using BrcmFirmwareRepo.kext + BrcmPatchRAM2.kext
- Audio using injected layout-id 3 from device-properties and AppleALC.kext + Lilu.kext
- Combo Jack using CodecCommander.kext
- Ethernet using RealtekRTL8111.kext
- USB Using USBInjectAll.kext and SSDT-UIAC with patched USB Power Property
- Touchpad I2C using VoodooI2C.kext + VoodooI2CHID.kext and patched DSDT for GPIO Pinning
- Keyboard using VoodooPS2Controller.kext
- Drop all SSDT Table related with CPU Power Management

## Credit
- Acidanthera
- RehabMan
- Andres
- Alexandred
- Another author of kext i used and tutorial, Thanks for all of your work.
