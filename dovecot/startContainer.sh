docker run -v `pwd`/start:/root/start -p 110:110 -p 995:995  --hostname="test.nikola.link" -e "USERR=user" -it dovecot bash
