# == Class: network_switch
#
class network_switch{
  $cisco_devices = hiera('cisco_devices',{})

# Begin File Definition 
# For Managing physical network resources

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

#network_switch::node_definition{'c3560g04':
#    device_type     => 'cisco',
#    access_method   => 'telnet',
#    enable_password => 'hard24get',
#    username        => 'puppet',
#    user_password   => $user_password,
#}

create_resources(node_definition,$cisco_devices)

#  class {'network_switch::build_ports':}
#  create_resources(network_switch::switchnode,"c3560g04")
}
