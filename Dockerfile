FROM python:3.9-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy and install dependencies, setup environment
COPY requirements.txt . 
COPY main.py .
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh && \
    pip install --no-cache-dir -r requirements.txt && \
    mkdir -p input_videos output_videos models

# Copy the application source code
#COPY ./nba_court_tracker ./nba_court_tracker



# Create necessary directories
RUN mkdir -p input_videos output_videos models

#ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]