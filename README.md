1. Clone Repo  
2. CD to the repo directory  
cp .env.sh.template .env.sh  
modify and supply the environment variables  


3. if you want to just run the container  
follow login instructions at https://github.com/Qubeship/qube_base_python/blob/master/login-instructions.md and proceed to step 5.  


4. Build  & Bake  
scripts/docker-builder.sh  
scripts/bake.sh  

5. Run  
scripts/run.sh  

6. end points
 start adding your api resources  


## extra info 
to run sonar, flake , pylint
https://github.com/Qubeship/qube_base_python/blob/master/sonar-flake-pylint.md






