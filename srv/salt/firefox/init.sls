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

/etc/ufw/user.rules:
  file.managed:
    - source: salt://firefox/user.rules

/etc/ufw/user6.rules:
  file.managed:
    - source: salt://firefox/user6.rules

/etc/ufw/ufw.conf:
  file.managed:
    - source: salt://firefox/ufw.conf

sshd ja ufw:
  service.running:
    - name: ssh
    - name: ufw
    - watch:
      - file: /etc/ssh/sshd_config
      - file: /etc/ufw/user.rules
      - file: /etc/ufw/user6.rules
      - file: /etc/ufw/ufw.conf
