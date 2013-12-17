#
#
#

$ge = 'GigabitEthernet0/'
$portlist = [ 
  "${ge}20",
  "${ge}22",
  "${ge}24",
  "${ge}26",
  "${ge}28",
  "${ge}30",
  "${ge}32",
  "${ge}34",
  "${ge}36",
  "${ge}38",
  "${ge}40",
  "${ge}42",
  "${ge}44",
  "${ge}46",
  "${ge}48",
}

interface { ${portlist}:
  description => "Trunk port",
  mode        => trunk,
  allowd_trunk_vlans => "500,1000",
}

