DEBIAN_FRONTEND=noninteractive apt-get install -y dovecot-pop3d
echo "ssl=yes" >> /etc/dovecot/conf.d/10-ssl.conf
echo "listen = *, ::" >> /etc/dovecot/dovecot.conf
echo "protocol imap {
login_greeting_capability = yes
imap_client_workarounds = tb-extra-mailbox-sep
}"
>> /etc/dovecot/dovecot.conf
openssl req     -new     -newkey rsa:8192     -days 365     -nodes     -x509     -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=`hostname -f`"     -keyout /etc/dovecot/private/dovecot.pem -out /etc/dovecot/dovecot.pem
