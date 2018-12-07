-

/etc/security/limits.conf:
  file.append:
   - text:
      - oracle soft nofile 1024
      - oracle hard nofile 65536
      - oracle soft nproc 16384
      - oracle hard nproc 16384
      - oracle soft stack 10240
      - oracle soft stack 32768

system.reboot:
  module.run:
     - onchanges:
           - file: //etc/security/limits.conf
