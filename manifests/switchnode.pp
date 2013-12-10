define network_switch::switchnode() {

  concat { "/etc/puppet/manifests/network/${name}.pp":
    owner => 'root',
    group => 'root',
    mode  => '0644'
  }

  concat::fragment{ "switchnode headers":
    target  => "${name}.pp",
    content => "This file is being managed by Puppet"
  }

  concat::fragment{ 'motd_interface':
    target  => "${name}.pp",
    content => template("network_switch/access_mode_switchport.erb")
   }

  concat::fragment{ 'motd_interface':
    target  => "${name}.pp",
    content => template("network_switch/trunk_mode_switchport.erb")
   }

  concat::fragment{ 'motd_interface':
    target  => "${name}.pp",
    content => template("network_switch/trunk_mode_native_vlan_switchport.erb")
  }
}
