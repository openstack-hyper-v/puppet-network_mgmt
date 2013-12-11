define network_switch::port (
) inherits params {
  interface {$name:
    ensure              => $ensure
    description         => $description
    allowed_trunk_vlans => $allowed_trunk_vlans
    description         => $description
    device_url          => $device_url
    duplex              => $duplex
    encapsultation      => $encapsulation
    etherchannel        => $etherchannel
    ipaddress           => $ipaddress
    mode                => $mode
    provider            => $provider
    speed               => $speed
  } 

  file {"/etc/puppet/manifests/network/switch/${switchname}/ports/${name}.pp":
    ensure => file,
  }


}
