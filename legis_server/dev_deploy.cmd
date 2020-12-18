docker build -t legis_server .
docker rm legis_server
docker run -e "dbhost=192.168.133.13" -d --name legis_server -p 3150:3150 legis_server   
