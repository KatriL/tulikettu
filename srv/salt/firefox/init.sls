installation:
  pkg.installed:
    - pkgs:
      - firefox
      - openssh-server

/etc/firefox/syspref.js:
  file.managed:
    - source: salt://firefox/syspref.js

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://firefox/sshd_config
    - template: jinja
    - context:
      port: 8888

sshd:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
