#!/bin/bash

# Colors
GREEN='\e[32m'
RED='\e[31m'
YELLOW='\e[33m'
CYAN='\e[36m'
RESET='\e[0m'

# Banner
echo -e "${CYAN}"
echo "--------------------------------------------------"
echo "               W P - E N U M . S H                "
echo "       NightFall-Sec Wordpress recon script       "
echo "--------------------------------------------------"
echo -e "${RESET}"

# Getting domain to exploit
read -p "Enter a domain to exploit (e.g., http://example.com) : " DOMAIN

if [ -z "$DOMAIN" ]; then
    echo -e "${RED}[-] No domain entered... Exiting.${RESET}"
    exit 1
fi

# Check if the domain is reachable
echo -e "${YELLOW}[~] Checking domain...${RESET}"
HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" "$DOMAIN")

if [ "$HTTP_STATUS" != "200" ]; then
    echo -e "${RED}[-] The domain is not responding correctly (HTTP $HTTP_STATUS).${RESET}"
    exit 1
fi

# Start enumeration
echo -e "\n${YELLOW}---------------- WP ENUM ----------------${RESET}"
echo -e "${GREEN}[+] Domain:${RESET} $DOMAIN"
echo -e "${GREEN}[+] Starting enumeration...${RESET}\n"

# WordPress version detection via <meta name="generator">
echo -e "${CYAN}[*] WordPress Version Detection:${RESET}"
curl -s "$DOMAIN" | grep --color=always -i '<meta name="generator"' | tee /tmp/wp-version.txt
if [ ! -s /tmp/wp-version.txt ]; then
    echo -e "${YELLOW}[!] No version info found via <meta> tag.${RESET}"
fi

# Search for wp-content, plugins, themes
echo -e "\n${CYAN}[*] Looking for PLUGINS & THEMES :${RESET}"
curl -s "$DOMAIN" | grep --color=always -Eo "wp-content/(plugins|themes)/[a-zA-Z0-9_-]+" | sort -u | while read line; do
    echo -e "${GREEN}[+] Found: $line${RESET}"
done

echo -e "\n"
curl -s -X GET $DOMAIN | sed 's/href=/\n/g' | sed 's/src=/\n/g' | grep --color=always 'wp-content/plugins/*' | cut -d"'" -f2 | sort -u | while read line; do 
    echo -e "${GREEN}[+] Found : $line${RESET}"
done

# Check for readme.html (sometimes reveals WP version)
echo -e "\n${CYAN}[*] Checking for readme.html:${RESET}"

README=$(curl -o /dev/null -s -w "%{http_code}\n" "$DOMAIN/README.html")

if [ "$README" != "200" ]; then
    echo -e "${RED}[-] Readme file not found."
elif [ "$README" == "200" ]; then
    echo -e "${GREEN}[+] License file founded => $README/license.txt ${RESET}"
fi

# Check for license.txt (sometimes reveals WP version)
echo -e "\n${CYAN}[*] Checking for license.txt:${RESET}"
LICENSE=$(curl -o /dev/null -s -w "%{http_code}\n" "$DOMAIN/license.txt")

if [ "$LICENSE" != "200" ]; then
    echo -e "${RED}[-] License file not found."
elif [ "$LICENSE" == "200" ]; then
    echo -e "${GREEN}[+] License file founded => $DOMAIN/license.txt ${RESET}"
fi

#checking for user list
echo -e "\n${CYAN} Checking for users : ${RESET}"
curl $DOMAIN/wp-json/wp/v2/users

echo -e "\n"



# End of enumeration
echo -e "\n${GREEN}[✓] Enumeration complete.${RESET}"
