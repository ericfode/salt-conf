automata:
  git.latest:
    - name: git@github.com:ericfode/automata.git
    - target: {{ pillar['home'] }}/projects/autmoata
    - user: {{pillar['user'] }}