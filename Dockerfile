FROM httpd:latest

COPY dist/lifegoals/browser/ /usr/local/apache2/htdocs/

RUN sed -i 's/#LoadModule rewrite_module/LoadModule rewrite_module/' \
    /usr/local/apache2/conf/httpd.conf

RUN sed -i 's/AllowOverride None/AllowOverride All/g' \
    /usr/local/apache2/conf/httpd.conf