# 
default:

build:
	docker pull cloudbees/cloudbees-jenkins-team
	docker-compose build	

start:
	docker-compose up -d

stop:
	docker-compose down