FROM node:6.10.0 
MAINTAINER Thore Sünert <mail@thoresuenert.de> 

# Note: npm is v3.10.10
RUN \
	npm install -g ember-cli@2.12.1 &&\
	npm install -g bower@1.8.0 &&\
	npm install -g phantomjs-prebuilt &&\
  npm install -g node-sass@3.13.1

RUN \
  apt-get update -y &&\
  apt-get install openssh-client -y
# install watchman
# Note: See the README.md to find out how to increase the
# fs.inotify.max_user_watches value so that watchman will 
# work better with ember projects.
RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v3.5.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install
