docker stop xalg-im
docker rm xalg-im
cd /opt/docker-files/ansible-docker-nginx/docker
docker build -t xalg/nginx /opt/docker-files/ansible-docker-nginx/docker/
docker run -d \
    --name xalg-im \
    -e WEB_DOCUMENT_ROOT=/app/xalg \
    -e WEB_ALIAS_DOMAIN="*.xalg.im" \
    -e VIRTUAL_HOST="*.xalg.im" \
    --restart=always \
    --volumes-from nginx-data \
    --env-file=env_file \
    --link xalg-mysql \
    -m 256m \
    -p 87:80 \
    -d xalg/nginx
