#Haraka container       

startHaraka is the alias used to start haraka        
first in haraka dir do       
`docker build -t haraka .`        
then     
`startContainer.sh`     
then `startHaraka`     
then config ThunderBird to connect to port 2555 on the container :-D       
you could also ssh tunnel to the port :-D     
this thing is meant to enable private(as in run by you) message sending
so it is configured to provide all the things while keeping in mind that it will be used only by one person like over ssh tunnel or what not so no special auth you just type password in a file
 auth flat ini
