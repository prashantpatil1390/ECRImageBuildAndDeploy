FROM nginx:latest
RUN echo "Hello World !! My name is Prashant." > /usr/share/nginx/html/index.html

EXPOSE 80

