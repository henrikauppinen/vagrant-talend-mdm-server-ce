# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 8180, host: 8180 # MDM Server - JBoss HTTP port
  config.vm.network "forwarded_port", guest: 8443, host: 8443 # MDM Server - JBoss HTTPS port
  config.vm.network "forwarded_port", guest: 8009, host: 8009 # MDM Server - JBoss AJP Port
  config.vm.network "forwarded_port", guest: 3873, host: 3873 # MDM Server - JBoss Invoker Locator port
  config.vm.network "forwarded_port", guest: 8093, host: 8093
  config.vm.network "forwarded_port", guest: 8083, host: 8083
  config.vm.network "forwarded_port", guest: 1099, host: 1099
  config.vm.network "forwarded_port", guest: 1098, host: 1098
  config.vm.network "forwarded_port", guest: 4444, host: 4444
  config.vm.network "forwarded_port", guest: 4445, host: 4445

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "shell", path: "provision.sh"

end
