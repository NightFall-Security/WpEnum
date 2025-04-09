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


**WpEnum** is a simple and efficient CLI tool designed for enumerating WordPress installations. It automates the process of gathering useful information about a target WordPress site, including its version, users, plugins, themes, and more. Perfect for penetration testing and security assessments.

---

## Features

- **WordPress Version Detection**: Extracts the version of WordPress from `<meta name="generator">` and other sources.
- **User Enumeration**: Attempts to find WordPress users via the `/author/` URL parameter.
- **Plugin & Theme Detection**: Scans the site for common WordPress plugin and theme names by analyzing the HTML.
- **Readme Check**: Looks for a `readme.html` file which may contain the WordPress version.

---

## Usage

**Run the script by following these simple steps:**

1. Clone this repository or download the script.
2. Make the script executable:

    ```bash
    chmod +x wp-enum.sh
    ```

3. Execute the script with:

    ```bash
    ./wp-enum.sh
    ```

4. Enter the domain of the WordPress site you'd like to enumerate when prompted.

---

## Example Output

