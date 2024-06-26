FROM httpd:latest AS httpd
LABEL SrvWeb=1.0
RUN apt update
RUN apt install -y git
RUN rm -rf /usr/local/apache2/htdocs
RUN mkdir /usr/local/apache2/htdocs
RUN git clone https://github.com/Frank15Medeiros/web_docker.git /usr/local/apache2/htdocs
EXPOSE 80

FROM nginx:latest AS nginx
LABEL SrvWeb=1.0
RUN apt update
RUN apt install -y git
RUN rm -rf /usr/share/nginx/html
RUN mkdir /usr/share/nginx/html
RUN git clone https://github.com/Frank15Medeiros/web_docker.git /usr/share/nginx/html
EXPOSE 80