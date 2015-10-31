chrome:
  pkgrepo.managed:
    - humanname: Chrome PPA
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - dist: stable 
    - file: /etc/apt/sources.list.d/google-chrome.list
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
    - require_in:
      - pkg: chrome

  pkg.installed:
    - pkgs:
      - google-chrome-stable
