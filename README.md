vagrant-hyperv-win-puppet
=========================

Bootstrapper for using Puppet Apply in Vagrant with a Windows vm in Hyper-V

Requirements
------------

 - Vagrant 1.9.5+
 - Hyper-V

Instructions
------------

Run:

    vagrant up --provider=hyperv

Content
-------

 1. Creates a Windows Server 2016 vm in Hyper-V from a box available on atlas.hashicorp.com
 2. Installs a Puppet Agent (version 4.10.1) on the vm
 3. Performs `puppet apply` using `manifest.pp`


