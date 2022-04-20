Set-TimeZone -Name "W. Australia Standard Time"

#Auto Choose WiFi MAC or LAN MAC to create MS"MAC Address" computer name
#If Wi-Fi MAC found use this else use NIC MAC
$MAC1 = ((Get-WmiObject Win32_NetworkAdapter -Filter "NetConnectionID = 'Wi-Fi'").MACAddress -replace '[:]','')
$MAC2 = ((Get-WmiObject win32_networkadapterconfiguration -filter "ipenabled = 'True'").MACAddress -replace '[:]','')
if ($MAC1)
{
$MAC = $MAC1
}
else
{
$MAC = $MAC2
}
$computername = "MS"+$MAC

#Forced rename of this computer to meet DoE convention
Rename-Computer -NewName $computername -Force
Restart-Computer -Force