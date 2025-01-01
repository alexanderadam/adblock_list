#!/bin/bash

FILENAME=${1:-"alexanderadam.txt"}
HOSTS_FILE="hosts.md"
start_time=$(date +%s)

current_time() {
  date +"%H:%M:%S"
}

blocklists=("abuse" "vaping" "torrent" "scam" "ransomware" "porn" "piracy" "phishing" "malware" "fraud" "drugs")
blocklists_count=${#blocklists[@]}

echo -e "📥 \e[34m[\e[90m$(current_time)\e[34m] Downloading $blocklists_count blocklists\e[0m"

for list in "${blocklists[@]}"; do
  wget -q "https://blocklistproject.github.io/Lists/${list}.txt" -O "${list}.txt" &
done
wait

echo -e "✅ \e[32m[\e[90m$(current_time)\e[32m] Blocklists downloaded\e[0m"

# Combine blocklists into one file
echo -e "🔄 \e[34m[\e[90m$(current_time)\e[34m] Combining blocklists\e[0m"
grep -hv '^#' *.txt | awk '{print $2}' | sort -u > combined_blocklist.txt
blocked=("romhustler.org" "romsfun.com" "custom-roms.com" "tarnkappe.info" "pirate-bays.net" "1337x.to" "1377x.to" "4kfilme.de" "limetorrentx.cc" "speedtorrent.com" "torrentgalaxy.mx" "ebookee.com" "dnoid.pw" "dnoid.to" "torrenting.com" "turkhacks.com" "tgx.rs" "tgx.sb" "ummn.nu" "cript.to" "gamulator.com" "ibooks.to" "emuparadise.me" "thepirate-bay.org" "wowroms.com" "consoleroms.com" "sanet.lc" "softarchive.is" "uptodown.com" "freetutsdownload.com" "demonoid.is" "apkpure.com" "apkmirror.com" "apklinker.com" "apkcombo.com")
printf "%s\n" "${blocked[@]}" >> combined_blocklist.txt
sort -u combined_blocklist.txt -o combined_blocklist.txt
echo -e "✅ \e[32m[\e[90m$(current_time)\e[32m] Blocklists combined\e[0m"

save_domain_entry() {
  local domain=$1
  local rule_count=$2
  local count=$3
  local total_domains=$4
  local unicode_domain=$(idn --idna-to-unicode "$domain")
  local favicon_url="https://icons.duckduckgo.com/ip3/${domain}.ico"
  if wget -q --spider "$favicon_url"; then
    echo "- <img src=\"${favicon_url}\" width=\"16\" loading=\"lazy\" />&nbsp;${unicode_domain} (${rule_count})" >> "$HOSTS_FILE"
  else
    echo "- 🌐&nbsp;${unicode_domain} (${rule_count})" >> "$HOSTS_FILE"
  fi
  echo -e "🔍 \e[35m[\e[90m$(current_time)\e[35m] $count / $total_domains - \e[34m\e[4m${unicode_domain}\e[0m\e[0m"
}

# Extract affected hosts and filter against blocklist
echo -e "🔍 \e[34m[\e[90m$(current_time)\e[34m] Extracting and filtering affected hosts\e[0m"

affected_hosts=()
domains=$(grep -oP '^[^#]+(?=##)' "${FILENAME}" | sort -u | grep -E '^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
total_domains=$(echo "$domains" | wc -l)

echo -e "✅ \e[32m[\e[90m$(current_time)\e[32m] $total_domains domains extracted\e[0m"
echo -e "# Affected hosts ($total_domains)\n\n" > "$HOSTS_FILE"

count=0

for domain in $domains; do
  count=$((count + 1))
  if ! grep -q "^${domain}$" combined_blocklist.txt; then
    rule_count=$(grep -c "^${domain}##" "${FILENAME}")
    save_domain_entry "$domain" "$rule_count" "$count" "$total_domains"
    affected_hosts+=("$domain")
  fi
done

affected_hosts_count=${#affected_hosts[@]}
echo -e "✅ \e[32m[\e[90m$(current_time)\e[32m] $affected_hosts_count affected hosts processed\e[0m"

# Clean up
rm -f combined_blocklist.txt
for list in "${blocklists[@]}"; do
  rm -f "${list}.txt"
done

end_time=$(date +%s)
duration=$((end_time - start_time))
echo -e "✅ \e[32m[\e[90m$(current_time)\e[32m] $HOSTS_FILE updated in $duration seconds\e[0m"
