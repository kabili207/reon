
FROM node:18-alpine as battle-deps
WORKDIR /app
COPY pokemon-battle/package.json pokemon-battle/package-lock.json* ./
RUN npm ci

FROM node:18-alpine as exchange-deps
WORKDIR /app
COPY pokemon-exchange/package.json pokemon-exchange/package-lock.json* ./
RUN npm ci


FROM node:18-alpine AS runner
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /app

COPY pokemon-battle pokemon-battle
COPY --from=battle-deps /app/node_modules ./pokemon-battle/node_modules

COPY pokemon-exchange pokemon-exchange
COPY --from=exchange-deps /app/node_modules ./pokemon-exchange/node_modules

COPY docker.crontab /etc/crontabs/root

# source: `docker run --rm -it alpine  crond -h`
# -f | Foreground
# -l N | Set log level. Most verbose 0, default 8
CMD ["crond", "-f", "-l", "2"]