#!/bin/bash

mkdir -p VM1 
mkdir -p VM2
mkdir -p VM3
mkdir -p VM1-6
mkdir -p VM2-6
mkdir -p VM3-6

#Installation des VMs.

#### VM1 ####

#LAN3
rm -f ./VM1/Vagrantfile
cat ./config-rep/Vagrantfile | sed 's/balise-cible1/config.vm.network \"private_network\", ip:\"0.0.0.0\", auto_config: false, virtualbox__intnet: \"LAN3\"/' > ./VM1/Vagrantfile
#LAN1
cat ./VM1/Vagrantfile | sed 's/balise-cible2/config.vm.network \"private_network\", ip:\"0.0.0.0\", auto_config: false, virtualbox__intnet: \"LAN1\"/' > ./VM1/Vagrantfile
rm -rf ./VM1/.vagrant

#### VM2 ####

#LAN1
rm -f ./VM2/Vagrantfile
cat ./config-rep/Vagrantfile | sed 's/balise-cible1/config.vm.network \"private_network\", ip:\"0.0.0.0\", auto_config: false, virtualbox__intnet: \"LAN1\"/' > ./VM2/Vagrantfile
#LAN2
cat ./VM2/Vagrantfile | sed 's/balise-cible2/config.vm.network \"private_network\", ip:\"0.0.0.0\", auto_config: false, virtualbox__intnet: \"LAN2\"/' > ./VM2/Vagrantfile

rm -rf ./VM2/.vagrant

#### VM3 ####
rm -rf ./VM3/.vagrant
#LAN2
rm -f ./VM3/Vagrantfile
cat ./config-rep/Vagrantfile | sed 's/balise-cible1/config.vm.network \"private_network\", ip:\"0.0.0.0\", auto_config: false, virtualbox__intnet: \"LAN2\"/' > ./VM3/Vagrantfile
#LAN4
cat ./VM3/Vagrantfile | sed 's/balise-cible2/config.vm.network \"private_network\", ip:\"0.0.0.0\", auto_config: false, virtualbox__intnet: \"LAN4\"/' > ./VM3/Vagrantfile


#### VM1-6 ####
rm -rf ./VM1-6/.vagrant
#LAN3
rm -f ./VM1-6/Vagrantfile
cat ./config-rep/Vagrantfile | sed 's/balise-cible1/config.vm.network \"private_network\", ip:\"0.0.0.0\", auto_config: false, virtualbox__intnet: \"LAN3\"/' > ./VM1-6/Vagrantfile
#LAN1-6
cat ./VM1-6/Vagrantfile | sed 's/balise-cible2/config.vm.network \"private_network\", ip:\"0.0.0.0\", auto_config: false, virtualbox__intnet: \"LAN1-6\"/' > ./VM1-6/Vagrantfile

#### VM2-6 ####
rm -rf ./VM2-6/.vagrant
#LAN1-6
rm -f ./VM2-6/Vagrantfile
cat ./config-rep/Vagrantfile | sed 's/balise-cible1/config.vm.network \"private_network\", ip:\"0.0.0.0\", auto_config: false, virtualbox__intnet: \"LAN1-6\"/' > ./VM2-6/Vagrantfile
#LAN2-6
cat ./VM2-6/Vagrantfile | sed 's/balise-cible2/config.vm.network \"private_network\", ip:\"0.0.0.0\", auto_config: false, virtualbox__intnet: \"LAN2-6\"/' > ./VM2-6/Vagrantfile


#### VM3-6 ####  2-6 4
rm -rf ./VM3-6/.vagrant
#LAN2-6
rm -f ./VM3-6/Vagrantfile
cat ./config-rep/Vagrantfile | sed 's/balise-cible1/config.vm.network \"private_network\", ip:\"0.0.0.0\", auto_config: false, virtualbox__intnet: \"LAN2-6\"/' > ./VM3-6/Vagrantfile
#LAN4
cat ./VM3-6/Vagrantfile | sed 's/balise-cible2/config.vm.network \"private_network\", ip:\"0.0.0.0\", auto_config: false, virtualbox__intnet: \"LAN4\"/' > ./VM3-6/Vagrantfile

VBoxManage setproperty machinefolder "/virtualbox/tmp"

