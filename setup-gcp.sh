#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"

source "${DIR}/gcp.config.sh"

gcloud config set project $PROJECT_ID
gcloud artifacts repositories create $ARTIFACT_REPOSITORY_NAME --repository-format=docker \
    --location="$GCP_LOCATION" --description="Docker repository: ${ARTIFACT_REPOSITORY_NAME}"