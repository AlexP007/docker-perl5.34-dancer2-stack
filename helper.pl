my ($action, $arg1) = @ARGV;

for ($action) {
    if (/up/)      { exec("docker compose up -d");           }
    if (/down/)    { exec("docker compose down -t 5");       }
    if (/logs/)    { exec("docker compose logs -f");         }
    if (/attach/)  { exec("docker compose exec $arg1 sh");   }
    if (/restart/)  { exec("docker compose restart");        }
}

print 'Action not found';