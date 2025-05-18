#!/bin/bash

set -e

AWS_ACCOUNT_ID="$AWS_ACCOUNT_ID"
REGION="ap-northeast-1"
REPO_NAME="fastapi-lambda-api"

# 1. ECR作成（なければ）
aws ecr describe-repositories --repository-names $REPO_NAME --region $REGION || \
aws ecr create-repository --repository-name $REPO_NAME --region $REGION

# 2. Dockerビルド＆プッシュ
docker build -t $REPO_NAME .
docker tag $REPO_NAME:latest $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com
docker push $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest
