class network_switch::ios ()inherits params {
  # Responsible for Switch Ports Configuration

  $access_mode_ports            = hiera('access_mode_ports',{})
  $trunk_mode_ports             = hiera('trunk_mode_ports',{})
  $trunk_mode_native_vlan_ports = hiera('trunk_mode_native_vlan_ports',{}) 

# Import Ports Records
  create_resources(switchport::mode_access,$access_mode_ports)
  create_resources(switchport::mode_trunk,$trunk_mode_ports)
  create_resources(switchport::mode_trunk_native_vlan,$trunk_mode_native_vlan_ports)
}
