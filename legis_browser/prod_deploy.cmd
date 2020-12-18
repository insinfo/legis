docker container stop legisbrowser
docker container rm legisbrowser  
REM docker image rm legisbrowser  
docker build -t legisbrowser .
docker run -d -p 8085:8084 --name legisbrowser --restart always legisbrowser
