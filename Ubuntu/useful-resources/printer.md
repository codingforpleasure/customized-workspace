<!--ts-->
<!--te-->

# Printer (Brother HL-2270DW)

## Installation

follow the instructions:

1. Download the installer (it's a bash script) [instruction](https://support.brother.com/g/b/downloadhowto.aspx?c=us&lang=en&prod=hl2270dw_all&os=128&dlid=dlf006893_000&flang=4&type3=625)
2. Make sure it's executable.
3. you will requested to insert the model name: `HL-2270DW`
4. Will you specify the Device URI? press Y
5. Enter the ip of the printer: 192.168.1.9 (I have configured the printer ip to be static)



Description | command
------------|-----
Start printer service  |  systemctl start cups
Stop printer service  |  systemctl stop cups
Login into the service | http://localhost:631/admin

## Reference
[Torubleshoot Brother-2270DW](https://sudoroom.org/wiki/Brother_HL-2270DW)
