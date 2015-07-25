docker run -v `pwd`/daemontools:/root/da
emontools -v `pwd`/ucspi:/root/ucspi -v `pwd`/qmail:/root/qmail -v `pwd`/start:/root/start -p 1
10:110 -p 995:995  --hostname="test.nikola.link" -e "USERR=user" -it qmail bash
