#
define dotnet::install::package(
  $version         = '',
  $package_dir     = ''
) {

  include dotnet::params

  $url       = $dotnet::params::version[$version]['url']
  $exe       = $dotnet::params::version[$version]['exe']
  $release   = $dotnet::params::version[$version]['release']

  if "x${package_dir}x" == 'xx' {
    $source_file = "C:/Windows/Temp/${exe}"
    remote_file { $source_file:
      ensure => 'present',
      source => $url,
    }
  } else {
    $source_file = "${package_dir}/${exe}"
  }

  exec { "install-dotnet-${version}":
    command   => "& ${$source_file} /q /norestart",
    provider  => powershell,
    logoutput => true,
    onlyif    => "if (\'${release}\'-gt (Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full' 'Release')) {exit 0} else {exit 1}",
  }
}