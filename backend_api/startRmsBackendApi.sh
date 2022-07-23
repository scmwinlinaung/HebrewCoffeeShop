#!/bin/bash
docker stack rm RMS
sleep 10
docker build -t rms-backend-api .
chmod -R 777 $HOME/Desktop/Customer_Project/RMS/backend_api/
docker stack deploy -c docker-compose.yaml RMS