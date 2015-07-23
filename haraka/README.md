# containerTemplate
template for making docker container               
pattern I found useful put here in order not to repeat it over               
mount start directory as a volume in /root/start         
that directory contains two files      
bootstrap.sh is run once on container initialisation          
and run.sh is run everytime a bash shell is invoked        
it is useful if you want to change something in container but you do not want to rebuild the thing since it might take long    
so          
       
1.build the thing       
2.put initialisation in bootstrap or run script       
3.rebuild possibly on major change       
4. rescript on config and minor issues       
5. TIP: all things that change often put on bottom of docker file :-D       
