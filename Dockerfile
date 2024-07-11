FROM node:20.11.0-slim AS base
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

FROM base AS dev
ENV WD=/home/app
WORKDIR ${WD}
COPY package.json package-lock.json tsconfig.json ./
RUN npm ci
COPY index.ts index.ts
CMD ["npm", "run", "dev"]
