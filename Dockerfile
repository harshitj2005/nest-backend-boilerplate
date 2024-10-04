FROM node:18.17.1-slim
# Create app directory
WORKDIR /usr/src/app
RUN mkdir /usr/src/app/logs


ARG namespace=development
ENV namespace ${namespace:-development}


# Install packages
# RUN npm install -g pm2
RUN npm install -g rimraf
RUN npm install -g nest
RUN npm install -g @nestjs/cli
# RUN pm2 install typescript
# RUN pm2 install pm2-logrotate@2.6.0
# RUN pm2 set pm2-logrotate:max_size 500M
# RUN pm2 set pm2-logrotate:retain 90
# RUN pm2 set pm2-logrotate:compress true

COPY . .
RUN npm i
# npm run build includes rimraf dist && nest build 
RUN npm run build

# EXPOSE 3020
# CMD export NODE_ENV=${namespace} ; rimraf dist && nest build && nest start
# CMD export NODE_ENV=${namespace} ; pm2-runtime start pm2-ecosystem.config.js --env ${namespace}
CMD ["npm", "run", "start"]