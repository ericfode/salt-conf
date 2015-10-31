installer:
  cmd.run:
  - name: |
       curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --channel=beta --yes --save
  - shell: /bin/zsh
  - user: {{ pillar['user'] }}