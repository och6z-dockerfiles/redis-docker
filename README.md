# Redis
```bash
docker build \
    --no-cache \
    --build-arg PYTHON_VERSION=3.6.9-slim \
    --build-arg REDIS_VERSION=5.0.8 \
    --file Dockerfile \
    --tag image-name:latest .
```
```bash
docker container run \
    --interactive \
    --tty \
    --network host \
    --name container-name och6z/redis
```
