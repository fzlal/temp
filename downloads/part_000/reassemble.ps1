# 🔧 Reassemble parts back to original file
$partsDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$outputFile = Join-Path $partsDir "part_000"
Write-Host "🔄 Reassembling parts into: $outputFile"
$parts = Get-ChildItem -Path $partsDir -Filter "part_*" | Sort-Object Name
$fileStream = [System.IO.File]::OpenWrite($outputFile)
foreach ($part in $parts) {
    $bytes = [System.IO.File]::ReadAllBytes($part.FullName)
    $fileStream.Write($bytes, 0, $bytes.Length)
}
$fileStream.Close()
Write-Host "✅ Done. File size: $((Get-Item $outputFile).Length) bytes"
