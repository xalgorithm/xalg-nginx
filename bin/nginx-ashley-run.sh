docker stop ashley 
docker rm ashley
cd /opt/docker-files/ansible-docker-nginx/docker
docker build -t xalg/nginx /opt/docker-files/ansible-docker-nginx/docker/
docker run -d \
    --name ashley \
    -e WEB_DOCUMENT_ROOT=/app/amcf \
    -e WEB_ALIAS_DOMAIN="*.ashleythenewbie.com" \
    -e VIRTUAL_HOST="*.ashleythenewbie.com" \
    --restart=always \
    --volumes-from nginx-data \
    --env-file=env_file \
    --link xalg-mysql \
    -m 256m \
    -p 85:80 \
    -d xalg/nginx
