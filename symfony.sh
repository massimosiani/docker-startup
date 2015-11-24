docker pull mysql:5.6
docker pull phpmentors/symfony-app

docker run --name mysql56 -d mysql
docker run --name symfony -p 8080:80 --link mysql56:mysql -d phpmentors/symfony-app
