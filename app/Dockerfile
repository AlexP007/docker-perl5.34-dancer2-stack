FROM perl:5.34.0

MAINTAINER AlexP007

# Creating app root directory.
RUN     mkdir -p -m 0775 /var/www/app/dancer && chown www-data /var/www/app/dancer && chgrp www-data /var/www/app/dancer

# Starting application.
WORKDIR /var/www/app/dancer
USER    www-data

CMD      export PERL5LIB=/var/www/app/perl/lib/perl5 && /var/www/app/perl/bin/plackup -I /var/www/app/perl/lib/perl5 -r -R lib -p 5000 bin/app.psgi

EXPOSE  5000
