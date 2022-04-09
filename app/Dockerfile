FROM perl:5.34.1

MAINTAINER AlexP007

ARG USER=www-data
ARG ROOT=/var/www
ARG APP=$ROOT/app

# Creating app root directory.
RUN     mkdir -p -m 0775 $APP && chown $USER $APP && chgrp $USER $APP

# Starting application.
WORKDIR $APP
USER    $USER

CMD     export PERL5LIB=/var/www/perl/lib/perl5 && /var/www/perl/bin/plackup -I /var/www/perl/lib/perl5 -r -R lib -s Starman --workers=8 -p 5000 bin/app.psgi

EXPOSE  5000
