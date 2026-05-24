FROM httpd:latest

COPY dist/lifegoals/browser/ /usr/local/apache2/htdocs/

RUN echo '<Directory "/usr/local/apache2/htdocs">\
\n    Options Indexes FollowSymLinks\
\n    AllowOverride All\
\n    Require all granted\
\n</Directory>' >> /usr/local/apache2/conf/httpd.conf

RUN sed -i 's/#LoadModule rewrite_module modules\/mod_rewrite.so/LoadModule rewrite_module modules\/mod_rewrite.so/' /usr/local/apache2/conf/httpd.conf

RUN echo "RewriteEngine On\nRewriteBase /\nRewriteRule ^index\\.html$ - [L]\nRewriteCond %{REQUEST_FILENAME} !-f\nRewriteCond %{REQUEST_FILENAME} !-d\nRewriteRule . /index.html [L]" > /usr/local/apache2/htdocs/.htaccess