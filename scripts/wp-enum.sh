#!/bin/bash

#Author : Yekuuun

# Colors
GREEN='\e[32m'
RED='\e[31m'
YELLOW='\e[33m'
CYAN='\e[36m'
RESET='\e[0m'

read -p "Enter the domain to exploit using wpscan : " DOMAIN

if [ -z "$DOMAIN" ]; then
    echo -e "${RED}[-] No domain entered... Exiting.${RESET}"
    exit 1
fi

wpscan --url "$DOMAIN" --enumerate # consider using --api-token <token>