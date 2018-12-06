Set pam session auth:
  file.replace:
    - name: /etc/pam.d/login
    - pattern: ^session include system-auth .*
    - repl: session include system-auth
    - append_if_not_found: True

    Set pam session required:
      file.replace:
        - name: /etc/pam.d/system-auth
        - pattern: ^session required pam_limits.so .*
        - repl: session required pam_limits.so
        - append_if_not_found: True
