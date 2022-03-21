FROM perl:5.34.1

MAINTAINER AlexP007

# Downloading all required modules.
WORKDIR /var/www
RUN     mkdir -m 0775 perl

CMD     cpanm -L perl --installdeps ./app --with-feature=accelerate --from https://www.cpan.org
