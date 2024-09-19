FROM python:3.9.6-alpine3.14

# Install git and other dependencies using apk
RUN apk update && apk upgrade && apk add --no-cache git build-base gcc libffi-dev musl-dev

# Copy the requirements file
COPY requirements.txt /requirements.txt

# Install pip and dependencies
RUN pip install --upgrade pip && pip install --no-cache-dir -r /requirements.txt

# Set the working directory
WORKDIR /app

# Copy all project files to the container
COPY . .

# Run Gunicorn and your main Python script
CMD gunicorn app:app & python3 bot.py
