# Open Chrome browser on MacOS via Command Line

Add the Bash Function below to your Run Commands file if bash: `.bashrc` or if ZShell `.zrc`

- _**Remeber to refresh your CLI to use**_
  - for bash:`source ~/.bashrc`
  - for Zshell `source ~/.zrc`

```sh
# Open Chrome to ENDPOINT # Open Chrome to ENDPOINT # Open Chrome to ENDPOINT # Open Chrome to ENDPOINT
chrome () {
  if [ $1 = gh  ];   then # if lh launch chrome @ my github
    /usr/bin/open -a "/Applications/Google Chrome.app" 'https://github.com/YOUR_GITHUB_USERNAME'

  elif [ $1 = gm  ];   then # if gm launch chrome @ gmail
    /usr/bin/open -a "/Applications/Google Chrome.app" 'https://mail.google.com/mail/u/0/#inbox'

  elif [ $1 = lh  ];   then  # if lh launch chrome @ desired port
    /usr/bin/open -a "/Applications/Google Chrome.app" 'http://localhost:'${2}

  else # if nothing has been entered launch chrome @ google.com
    /usr/bin/open -a "/Applications/Google Chrome.app" 'https://www.google.com/'
  fi
}
# -------------------- END CHROME ----------
```

- **Invocation Example Use:**
  - $`chrome` launches chrome to your home page
  - $`chrome gh` opens chrome to your Github Page
  - $`chrome gm` Opens gmail
  - $`chrome lh <desired_port_number>`Launches chrome to localhost:<desired_port_number>
    - Example: $`chrome lh 8080` Opens chrome to localhost:8080