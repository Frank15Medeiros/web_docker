ARG HEADER_TITLE
ARG NOM_PRENOM

FROM httpd:latest AS httpd
LABEL SrvWeb=1.0
RUN apt update
RUN apt install -y git
RUN rm -rf /usr/local/apache2/htdocs
RUN mkdir /usr/local/apache2/htdocs
RUN git clone https://github.com/Frank15Medeiros/web_docker.git /usr/local/apache2/htdocs
# Remplacer title
RUN sed -i "s|<title>.*</title>|<title>${HEADER_TITLE}</title>|g" /usr/local/apache2/htdocs/index.html
# Mettre nom sur footer
RUN sed -i "s|<h1 class=\"name\">.*</h1>|<h1 class=\"name\">${NOM_PRENOM}</h1>|g" /usr/local/apache2/htdocs/index.html
EXPOSE 80

FROM nginx:latest AS nginx
LABEL SrvWeb=1.0
RUN apt update
RUN apt install -y git
RUN rm -rf /usr/share/nginx/html
RUN mkdir /usr/share/nginx/html
RUN git clone https://github.com/Frank15Medeiros/web_docker.git /usr/share/nginx/html
# Remplacer title
RUN sed -i "s|<title>.*</title>|<title>${HEADER_TITLE}</title>|g" /usr/share/nginx/html/index.html
# Mettre nom sur footer
RUN sed -i "s|<h1 class=\"name\">.*</h1>|<h1 class=\"name\">${NOM_PRENOM}</h1>|g" /usr/share/nginx/html/index.html
EXPOSE 80