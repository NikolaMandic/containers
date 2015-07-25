openssl req     -new     -newkey rsa:8192     -days 365     -nodes     -x509     -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=`hostname -f`"     -keyout /root/haraka/config/tls_key.pem -out /root/haraka/config/tls_cert.pem
sed -i '1s/.*/gcc -O2 -include \/usr\/include\/errno.h/g' /root/qmail/conf-cc
sed -i '1s/.*/gcc -O2 -include \/usr\/include\/errno.h/g' /root/ucspi/conf-cc
sed -i '1s/.*/gcc -O2 -include \/usr\/include\/errno.h/g' /root/admin/daemontools-0.76/src/conf-cc

groupadd nofiles
useradd -g nofiles -d /var/qmail/alias alias
useradd -g nofiles -d /var/qmail qmaild
useradd -g nofiles -d /var/qmail qmaill
useradd -g nofiles -d /var/qmail qmailp
groupadd qmail
useradd -g qmail -d /var/qmail qmailq
useradd -g qmail -d /var/qmail qmailr
useradd -g qmail -d /var/qmail qmails

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

echo '127.:allow,RELAYCLIENT=""' >>/etc/tcp.smtp
echo '172:allow,RELAYCLIENT=""' >>/etc/tcp.smtp

echo taras > /var/qmail/alias/.qmail-root
echo taras > /var/qmail/alias/.qmail-postmaster
ln -s .qmail-postmaster /var/qmail/alias/.qmail-mailer-daemon
chmod 644 /var/qmail/alias/.qmail-root /var/qmail/alias/.qmail-postmaster

svscanboot &
