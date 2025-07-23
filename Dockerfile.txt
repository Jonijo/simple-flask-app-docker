# Base image
FROM ubuntu:latest

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Install flask
RUN pip3 install flask

# Set working directory
WORKDIR /opt/source-code

COPY app.py .

# Expose port
EXPOSE 8080

ENTRYPOINT FLASK_APP=app.py flask run --host=0.0.0.0 --port=8080