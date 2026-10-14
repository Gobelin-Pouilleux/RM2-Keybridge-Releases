# RM2 Keybridge - Downloads

This repository hosts the release files for RM2 Keybridge.

## Downloads

- `RM2-Keybridge-v0.1.0.apk`: Android application for Android 8.0 and later.
- `rm2-ssh-wlan-helper.bat`: Windows helper used to enable SSH over Wi-Fi on a reMarkable 2.

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
