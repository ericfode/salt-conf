backup:
  file.copy:
    - name: /etc/X11/xorg.conf
    - source: /etc/X11/xorg.conf
    - target: /etc/X11/xorg.conf.BAK

driver:
  pkg.installed:
    - pkgs:
      - fglrx
      - xvba-va-driver
      - libva-glx1
      - libva-egl1
      - vainfo

