openssl req     -new     -newkey rsa:8192     -days 365     -nodes     -x509     -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=`hostname -f`"     -keyout /root/haraka/config/tls_key.pem -out /root/haraka/config/tls_cert.pem
sed -i '1s/.*/gcc -O2 -include \/usr\/include\/errno.h/g' /root/qmail/conf-cc
sed -i '1s/.*/gcc -O2 -include \/usr\/include\/errno.h/g' /root/ucspi/conf-cc
sed -i '1s/.*/gcc -O2 -include \/usr\/include\/errno.h/g' /root/daemontools/src/conf-cc
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


