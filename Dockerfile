FROM python:3.7.0-alpine

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ["python", "api.py"]


