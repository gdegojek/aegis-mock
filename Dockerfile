FROM nginx:1.19-alpine
ENV AEGIS_JSON='{"decision":"accept","hit_rules":["GB0004382","GB0004381","GB0000001"],"hit_reasons":["Accept WHEN payment_type is not Like credit_card","Accept WHEN payment_type is not equal to credit_card","Accept non cards transactions."],"accept":true,"challenge":false,"deny":false}'
RUN echo "$AEGIS_JSON" > /usr/share/nginx/html/aegis.json && sed -ie 's|\(.*\)\(index  index.html index.htm;\)|\1\2\n\1error_page 405 =200 $uri;|' /etc/nginx/conf.d/default.conf
