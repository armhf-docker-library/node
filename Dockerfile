FROM armhfbuild/debian:wheezy

RUN apt-get update
RUN apt-get install --no-install-recommends -y -q curl build-essential git ca-certificates

RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get -y install nodejs \
 && apt-get clean
