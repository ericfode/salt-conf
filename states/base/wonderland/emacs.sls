emacssrc24:
  git.latest:
    - name: git://git.sv.gnu.org/emacs.git
    - opts: "--depth 1"
    - user: {{ pillar['user'] }}
    - target: {{ pillar['home'] }}/src/emacs

emacs_build_deps:
  pkg.installed:
    - pkgs:
        - autoconf
        - automake
        - libtool
        - texinfo
        - build-essential
        - xorg-dev
        - libgtk2.0-dev
        - libjpeg-dev
        - libncurses5-dev
        - libdbus-1-dev
        - libgif-dev
        - libtiff-dev
        - libm17n-dev
        - libpng12-dev
        - librsvg2-dev
        - libotf-dev
        - libxml2-dev

build-emacs:
  cmd.run:
    - name: |
        ./autogen.sh
        ./configure
        make bootstrap
        make install
    - cwd: {{ pillar['home'] }}/src/emacs
    - shell: /bin/zsh
    - creates: /usr/local/bin/emacs
    
spacemacs:  
  git.latest:
    - name: https://github.com/syl20bnr/spacemacs.git
    - submodules: True
    - user: {{ pillar['user']}}
    - target: {{ pillar['home'] }}/.emacs.d

  file.managed:
   - name: {{ pillar['home'] }}/.spacemacs
   - source: salt://files/wonderland/spacemacs.template 
   - user: {{ pillar['user'] }}
   - group: {{ pillar['user'] }}    
