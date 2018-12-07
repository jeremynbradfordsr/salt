run orainstRoot
  cmd.run:
    - name: /u01/app/oraInventory/orainstRoot.sh
    
run root.sh :
  cmd.run:
    - name: /u01/app/oracle/product/12.2.0/dbhome_1/root.sh
    
/home/oracle/.bash_profile:
  file.append:
    - text:
      - umask 022
      - export ORACLE_HOME=/u01/app/oracle/product/12.2.0/dbhome_1
      - export ORACLE_BASE=/u01/app/oracle
      - PATH=$PATH:$HOME/bin:$ORACLE_HOME/bin
      - export PATH
      
