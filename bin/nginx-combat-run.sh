docker stop combat 
docker rm combat
cd /opt/docker-files/ansible-docker-nginx/docker
docker build -t xalg/nginx /opt/docker-files/ansible-docker-nginx/docker/
docker run -d \
    --name combat \
    -e WEB_DOCUMENT_ROOT=/app/combat \
    -e WEB_ALIAS_DOMAIN="medieval-combat.org,*.medieval-combat.org, ursusfightclub.org, *.ursusfightclub.org" \
    -e VIRTUAL_HOST="medieval-combat.org,*.medieval-combat.org, ursusfightclub.org, *.ursusfightclub.org" \
    --restart=always \
    --volumes-from nginx-data \
    --env-file=env_file \
    --link xalg-mysql \
    --link memcache \
    -m 256m \
    -p 83:80 \
    -d xalg/nginx
