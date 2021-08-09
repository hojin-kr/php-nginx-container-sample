#!/bin/bash
PROJECT_ID=xxx
APP_NAME=app
REGION=us-central1

gcloud builds submit --tag gcr.io/${PROJECT_ID}/${APP_NAME} --project ${PROJECT_ID} .
echo y | gcloud run deploy ${APP_NAME} --image=gcr.io/${PROJECT_ID}/${APP_NAME} --project=${PROJECT_ID} --region=${REGION} --port=80

# CD
# echo y |  gcloud run deploy ${APP_NAME} --image=gcr.io/$PROJECT_ID/$APP_NAME --project=$PROJECT_ID --region=$REGION --port=80 --no-traffic
# gcloud run services update-traffic ${APP_NAME} --project=$PROJECT_ID --region=$REGION --to-revisions=LATEST=${1}
