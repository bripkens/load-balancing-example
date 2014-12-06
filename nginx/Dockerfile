FROM nginx:1.7.8
MAINTAINER Ben Ripkens <bripkens.dev@gmail.com>

RUN rm /etc/nginx/conf.d/*

COPY proxy.conf proxy.conf.part2
COPY run.bash run.bash
COPY data /www/data

CMD bash run.bash
