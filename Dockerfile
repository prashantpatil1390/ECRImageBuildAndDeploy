FROM nginx:latest
RUN echo "Welcome to DevOps world" > /usr/share/nginx/html/index.html

EXPOSE 80

