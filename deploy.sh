#!/bin/bash
# Script de despliegue automático a AWS S3
BUCKET="devops-03029008-cli"
REGION="us-east-1"

echo " Obteniendo últimos cambios del repositorio..."
git pull origin main

echo " Desplegando a S3..."
aws s3 sync . s3://$BUCKET \
  --exclude ".git/*" \
  --exclude "deploy.sh" \
  --region $REGION

echo " Despliegue completado!"
echo " URL: http://$BUCKET.s3-website-$REGION.amazonaws.com"