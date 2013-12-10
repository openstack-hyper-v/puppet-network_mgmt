# == Class: network_switch
#
# Full description of class network_switch here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { network_switch:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class network_switch {
  file {"/etc/puppet/manifests/network":
    ensure => directory,
    #user   => 'root',
    group  => 'root',
    mode   => '0644',
  }
# We need /etc/puppet/manifests/.gitignore because this module manages devices in /etc/puppet/manifests/network 
  file {"/etc/puppet/manifests/.gitignore":
    ensure  => file,
    #user    => 'root',
    group   => 'root',
    mode    => '0644',
    content => 'network',
    require => File["/etc/puppet/manifests/network"],
  }

  concat {"/etc/puppet/device.conf.test":
    #user    => 'root',
    group   => 'root',
    mode    => '0644',
  }
  concat::fragment {"device.conf_header":
    target  => "/etc/puppet/device.conf.test",
    #content => template("network_switch/switch_node_definition_header.erb"),
    content => "My test",
    order   => 00,
  }
  class {'network_switch::ios':}
  create_resources(network_switch::switchnode,"c356004")
}
