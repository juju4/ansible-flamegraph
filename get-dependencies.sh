#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

#[ ! -d $rolesdir/juju4.redhat-epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat-epel
[ ! -d $rolesdir/geerlingguy.java ] && git clone https://github.com/juju4/ansible-role-java.git $rolesdir/geerlingguy.java
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.flamegraph ] && ln -s ansible-flamegraph $rolesdir/juju4.flamegraph
[ ! -e $rolesdir/juju4.flamegraph ] && cp -R $rolesdir/ansible-flamegraph $rolesdir/juju4.flamegraph

## don't stop build on this script return code
true
