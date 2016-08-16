# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

load 'scripts.rb'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.box = "maier/alpine-3.4-x86_64"

  config.vm.define "node" do |node|
    node.vm.provider "virtualbox" do |v|
      v.memory = 1536
    end

    # these functions are all defined in 'scripts.rb'
    node.vm.provision :shell, inline:
      install_nginx() +
      setup_conf_files() +
      start_nginx()
  end

end
