ARG PYTHON_VERSION

FROM python:${PYTHON_VERSION}

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    net-tools \
    iproute2 \
    gcc \
    libc6-dev \
    make \
    && apt-get purge -y && apt-get autoremove -y && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

ARG REDIS_VERSION
ARG REDIS_DOWNLOAD_URL=download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz
ENV REDIS_DOWNLOAD_URL ${REDIS_DOWNLOAD_URL}

RUN wget --output-document=redis.tar.gz ${REDIS_DOWNLOAD_URL} \
    && mkdir --parents /usr/src/redis \
    && tar -xzf redis.tar.gz --directory=/usr/src/redis --strip-components=1 \
    && rm redis.tar.gz \
    && make --directory=/usr/src/redis -j "$(nproc)" all \
    && make --directory=/usr/src/redis install \
    && REDIS_PORT=6379 \
       REDIS_CONFIG_FILE=/etc/redis/6379.conf \
       REDIS_LOG_FILE=/var/log/redis_6379.log \
       REDIS_DATA_DIR=/var/lib/redis/6379 \
       REDIS_EXECUTABLE=`command -v redis-server` /usr/src/redis/utils/install_server.sh

RUN pip install --upgrade wheel pip iredis

ENTRYPOINT ["/bin/sh", "-c"]

EXPOSE 6379

CMD ["redis-server", "/etc/redis/6379.conf"]
