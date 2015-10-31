obs-ppa:
  pkgrepo.managed:
    - ppa: obsproject/obs-studio

ffmpeg-ppa:
  pkgrepo.managed:
    - ppa: kirillshkrogalev/ffmpeg-next

pkgs:  
  pkg.installed:
    - pkgs:
      - ffmpeg
      - obs-studio 
