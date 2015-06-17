# docker-flexget
flexget in a container

This image uses ubuntu:latest as base image and assume that you already have a config.yaml and flexget db
somewhere in your host and you simply share the files to your container. 


##<a name="installation"></a>Installation
- [install docker](https://docs.docker.com/installation/#installation)

Pull the image from the docker index. 

```bash
docker pull pfragoso/docker-flexget
```

You can also build this image locally.

```bash
git clone https://github.com/ember/docker-flexget
cd docker-flexget
docker build -t "$USER/flexget" .
```
## <a name="start"></a>Start

You can launch the image using the docker command line,

```bash
docker run -d --name flexget -v /apps/flexget/:/home/flexget/.flexget:rw pfragoso/docker-flexget
```

## <a name="references"></a>References
  * https://docs.docker.com
  * http://flexget.com
  * https://registry.hub.docker.com/u/pfragoso/docker-flexget/
