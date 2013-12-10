define network_switch::switch_node_def() {

  concat { "/etc/puppet/manifests/network/${name}.pp":
    owner => 'root',
    group => 'root',
    mode  => '0644'
  }

  concat::fragment{ "switch-node_def_headers:
    target  => "/etc/puppet/manifests/network/switch/${name}.pp",

    content => "## This file is being managed by Puppet
## Do not edit edit directly",
  }

  concat::fragment{ "switch-port_mode_access":
    target  => "/etc/puppet/manifests/network/switch/${name}.pp",
    content => template("network_switch/access_mode_switchport.erb")
   }

  concat::fragment{ "switch-port_mode_trunk":
    target  => "/etc/puppet/manifests/network/switch/${name}.pp",
    content => template("network_switch/trunk_mode_switchport.erb")
   }

  concat::fragment{ 'motd_interface':
    target  => "${name}.pp",
    content => template("network_switch/trunk_mode_native_vlan_switchport.erb")
  }
}
