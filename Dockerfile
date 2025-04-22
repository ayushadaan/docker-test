FROM ubuntu:latest

# Install Python, pip, and virtual environment tools
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy requirements first
COPY requirements.txt .

# Install dependencies using the correct flag to bypass PEP 668
RUN pip install --break-system-packages --no-cache-dir -r requirements.txt

# Copy your Django project code
COPY firstpy /app/

# Switch into your Django app directory
WORKDIR /app/firstpy

# Expose the Django dev server port
EXPOSE 8000

# Run the development server
ENTRYPOINT ["python3"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]
