$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$driverPath1 = Join-Path $scriptDir "Aficio MP 6001-7001-8001-9001\OEMSETUP.INF"
$driverName1 = "RICOH Aficio MP 6001 PCL 6"
$printer1Name = "RICOH Aficio MP 6001 PCL 6 (sadora may 1)"
$port1Name = "IP_10.10.110.113"
$port1Address = "10.10.110.113"
$paperSize = "A4"
pnputil /add-driver $driverPath1 /install
Add-PrinterDriver -Name $driverName1
if (-not (Get-PrinterPort -Name $port1Name -ErrorAction SilentlyContinue)) {
    Add-PrinterPort -Name $port1Name -PrinterHostAddress $port1Address
}
Add-Printer -Name $printer1Name -PortName $port1Name -DriverName $driverName1
Set-PrintConfiguration -PrinterName $printer1Name -PaperSize $paperSize
Pause