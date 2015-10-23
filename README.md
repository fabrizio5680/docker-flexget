## Fab's Reference

## build and run
```bash
docker build -t <image_name> .
docker run --name <container_name> -v /home/flexget <image_name> true
docker run --rm --volumes-from <container_name> <image_name>
```
## ssh into container 
```bash
docker exec -i -t <container_id> bash
```