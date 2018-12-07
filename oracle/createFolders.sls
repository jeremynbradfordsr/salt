/u01/:
  file.directory:
    - user: oracle
    - group: oinstall
    - mode: 755
    - makedirs: True


 /u01/oradata:
  file.directory:
    - user: oracle
    - group: oinstall
    - mode: 755
    - makedirs: True
    
 /u01/oradata/rcv_area:
  file.directory:
    - user: oracle
    - group: oinstall
    - mode: 755
    - makedirs: True
