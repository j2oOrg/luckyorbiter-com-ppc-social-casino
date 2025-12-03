# Static site image built on nginx
FROM nginx:1.27-alpine

# Remove default nginx content before copying the static site.
RUN rm -rf /usr/share/nginx/html/*

# Copy the repository (filtered by .dockerignore) into the web root.
COPY . /usr/share/nginx/html

# Surface favicons and app icons at the expected root paths.
RUN cp /usr/share/nginx/html/favicon.ico /usr/share/nginx/html/favicon.ico && \
    cp /usr/share/nginx/html/favicon-16x16.png /usr/share/nginx/html/favicon-16x16.png && \
    cp /usr/share/nginx/html/favicon-32x32.png /usr/share/nginx/html/favicon-32x32.png && \
    cp /usr/share/nginx/html/favicon-48x48.png /usr/share/nginx/html/favicon-48x48.png && \
    cp /usr/share/nginx/html/favicon-64x64.png /usr/share/nginx/html/favicon-64x64.png && \
    cp /usr/share/nginx/html/apple-touch-icon.png /usr/share/nginx/html/apple-touch-icon.png && \
    cp /usr/share/nginx/html/android-chrome-192x192.png /usr/share/nginx/html/android-chrome-192x192.png && \
    cp /usr/share/nginx/html/android-chrome-512x512.png /usr/share/nginx/html/android-chrome-512x512.png

EXPOSE 80

CMD ["nginx","-g","daemon off;"]
