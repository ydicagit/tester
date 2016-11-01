FROM python:3.3
ADD dist/qube*.whl .
ADD requirements.txt .
RUN pip install -r requirements.txt
RUN pip install qube*.whl 
ADD assets ./assets
ADD scripts/startup.sh .
CMD ["./startup.sh"]  