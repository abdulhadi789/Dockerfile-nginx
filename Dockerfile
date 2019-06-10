FROM centos
MAINTAINER abdul <abdulhadi.gdk@gmail.com>
LABEL vendor="abdul" \
      Version="2.0.1"
USER root
WORKDIR /
RUN yum -y install epel-release && \
    yum -y install nginx && \
    yum clean all
VOLUME /usr/share/nginx/html
COPY index.html /usr/share/nginx/html
EXPOSE 80
HEALTHCHECK --interval=5m --timeout=3s --retries=4 CMD curl -f http://localhost:80 || exit 1
CMD ["nginx", "-g", "daemon off;"]

