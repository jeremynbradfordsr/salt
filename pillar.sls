base:
  'apache*':
    - apache.server
  'oracle*':
    - oracle.pam
    - oracle.ulimit
    - oracle.server
