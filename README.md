# devops
Здесь представлен `Dockerfile` для создания почтового вебсервера.
Предполагается, что в папке сборки будут находиться файлы .env и docker-compose.yml
## Технологические решения
Было решено использовать `mailu` в качестве сервера.
https://mailu.io/1.5/compose/setup.html#start-mailu
## Использование
Создать образ `docker build -t mailu .` \ 
Запустить `docker run --privileged mailu`
## TODO
Собственно настроить почтовый сервер
