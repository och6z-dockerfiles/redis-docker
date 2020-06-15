# Redis
```bash
docker build \
    --no-cache \
    --build-arg PYTHON_VERSION=3.6.9-slim \
    --build-arg REDIS_VERSION=4.0.9 \
    --file Dockerfile \
    --tag image-name:latest .
```
```bash
docker container run \
    --interactive \
    --tty \
    --network host \
    --name container-name och6z/redis:4.0.9
```
