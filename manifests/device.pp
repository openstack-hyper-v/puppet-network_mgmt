# == Define: network_mgmt::device
#

#
#
define network_mgmt::device (
  $device_type,
  $access_method,
  $enable_password,
  $username,
  $user_password,
) inherits params {

  concat::fragment{"device.conf-${device_type}_${name}":
    target  => "/etc/puppet/device.conf",
    content => template("network_switch/device.erb"),
    order   => '02',
  }

}
