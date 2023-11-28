# Define paths
$htmlFilePath = "index.html"
$txtFilePath = "File.txt"
$outputFilePath = "modified.html"

# Read the original HTML file
$originalHtmlContent = Get-Content -Path $htmlFilePath -Raw

# Read each line from the text file and process
Get-Content -Path $txtFilePath | ForEach-Object {
    $imgSource = $_.Trim()

    # Replace the image source with the one from the text file
    $modifiedHtmlContent = $originalHtmlContent -replace 'src=".*?"', "src=`"$imgSource`""

    # Replace the href attribute with the one from the text file
    $modifiedHtmlContent = $modifiedHtmlContent -replace 'href=".*?"', "href=`"$imgSource`""

    # Append the modified HTML content to the output file
    $modifiedHtmlContent | Out-File -FilePath $outputFilePath -Encoding UTF8
}

Write-Host "Processing complete. Modified HTML content appended to $outputFilePath."
