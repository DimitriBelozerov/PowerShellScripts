# Define paths
$inputFolder = "inputFolder"
$outputFolder = "outputFolder"

# Ensure the output folder exists
if (-not (Test-Path $outputFolder)) {
    New-Item -ItemType Directory -Path $outputFolder | Out-Null
}

# Get all image files in the input folder
$imageFiles = Get-ChildItem $inputFolder -Filter *.jpg

# Loop through each image file
foreach ($imageFile in $imageFiles) {
    # Calculate new dimensions for 16:9 aspect ratio with a height of 600 pixels
    $newHeight = 600
    $newWidth = [math]::Round($newHeight * 16 / 9)

    # Construct the output file path in the thumbnails folder
    $outputFileName = "thumbnail_$($imageFile.Name)"
    $outputFilePath = Join-Path $outputFolder $outputFileName

    # Construct the Magick command for resizing and cropping
    $magickCommand = "magick convert `"$($imageFile.FullName)`" -resize ${newWidth}x${newHeight}^ -gravity Center -extent ${newWidth}x${newHeight} `"$outputFilePath`""

    # Execute the Magick command
    Invoke-Expression -Command $magickCommand
}

Write-Host "Thumbnail generation completed. Thumbnails saved in: $outputFolder"