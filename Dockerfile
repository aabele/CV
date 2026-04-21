FROM oven/bun:1-debian

RUN apt-get update && apt-get install -y --no-install-recommends \
    chromium \
    ghostscript \
    fonts-liberation \
    fonts-noto-core \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdrm2 \
    libgbm1 \
    libnss3 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libxkbcommon0 \
    libpango-1.0-0 \
    libcairo2 \
    libasound2 \
 && rm -rf /var/lib/apt/lists/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium \
    CV_WORK_DIR=/work \
    HOME=/tmp

WORKDIR /app

COPY package.json ./
RUN bun install

COPY build.js docker-entrypoint.sh ./
RUN chmod +x /app/docker-entrypoint.sh

WORKDIR /work

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["bun", "run", "/app/build.js"]
