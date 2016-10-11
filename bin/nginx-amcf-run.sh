docker stop amcf 
docker rm amcf
cd /opt/docker/docker-nginx
docker build -t xalg/nginx /opt/docker/docker-nginx
docker run -d \
    --name amcf \
    -e WEB_DOCUMENT_ROOT=/app/amcf \
    -e WEB_ALIAS_DOMAIN="amcf.org,*.amcf.org" \
    -e VIRTUAL_HOST="amcf.org,*.amcf.org" \
    --restart=always \
    --volumes-from nginx-data \
    --env-file=env_file \
    --link xalg-mysql-web \
    --link memcache \
    -p 82:80 \
    -m 256m \
    -d xalg/nginx
