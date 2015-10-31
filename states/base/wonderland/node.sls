nodejs.ppa.deps:
  pkg.installed:
    - name: apt-transport-https

nodejs.ppa.ppa:
  pkgrepo.managed:
    - name: deb https://deb.nodesource.com/node_0.12 stable main
    - dist: {{ grains['oscodename'] }}
    - file: /etc/apt/sources.list.d/nodesource.list
    - keyid: "68576280"
    - key_url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
    - keyserver: keyserver.ubuntu.com

nodejs-pkg:
  pkg.installed:
    - name: nodejs
    - reload_modules: true