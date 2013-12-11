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
) {

  concat::fragment{"device.conf-${device_type}_${name}":
    target  => "/etc/puppet/device.conf",
    content => template("network_mgmt/device.conf.erb"),
    order   => '02',
  }

}
