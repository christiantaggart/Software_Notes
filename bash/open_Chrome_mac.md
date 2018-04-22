### Open chrome browser:

- Example Use:
  - $`chrome gh` opens chrome to your Github Page
  - $`chrome gm` Opens gmail
  - $`chrome lh 8080` Launches chrome to localhost:8080 (or what ever port number specified with a space after lh
  - $`chrome` launches chrome to your home page

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
