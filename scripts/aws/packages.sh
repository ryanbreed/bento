#!/bin/bash
yum -y install NetworkManager audit audispd-plugins bzip2 deltarpm gcc cpp perl authconfig kernel-devel kernel-headers make  nfs-utils ntp openssh-clients unzip vim-minimal xz ruby grub2-tools
yum -y install http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.noarch.rpm

echo "rewriting amitools binstubs"

cat <<END > /usr/bin/ec2-bundle-vol
#!/bin/bash
export RUBYLIB=\$RUBYLIB:/usr/lib/ruby/site_ruby:/usr/lib64/ruby/site_ruby
ruby /usr/lib/ruby/site_ruby/ec2/amitools/bundlevol.rb \$*
END

chmod 755 /usr/bin/ec2-bundle-vol
rm -f /usr/local/bin/ec2-bundle-vol

cat <<END > /usr/bin/ec2-upload-bundle
#!/bin/bash
export RUBYLIB=\$RUBYLIB:/usr/lib/ruby/site_ruby:/usr/lib64/ruby/site_ruby
ruby /usr/lib/ruby/site_ruby/ec2/amitools/uploadbundle.rb \$*
END

chmod 755 /usr/bin/ec2-upload-bundle
rm -f /usr/local/bin/ec2-upload-bundle



