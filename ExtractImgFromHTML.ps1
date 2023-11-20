# Function to extract img src attributes from HTML code
function Get-ImageSources {
    param (
        [string]$htmlCode
    )

    # Define regular expression pattern for img src attributes
    $pattern = '<img[^>]*src=["''](.*?)["'']'

    # Use Select-String to find matches in the HTML code
    $matches = $htmlCode | Select-String -Pattern $pattern -AllMatches

    # Loop through each match and extract the captured groups
    $imageSources = foreach ($match in $matches.Matches) {
        $match.Groups[1].Value
    }

    return $imageSources
}

# Specify the file path containing HTML code
$htmlFilePath = "index.html"

# Read HTML code from the file
$htmlCode = Get-Content -Path $htmlFilePath -Raw

# Get image sources from HTML code
$imageSources = Get-ImageSources -htmlCode $htmlCode

# Specify the file path to store the image sources
$outputFilePath = "image_sources.txt"

# Write image sources to the output file
$imageSources | Out-File -FilePath $outputFilePath

Write-Host "Image sources extracted and stored in $outputFilePath"