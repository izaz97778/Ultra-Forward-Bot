FROM python:3.10-slim

# Install git (no need to fix old mirrors since this is not buster)
RUN apt update && apt install -y git

# Set working directory
WORKDIR /fwdbot

# Copy all files into the container
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy and run the start script
COPY start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]
