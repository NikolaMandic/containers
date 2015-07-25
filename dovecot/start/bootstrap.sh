DEBIAN_FRONTEND=noninteractive apt-get install -y dovecot-pop3d
echo "ssl=yes" >> /etc/dovecot/conf.d/10-ssl.conf
echo "listen = *, ::" >> /etc/dovecot/dovecot.conf
echo "protocol imap {
login_greeting_capability = yes
imap_client_workarounds = tb-extra-mailbox-sep
}"
>> /etc/dovecot/dovecot.conf
sed -i 's/#!include auth-passwdfile.conf.ext/!include auth-passwdfile.conf.ext/' /etc/dovecot/conf.d/10-auth.conf
echo "user:{plain}pass:1000:1000::/home/user" >> /etc/dovecot/users
echo "
passdb {
  driver = passwd-file
  args = scheme=plain-md5 username_format=%n /etc/dovecot/users
}

userdb {
  driver = passwd-file
  args = username_format=%n /etc/dovecot/users

  # Default fields that can be overridden by passwd-file
  #default_fields = quota_rule=*:storage=1G

  # Override fields from passwd-file
  #override_fields = home=/home/virtual/%u
}
">>/etc/dovecot/conf.d/auth-passwdfile.conf.ext
mkdir /home/user/mail
mkdir /var/mail/user
useradd $USERR
mkdir /home/$USERR
chown -R $USER: /home/$USERR
openssl req     -new     -newkey rsa:8192     -days 365     -nodes     -x509     -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=`hostname -f`"     -keyout /etc/dovecot/private/dovecot.pem -out /etc/dovecot/dovecot.pem
