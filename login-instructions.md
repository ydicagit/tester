## Background
In order to work with qubeship containers, you need to be connected to the google container registry. 
the following are the instructions to connect to the 


## Setup Instructions
1. download https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-133.0.0-darwin-x86.tar.gz
2. go to the directory where the gcloud-sdk was downloaded , extract the tar.gz
3. ./google-cloud-sdk/install.sh


## Login 
To login into the docker registry , please follow the following steps
```
1. gcloud auth login

2. gcloud auth list
#confirm that your qubeship.io account is the most recent and active


3. docker login -e $(gcloud auth list | grep ACTIVE | grep qubeship.io | awk '{print $2}')  -u _token -p "$(gcloud auth print-access-token)" https://gcr.io
# confirm login succeeded

4. docker pull gcr.io/qubeship/nodebase:0.2
# for test confirmation
```
