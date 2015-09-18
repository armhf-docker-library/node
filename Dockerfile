FROM resin/armv7hf-debian:jessie

ENV NODE_VERSION 0.12.7

RUN apt-get update && apt-get install -y wget python build-essential && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz && \
  tar xvzf node-v${NODE_VERSION}.tar.gz && \
  rm -f node-v${NODE_VERSION}.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  npm install -g npm && \
  printf '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
