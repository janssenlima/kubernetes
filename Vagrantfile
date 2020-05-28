# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|
  config.vm.box_check_update = false
  config.vm.provision "shell", path: "basic_deploy.sh"

  # Kubernetes Master Node
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/bionic64"
    master.vm.hostname = "master.home.lab"
    master.vm.network "private_network", ip: "172.10.10.100"
    master.vm.provider "virtualbox" do |vb|
      vb.name = "master"
      vb.memory = "1024"
      vb.cpus = "2"
      vb.customize ["modifyvm", :id, "--groups", "/kubernetes"]
    end
    master.vm.provision "shell", path: "init_master.sh"
  end

  NodeCount = 2

  # Kubernetes Worker Nodes
  (1..NodeCount).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.box = "ubuntu/bionic64"
      node.vm.hostname = "node#{i}.home.lab"
      node.vm.network "private_network", ip: "172.10.10.10#{i}"
      node.vm.provider "virtualbox" do |vb|
        vb.name = "node#{i}"
        vb.memory = "512"
        vb.cpus = "1"
        vb.customize ["modifyvm", :id, "--groups", "/kubernetes"]
      end
      node.vm.provision "shell", path: "init_workers.sh"
    end
  end

end
