FROM python:3.7.0-alpine

COPY . .

RUN pip install -r requirements.txt

CMD ["python", "api.py"]


