FROM python:3.8-slim-buster

# Fix outdated buster mirrors
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/|http://archive.debian.org/|g' /etc/apt/sources.list && \
    apt update && apt upgrade -y

# Install git
RUN apt install git -y

# Install Python dependencies
COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip && pip install -r /requirements.txt

# Copy app
RUN mkdir /fwdbot
WORKDIR /fwdbot
COPY . /fwdbot

# Run script
COPY start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]
