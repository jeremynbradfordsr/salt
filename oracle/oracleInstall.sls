copy Oracle installation archive:
  file.managed:
    - name: /tmp/
    - source: salt://binaries/oracle/linuxx64_12201_database.zip
    - backup: minion

copy Oracle response file:
  file.managed:
    - name: /tmp/
    - source: salt://oracle/dbInstall.rsp
    - backup: minion

unzip Oracle Installation archive:
  archive.extracted:
    - name: /tmp/
    - source: salt://binaries/oracle/linuxx64_12201_database.zip
    - archive_format: zip

oraInstall:
  cmd.run:
    - name: runInstaller -silent -responseFile /tmp/dbInstall.rsp
    - env:
      - PATH: {{ [current_path, '/tmp/database']|join(':') }}
    - runas: oracle
