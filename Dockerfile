FROM ubuntu:16.04
MAINTAINER YusupovAI
RUN apt-get update && \ 
    apt-get install -y \
    curl \
    docker.io && \
    curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose && \

    mkdir mailu

COPY .env mailu/
COPY docker-compose.yml mailu/
CMD cd mailu && \
    service docker start && \
    docker-compose up && \
    docker-compose run --rm admin python manage.py admin root example.net password
EXPOSE 80
