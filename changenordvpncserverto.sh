#!/usr/bin/env bash

# This script intent to create a command to easily change the NordVPN Server

cp /etc/openvpn/NordVPN-Servers/ovpn_udp/$1.nordvpn.com.udp.ovpn /etc/openvpn/NordVPN.conf
sed -i 's_auth-user-pass_auth-user-pass /etc/openvpn/login_g' /etc/openvpn/NordVPN.conf
systemctl restart openvpn@NordVPN