docker stop funky-penguin 
docker rm funky-penguin
cd /opt/docker-files/ansible-docker-nginx/docker
docker build -t xalg/nginx /opt/docker-files/ansible-docker-nginx/docker/
docker run -d \
    --name funky-penguin \
    -e WEB_DOCUMENT_ROOT=/app/funky-penguin \
    -e WEB_ALIAS_DOMAIN="funky-penguin.com,*.funky-penguin.com" \
    -e VIRTUAL_HOST="funky-penguin.com,*.funky-penguin.com" \
    --restart=always \
    --volumes-from nginx-data \
    --env-file=env_file \
    --link xalg-mysql \
    --link memcache \
    -m 256m \
    -p 86:80 \
    -d xalg/nginx
