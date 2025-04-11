#!/bin/bash

# Colors
GREEN='\e[32m'
RED='\e[31m'
YELLOW='\e[33m'
CYAN='\e[36m'
RESET='\e[0m'

# Banner
echo -e "${CYAN}=============================="
echo -e "  WordPress Plugin Version Finder"
echo -e "==============================${RESET}"

# Prompt
read -p "Enter the full URL path to the plugin (e.g., http://example.com/wp-content/plugins/photo-gallery): " PLUGIN_URL

# Check if input is empty
if [[ -z "$PLUGIN_URL" ]]; then
    echo -e "${RED}[-] No URL provided. Exiting.${RESET}"
    exit 1
fi

# Try to fetch readme.txt
echo -e "${YELLOW}[+] Trying to fetch readme.txt...${RESET}"
README=$(curl -s "$PLUGIN_URL/readme.txt")

if [[ -z "$README" ]]; then
    echo -e "${RED}[-] readme.txt not found or not accessible.${RESET}"
else
    echo -e "${GREEN}[+] Found readme.txt content:${RESET}"
    echo "$README" | grep --color=always -iE "stable tag|version" | sed 's/^/   -> /'
    exit 0
fi

# Try to detect plugin main file
echo -e "${YELLOW}[+] Trying to detect plugin main PHP file...${RESET}"
INDEX=$(curl -s "$PLUGIN_URL/")

MAIN_PHP=$(echo "$INDEX" | grep --color=always -oP '(?<=href=")[^"]+\.php(?=")' | head -n 1)

if [[ -z "$MAIN_PHP" ]]; then
    echo -e "${RED}[-] Could not detect main plugin PHP file.${RESET}"
    exit 1
fi

echo -e "${YELLOW}[+] Found possible plugin main file: $MAIN_PHP${RESET}"

PLUGIN_INFO=$(curl -s "$PLUGIN_URL/$MAIN_PHP" | grep -iE "^.*(Plugin Name|Version):")

if [[ -z "$PLUGIN_INFO" ]]; then
    echo -e "${RED}[-] Could not extract version info from PHP file.${RESET}"
else
    echo -e "${GREEN}[+] Plugin Info:${RESET}"
    echo "$PLUGIN_INFO" | sed 's/^/   -> /'
fi
