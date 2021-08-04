use Dotenv; 
Dotenv->load;

my ($action, $arg1) = @ARGV;

for ($action) {
    # containers.
    if (/up/)      { exec("docker compose up -d");         }
    if (/down/)    { exec("docker compose down -t 5");     }
    if (/logs/)    { exec("docker compose logs -f");       }
    if (/cpanm/)   { exec("docker compose run cpanm");     }
    if (/attach/)  { exec("docker compose exec $arg1 sh"); }
    if (/restart/) { exec("docker compose restart");       }

    # db.
    if (/db/)      { exec("docker compose exec db mysql -u$ENV{MYSQL_USER} -p$ENV{MYSQL_PASSWORD}"); }
}

print 'Action not found';

__END__
