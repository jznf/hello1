# hello1
hello docker, hello jupyter, hello world: minimal setup for starting with docker, conda, jupyter.

# build image with specific name:
```
docker build -t zvsx/hello1 .
```

# run image with one shared directory
current local directory maps to '/hello' in docker container
which means we will have our notebooks saved on host machine even after we kill/remove this container, image or docker itself
```
docker run -i -p 8888:8888 -v $PWD:/hello -t zvsx/hello1 bash -c 'cd /hello && jupyter notebook --no-browser --ip 0.0.0.0 --port=8888'
```

# fire up the browser and go to link displayed by terminal
something like:
```
http://localhost:8888/tree?token=<auth_token>
```

# go to 'hello.ipynb' notebook or create your own

# CLI operations:
get info about running container(s):
```
docker ps
```
'get inside' of running container:
```
docker exec -it container_name_we_know_from_docker_ps_command_we_run_before bash
```
kill the container:
```
docker kill container_name_we_know_from_docker_ps_command_we_run_before
```
