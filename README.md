# Change NordVPN Server Command

This is a small script that develops a command for easily change the NordVPN Server. 

It basically do is 4 commands. 

1. It changes the configuration file form the old one to the new one and rename it to `NordVPN.conf`. 
2. Then add the needed configuration to the file to work properly without the need of a password and username. In other words, set the location of the file containing those two elements. 
3. Restarts the `openvpn` service so the new configuration has effect. 

## Prerequisites

It assumes that you have downloaded and unzipped the configuration files for NordVPN servers doing the following.  

```shell
$ cd /etc/openvpn/
$ sudo wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
$ sudo unzip ovpn.zip -d NordVPN-Servers
$ sudo rm ovpn.zip
```

The `/etc/openvpn/login` has to ve formatted just like this: 

```
username@email.com
password1234
```

It also assumed that you have `openvpn` installed, of course.

## Install

You don't need to install anywhere, you just download it and you can run it from the download folder like any other script. 

I've copy to the folder `/usr/local/bin` so I can run it form anywhere. I've also removed the extension `.sh` so the invocation is cleaner. 

## Usage

```shell
$ changenordvpnsever coNNNN
```

Where `coNNN` is the country and number of the server you want to connect. For example `us1182`. You can see all the servers [here](https://nordvpn.com/servers/). 

​	