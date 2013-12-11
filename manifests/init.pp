# == Class: network_mgmt
# Example:
#  network_mgmt::switch{'c3560g04':
#    device_type     => 'cisco',
#    access_method   => 'telnet',
#    enable_password => 'secret,
#    username        => 'admin',
#    user_password   => 'password', 
#  }

class network_mgmt()inherits params{
  class {'network_mgmt::files':}
  create_resources(switch,$cisco_devices)
  create_resources(ports,$cisco_devices)

}
