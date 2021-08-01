FROM perl:5.34.0

MAINTAINER AlexP007

# Creating app root directory.
RUN     mkdir -p -m 0775 /var/www/app/dancer && chown www-data /var/www/app/dancer && chgrp www-data /var/www/app/dancer

# Downloading dancer with all required modules.
WORKDIR /var/www/app/
ADD     ./cpanfile ./cpanfile
RUN     cpanm --installdeps . --with-feature=accelerate

# Starting application.
WORKDIR /var/www/app/dancer
USER    www-data
CMD     plackup -r -R lib -p 5000 bin/app.psgi

EXPOSE  5000