# Use an official Python 3.10 image from Docker Hub
FROM python:3.10-slim-buster

# Set the working directory
WORKDIR /app

# Copy your application code
COPY . /app

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir -e .

# Expose the port FastAPI will run on
EXPOSE 5000

# Command to run the FastAPI app (uvicorn ensures host 0.0.0.0 binding)
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "5000"]