# RabbitMQ-Dockerfile 사용법

### Create docker Image
docker build --t <Dockerfile Path> 형식입니다.<br>
example: sudo docker build --t pegasuskim-rabbitmq:latest ./dockerfile.<br>

### Docker image file list
sudo docker images

### docker Image run(백그라운드)
sudo docker run -it -d --restart=always --name pegasus-rabbitmq -p 5672:5672 -p 15672:15672 -v "외부Path"/data/log:/data/log -v "외부Path"/data/mnesia:/data/mnesia 52.231.165.154:5000/pegasus-rabbitmq

### docker image run (그냥 실행 함.)
sudo docker run -it -p 5672:5672 -p 15672:15672 pegasus-rabbitmq

###  Bash 실행.
sudo docker run -it pegasus-rabbitmq:latest /bin/bash 

### Docker container 접속
sudo docker ps -a
sudo docker exec -it container_name(id) /bin/bash

### rabbitmq 접속
http://127.0.0.1/15672 <br>
ID  : admin  <br>
Pass: asdf12 <br>

## Docker Public Repository & docker registry Server 