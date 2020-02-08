#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=madhurgupta10/udacity_ml

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment udacity_ml --image=$dockerpath 


# Step 3:
# List kubernetes pods
kubectl get pods
name=`kubectl get pods --no-headers -o custom-columns=":metadata.name"`

# Step 4:
# Get the name of the pod, and forward the port
# Forward the container port to a host
kubectl port-forward $name 8888:80
bash make_prediction.sh