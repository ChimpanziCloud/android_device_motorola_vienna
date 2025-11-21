# TWRP device tree for Motorola Edge 50 Neo (vienna)

Official released on August 29 2024

# Maintainers
- [TeamWin Recovery Project](https://github.com/TeamWin) - developer manifest
- [OrangeFox Recovery Project](https://gitlab.com/OrangeFox) - developer manifest
- [Cloud](https://github.com/ChimpanziCloud) - Device owner and developer

# Motorola Edge 50 Neo
<p align="left" width="100%">
<img width="33%" src="https://github.com/ChimpanziCloud/Images/blob/main/Moto-Edge-50-Neo.png"> 
</p>




# Device Specifications

| Basic                        | Spec Sheet                                                                    |
| ---------------------------: | :-----------------------------------------------------------------------------|
| Chipset                      | Mediatek Dimensity 7300 (MT6878)                                              |
| CPU                          | Octa-core (4x2.5 GHz Cortex-A78 & 4x2.0 GHz Cortex-A55)                       |
| GPU                          | Mali-G615 MC2                                                                 |
| Memory                       | 8/12 GB RAM (LPDDR4X)                                                         |
| Shipped OS                   | Android 14                                                                    |
| Storage                      | 256/512 GB (UFS 2.2)                                                          |
| SIM                          | dual Nano-SIM, eSIM                                                           |
| MicroSD                      | No                                                                            |
| Battery                      | 4310mAh Li-ion (non-removable), 68W fast charge                               |
| Dimensions                   | 154.1 x 71.2 x 8.1 mm                                                         |
| Display                      | 6.4" 2400x1080 pixels, 20:9 ratio, 120Hz (~460 ppi)                           |
| Rear Camera 1                | 50 MP, f/1.8 OIS                                                              |
| Rear Camera 2                | 10 MP, f/2.0 (telephoto)                                                      |
| Rear Camera 3                | 13 MP, f/2.2, (macro)                                                         |
| Front Camera                 | 32 MP, f/2.4                                                                  |
| Fingerprint                  | under display, optical                                                        |
| Sensors                      | accelerometer, gyroscope, light sensor, proximity sensor, compass             |
| Extras                       | Dual speakers, NFC, HDR10+ support, Always on Display                         |





# Checks
Blocking checks
- [✔] Correct screen/recovery size
- [✔] Working Touch, screen
- [✖] Backup to internal/microSD (No SD card slot)
- [✖] Restore from internal/microSD (No SD card slot)
- [✔] reboot to system
- [✖] ADB (In Recovery Mode)

Medium checks
- [✔] update.zip sideload
- [✔] UI colors (red/blue inversions)
- [✔] Screen goes off and on
- [✔] F2FS/EXT4 Support, exFAT/NTFS where supported
- [✔] all important partitions listed in mount/backup lists
- [✖] backup/restore to/from external (USB-OTG) storage
- [✖] decrypt /data
- [✖] Correct date
- [✖] USB-OTG (flash drive)

Minor checks
- [✖] MTP export
- [✖] reboot to bootloader
- [✖] reboot to recovery
- [✔] poweroff
- [✖] battery level
- [✖] temperature
- [✖] encrypted backups
- [✖] input devices via USB (USB-OTG) - keyboard and mouse
- [✖] USB mass storage export
- [✔] set brightness
- [✖] vibrate
- [✔] screenshot
- [✖] partition SD card (No SD card slot)
- [✔] Fastbootd

## To Build with OrangeFox manifest
**Clone manifest ofrp-14.1**
```bash
sudo apt install git
sudo apt install repo
sudo apt install git aria2 -y
git clone https://gitlab.com/OrangeFox/misc/scripts
cd scripts
sudo bash setup/android_build_env.sh
sudo bash setup/install_android_sdk.sh
```
**Sync manifest ofrp-14.1**
```bash
mkdir ~/OrangeFox_sync
cd ~/OrangeFox_sync
git clone https://gitlab.com/OrangeFox/sync.git
cd ~/OrangeFox_sync/sync/
./orangefox_sync.sh --branch 14.1 --path ~/fox_14.1
```
**Cloning the device tree**
```bash
cd ~/fox_14.1
git clone https://github.com/ChimpanziCloud/android_device_motorola_vienna.git -b twrp-14.1 device/motorola/vienna
```
**Build**
```bash
build/envsetup.sh; lunch twrp_vienna-ap2a-eng && mka adbd vendorbootimage
```
## To Build with TeamWin manifest
**Clone manifest twrp-14.1**
```bash
sudo apt install git
sudo apt install repo
mkdir ~/twrp_14.1
cd ~/twrp_14.1
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp -b twrp-14.1
```
**Sync manifest twrp-14.1**
```bash
repo sync
```
**Cloning the device tree**
```bash
cd ~/twrp_14.1
git clone https://github.com/ChimpanziCloud/android_device_motorola_vienna.git -b twrp-14.1 device/motorola/vienna
```
**Build**
```bash
export ALLOW_MISSING_DEPENDENCIES=true; . build/envsetup.sh; lunch twrp_vienna-ap2a-eng
mka vendorbootimage
```
## Common Fixes
- Terminal Closing after 2 Minutes: run this command to disable systemd-oomd which causes Terminal to close if high memory usage (Ubuntu 22.04 and Later)
```bash
systemctl disable --now systemd-oomd
```
To check if it worked run this command
```bash
systemctl is-enabled systemd-oomd
```
The output should be
```bash
disabled
```
