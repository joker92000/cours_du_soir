# Start with a Python base image that supports linux/arm/v7
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the contents of the repository to the working directory
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install uvicorn and gunicorn separately
RUN pip install uvicorn gunicorn fastapi

# Expose the port the app runs on
EXPOSE 8001

# Command to run the app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8001"]
