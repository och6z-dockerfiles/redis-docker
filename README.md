# Redis
```bash
docker build \
    --no-cache \
    --build-arg PYTHON_VERSION=3.6.9-slim \
    --build-arg REDIS_VERSION=6.0.5 \
    --file Dockerfile \
    --tag image-name:6.0.5 .
```
```bash
docker container run \
    --interactive \
    --tty \
    --network host \
    --name container-name och6z/redis:6.0.5
```
