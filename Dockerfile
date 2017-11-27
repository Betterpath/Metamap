FROM java:latest
MAINTAINER brandon@bettepath.com
ENV LAST_UPDATED 2017-26-11
ADD download.sh /download.sh
RUN /download.sh
RUN unzip
