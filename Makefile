build:
	docker build -t minecraft-server .

run:
	docker run --name server-minecraft -it minecraft-server

start:
	docker start -a server-minecraft

stop:
	docker stop server-minecraft