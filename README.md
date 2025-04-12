```Bash
          ___       __   ________  _______   ________   ___  ___  _____ ______      
         |\  \     |\  \|\   __  \|\  ___ \ |\   ___  \|\  \|\  \|\   _ \  _   \    
         \ \  \    \ \  \ \  \|\  \ \   __/|\ \  \\ \  \ \  \\\  \ \  \\\__\ \  \   
          \ \  \  __\ \  \ \   ____\ \  \_|/_\ \  \\ \  \ \  \\\  \ \  \\|__| \  \  
           \ \  \|\__\_\  \ \  \___|\ \  \_|\ \ \  \\ \  \ \  \\\  \ \  \    \ \  \ 
            \ \____________\ \__\    \ \_______\ \__\\ \__\ \_______\ \__\    \ \__\
             \|____________|\|__|     \|_______|\|__| \|__|\|_______|\|__|     \|__|

                              ----- WordPress Enumeration Tool -----


```

**WpEnum** is a base repo containing scripts & tricks for WP enumeration. It automates the process of gathering useful information about a target WordPress site, including its version, users, plugins, themes, and more. Perfect for penetration testing and security assessments.

---

## Base scan features

- **WordPress Version Detection**: Extracts the version of WordPress from `<meta name="generator">` and other sources.
- **User Enumeration**: Attempts to find WordPress users via the `/author/` URL parameter.
- **Plugin & Theme Detection**: Scans the site for common WordPress plugin and theme names by analyzing the HTML.
- **Readme Check**: Looks for a `readme.html` file which may contain the WordPress version.
- **License Check**: Looks for a `license.txt` file which may contain the WordPress version.

- **More informations for a plugin :** => Consider using `plugin-version.sh`

---

### Running it

**Run the script by following these simple steps:**

1. Clone this repository or download the script.
2. Make the script executable:

    ```bash
    chmod +x scan.sh
    ```

3. Execute the script with:

    ```bash
    ./scan.sh
    ```

4. Enter the domain of the WordPress site you'd like to enumerate when prompted.

### Output

<img src="https://github.com/NightFall-Security/WpEnum/blob/main/assets/scan.png" alt="DebugInfo" />

---

## WPScan

Base notes about WPScan. WPScan is powerfull wordpress vulnerability scanner. Consider using it for more efficienty.

<a href="https://github.com/wpscanteam/wpscan" target="blank">More informations ?</a>

### Installation : 

`sudo apt-get update`

`sudo gem install wpscan`

Once the installation completes, you can issue a command such as `wpscan --hh` to verify the installation. This command will show you the usage menu with all of the available command-line switches.

for more details : consider consulting `wpscan official repo` at <a href="https://github.com/wpscanteam/wpscan/blob/master/README.md" target="blank">official README</a>

>[!Warning]
>Consider getting an access token for more options & deeper scans.

`wp-enum.sh` use a simple recon & enumeration scan. `wp-enum-vp` use a simple recon + vulnerable plugins => do not forget to update the file & set your API_TOKEN


**Where can I grab my API token ?** 

Juste create an account on WpScan & you'll get your API TOKEN <a href="https://wpscan.com/register/" target="blank">Create my account</a>

### Cheatsheet :

```Bash

basic :
wpscan --url http://example.com --enumerate

verbose :
wpscan --url http://example.com --verbose

enum plugins :
wpscan --url http://example.com --enumerate p

enum users :
wpscan --url http://example.com --enumerate u

enum themes :
wpscan --url http://example.com --enumerate t

plugins vulns :
wpscan --url http://example.com --plugins-detection aggressive --enumerate p
wpscan --url http://example.com --enumerate vp

user password brute forcing :
wpscan --password-attack xmlrpc -t 20 -U <user> -P <path_to_wordlist> --url http://83.136.252.66:50942
```

**do not forget to add your api token with :** `--api-token YOUR_API_TOKEN`

>[!Important]
>be carefull using brute force method. I recommend using other techniques instead of trying brute force request who may causing being flagged => this was used during my HTB wordpress chapter so i put it here. 
