# use lightweight base image
FROM python:3.9-slim

# set environment variables to prevent python from writing .pyc files and buffer output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# set working directory
WORKDIR /app

# copy only the required files to the working directory
COPY requirements.txt /app/
COPY app.py /app/
COPY templates /app/templates
COPY static /app/static

# install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port to run the application
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]