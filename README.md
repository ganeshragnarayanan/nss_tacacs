- do make, "sudo make install"

- create a local user tacacs_user using useradd

- copy the file libnss-tacacs.conf to /etc/libnss-tacacs.conf 

- edit the /etc/nsswitch.conf to look like below for the passwd line:

passwd:         files tacacs

- edit /etc/pam.d/sshd to look like below:

# PAM configuration for the Secure Shell service

auth       [success=2 default=ignore]     /usr/local/lib/security/pam_tacplus.so debug server=192.168.9.131 secret=tac_test
# Standard Un*x authentication.
 @include common-auth
 
 
Reference:
https://github.com/donapieppo/libnss-ato

