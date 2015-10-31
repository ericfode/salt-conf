chruby:
  git.latest:
    - name: https://github.com/postmodern/chruby
    - target: {{ pillar['home'] }}/src/chruby
    - user: {{ pillar['user'] }}

  cmd.run:
    - name: |
        ./scripts/setup.sh
    - cwd: {{ pillar['home'] }}/src/chruby
    - shell: /bin/zsh

  file.append:
    - name: {{pillar['home']}}/.zshrc
    - text: source /usr/local/share/chruby/chruby.sh

ruby-install:
  git.latest:
    - name: https://github.com/postmodern/ruby-install.git
    - target: {{ pillar['home'] }}/src/ruby-install
    - user:   {{ pillar['user'] }}

  cmd.run:
    - name: make install
    - cwd: {{ pillar['home'] }}/src/ruby-install

install-rubies:
  cmd.run:
    - name: |
        ruby-install ruby --no-reinstall