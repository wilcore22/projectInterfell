FROM python:3.9-slim


WORKDIR /app2


COPY . /app2


RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80


ENV NAME World2


CMD ["python", "app.py"]

