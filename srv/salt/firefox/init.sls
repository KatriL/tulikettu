pkgs.installed:
  - firefox
  - ssh

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://ssh/sshd_config
    - template: jinja
    - context:
      port: 8888

sshd:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
