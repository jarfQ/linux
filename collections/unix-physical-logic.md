



# shell

## 环境变量



```shell
$:pgrep <option> # 获得应用程序的pid
$:cat /proc/$PID/environ # 查看pid的环境变量
$:var=value # 赋值
$:var = value # 相等操作

```





```shell
$:lspci  #查看系统pci设备.主板,声卡,网卡,显卡等信息
$:lspci -v # 查看详细pci信息
$:more /proc/cpuinfo # 查看cpu信息
$:cat /proc/cpuinfo | grep "physical id" | sort | uniq | wc -l # 查看系统物理cpu个数
$:cat /proc/cpuinfo | grep "cpu cores" # 查看每个物理cpu中内核个数
$:cat /proc/cpuinfo | grep "processor" | wc -l # 查看系统所有逻辑cpu个数
$:more /proc/meminfo # 查看系统内存信息
$:fdisk -l #查看磁盘分区信息

```





```
## 外部设备管理
$:mount -t msdos /dev/fd0 /mnt/floppy # 挂载软盘

#挂载U盘
$:dmesg | more # 查看U盘设备文件
$:mkdir /mnt/usb # 建立挂载点
$:mount -t vfat /dev/sda1 /mnt/usb # 挂载到目录

#挂载光盘

```















