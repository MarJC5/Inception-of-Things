# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.box = "ubuntu/focal64"

  config.vm.define "mpouceS" do |mpouceS|
    mpouceS.vm.hostname = "mpouceS"
    mpouceS.vm.network :private_network, ip: "192.168.56.110"
    mpouceS.vm.provider "virtualbox" do |vb|
      vb.name = "mpouceS"
      vb.memory = "1024"
      vb.cpus = 1
    end
  end
  config.vm.define "mpouceSW" do |mpouceSW|
    mpouceSW.vm.hostname = "mpouceSW"
    mpouceSW.vm.network :private_network, ip: "192.168.56.111"
    mpouceSW.vm.provider "virtualbox" do |vb|
      vb.name = "mpouceSW"
      vb.memory = "1024"
      vb.cpus = 1
    end
  end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Disable the default share of the current code directory. Doing this
  # provides improved isolation between the vagrant box and your host
  # by making sure your Vagrantfile isn't accessible to the vagrant box.
  # If you use this you may want to enable additional shared subfolders as
  # shown above.
  # config.vm.synced_folder ".", "/vagrant", disabled: true

  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
