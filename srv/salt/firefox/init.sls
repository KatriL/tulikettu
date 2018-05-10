installation:
  pkg.installed:
    - pkgs:
      - firefox
      - openssh-server
      - gimp

/etc/firefox/syspref.js:
  file.managed:
    - source: salt://firefox/syspref.js

/etc/ufw/user.rules:
  file.managed:
    - source: salt://firefox/user.rules

/etc/ufw/user6.rules:
  file.managed:
    - source: salt://firefox/user6.rules

/etc/ufw/ufw.conf:
  file.managed:
    - source: salt://firefox/ufw.conf

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://firefox/sshd_config
    - template: jinja
    - context:
      port: 8888

sshd ja ufw:
  service.running:
    - name: ufw
    - name: sshd
    - watch:
      - file: /etc/ufw/user.rules
      - file: /etc/ufw/user6.rules
      - file: /etc/ufw/ufw.conf
      - file: /etc/ssh/sshd_config
