synapse_code_ppa:
  pkgrepo.managed:
    - ppa: synapse-core/testing

xmonad_packages:
  pkg.installed:
  - pkgs:
    - xmonad
    - libghc-xmonad-dev
    - libghc-xmonad-contrib-dev
    - xmobar
    - xcompmgr
    - nitrogen
    - stalonetray
    - moreutils
    - synapse
    - consolekit
    - ssh-askpass-gnome
    - thunar
    - terminator
    - remmina

xmonad-easy-repo:
  git.latest:
    - name: git://github.com/davidbrewer/xmonad-ubuntu-conf.git
    - target: {{pillar['home']}}/.xmonad
    - user: {{pillar['user']}}

copy-xmonad-destop:
  file.copy:
    - name: /usr/share/xsessions/xmonad.desktop
    - source: {{pillar['home']}}/.xmonad/xmonad.desktop

copy-image-badge:
  file.copy:
    - name: /usr/share/unity-greeter
    - source: {{pillar['home']}}/.xmonad/images/custom_xmonad_badge.png

fix-gtkrc:
   file.symlink:
     - name: {{pillar['home']}}/.gtkrc-2.0
     - target: {{pillar['home']}}/.xmonad/.gtkrc-2.0
     - user: {{pillar['user']}}