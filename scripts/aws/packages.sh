#!/bin/bash
yum -y install NetworkManager audit audispd-plugins bzip2 deltarpm gcc cpp perl authconfig kernel-devel kernel-headers make  nfs-utils ntp openssh-clients unzip vim-minimal xz ruby grub2-tools gdisk kpartx parted python2-pip python-virtualenv
mkdir -p /opt/ec2
cat <<END > /etc/profile.d/ec2-tools.sh
export PATH=\$PATH:/opt/ec2/bin
export EC2_AMITOOL_HOME=/opt/ec2
END
chmod 0755 /etc/profile.d/ec2-tools.sh

( cd /var/tmp && curl -L -O http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.zip && unzip ec2-ami-tools.zip -d /opt/ec2 )

