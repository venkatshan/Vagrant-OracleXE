Vagrant.configure(2) do |config|

  config.vm.define "dev1"  do |dev1|
    dev1.vm.hostname="dev1"
    dev1.vm.box = "ubuntu/trusty64"
    dev1.vm.network "private_network", ip: "192.168.33.100"
    dev1.vm.network "forwarded_port", guest: 1521, host: 1521, id: "oracle"
    dev1.vm.provision "shell", path: "ora-provision.sh"
    dev1.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024"]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
    config.vm.synced_folder "./", "/vagrant", disabled: true
    config.vm.synced_folder "./installs", "/pcinstalls"

  end
end
