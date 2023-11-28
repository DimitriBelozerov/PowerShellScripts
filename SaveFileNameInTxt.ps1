$directoryPath = "H:\Privat\Palito\Fotos"
$outputFileName = "File.txt"
$outputFilePath = Join-Path -Path $PSScriptRoot -ChildPath $outputFileName

# Check if the output file exists, if not, create one
if (-not (Test-Path -Path $outputFilePath)) {
    New-Item -ItemType File -Path $outputFilePath -Force
}

# List files with the specified extension and save only the names with extensions to the output file
Get-ChildItem -Path $directoryPath | ForEach-Object { $_.Name } | Out-File -FilePath $outputFilePath -Encoding UTF8
