my ($helper) = @ARGV;

SWITCH: for ($helper) {
    if (/up/)    { exec('docker compose up -d');     last SWITCH; }
    if (/down/)  { exec('docker compose down -t 5'); last SWITCH; }
    if (/logs/)  { exec('docker compose logs -f');   last SWITCH; }
}