FROM python:3.7.0

RUN pip install -r requirements.txt 

COPY . .

CMD ["python", "api.py"]


