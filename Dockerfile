FROM python:3.3
ADD dist/qube_placeholder*.whl .
ADD requirements.txt .
RUN pip install -r requirements.txt
RUN pip install qube_placeholder*.whl 
ADD scripts/startup.sh .
CMD ["./startup.sh"]  