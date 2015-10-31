zsh:
  pkg.installed:
    - pkgs:
      - zsh

  git.latest:
    - name: git://github.com/robbyrussell/oh-my-zsh.git
    - target: {{ pillar['home'] }}/.oh-my-zsh
    - user: {{ pillar['user'] }}
 
  file.copy:
    - name: {{ pillar['home'] }}/.zshrc
    - source: {{ pillar['home'] }}/.oh-my-zsh/templates/zshrc.zsh-template
    - user: {{ pillar['user'] }}
    - group: {{ pillar['user'] }} 