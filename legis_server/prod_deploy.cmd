docker build -t legis_server .
docker rm legis_server
docker run -e "dbhost=10.0.0.22" -d --name legis_server -p 3150:3150 legis_server   
