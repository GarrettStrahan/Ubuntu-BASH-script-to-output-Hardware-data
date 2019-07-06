#!/bin/sh
#This works with HP + Dell servers to get important data for an RMA process or if your about to send important server hardware to verify the hardware worked before you shipped it out.
#Works with Ubuntu, even the with the Ubuntu version that is loaded into memory, no installation package needed. Just load the Ubuntu into memory and run this BASH script into the memory with a USB stick. It will put the data back into the USB with the results.


notify-send 'Trojan Script Running' 'Your servers data is being saved to /' #Joking

echo 'What is the Sales Order #?';
read varname;

route add default gw 10.69.0.254;
uname -a > /SO.txt;
ping 8.8.8.8 -c 2 >> /SO.txt;

apt-get update; apt-get install ntpdate -y; sudo apt-get install stress -y; apt-get install tftp -y;

ntpdate -uv 209.115.181.107;
date >> /SO.txt;

ifconfig >> /SO.txt;

stress -c 4 -t 5 >> /SO.txt;
ethtool eno1 >> /SO.txt; ethtool eno2 >> /SO.txt; ethtool eno3 >> /SO.txt; ethtool eno4 >> /SO.txt;

dmidecode -q >> /SO.txt; lshw >> /SO.txt;

SERIAL=replace.this;
SERIAL=$(lshw | grep -m 1 serial: | cut -c 13-19);

mv /SO.txt /SO-$varname.$SERIAL.txt;

#move this to the tftp of /Test Reports/ on 10.69.0.201 or 192.168.10.10

#tftp server 192.168.10.10;
#put /SO-$varname $SERIAL.txt /Test Reports/;
#quit;


mv /SO-$varname $SERIAL.txt /media/ubuntu/NEW VOLUME/SO-$varname $SERIAL.txt #This will move everything to the USB that you insert




#Try to this command for HP script, this might tell you the cache battery levels
#cat /proc/acpi/battery/BAT0/state;









DELL
-------------
sudo su
echo 'What is the Sales Order #?';
read varname;

SERIAL=replace.this;
SERIAL=$(lshw | grep -m 1 serial: | cut -c 13-19);



dmidecode -q > /media/ubuntu/TEST_REPORT/Dell/SO.txt; lshw >> /media/ubuntu/TEST_REPORT/Dell/SO.txt;

mv /media/ubuntu/TEST_REPORT/Dell/SO.txt /media/ubuntu/TEST_REPORT/Dell/SO-$varname.$SERIAL.txt;


ifconfig


HP //needs the serial number added to the file
---------------
sudo su

sudo su
echo 'What is the Sales Order #?';
read varname;


dmidecode -q > /media/ubuntu/TEST_REPORT/HP/SO.txt; lshw >> /media/ubuntu/TEST_REPORT/HP/SO.txt;

mv /media/ubuntu/TEST_REPORT/Dell/SO.txt /media/ubuntu/TEST_REPORT/Dell/SO-$varname.txt;

ifconfig
