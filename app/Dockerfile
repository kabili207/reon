# Specify arguments with defaults for use in "FROM"
ARG DOTNET_VERSION=6.0
ARG NODE_VERSION=18
FROM mcr.microsoft.com/dotnet/sdk:${DOTNET_VERSION} AS base
ENV DEBIAN_FRONTEND=noninteractive

# Args listed before FROM are excluded by default, so we specify them again
# See https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG NODE_VERSION
RUN apt update && apt install -y ca-certificates curl gnupg cron \
	&& curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/nodesource.gpg \
	&& echo "deb https://deb.nodesource.com/node_${NODE_VERSION}.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list \
	&& apt-get update && apt-get install nodejs -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /etc/cron.*/*


FROM base AS trade-build
WORKDIR /src

COPY ["crystal-trade-corner/CGBPokemonCronJob/CGBPokemonCronJob.csproj", "crystal-trade-corner/CGBPokemonCronJob/"]
RUN dotnet restore "crystal-trade-corner/CGBPokemonCronJob/CGBPokemonCronJob.csproj"
COPY crystal-trade-corner crystal-trade-corner
WORKDIR "/src/crystal-trade-corner/CGBPokemonCronJob"
RUN dotnet publish "CGBPokemonCronJob.csproj" -c Release -o /app/publish


FROM node:18-alpine as battle-deps
WORKDIR /app
COPY pokemon-battle/package.json pokemon-battle/package-lock.json* ./
RUN npm ci


FROM node:18-alpine as exchange-deps
WORKDIR /app
COPY pokemon-exchange/package.json pokemon-exchange/package-lock.json* ./
RUN npm ci


FROM base AS runner
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /app
COPY --from=trade-build /app/publish crystal-trade-corner/.

COPY pokemon-battle pokemon-battle
COPY --from=battle-deps /app/node_modules ./pokemon-battle/node_modules

COPY pokemon-exchange pokemon-exchange
COPY --from=exchange-deps /app/node_modules ./pokemon-exchange/node_modules

COPY docker.crontab /etc/crontab

# https://manpages.ubuntu.com/manpages/trusty/man8/cron.8.html
# -f | Stay in foreground mode, don't daemonize.
# -L loglevel | Tell  cron  what to log about jobs (errors are logged regardless of this value) as the sum of the following values:
CMD ["cron","-f", "-L", "2"]