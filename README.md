# Archlinux Bootstrap
A bash script to installing the Archlinux base system in an automated and minimally interactive manner.

It is designed to facilitate clean installations through the use of configurable variables defined in `config.sh`. It uses standard tools from the `Arch live ISO`, such as `pacstrap`, `arch-chroot`, and system commands to automate the initial process.

The result is a base system without a graphical environment, ready for further customization.

> The main goal of this project is to gain a deeper understanding of how Archlinux works at a fundamental level including its installation process and system setup while practicing shell scripting.

## Connect to the Internet (via Wi-Fi, if necessary)

``` sh
iwctl
device list
station <interface> scan
station <interface> get-networks
station <interface> connect <network-name>
exit
```

### Check the Connection

``` sh
ping -c 3 www.google.com
```

## Get the Installer

``` sh
pacman -Sy
pacman -S git

git clone https://github.com/joseangcabb/archlinux-bootstrap.git

cd archlinux-bootstrap
```

## Setting Up (`config.sh`)

Edit the `config.sh` file to customize the installation.

``` sh
vim config.sh
```

Some supported variables include:

``` sh
HOSTNAME="myarch"
TIMEZONE="America/Lima"
LANG="en_US.UTF-8"
EFI_SIZE="500M"
SWAP_SIZE="4G"
ROOT_SIZE="50G"
USER_NAME="angel"
```

## Run Installer

``` sh
chmod +x installer.sh
./installer.sh
```
