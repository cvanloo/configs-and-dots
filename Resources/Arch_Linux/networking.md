# Networking

```sh
paru -Syu systemd-networkd systemd-resolved
systemctl enable --now systemd-networkd
systemctl enable --now systemd-resolved
```

List network interfaces.

```sh
ip link
ip a # also shows addresses

# let's assume ethernet is enp6s0 and wlan is wlan0
```

```sh
cat <<EOF
[Match]
Name=enp6s0

[Network]
DHCP=yes

[DHCPv4]
RouteMetric=10

[IPv6AcceptRA]
RouteMetric=10
EOF > /etc/systemd/network/20-wired.network
```

```sh
cat <<EOF
[Match]
Name=wlan0

[Network]
DHCP=yes
IgnoreCarrierLoss=3s

[DHCPv4]
RouteMetric=20

[IPv6AcceptRA]
RouteMetric=20
EOF > /etc/systemd/network/25-wireless.network
```
