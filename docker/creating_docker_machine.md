# Creating a new Docker machine in development computer (local MacBook)

If you don't have Docker and Docker Machine, install Docker, Docker Machine and Docker Compose by using installer provided in Docker website.

Create a new docker machine by running docker machine command

`docker-machine create --driver virtualbox --engine-insecure-registry 192.168.5.0/24 --virtualbox-cpu-count "2" --virtualbox-memory "3072" dev`

###Descriptions:
- engine-insecure-registry : IP address / DNS name and port of private docker registry
- virtualbox-cpu-count : Number of CPUs for new docker machine
- virtualbox-memory : RAM amount for new docker machine

Run the following command to configure your shell:
`eval "$(docker­machine env dev)"`
