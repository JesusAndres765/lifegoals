FROM httpd:latest

COPY dist/lifegoals/browser/ /usr/local/apache2/htdocs/

RUN sed -i \
    -e 's/#LoadModule rewrite_module/LoadModule rewrite_module/' \
    -e 's/AllowOverride None/AllowOverride All/g' \
    /usr/local/apache2/conf/httpd.conf

RUN printf '%s\n' \
    'RewriteEngine On' \
    'RewriteBase /' \
    'RewriteRule ^index\.html$ - [L]' \
    'RewriteCond %{REQUEST_FILENAME} !-f' \
    'RewriteCond %{REQUEST_FILENAME} !-d' \
    'RewriteRule . /index.html [L]' \
    > /usr/local/apache2/htdocs/.htaccess