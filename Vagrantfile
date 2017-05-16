Vagrant.configure("2") do |config|
  config.vm.box = "mwrock/Windows2016"

  # Install Puppet agent - https://github.com/hashicorp/puppet-bootstrap
  config.vm.provision "shell", path: "./puppet-bootstrap/windows.ps1"
  
  # Apply Puppet manifest
  config.vm.provision "puppet" do |puppet|

    # https://docs.puppet.com/puppet/3/experiments_future.html#enabling-the-future-parser
    # Puppet Agent version < 4.0.0
    #puppet.options        = "--verbose --debug --parser future"

    puppet.options        = "--verbose --debug"
    
    puppet.manifests_path = "./puppet-manifest"
    puppet.manifest_file  = "manifest.pp"
    
    puppet.module_path    = "./puppet-modules"

    # https://github.com/mitchellh/vagrant/issues/6128#issuecomment-287356772
    puppet.environment_path = "./puppet-environments"
    puppet.environment      = "common"
  end
end
