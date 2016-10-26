This directory contains the configuration files needed to build the custom OpenWRT firmware for the router. 
It also contains a precompiled firmware for a GL-MT300A-Ext model.

## Compile your own firmware

- Install the OpenWRT builder
- Copy the .config file to the root directory of your OpenWRT
- If you want to change some configuration, or create the image for a different target router, run `make menuconfig` and change whatever you want to change
- Run `make`
- The firmware would be created in the directory `/bin/`

## Install the firmware

Use the device web interface to load the new firmware.
