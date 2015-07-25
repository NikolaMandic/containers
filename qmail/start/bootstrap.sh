openssl req     -new     -newkey rsa:8192     -days 365     -nodes     -x509     -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=`hostname -f`"     -keyout /root/haraka/config/tls_key.pem -out /root/haraka/config/tls_cert.pem
sed -i '1s/.*/gcc -O2 -include \/usr\/include\/errno.h/g' /root/qmail/conf-cc
sed -i '1s/.*/gcc -O2 -include \/usr\/include\/errno.h/g' /root/ucspi/conf-cc
sed -i '1s/.*/gcc -O2 -include \/usr\/include\/errno.h/g' /root/admin/daemontools-0.76/src/conf-cc
useradd alias
useradd qmaild
useradd qmaill
useradd qmailq
useradd qmailr
useradd qmailp
useradd qmails
groupadd nofiles
groupadd qmail
mkdir /var/qmail
cd /root/qmail
make setup check
cd /root/ucspi
make setup check
cd /root/admin/daemontools-0.76
package/install


cp /root/config/rc /var/qmail/rc
chmod 755 /var/qmail/rc
mkdir /var/log/qmail
echo ./Maildir/ >/var/qmail/control/defaultdelivery
cp /root/config/startstop /var/qmail/bin/qmailctl

chmod 755 /var/qmail/bin/qmailctl
ln -s /var/qmail/bin/qmailctl /usr/bin
mkdir -p /var/qmail/supervise/qmail-send/log
mkdir -p /var/qmail/supervise/qmail-smtpd/log
cp /root/config/run /var/qmail/supervise/qmail-send/run 
cp /root/config/logrun /var/qmail/supervise/qmail-send/log/run 
cp /root/config/smtpdrun /var/qmail/supervise/qmail-smtpd/run 

echo 20 > /var/qmail/control/concurrencyincoming
chmod 644 /var/qmail/control/concurrencyincoming

cp /root/config/smtpdlogrun /var/qmail/supervise/qmail-smtpd/log/run 



chmod 755 /var/qmail/supervise/qmail-send/run
chmod 755 /var/qmail/supervise/qmail-send/log/run
chmod 755 /var/qmail/supervise/qmail-smtpd/run
chmod 755 /var/qmail/supervise/qmail-smtpd/log/run
mkdir -p /var/log/qmail/smtpd
chown qmaill /var/log/qmail /var/log/qmail/smtpd
ln -s /var/qmail/supervise/qmail-send /var/qmail/supervise/qmail-smtpd /service
