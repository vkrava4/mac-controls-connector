# MCC - Mac Controls Connector
The given setup with the provided scripts will enable your single set of Bluetooth controls and equipment to work separately on multiple MacOS devices.

## How?
Scripts listening to your MacOS events using [SleepWatcher](https://www.bernhard-baehr.de), a daemon that monitors sleep, wakeup and idleness of a Mac and disconnects listed Bluetooth controls, as one of your devices goes sleeping while giving a chance to another MacOS device to connect and pair to disconnected Bluetooth controls.

Bluetooth connection is maintedined with [blueutil](https://github.com/toy/blueutil).

## Prerequisite
Firstly, you need to have blueutil and Sleepwatcher installed on your device. 
These tools allow you to control Bluetooth devices and monitor system sleep events respectively. You can download these tools from their websites or by using a package manager like Homebrew as shown below.

``` bash
brew install blueutil
```

```bash
brew install sleepwatcher
```

## Setting Up
Set up `BLUE_CONTROLS` environment variable with comma-separated Bluetooth control IDs, where ID can be either address in form xxxxxxxxxxxx, xx-xx-xx-xx-xx-xx or xx:xx:xx:xx:xx:xx, or name of device to search in used devices, as follows:

```
export BLUE_CONTROLS=xx:xx:xx:xx:xx:xx,xxxxxxxxxxxx,xx-xx-xx-xx-xx-xx
```

Control IDs can be found using the blueutil command:

```
blueutil --paired
```

Copy `blue-conn.sh` content to `~/.wakeup` and `blue-disconn.sh` to `~/.sleep` respectively to set up connect/disconnect behaviour.

## Conclusion
Once you have completed the prerequisites above and a setup process, you can start using the MCC tool to automate Bluetooth device connectivity over multiple MacOS devices.
