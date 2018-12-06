-

/etc/security/limits.conf:
  file.append:
   - text:
      - oracle soft nofile 1024
      - oracle hard nofile 65536
      - oracle soft nproc processes 16384
      - oracle hard nproc processes 16384
      - oracle soft stack size 10240
      - oracle soft stack size 32768

system.reboot:
  module.run:
     - onchanges:
           - file: //etc/security/limits.conf
