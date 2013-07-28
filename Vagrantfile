# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"
  # Might try this one: http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-i386-vagrant-disk1.box
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = false
  
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--name", "triton"]
    vb.customize ["modifyvm", :id, "--memory", 2048]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end
 
  
  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.hostname = "triton"
  
  config.vm.provision :puppet, :module_path => "environment/modules" do |puppet|
    puppet.manifests_path = "environment/manifests"
    puppet.manifest_file  = "site.pp"
  end
  
end
