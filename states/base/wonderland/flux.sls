flux-ppa:
  pkgrepo.managed:
    - humanname: Kilian Flux ppa
    - ppa: kilian/f.lux

fluxgui:
  pkg.installed:
    - pkgs:
      - fluxgui

xflux:
  file.managed:
    - name: /usr/local/bin/xflux
    - source: salt://files/wonderland/xflux
    - user: {{pillar['user']}}
    - group: {{pillar['user']}}
