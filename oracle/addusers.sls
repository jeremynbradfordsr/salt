


oracle:
  user.present:
    - fullname: Oracle User
    - shell: /bin/zsh
    - home: /home/oracle
    - uid: 4000
    - gid: 4000
    
grid:
  user.present:
    - fullname: Oracle Grid
    - shell: /bin/zsh
    - home: /home/oracle
    - uid: 4001
    - gid: 4001

oinstall:
  group.present:
    - gid: 7648
    - system: False
    - addusers:
      - oracle
      - grid

racdbs:
  group.present:
    - gid: 7649
    - system: False
    - addusers:
      - grid
      - oracle

dba:
  group.present:
    - gid: 7649
    - system: False
    - addusers:
      - oracle
      - racdbs
 
 run_installer:
  cmd.run:
    - name: usermod -g oinstall oracle
 
