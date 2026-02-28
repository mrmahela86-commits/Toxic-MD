FROM node:lts-bookworm

# 1. Sakinisha nyenzo muhimu za mfumo
RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  npm i pm2 -g && \
  rm -rf /var/lib/apt/lists/*

# 2. Tengeneza folder la kazi (Working Directory)
WORKDIR /app

# 3. Copy package.json kwanza kwa ajili ya install
COPY package.json .
RUN npm install --legacy-peer-deps

# 4. Copy mafaili mengine yote (pamoja na folder la lib)
COPY . .

# 5. Fungua port ya mawasiliano
EXPOSE 5000

# 6. WASHA BOT KWA KUTUMIA SCRIPT YA START (lib/toxic.js)
CMD ["npm", "start"]
