#!/usr/bin/env bash


# This is a collection of servers to interact with my NordVPN connection on my 
# raspberry pi

# This function is change the VPN to an specific server

function changenordvpnserverto () {
	cp /etc/openvpn/NordVPN-Servers/ovpn_udp/$1.nordvpn.com.udp.ovpn /etc/openvpn/NordVPN.conf
	sed -i 's_auth-user-pass_auth-user-pass /etc/openvpn/login_g' /etc/openvpn/NordVPN.conf
	systemctl restart openvpn@NordVPN
}

# This Function is to update the server list

function updatenordvpnserver () {
	wget -O /etc/openvpn/ovpn.zip https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
	unzip -o /etc/openvpn/ovpn.zip -d /etc/openvpn/NordVPN-Servers
}