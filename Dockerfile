FROM python:3.11-slim

# Set working directory
WORKDIR /opt/source-code

COPY . .

RUN pip install flask

# Expose port
EXPOSE 8080


# Run the app
CMD ["python", "app.py"]
