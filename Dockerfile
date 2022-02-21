FROM nginx:latest
RUN echo "Welcome to DevOps !!" > /usr/share/nginx/html/index.html

EXPOSE 80

