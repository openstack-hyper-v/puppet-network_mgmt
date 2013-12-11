define network_switch::access_port ( $description,$mode,$interface,)inherits params {
# SwitchPort Mode Access
  network_switch::interface {$name: 

  define "mode_access" ($description,$mode,$native_vlan){
    interface { $name:
      description => $description,
      mode        => $access,
      native_vlan => $native_vlan,
    }
  }
  
# SwitchPort Mode Trunk
  define "mode_trunk" ($description,$mode,$vlans){
    notify { "${name}-switchport_mode_trunk(allowed_trunk_vlans:${vlans})":}
  # SDN Port Trunk Mode Vlan 500-1000
    interface { $name:
      description         => $description,
      mode                => $mode,
      allowed_trunk_vlans => $vlans,
    }
  }
  
# SwitchPort Mode Trunk With Native Vlan
  define "mode_trunk_with_native_vlan" ($description,$mode,$vlans,$native_vlan){
    notify { "${name}-switchport_mode_trunk(native_vlan:${native_vlan} allowed_trunk_vlans:${vlans})":}
    interface { $name:
      description         => $description,
      mode                => $mode,
      allowed_trunk_vlans => $vlans,
      native_vlan         => $native_vlan,
    }
  }
}
