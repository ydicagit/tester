
## Extra Info Run Sonar , Tox , Pylint , Flake


```
~/Downloads/sonar-scanner-2.8/bin/sonar-scanner
docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube

## bash into the source code container  

docker run -it --rm --name python3-builder -v "$PWD":/usr/src/myapp -v /usr/src/myapp/build -w /usr/src/myapp python:3-onbuild  bash

# Run pylint , flake and tox
.tox/lint/bin/flake8 --ignore E111 --exclude=env,.tox --import-order-style=google
.tox/pylint/bin/pylint qube --rcfile=./default.pylintrc  --reports=y
.tox/pylint/bin/pylint --rcfile=./default.pylintrc qube/src/auth_listener.py --msg-template='{msg_id}:{line:3d},{column}: {obj}: {msg}'
.tox/pylint/bin/pylint --rcfile=./default.pylintrc qube/src/oauth.py

http://192.168.99.100:3000/auth/login?cb=http%3A%2F%2F192.168.99.100%3A9080%2Flogin-github%3F&provider=github 
```
