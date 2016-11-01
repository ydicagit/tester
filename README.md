1. Run Sonar , Tox , Pylint , Flake

~/Downloads/sonar-scanner-2.8/bin/sonar-scanner
```
docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube
.tox/lint/bin/flake8 --ignore E111 --exclude=env,.tox --import-order-style=google
.tox/pylint/bin/pylint qube_auth --rcfile=./default.pylintrc  --reports=y
.tox/pylint/bin/pylint --rcfile=./default.pylintrc qube_auth/src/auth_listener.py
.tox/pylint/bin/pylint --rcfile=./default.pylintrc qube_auth/src/oauth.py
http://192.168.99.100:3000/auth/login?cb=http%3A%2F%2F192.168.99.100%3A9080%2Flogin-github%3F&provider=github 
```

1. Customize
./customize.sh api_pipeline api_pipeline PIPE  
modified files would be setup.py scripts/run.sh scripts/bake.sh sonar-project.properties

git add 
git commit 


2. Build 
scripts/docker-builder.sh
scripts/bake.sh


3. Run  
scripts/run.sh  


start adding your api resources  





