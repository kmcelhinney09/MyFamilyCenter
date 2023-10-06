FROM mcr.microsoft.com/devcontainers/javascript-node:1-20-bullseye


COPY ./app /app
WORKDIR /app

RUN npm install -g npm@latest
RUN npm install

WORKDIR /api
RUN apt-get update && apt-get upgrade -y

RUN sudo apt install -y pip

COPY ./api/api-requierments.txt /api
RUN pip install -r api-requierments.txt

COPY ./api /api

COPY ./api/entrypoint.sh /api
ENTRYPOINT ["sh", "/api/entrypoint.sh"]

