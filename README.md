# Neovo Clock

This app is a hybrid digital & analog clock with a beautiful UI for the flutter clock challenge [here](https://www.flutter.dev/clock).

## Dependency Notice
This project is made with [Flutter](https://flutter.dev) and written in [Dart](https://dart.io). Ensure you have the necesarry sdks and tools to build/run the application on a device/emulator. See the [documentation](https://flutter.dev/docs) for flutter on how to install these.
This project depends on the flutter_clock_helper library found [here](https://github.com/flutter/flutter_clock)

## Building/Running the app

- Clone the dependency project's [flutter_clock](https://github.com/flutter/flutter_clock) and this repository in the same working directory
```bash
<working directory>$ git clone git@github.com:flutter/flutter_clock
<working directory>$ git clone git@github.com:NateNjuguna/neovo_clock.git
```
- Change directories to neovo_clock
```bash
<working directory>$ cd neovo_clock
```
- Run the following command to build the application launcher icons:
```bash
<working directory>/neovo_clock$ flutter pub run flutter_launcher_icons:main
```
- Run the following command to build the application:
```bash
<working directory>/neovo_clock$ flutter build [--release]
```
- Run the following command to run the application (Make sure you have a working device or emulator connected via adb):
```bash
<working directory>/neovo_clock$ flutter run
```
