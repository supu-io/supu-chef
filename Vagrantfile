# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.hostname = 'supu.local'
  config.vm.network 'private_network', ip: '10.50.1.21'

  config.vm.provider 'virtualbox' do |v|
    v.memory = 4096
    # v.cpus = 2
    # Allow the vagrant guest to resolve connections using the host's VPN
    # connection, so can resolve internal.vpn domains
    v.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    v.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end

  config.vm.provision 'chef_solo' do |chef|
    #chef.log_level = :debug
    chef.add_recipe 'supu-chef'
  end
end
