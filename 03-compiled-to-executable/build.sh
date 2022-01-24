#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"

source "${DIR}/../gcp.config.sh"

MACHINE_TYPE="e2-highcpu-8"
ARTIFACT_NAME="towards-julia-notebook-03-compiled"
TAG="1.0.0"
FULL_TAG="${GCP_LOCATION}-docker.pkg.dev/${PROJECT_ID}/${ARTIFACT_REPOSITORY_NAME}/${ARTIFACT_NAME}:${TAG}"

gcloud config set project $PROJECT_ID
gcloud builds submit --machine-type $MACHINE_TYPE --tag "${FULL_TAG}"
