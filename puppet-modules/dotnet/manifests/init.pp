# Author::    Liam Bennett (mailto:liamjbennett@gmail.com)
# Copyright:: Copyright (c) 2014 Liam Bennett
# License::   MIT

# == Define: dotnet
#
# Module to install the Microsoft .NET framework on windows
#
# === Requirements/Dependencies
# 
# lwf/remote_file
# https://github.com/lwf/puppet-remote_file
# 
# puppetlabs/powershell
# https://github.com/puppetlabs/puppetlabs-powershell
#
# === Parameters
#
# [*version*]
# The version of .NET to be managed
#
# [*package_dir*]
# If installing .NET from a directory or a mounted network location then this is that directory
#
# === Examples
#
#  Installing .NET 4.5
#
#    dotnet { 'dotnet45':
#      version => '4.5',
#    }
#
define dotnet(
  Enum['4.5', '4.5.1', '4.5.2', '4.6', '4.6.1', '4.6.2', '4.7']
  $version,

  Variant[String, Undef]
  $package_dir = undef,
) {

  if $::os['family'] != 'windows' {
    fail("dotnet ${version} is not supported on ${::os['family']}")
  }

  $windows_version = $::os['release']['full']

  if ! ($windows_version in ['2012', '2012 R2', '2016']) {
    fail("dotnet ${version} is not supported on windows ${windows_version}")
  }

  dotnet::install::package { "dotnet-package-${version}":
    version         => $version,
    package_dir     => $package_dir,
  }
}
