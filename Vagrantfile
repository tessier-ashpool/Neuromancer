# -*- mode: ruby -*-
# vi: set ft=ruby :

# Config Github Settings
# Server Configuration
hostname = "neuromancer.dev"

# Set a local private network IP address.
# See http://en.wikipedia.org/wiki/Private_network for explanation
# You can use the following IP ranges:
server_ip             = "192.168.22.10"
server_cpus           = "2"   # Cores
server_memory         = "1024" # MB
server_swap           = "768" # Options: false | int (MB) - Guideline: Between one or two times the server_memory

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  config.omnibus.chef_version = :latest
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "hashicorp/precise64"

  config.vm.hostname = hostname

  config.vm.network :forwarded_port, guest: 80, host: 8080

  # If using VirtualBox
  config.vm.provider :virtualbox do |vb|

    vb.name = "Neuromancer"

    # Set server cpus
    vb.customize ["modifyvm", :id, "--cpus", server_cpus]

    # Set server memory
    vb.customize ["modifyvm", :id, "--memory", server_memory]

    # Set the timesync threshold to 10 seconds, instead of the default 20 minutes.
    # If the clock gets more than 15 minutes out of sync (due to your laptop going
    # to sleep for instance, then some 3rd party services will reject requests.
    vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]

  end

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "monit"
    chef.add_recipe "nvm"
    chef.add_recipe "build-essential"
    chef.add_recipe "phantomjs"
    chef.add_recipe "apache2"
    chef.json = { :apache => { :default_site_enabled => true } }
  end

  config.vm.provision :shell, :path => "bootstrap.sh"

end