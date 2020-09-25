FROM node:14

# create the app directory
WORKDIR /usr/src/app

# copy the source directory (.dockerignore file in source directory should take care that node_modules is not copied)
COPY . .

RUN chgrp -R 0 /usr/src/app && \
    chmod -R g=u /usr/src/app && \
    chown -R 1000:0 /usr/src/app && \
    usermod -a -G root node
USER 1000

# execute npm install (should install necessary node_modules and in this case also bower components)
RUN npm install  bower

RUN npm install

EXPOSE 8080

CMD [ "npm", "start"]
