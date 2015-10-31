stack-ppa:
  pkgrepo.managed:
    - humanname: FP Complete PPA
    - name: deb http://download.fpcomplete.com/ubuntu/trusty stable main
    - dist: stable 
    - file: /etc/apt/sources.list.d/fp-compelete.list
    - key_url: https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key
    - require_in:
      - pkg: stack

stack: 
  pkg.installed:
    - pkgs:
      - stack
