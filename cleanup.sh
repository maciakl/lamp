#!/bin/bash

# Readies your folder for a new project removing git garbage and simplifying
# your vagrant file

echo "Deleting git cruft..."
[ -d .git ] && rm -rf .git
[ -f  setup.sh ] && rm setup.sh
[ -f Readme.markdown ] && rm Readme.markdown
[ -f Vagrantfile ] && rm Vagrantfile

echo "Creating new Vagrantfile..."
cat << 'EOF' > Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.synced_folder "./www", "/var/www"
end
EOF

echo "Deleting self."
rm cleanup.sh

echo "Done."
