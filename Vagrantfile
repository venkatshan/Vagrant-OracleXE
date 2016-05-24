Vagrant.configure(2) do |config|

  config.vm.define "orclvm"  do |orclvm|
    orclvm.vm.hostname="orclvm"
    orclvm.vm.box = "ubuntu/trusty64"
    orclvm.vm.network "private_network", ip: "192.168.33.100"
    orclvm.vm.network "forwarded_port", guest: 1521, host: 1521, id: "oracle"
    orclvm.vm.provision "shell", path: "ora-provision.sh"
    orclvm.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
    config.vm.synced_folder "./", "/vagrant", disabled: true
    config.vm.synced_folder "./installs", "/pcinstalls"

  end
end
