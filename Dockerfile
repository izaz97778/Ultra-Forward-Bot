FROM python:3.8-slim-buster

# Fix outdated buster mirrors
RUN sed -i 's|http://deb.debian.org/debian|http://archive.debian.org/debian|g' /etc/apt/sources.list && \
    sed -i 's|http://security.debian.org/|http://archive.debian.org/|g' /etc/apt/sources.list && \
    apt update && apt upgrade -y && apt install -y git

# Set working directory
WORKDIR /fwdbot

# Copy entire repo contents
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Run start.sh script
COPY start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]
