FROM perl:5.34.0

MAINTAINER AlexP007

# Creating app root directory.
RUN mkdir -p -m 0775 /var/www/app/dancer && chown www-data /var/www/app/dancer && chgrp www-data /var/www/app/dancer

# Downloading dancer with all required modules.
RUN cpanm Dancer2 

RUN cpanm Dancer2::Plugin::Database && cpanm Dancer2::Plugin::Auth::Tiny && cpanm Dancer2::Plugin::BrowserDetect \
 && cpanm Dancer2::Plugin::Deferred && cpanm Dancer2::Plugin::Emailesque && cpanm Dancer2::Session::Cookie

RUN cpanm Data::Dumper && cpanm Template::Alloy && cpanm Plack::Handler::Starman

# Starting application.
USER    www-data
WORKDIR /var/www/app/dancer
CMD     plackup -s Starman -E deployment -p 5000 dancer/bin/app.psgi

EXPOSE 5000