FROM nginx:latest
MAINTAINER Kyle Calica "Kyle Calica"

#for nodejs
RUN apt-get update
RUN apt-get install -y build-essential git


#nginx configuration
RUN rm /etc/nginx/nginx.conf
COPY ./nginx.conf /etc/nginx/

RUN mkdir /etc/nginx/sites-enabled
RUN mkdir -p /var/www/server1/html
RUN mkdir -p /var/www/server2/html

RUN chmod 755 /var/www/

COPY ./server/server1 /var/www/server1
COPY ./server/server2 /var/www/server2

COPY ./sites-enabled/server1 /etc/nginx/sites-available/
COPY ./sites-enabled/server2 /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/server1 /etc/nginx/sites-enabled/
RUN ln -s /etc/nginx/sites-available/server2 /etc/nginx/sites-enabled/


EXPOSE 80
