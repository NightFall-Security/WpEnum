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

---

## WPScan

Base notes about WPScan. WPScan is powerfull wordpress vulnerability scanner. Consider using it for more efficienty.

**More informations ?**

<a href="https://github.com/wpscanteam/wpscan" target="blank">WPScan</a>

### Installation : 

`sudo apt-get update`

`sudo gem install wpscan`

Once the installation completes, you can issue a command such as wpscan --hh` to verify the installation. This command will show you the usage menu with all of the available command-line switches.

for more details : => consider consulting `wpscan.sh`
