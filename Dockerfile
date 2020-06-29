# See https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md for best practices for node.js in docker
FROM node:14-alpine

ADD ["./app", "/app"]
WORKDIR /app
EXPOSE 8080/tcp

# Add Tini (allows proper init and sigint handling around node.js, see https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md)
#ENV TINI_VERSION v0.19.0
#ADD ["https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static", "/tini"]
#RUN chmod a+x /tini
#ENTRYPOINT ["/tini", "--"]

USER node
CMD ["/usr/local/bin/node", "index.js"]
