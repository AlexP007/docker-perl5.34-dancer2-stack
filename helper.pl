use Dotenv; 
Dotenv->load;

my ($action, $arg1, $arg2) = @ARGV;

for ($action) {
    # containers.
    if (/up/)      { exec("docker compose up -d && docker compose ps");   }
    if (/app/)     { exec("docker compose exec app sh");                  }
    if (/down/)    { exec("docker compose down -t 5");                    }
    if (/logs/)    { exec("docker compose logs -f");                      }
    if (/cpanm/)   { exec("docker compose run --rm cpanm");               }
    if (/attach/)  { exec("docker compose exec $arg1 sh");                }
    if (/restart/) { exec("docker compose restart && docker compose ps"); }

    # db.
    if (/db/)      { exec("docker compose exec db mysql -u$ENV{MYSQL_USER} -p$ENV{MYSQL_PASSWORD}"); }
    if (/migrate/) { exec("docker compose exec app bash -c 'export PERL5LIB=/var/www/app/perl/lib/perl5 && perl migration.pl $arg1 $arg2'"); }
}

print "Action not found\n";

__END__
