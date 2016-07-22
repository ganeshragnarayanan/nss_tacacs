# Makefile for libnss-tacacs

#### Start of system configuration section. ####

CC = gcc
INSTALL = install
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644

prefix = ""
exec_prefix = ${prefix}

# Where the installed binary goes.
bindir = ${exec_prefix}/bin
binprefix =

sysconfdir = /etc


#### End of system configuration section. ####

all:	libnss_tacacs 

libnss_tacacs:	libnss_tacacs.c
	${CC} -fPIC -shared -o libnss_tacacs.so.2 -Wl,-soname,libnss_tacacs.so.2 libnss_tacacs.c

install:	
	${INSTALL_DATA} libnss_tacacs.so.2 ${prefix}/lib/x86_64-linux-gnu/
	sudo /sbin/ldconfig -n /lib/x86_64-linux-gnu/ /usr/lib
	sudo /sbin/ldconfig -n /lib /usr/lib

clean:
	rm -f ${prefix}/lib/x86_64-linux-gnu/libnss_tacacs.so.2
	rm libnss_tacacs.so.2


