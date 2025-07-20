FROM python:3.8-slim-buster

# Fix Debian buster repo issue
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/|http://archive.debian.org/|g' /etc/apt/sources.list && \
    apt update && apt upgrade -y

# Install git
RUN apt install git -y

# Install dependencies
COPY requirements.txt /requirements.txt
RUN pip3 install -U pip && pip3 install -U -r /requirements.txt

# App setup
RUN mkdir /fwdbot
WORKDIR /fwdbot
COPY . /fwdbot

# If you use start.sh, keep this
COPY start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]
