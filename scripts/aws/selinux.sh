#!/bin/bash
cat <<END > /etc/sysconfig/selinux
SELINUX=permissive
SELINUXTYPE=targeted
END
