# hello1
hello docker, hello jupyter, hello world: minimal setup for starting with docker, conda, jupyter.

# build image with specific name:
```
docker build -t zvsx/hello1 .
```

# run notebook with one shared directory (current local directory maps to '/hello' in docker image)
```
docker run -i -p 8888:8888 -v $PWD:/hello -t zvsx/hello1 bash -c 'cd /hello && jupyter notebook --no-browser --ip 0.0.0.0 --port=8888'
```

# fire up the browser and go to link diplayed by command line interface
something like:
```
http://localhost:8888/tree?token=<auth_token>
```

