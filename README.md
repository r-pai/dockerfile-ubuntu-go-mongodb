# dockerfile-ubuntu-go-mongodb
Repository has Dockerfile which creats the ubuntu image with golang , mongodb.

## Purpose 
To run golang programs which connects to mongodb atlas.

### Creating docker image
```shell
docker build --tag <imagename> .
```

### Run docker image
```shell
docker container run -it <imageid> /bin/bash
```
### Change the resolve.conf
When connecting to mongodb atlas there would be a DNS error "cannot unmarshal DNS message"
Solution
Update the content of /etc/resolv.conf by replacing the nameserver to use a compliant and/or public DNS server i.e. 1.1.1.1 or 8.8.8.8

### Get IP Address of docker image 
docker inspect  <imageid> | grep "IPAddress"
