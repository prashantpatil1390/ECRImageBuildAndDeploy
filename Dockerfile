FROM nginx:latest
RUN echo "My name is Antheny Gonsalvis" > /usr/share/nginx/html/index.html

EXPOSE 80

