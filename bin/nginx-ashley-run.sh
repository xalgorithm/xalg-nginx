docker stop ashley
docker rm ashley
cd opt/docker/docker-nginx
docker build -t xalg/nginx opt/docker/docker-nginx
docker run -d \
    --name ashley \
    -e WEB_DOCUMENT_ROOT=/app/ashley \
    -e WEB_ALIAS_DOMAIN="ashleythenewbie.com,*.ashleythenewbie.com" \
    -e VIRTUAL_HOST="ashleythenewbie.com,*.ashleythenewbie.com" \
    --restart=always \
    --volumes-from nginx-data \
    --env-file=env_file \
    --link xalg-mysql \
    --link memcache \
    -m 256m \
    -p 85:80 \
    -d xalg/nginx
