FROM nginx:alpine

RUN apk add --no-cache curl

# Copy our HTML
COPY web/index.html /usr/share/nginx/html/index.html

# Create a simple health endpoint
RUN echo 'location = /health { return 200 "healthy\n"; add_header Content-Type text/plain; }' > /etc/nginx/conf.d/health.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD curl -f http://localhost/health || exit 1
