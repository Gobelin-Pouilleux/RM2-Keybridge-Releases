# Projet Gobelin — reMarkable downloads

This repository hosts the Android release files for RM2 Keybridge and SleepGoblin.

## Downloads

- `RM2-Keybridge-v0.1.2.apk`: Current Android application for Android 8.0 and later.
- [`SleepGoblin-v0.2.5.apk`](https://github.com/Gobelin-Pouilleux/RM2-Keybridge-Releases/raw/refs/heads/main/SleepGoblin-v0.2.5.apk): Manage, crop and send custom sleep screens to a reMarkable 2 (Android 8.0 and later).
- `rm2-ssh-wlan-helper.bat`: Windows helper used to enable SSH over Wi-Fi on a reMarkable 2.

SleepGoblin is signed with its dedicated production certificate. Test builds previously installed from Android Studio used a different debug signature and must be uninstalled once before installing this release.

## First-time setup

1. Install the APK on the Android phone.
2. Connect the reMarkable 2 to a Windows computer with a USB cable.
3. Run `rm2-ssh-wlan-helper.bat` and choose **Activate SSH over Wi-Fi**.
4. Disconnect the USB cable.
5. Enable the phone hotspot and connect the reMarkable to it.
6. Find the reMarkable's current Wi-Fi IP address in the phone hotspot's connected-device list.
7. In RM2 Keybridge, enter that IP, port `22`, user `root`, and the root password shown in the reMarkable settings.
8. Connect, place the cursor in a text field on the reMarkable, then type with the Bluetooth keyboard.

The USB address `10.11.99.1` is used only by the Windows helper. Do not enter it in the Android app unless it is actually the tablet's current Wi-Fi address.

## Security

Use SSH over Wi-Fi only on a trusted network. When it is no longer needed, reconnect the tablet by USB and run the helper again to disable SSH over Wi-Fi.

No cloud service, permanent daemon, or system partition change is used by the application.
