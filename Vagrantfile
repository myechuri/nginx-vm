# -*- mode: ruby -*-
# vi: set ft=ruby :

# VAGRANTFILE_API_VERSION = "2"

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

load 'scripts.rb'

Vagrant.configure("2") do |config|
  # we will try to autodetect this path. 
  # However, if we cannot or you have a special one you may pass it like:
  # config.vbguest.iso_path = "#{ENV['HOME']}/Downloads/VBoxGuestAdditions.iso"
  # or an URL:
  # config.vbguest.iso_path = "http://company.server/VirtualBox/%{version}/VBoxGuestAdditions.iso"
  # or relative to the Vagrantfile:
  # config.vbguest.iso_path = File.expand_path("../relative/path/to/VBoxGuestAdditions.iso", __FILE__)

  # set auto_update to false, if you do NOT want to check the correct 
  # additions version when booting this machine
  config.vbguest.auto_update = false

  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  # do NOT download the iso file from a webserver
  config.vbguest.no_remote = true
# end

# Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # if Vagrant.has_plugin?("vagrant-cachier")
  #  config.cache.scope = :box
  #end

  config.vm.box = "maier/alpine-3.4-x86_64"

  config.vm.define "node" do |node|
    # node.vm.provider "virtualbox" do |v|
    #  v.memory = 1536
    # end

    # these functions are all defined in 'scripts.rb'
    node.vm.provision :shell, inline:
      install_nginx() +
      setup_conf_files() +
      start_nginx()
  end

end
