# Use the official Python image as a base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy project files
COPY src/ ./src
COPY pyproject.toml .
COPY README.md .
COPY LICENSE .
COPY requirements.txt .
COPY gradio_tts_app.py .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt && pip install --no-cache-dir .

# Expose the port that Gradio runs on
EXPOSE 7860

# Define the command to run the application
CMD ["gradio", "gradio_tts_app.py"] 