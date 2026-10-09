# Step 1: Use an ultra-lightweight Python runtime based on Alpine Linux
FROM python:3.11-alpine

# Step 2: Set an isolated working directory inside the container
WORKDIR /app

# Step 3: Copy the application script into the container
COPY app.py .

# Step 4: Define the default runtime command
CMD ["python", "app.py"]
