# Base image
FROM ubuntu:latest

# Install Python and pip
RUN apt update && apt install -y python3 python3-pip python3-venv

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Activate the venv and install Flask
RUN /opt/venv/bin/pip install flask

# Set environment so Python uses the venv
ENV PATH="/opt/venv/bin:$PATH"

# Set working directory
WORKDIR /opt/source-code

COPY app.py .

# Expose port
EXPOSE 8080

ENTRYPOINT FLASK_APP=app.py flask run --host=0.0.0.0 --port=8080