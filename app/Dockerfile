FROM perl:5.34.1

MAINTAINER AlexP007

ARG USER=www-data

ARG ROOT=/var/www
ARG APP=$ROOT/app
ARG PERL=/var/www/perl
ARG PERL5LIB=PERL5LIB=$PERL/lib/perl5

# Creating app root directory.
RUN     mkdir -p -m 0775 $APP && chown $USER $APP && chgrp $USER $APP

# Starting application.
WORKDIR $APP
USER    $USER

CMD     export $PERL5LIB && $PERL/bin/plackup -I $PERL5LIB -r -R lib -p 5000 bin/app.psgi

EXPOSE  5000
