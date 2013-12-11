# == Class: network_mgmt::params
#
class network_mgmt::params{

# Device Data
##
  $cisco_device = hiera('cisco_devices',{})
  $f5_device    = hiera('f5_devices',{})

# Owner,Mode,Group for filesystem resources
##
  File{
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

}
