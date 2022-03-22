use Dotenv; 
Dotenv->load;

my ($action, $arg1, $arg2) = @ARGV;

for ($action) {
    # containers.
    if (/^up$/)      { exec("docker compose up -d && docker compose ps");   }
    if (/^app$/)     { exec("docker compose exec app sh");                  }
    if (/^down$/)    { exec("docker compose down -t 5");                    }
    if (/^logs$/)    { exec("docker compose logs -f");                      }
    if (/^cpanm$/)   { exec("docker compose run --rm cpanm");               }
    if (/^attach$/)  { exec("docker compose exec $arg1 sh");                }
    if (/^restart$/) { exec("docker compose restart && docker compose ps"); }

    # db.
    if (/^db$/)      { exec("docker compose exec db mysql -u$ENV{MYSQL_USER} -p$ENV{MYSQL_PASSWORD}");                                     }
    if (/^db-init$/) { exec("docker compose exec db mysql -uroot -p$ENV{MYSQL_ROOT_PASSWORD} -e  '" . db_init($arg1) . "'");               }
    if (/^migrate$/) { exec("docker compose exec app bash -c 'export PERL5LIB=/var/www/perl/lib/perl5 && perl migration.pl $arg1 $arg2'"); }
}

print "Action not found\n";

sub db_init {
    my $db_sql   = "CREATE DATABASE $_[0] CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;";
    my $db_grant = "GRANT ALL PRIVILEGES ON $_[0].* TO '$ENV{MYSQL_USER}';";

    return $db_sql . $db_grant;
}

__END__
