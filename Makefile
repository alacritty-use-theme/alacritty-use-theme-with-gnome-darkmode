getID=$$(docker ps -l --format {{.ID}})
export getID

.SILENT: stop
.PHONY: all build connect server stop
all:
	# getID=$$(docker ps -l --format {{.ID}})
	# export getID
	echo $(getID)

build:
	docker build . -t day_night:latest

run: ./app/var/tmp/night-and-day/mode
	docker run --rm -i -e lat=$(lat) -e lng=$(lng) -t day_night:latest \
	cat /var/tmp/night-and-day/mode

server:
	docker run --rm -dt day_night:latest /bin/bash

stop:
	echo "stopping container"

	docker stop $(getID)
	unset $(getID)

connect:
	bash -c "docker exec -it $(getID) /bin/bash"
	$(MAKE) stop

