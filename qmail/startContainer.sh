docker run -v `pwd`/config:/root/config -v `pwd`/admin:/root/admin -v `pwd`/ucspi:/root/ucspi -v `pwd`/qmail:/root/qmail -v `pwd`/start:/root/start -p 110:110 -p 995:995  --hostname="test.nikola.link" -e "USERR=user" -it qmail bash
