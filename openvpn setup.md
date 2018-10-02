##  OpenVPN Setup with NordVPN

The main references for this setup have been [this](https://www.novaspirit.com/2017/06/22/raspberry-pi-vpn-router-w-pia/) & [this](https://gist.github.com/superjamie/ac55b6d2c080582a3e64), and [NordVPN help docs](https://support.nordvpn.com/#/Connectivity/Linux/1047409772/How-to-configure-a-Raspberry-Pi.htm). 

### Setup OpenVPN

Make sure you have a static IP and download OpenVPN: 

```sh
$ sudo apt-get install openvpn 
```

Download the NordVPN config files from [here](https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip), although I think it's better to download them directly to the openvpn folder with the following chain of commands: 

```sh 
$ cd /etc/openvpn/
$ sudo wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
$ sudo unzip ovpn.zip -d NordVPN-Servers
$ sudo rm ovpn.zip
```

The `NordVPN-Servers` folder is composed for two folders `ovpn_tcp ` and  `ovpn_udp`. 

We need to create also de login file where we are going to store the login credentials for the VPN. 

```sh
$ sudo nano /etc/openvpn/login
```

```
username@mail.com
password1234
```

Save the file `ctrl-o` and `ctrl-x` to leave. 

Change the permissions of this file to be only accesible by root: 

```sh 
$ sudo chmod 600 /etc/openvpn/login
```

Now, setup one of the files we downloaded to configure OpenVPN. 

Go to the NordVPN site in the [recommended servers section](https://nordvpn.com/servers/#recommended) and ask for a server for the best server related to our criteria and country. For example, if we want to connect to USA, it could yield the server name `us2328.nordvpn.com`.

Copy that file from the `NordVPN-Servers` files to `/etc/openvpn/` and rename it as `NordVPN.conf`. Usually UDP connection is preferred, so you can copy with the following command. 

```sh 
$ sudo cp /etc/openvpn/NordVPN-Servers/ovpn_udp/$server_name.nordvpn.com.udp.ovpn /etc/openvpn/NordVPN.conf
```

Where `$server_name` is  `us2328` in this example. 

Now, change in the file `NordVPN.conf` the line containing `auth-user-pass`  for `auth-user-pass /etc/openvpn/login`. 

Manually:

```sh
$ sudo nano /etc/openvpn/NordVPN.conf
```

or running the following command: 

```sh 
$ sudo sed -i 's_auth-user-pass_auth-user-pass /etc/openvpn/login_g' /etc/openvpn/NordVPN.conf 
```

### Test the VPN and enable it on boot

Run: 

```sh 
$ sudo openvpn --config /etc/openvpn/NordVPN.conf
```

If everything looks fine, stop it with `ctrl+c` and enable it on boot with: 

```sh 
$ sudo systemctl enable openvpn@NordVPN
```
