# (Not so in-)secure Access Point

## Motivation

There are wireless access point that give access to the internet everywhere: bars, libraries, civic centers, malls...

Most of them offer either WPA2-PSK encryption (whose security relies on a pre-shared key, common to all the users of the network) or no encryption at all. This means that the traffic of a user can be seen (and what is worse: tampered with) by any other user.

On the other hand, WPA2-Enterprise standard (which is widely supprted by every modern OS) could provide the required security for this kind of settings. But since it requires a complicated infrastructure (some mechanism to provide the user credentials, a radius server...) it is rarely used in these scenarios.

This project aims to help closing this gap, by providing an affordable easy to deploy and easy to use solution.

The main idea is to have a properly configured wifi access point, a ticket printer and a user interface that consists on a lcd screen and a keypad. Each time a user wants to connect, the person in charge of delivering the credentials types the expected duration (can be minutes, hours, days or even permanent) and a ticket with the credentials is printed. Then the user can just use those credentials to connect. The fact that each user will use a different password prevents other users to eavesdrop or tamper with his connection.

## Overview

The basic idea of the design is the following:

1. A router running a custom OpenWRT OS, that will provide the wifi network.
2. A device that provides access to the internet (typically a DSL or Cable Router/Modem), connected to (1) by ethernet cable.
3. A USB hub, connected to (1)
4. A Ticket printer, connected by USB to (3)
5. An arduino nano board, connected by USB to (3)
6. A Keypad and LCD, connected to the pins of (5)

The router (1) will take care of the radius server and the wifi access. It will get the input from the arduino board, create random credentials on demmand, and send them to the printer.

## Used hardware

In principle any OpenWRT compatible router with enough RAM, and a compatible USB ticket printer could work. We used in particular a GL-MT300A-Ext router and a Floureon ZJ-5890T printer.

In particular, we used a Floureon ZJ-5890T


## To do

- Configure restrictive firewall
- Block access to global ip
