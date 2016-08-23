docker stop kraken 
docker rm kraken
cd /opt/docker-files/ansible-docker-nginx/docker
docker build -t xalg/nginx /opt/docker-files/ansible-docker-nginx/docker/
docker run -d \
    --name kraken \
    -e WEB_DOCUMENT_ROOT=/app/kraken \
    -e WEB_ALIAS_DOMAIN=="*.argentkraken.com" \
    -e VIRTUAL_HOST="argentkraken.com" \
    -e VIRTUAL_HOST="www.argentkraken.com" \
    --restart=always \
    --volumes-from nginx-data \
    --env-file=env_file \
    --link xalg-mysql \
    -m 256m \
    -p 81:80 \
    -d xalg/nginx
