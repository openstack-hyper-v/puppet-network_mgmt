define network_mgmt::switch(
  $switch_name = "${name}",
  $device_type,
  $access_method,
  $enable_password,
  $username,
  $user_password,
){

  network_mgmt::device{$name:
    device_type     => $device_type,
    access_method   => $access_method,
    enable_password => $enable_password,
    username        => $username,
    user_password   => $user_password,
  }

  file {"/etc/puppet/manifests/network/switch/${name}":
    ensure => directory,
  }
  file {"/etc/puppet/manifests/network/switch/${name}/port":
    ensure  => directory,
    require => File["/etc/puppet/manifests/network/switch/${name}"],
  }
#  concat { "/etc/puppet/manifests/network/switch/${name}.pp":
  concat { "/etc/puppet/manifests/network/${name}.pp":
    owner => 'root',
    group => 'root',
    mode  => '0644'
  }
  concat::fragment{ "${name}-switch_node_definition_header":
#    target  => "/etc/puppet/manifests/network/switch/${name}.pp",
    target  => "/etc/puppet/manifests/network/${name}.pp",
    content => template("network_mgmt/warning.erb"),
    order   => '00',
  }

}
