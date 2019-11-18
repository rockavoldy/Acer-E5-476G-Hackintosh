# Acer E5-476G

## Specifications
- Processor: Intel Core i3-6006U @2.0GHz
- Memory: 8GB DDR4 Dual Channel @2400MHz
- Integrated GPU: Intel HD Graphics 520
- Discrete GPU: Nvidia MX130
- Audio: Realtek ALC255
- Storage: Samsung 860 EVO 500GB (replaced from WDC 1TB)
- Ethernet: Realtek RTL8111
- Wireless Combo: DW1820A M.2 NGFF key A/E (replaced from Intel NGW 3168)
- Wifi Adapter: BCM94350ZAE (vendor-id 14e4, device-id 43a3)
- Bluetooth Adapter: BCM2045A0 USB
- Touchpad: ELAN0501 I2C
- Keyboard: PS2 Keyboard
- Resolution: 1366x768@60Hz
- Bootloader: OpenCore 0.5.2 Release 
- OS Version: OS X Catalina 10.15.1
- SMBIOS: MacBook Pro 13" Early 2016 (MacBookPro13,1)

## What's Work?
- Power Management, idle @600-800MHz
- Shutdown, Restart, Sleep
- QE/CI Intel HD 520
- Brightness
- Battery up to 6 hours
- TRIM SSD
- Ethernet
- 2,4GHz and 5GHz
- Bluetooth
- Touchpad
- Keyboard
- USB 3.0
- VGA Port
- HDMI Port
- Audio + Combo Jack Headphone

## What's Not Work?
- Nvidia MX130 (Optimus)
- Combo Jack Microphone
- SD Card reader (Realtek devices with no support, for now maybe(?) )
- Facetime, iMessage (don't have any iPhone to activate this)

## What's Disabled?
- Nvidia MX130, disabled with SSDT-DGPU
- SD Card, disabled with USBInjectAll

## Credit
- Acidanthera
- Alexandred
- RehabMan
- Andres
- Any person that help me in Forum, FB Group, Discord, and other place
