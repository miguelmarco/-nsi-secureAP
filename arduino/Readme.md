This directory contains the code for the arduino controller that controls the lcd screen and the numeric keypad.

It deppends on the following arduino libraries:

- FaboLCD
- Keypad

It is intended for a 16x2 LCD display with I2C interface. The pins GND, VCC, SDA and SCL of the I2C interface should be connected to the
arduino pins GND, 5V, A4 and A5 respectively.

The Keypad pins should be connected to the pins D2 to D9 of the arduino board.

The arduino board is connected to the router by the USB cable (through a USB hub if necessary)
