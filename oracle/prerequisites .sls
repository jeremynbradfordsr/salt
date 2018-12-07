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
   
/home/oracle/.bash_profile:
  file.append:
    - text:
      - umask 022
      
oracle:
 pkg.latest:
   - pkgs:
     - bind-libs
     - bind-utils
     - compat-libcap1
     - compat-libstdc++-33
     - glibc-devel
     - glibc-headers
     - gssproxy
     - kernel-headers
     - keyutils
     - ksh
     - libICE
     - libSM
     - libX11
     - libX11-common
     - libXau
     - libXext
     - clibXext
     - libXi
     - libXinerama
     - libXmu
     - libXrandr
     - libXrender
     - libXt
     - libXtst
     - libXv
     - libXxf86dga
     - libXxf86misc
     - libXxf86vm
     - libaio-devel
     - libbasicobjects
     - libcollection
     - libdmx
     - libevent
     - libini_config
     - libnfsidmap
     - libpath_utils
     - libref_array
     - libstdc++-devel
     - libtirpc
     - libverto-libevent
     - libxcb
     - lm_sensors-libs
     - mailx
     - nfs-utils
     - psmisc
     - quota
     - quota-nls
     - rpcbind
     - smartmontools
     - sysstat
     - tcp_wrappers
     - unzip

disabled:
    selinux.mode
