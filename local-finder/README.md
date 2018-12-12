Prototype built using:
* [Redis](https://redis.io) - database backend
* [Falcon](https://falconframework.org) - web framework
* [Docker](https://www.docker.com) and [docker compose](https://docs.docker.com/compose/overview/) - container environment

To get up and running, run:

1.	`docker-compose up -d`

The web interface will be availabe at [http://localhost:8000](http://localhost:8000) and [http://localhost:5000](http://localhost:5000)
Alternatively you can run curl -XGET at either URL to print the response on terminal.
Visit Consul at [http://localhost:8500](http://localhost:8500) to verify that the services are discovered and registered.

The `seed_db_with_random_places.py` script is used to populate redis with random data,
run these commands:

2.	`docker-compose run app python seed_db_with_random_places.py`
3.	`docker-compose run application python seed_db_with_random_places.py`

This will create a fixed number of locations based on seed data which will be printed out onto the screen.

Run this command and copy the result:
4.	`docker ps | grep redis | cut -d' ' -f1`

The output is the container id of redis container, run the following commands to access redis terminal and verify keys and values:

5.	`docker exec -it <container_id> /bin/sh`
6.	`redis-cli`
7.	`keys *`

This will output the key name, in this case 'locations', we will use <key> to denote this. Run this command on the redis container shell:

8.	`type <key>`

The output will be zset. Run the following command to verify the key values:

9.	`zrange <key> 0 -1 withscores`

It will output all location values stored for app containers.
