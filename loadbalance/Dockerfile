FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY <SOURCE PATH TO LOADER TEST API KEY> <DEST PATH>
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "nano"]
EXPOSE 80