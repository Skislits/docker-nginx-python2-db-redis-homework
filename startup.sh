#!/bin/bash

# Build docker image
docker-compose up -d --build
# Run all the services except the consumers, which will be run after all the apps are prepaired
docker-compose up -d --scale consumers=0

######################################################################################
# Prepare web Django container
######################################################################################
docker-compose exec web git checkout master
"scripts/migrateToDo.sh"

# after all set and done run the consumers
docker-compose up -d consumers
# start the cron jobs and set the commands under todo app
docker-compose exec web service cron start
docker-compose exec web crontab ../../../etc/crontab
