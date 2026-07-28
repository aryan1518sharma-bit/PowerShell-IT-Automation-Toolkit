[CmdletBinding()]
param(
    [string]$OutputPath = "report.html"
)
try{
    $cpu = Get-Counter 'Processor(_Total)\% Processor Time'
    $cpuUsage = [math] ::Round($cpu.CounterSamples.CookedValue, 2)

    $os = Get-CimInstance Win32_OperatingSystem
    $totalRAM = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
    $freeRAM = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
    $usedRAM = $totalRAM - $freeRAM

    $disk = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
        [PSCustomObject]@{
           FreeGB = [math]::Round($_.FreeSpace / 1GB, 2)
           TotalGB = [math]::Round($_.Size / 1GB, 2
        }
    }
    $Html = @"
    <h1>System Health Report</h1>
    <h2>CPU Usage</h2>
    <p>Usage : $cpuUsage %</p>

    <h2>RAM</h2>
    <p>Total: $totalRAM GB</p>
    <p>Free: $freeRAM GB</p>
    <p>Used: $usedRAM GB</p>

    <h2>Disk Space</h2>
   try {
    $html = @"
$($disks | ConvertTo-Html -Fragment)
"@
    $html | Out-File -FilePath $OutputPath
}
catch {
    Write-Error "An error occurred: $_"
}