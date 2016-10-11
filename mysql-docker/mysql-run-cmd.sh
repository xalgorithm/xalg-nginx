#mysql with data in /opt/mysql
docker run  \
  --name xalg-mysql-web \
  --env-file ./env_file \
  -v /opt/mysql:/var/lib/mysql \
  -d  mysql:5.7
