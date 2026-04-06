FROM node:24-alpine AS build
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci --only=production && npm cache clean --force

FROM node:24-alpine AS prod
RUN apk --no-cache add dumb-init
WORKDIR /app

# 1. Copy dependencies from the build stage
COPY --from=build /app/node_modules ./node_modules

# 2. FIX: Copy your actual source code from your machine into this stage
COPY . . 

EXPOSE 5000

ENTRYPOINT ["dumb-init","--"]
CMD ["node", "src/index.js"]