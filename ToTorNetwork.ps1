$Geteway = '192.168.50.111'
$InterfaceIP = '192.168.50.35'

$InterfaceId = (Get-NetIPAddress -IPAddress $InterfaceIP).InterfaceIndex
route change 0.0.0.0 mask 0.0.0.0 $Geteway
Set-DnsClientServerAddress -InterfaceIndex $InterfaceId -ServerAddresses $Geteway


