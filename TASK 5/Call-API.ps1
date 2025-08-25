
$logFile = "C:\Logs\api_call.log"


if (!(Test-Path "C:\Logs")) { New-Item -ItemType Directory -Path "C:\Logs" }

function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $line = "$timestamp - $Message"
    $line | Out-File -FilePath $logFile -Append
    Write-Host $line
}


Write-Log "Starting simulated API call..."
try {
   
    $response = @{ status = "success"; data = "Sample API data" }
    Write-Log "API call successful."
    Write-Log "Response preview: $($response | ConvertTo-Json -Compress)"
} catch {
    Write-Log "API call failed. Error: $_"
}
Write-Log "Script finished."
