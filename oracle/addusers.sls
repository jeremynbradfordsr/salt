


oracle:
  user.present:
    - fullname: Oracle User
    - shell: /bin/zsh
    - home: /home/oracle
    - uid: 4000
    - gid: 4000
    
oinstall:
  group.present:
    - gid: 7648
    - system: False
    - addusers:
      - oracle
      - grid

racdbs:
  group.present:
    - gid: 7659
    - system: False
    - addusers:
      - grid
      - oracle

dba:
  group.present:
    - gid: 7679
    - system: False
    - addusers:
      - oracle

osoper:
  group.present:
    - gid: 7689
    - system: False
    - addusers:
      - oracle
     
 
 Assign oracle pre-install primary group:
  cmd.run:
    - name: usermod -g oinstall oracle
 
