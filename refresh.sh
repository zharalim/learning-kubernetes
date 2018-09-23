#/bin/bash

set -e

GCP_PROJECT_ID=$(gcloud config get-value project)
sudo docker build -t eu.gcr.io/$GCP_PROJECT_ID/node-app ./node-app/ --no-cache
sudo docker push eu.gcr.io/$GCP_PROJECT_ID/node-app
kubectl delete po -l app=node
