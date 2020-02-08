FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

COPY ./ /app

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip \
    && pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 80
EXPOSE 80

# Run app.py at container launch
CMD ["python","app.py"]

