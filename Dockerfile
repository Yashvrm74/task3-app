FROM node:18

WORKDIR /app
COPY . .

RUN echo "console.log('Hello from EC2 Docker image'); require('http').createServer((_, res) => res.end('Hello from EC2')).listen(3000)" > index.js

CMD ["node", "index.js"]
