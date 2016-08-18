# -*- mode: ruby -*-
# vi: set ft=ruby :

# VAGRANTFILE_API_VERSION = "2"

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

load 'scripts.rb'

Vagrant.configure("2") do |config|
  # set auto_update to false, if you do NOT want to check the correct 
  # additions version when booting this machine
  config.vbguest.auto_update = false

  # Use private network and nfs synced_foler because
  # maier/alpine-3.4-x86_64 needs these settings.
  config.vm.network "private_network", ip: "192.168.50.4"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  # do NOT download the iso file from a webserver
  config.vbguest.no_remote = true

  config.vm.box = "maier/alpine-3.4-x86_64"

  config.vm.define "node" do |node|
    node.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end

    # these functions are all defined in 'scripts.rb'
    node.vm.provision :shell, inline:
      install_nginx() +
      setup_conf_files() +
      start_nginx()
  end

end
