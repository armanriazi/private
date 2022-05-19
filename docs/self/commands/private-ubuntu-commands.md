### LVM-Disk
#### Notice
**[[partprobe]]**
> to force the kernel to re-read the partition table so that it is not necessary to perform a reboot.

#### Get Status
```lsblk```
```pvscan```
```vgs -o +devices,lv_path```
```vgdisplay```
```lvmdiskscan```


### Add Disk
```fdisk /dev/sdX``
> Regular disk: n => (Enter All)=>p => t => 8e = changes to LVM partition type=>w

> Swap disk: n => (Enter All)=>p => t => 82 = changes to SWAP partition type=>w

### Create Partition
```pvcreate /dev/sdX1```

### Create Logical Volume
```vgextend vgubuntu /dev/sdX```
```lvcreate -l 100%FREE -n XLV vgubuntu```

> For Regular Disk

```mkfs -t ext4 /dev/vgubuntu/XLV```
```mount -t ext4 /dev/vgubuntu/XLV /mnt/X/```

> For Swap Disk

```mkswap /dev/vgubuntu/swap```
```mkswap /dev/mapper/vgubuntu-swap```
```swapon -v /dev/vgubuntu/swap```
```partprobe```
```swapon -va```
```cat /proc/swaps```
```Free -h```

### Fstab Boot

```gedit /etc/fstab```

```

# <file system> <mount point>   <type>  <options>       <dump>  <pass>
/dev/mapper/vgubuntu-root /               ext4    errors=remount-ro 0       1

/dev/mapper/vgubuntu-swap   swap     swap    defaults     0 0

# /boot/efi was on /dev/sda1 during installation

UUID=9fd9c344-09a7-4bbf-af88-9b4e1c24955d       /mnt/docker    ext4    defaults        0       2

/dev/mapper/vgubuntu-home /mnt/home ext4 errors=remount-ro,x-gvfs-show,x-udisks-auth,x-gvfs-name=mnt-home 0 1

/dev/mapper/vgubuntu-sub /mnt/sub ext4 errors=remount-ro,x-gvfs-show,x-udisks-auth,x-gvfs-name=mnt-sub 0 1

```


### Network

```echo "1" > /proc/sys/net/ipv4/ip__forward```
>
```iptables -t nat -A PREROUTING -p tcp --dport 22 -j REDIRECT --to-port 2222```
>
```netsh interface portproxy add v4tov4 listenport=35999 listenaddress=0.0.0.0 connectport=80 connectaddress=0.0.0.0```
>
```netsh http delete urlacl url=http://*:35999/ user=Everyone```

