FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  npm install -g pm2 && \
  rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/Sddxf/Diigitex_xmd /root/lucky_bot
WORKDIR /root/lucky_bot

RUN npm install --legacy-peer-deps

EXPOSE 5000

CMD ["npm", "run", "lucky"]
