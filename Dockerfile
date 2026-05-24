FROM httpd:latest

COPY dist/lifegoals/browser/ /usr/local/apache2/htdocs/

RUN sed -i \
    -e 's/#LoadModule rewrite_module/LoadModule rewrite_module/' \
    /usr/local/apache2/conf/httpd.conf

RUN sed -i '/<Directory "\/usr\/local\/apache2\/htdocs">/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' \
    /usr/local/apache2/conf/httpd.conf