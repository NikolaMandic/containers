npm install -g Haraka 
haraka -i /root/haraka
echo ".*" >> haraka/config/connect.rdns_access.whitelist
echo ".*" >> haraka/config/mail_from.access.whitelist
openssl req     -new     -newkey rsa:8192     -days 365     -nodes     -x509     -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=`hostname -f`"     -keyout /root/haraka/config/tls_key.pem -out /root/haraka/tls_cert.pem
curl -LSso /root/haraka/config/plugins  https://gist.githubusercontent.com/NikolaMandic/604a51c52c2531bd459a/raw/314e878e6670722cd004cf4b3428115b654dadfe/plugins 
