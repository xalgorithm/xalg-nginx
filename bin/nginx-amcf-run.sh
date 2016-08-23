docker stop amcf 
docker rm amcf
cd /opt/docker-files/ansible-docker-nginx/docker
docker build -t xalg/nginx /opt/docker-files/ansible-docker-nginx/docker/
docker run -d \
    --name amcf \
    -e WEB_DOCUMENT_ROOT=/app/amcf \
    -e WEB_ALIAS_DOMAIN="*.amcf.org" \
    -e VIRTUAL_HOST="*.amcf.org" \
    --restart=always \
    --volumes-from nginx-data \
    --env-file=env_file \
    --link xalg-mysql \
    -p 82:80 \
    -m 256m \
    -d xalg/nginx
