FROM mcr.microsoft.com/devcontainers/javascript-node:1-20-bullseye

WORKDIR /app
COPY . .
Run npm install -g npm@latest
RUN npm install

RUN apt-get update && apt-get upgrade -y

RUN pip install --upgrade pip

COPY ./api-requirements.txt .
RUN pip install -r api-requirements.txt

COPY ./api
WORKDIR /api

COPY ./entrypoint.sh .
ENTRYPOINT ["sh", "/app/entrypoint.sh"]