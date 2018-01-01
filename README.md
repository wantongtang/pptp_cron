# ppptp auto dial
## pptp 自动拨号

# install
apt-get install pptp-linux -y

# create 
pptpsetup --create pptp0 --server yourserver  --username yourusername --password yourpassword --start

# set up route
```shell
vim /etc/ppp/ip-up
```
add this:
```shell
route add default dev $1
```


# connect:
pon pptp0
# disconnect
poff pptp0

# auto dial
crontab -e
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/1  * * * * /root/cron/pptp_cron.sh >> /var/log/pptp_pinger.log 2>&1
