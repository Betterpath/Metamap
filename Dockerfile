FROM java:latest
MAINTAINER brandon@bettepath.com
ENV LAST_UPDATED 2017-26-11
ARG S3_KEY
ARG S3_SECRET
ENV AWS_ACCESS_KEY_ID=${S3_KEY}
ENV AWS_SECRET_ACCESS_KEY=${S3_SECRET}
ADD download.sh /download.sh
RUN /download.sh
RUN tar xfj public_mm_linux_main_2016v2.tar.bz2
RUN cd public_mm && ./bin/install.sh
CMD tail -f /dev/null

