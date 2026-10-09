# Step 1: Use an ultra-lightweight Python runtime based on Alpine Linux
FROM python:3.11-alpine AS base

# Step 2: Set an isolated working directory inside the container
WORKDIR /app

# Step 3: Copy the application script into the container
COPY app.py .

# Step 4: Define the default runtime command
CMD ["python", "app.py"]

# Run the repository tests without installing Python tools on Jenkins.
FROM base AS test
COPY test.py .
RUN python -m pip install --no-cache-dir pytest
RUN python -m pytest -p no:cacheprovider test.py

# Keep the default application image free of test dependencies.
FROM base AS runtime
