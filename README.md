# Prerequisites for running Angular locally using docker

- Node Latest.
- NVM for node management.
- [Angular CLI](https://github.com/angular/angular-cli).
- DockerFile (with layers that support angular build)

## Spinning up local Docker

##### STEP 1 : Check if docker is running
```
docker ps 
```
##### STEP 2 : Build docker image 
```
docker build . -t martins-instance
```
if docker file is not present in same path as terminal/cmd then use 
```
docker build . -t martins-instance -f ./path/to/dockerfile
```

##### STEP 3 : Run the docker image
```
docker run -it -p 5000:9000 martins-instance
```
##### Note: here the port for docker 9000 is specified as custom port at nginx.conf level
##### Now access the app via http://localhost:5000/