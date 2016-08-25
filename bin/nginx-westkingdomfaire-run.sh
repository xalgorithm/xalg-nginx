docker stop westkingdomfaire 
docker rm westkingdomfaire
cd /opt/docker-files/ansible-docker-nginx/docker
docker build -t xalg/nginx /opt/docker-files/ansible-docker-nginx/docker/
docker run -d \
    --name westkingdomfaire \
    -e WEB_DOCUMENT_ROOT=/app/westkingdomfaire \
    -e WEB_ALIAS_DOMAIN="westkingdomfaire.org,*.westkingdomfaire.org" \
    -e VIRTUAL_HOST="westkingdomfaire.org,*.westkingdomfaire.org" \
    --restart=always \
    --volumes-from nginx-data \
    --env-file=env_file \
    --link xalg-mysql \
    --link memcache \
    -m 256m \
    -p 84:80 \
    -d xalg/nginx
