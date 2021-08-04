FROM perl:5.34.0

MAINTAINER AlexP007

# Downloading all required modules.
WORKDIR /var/www/app/
RUN     mkdir -m 0775 perl

CMD     cpanm -L perl --installdeps ./dancer --with-feature=accelerate