# == Class: network_mgmt::files
#
class network_mgmt::files(
)inherits params{

# This class create the default filesytem layout
# to allow for automated management and control
# of networking devices with puppet.

# File /etc/puppet/.gitignore
# &
# File /etc/puppet/manifests/.gitignore
# Setting to ignore the folders we create
# to house the auto generated switch config

  file {'/etc/puppet/.gitignore':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'device.conf',
    require => File["/etc/puppet/manifests/network"],
  }


  file {'/etc/puppet/manifests/.gitignore':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'network',
    require => File["/etc/puppet/manifests/network"],
  }

  file {"/etc/puppet/manifests/network":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file {"/etc/puppet/manifests/network/switch":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    require => File["/etc/puppet/manifests/network"],
  }

  file {"/etc/puppet/manifests/network/port":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    require => File["/etc/puppet/manifests/network"],
  }

  concat {"/etc/puppet/device.conf":
    owner    => 'root',
    group   => 'root',
    mode    => '0644',
  }
  concat::fragment {"device.conf_header":
    target  => "/etc/puppet/device.conf",
    content => template("network_switch/warning.erb"),
    order   => '00',
  }

}
