define network_mgmt::switch(
  $switch_name = "${name}",
  $device_type,
  $access_method,
  $enable_password,
  $username,
  $user_password,
){

  network_switch::device{$name:
    device_type     => $device_type,
    access_method   => $access_method,
    enable_password => $enable_password,
    username        => $username,
    user_password   => $user_password,
  }

  file {"/etc/puppet/manifests/network/switch/${name}":
    ensure => directory,
  }
  concat { "/etc/puppet/manifests/network/switch/${name}.pp":
    owner => 'root',
    group => 'root',
    mode  => '0644'
  }
  concat::fragment{ "${name}-switch_node_definition_header":
    target  => "/etc/puppet/manifests/network/switch/${name}.pp",
    content => template("network_switch/warning.erb"),
    order   => '00',
  }

#  concat { "/etc/puppet/manifests/network/ports/${name}-${}.pp":
#    owner => 'root',
#    group => 'root',
#    mode  => '0644'
#  }
#
#  concat::fragment{ "switch-node_def_headers":
#    target  => "/etc/puppet/manifests/network/switch/${name}.pp",
#    content => template("network_switch/warning.erb"),
#  }
#
#  concat::fragment{ "switch-port_mode_access":
#    target  => "/etc/puppet/manifests/network/switch/${name}.pp",
#    content => template("network_switch/port.erb")
#   }
#
#  concat::fragment{ "switch-port_mode_trunk":
#    target  => "/etc/puppet/manifests/network/switch/${name}.pp",
#    content => template("network_switch/port.erb")
#   }
#
#  concat::fragment{ "switch-port_mode_trunk_native_vlan":
#    target  => "/etc/puppet/manifests/network/switch/${name}.pp",
#    content => template("network_switch/port_erb")
#  }
}
