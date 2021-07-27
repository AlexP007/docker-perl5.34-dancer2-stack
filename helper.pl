my ($action) = @ARGV;

for ($action) {
    if (/up/)    { exec('docker compose up -d');     }
    if (/down/)  { exec('docker compose down -t 5'); }
    if (/logs/)  { exec('docker compose logs -f');   }
}