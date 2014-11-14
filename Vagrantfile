# -*- mode: ruby -*-
# vi: set ft=ruby :

require './config/default'
include VConfig


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  config.omnibus.chef_version = :latest
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = $config[:default_box]

  config.vm.hostname = $config[:hostname]

  config.vm.network :forwarded_port, guest: 80, host: $config[:port]
  config.vm.network :private_network, ip: $config[:server_ip]

  if $config[:database] != '' # If database is set.
    config.vm.network :forwarded_port, guest: 3306, host: 3306
  end

  config.vm.synced_folder '.', '/vagrant', owner: 'www-data', group: 'www-data', :mount_options => ['dmode=777,fmode=777']

  # If using VirtualBox
  config.vm.provider :virtualbox do |vb|

    vb.name = $config[:vm_hostname]

    # Set server cpus
    vb.customize ["modifyvm", :id, "--cpus", $config[:cpus]]

    # Set server memory
    vb.customize ['modifyvm', :id, '--memory', $config[:ram]]

    # Set the timesync threshold to 10 seconds, instead of the default 20 minutes.
    # If the clock gets more than 15 minutes out of sync (due to your laptop going
    # to sleep for instance, then some 3rd party services will reject requests.
    vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]

  end

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "build-essential"
    chef.add_recipe "nvm"
    chef.add_recipe "phantomjs"
    chef.add_recipe "apache2"
    chef.json = { :apache => { :default_site_enabled => true } }
  end

end