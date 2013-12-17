#
#
#

$ge = 'GigabitEthernet0/'
$portlist = {
  "${ge}19",
  "${ge}21",
  "${ge}23",
  "${ge}25",
  "${ge}27",
  "${ge}29",
  "${ge}31",
  "${ge}33",
  "${ge}35",
  "${ge}37",
  "${ge}39",
  "${ge}41",
  "${ge}43",
  "${ge}45",
  "${ge}47",
}

interface { ${portlist}:
  description => "Access port",
  mode        => access,
  native_vlan => 3,
}

