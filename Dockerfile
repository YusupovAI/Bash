FROM ubuntu:16.04
MAINTAINER YusupovAI
RUN apt-get update && \ 
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88  && \
    add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \

    curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose && \

    mkdir mailu

COPY .env mailu/
COPY docker-compose.yml mailu/
CMD cd mailu && \
    # systemctl start docker && \
    # docker-compose up
EXPOSE 80

