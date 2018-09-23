
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "kubernetes-control"

  config.vm.provision "shell", path: "scripts/init.sh"

  config.vm.synced_folder ".", "/opt/repo"

end