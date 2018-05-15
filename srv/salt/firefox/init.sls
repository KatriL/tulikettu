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

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://firefox/sshd_config
    - template: jinja
    - context:
      port: 8888

sshd:
  service.running:
    - name: sshd
    - watch:
      - file: /etc/ssh/sshd_config

start ufw:
  cmd.run:
    - name: "ufw --force enable"

ufw:
  service.running:
    - name: ufw
    - watch:
      - file: /etc/ufw/user.rules
      - file: /etc/ufw/user6.rules
