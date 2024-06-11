ARG REDIS_VERSION=latest
FROM redis:${REDIS_VERSION}
RUN mkdir -p /etc/redis
COPY redis.conf /etc/redis/redis.conf
VOLUME /data
CMD ["redis-server", "/etc/redis/redis.conf"]
EXPOSE 6379
