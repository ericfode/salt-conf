lein_repo:
  git.latest:
    - name: https://github.com/technomancy/leiningen.git
    - target: /usr/src/leiningen
    - rev: stable

boot:
  file.managed:
    - name: /usr/local/bin/boot
    - mode: 775
    - source: https://github.com/boot-clj/boot/releases/download/2.2.0/boot.sh
    - source_hash: sha256=2e7d9c501ba3e59ae9f23ce21a8a9f8d24177a346238ee3710f7dd0adbddea33

lein_config:
  file.managed:
    - name: {{pillar['home']}}/.lein/profiles.clj
    - source: salt://files/wonderland/lein.profile.clj.template
    - template: jinja
    - user: {{ pillar['user'] }}
    - group: {{ pillar['user'] }}
    - context:
      cider_nrepl_version: {{pillar['cider_nrepl_version']}}
      refactor_nrepl_version: {{ pillar['refactor_nrepl_version']}}
      nrepl_tools_version:  {{pillar['nrepl_tools_version']}}

boot_config_dir:
  file.directory:
    - name: {{pillar['home']}}/.boot
    - user: {{pillar['user']}}
    - group: {{pillar['user']}}

boot_config:
  file.managed:
    - name: {{pillar['home']}}/.boot/profile.boot
    - source: salt://files/wonderland/boot.profile.boot.template
    - template: jinja
    - user: {{pillar['user']}}
    - group: {{ pillar['user'] }}
    - context:
      cider_nrepl_version: {{pillar['cider_nrepl_version']}}
      refactor_nrepl_version: {{ pillar['refactor_nrepl_version']}}
      nrepl_tools_version:  {{pillar['nrepl_tools_version']}}

lein_bin:
  cmd.run:
    - name: cp /usr/src/leiningen/bin/lein /usr/bin/lein
    - require:
      - git: lein_repo
