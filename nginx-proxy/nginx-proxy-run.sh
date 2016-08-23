#docker pull jwilder/nginx-proxy
docker exec -d nginx-proxy cat /etc/nginx/conf.d/default.conf > ./default.conf
docker stop nginx-proxy
docker rm nginx-proxy
docker run --name="nginx-proxy" -d -p 80:80 -v default.conf:/etc/nginx/conf.d/default.conf:rw  -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy 
