FROM python:3.7-alpine

WORKDIR /usr/src/app

# Flask configurations
ENV FLASK_APP=./src/main.py
ENV FLASK_RUN_HOST=0.0.0.0

RUN apk add --no-cache gcc musl-dev linux-headers

# Instalação de dependencias python
COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

COPY ./src ./
COPY . .

CMD [ "python", "./src/main.py" ]

# FROM python:2.7-alpine
# ADD . /code
# WORKDIR /code
# COPY ./src ./
# COPY . .
# RUN pip install -r requirements.txt
# CMD [ "python", "./src/main.py" ]