$jsonFile = "GoodLinks-Export-*.json"

if (-not (Test-Path $jsonFile)) {
    Write-Error "File not found: $jsonFile"
    exit 1
}

$csvFile = [System.IO.Path]::ChangeExtension($jsonFile, ".csv")

$data = Get-Content $jsonFile -Raw -Encoding UTF8 | ConvertFrom-Json

$results = foreach ($item in $data) {
    [PSCustomObject]@{
        URL       = ($item.url ?? $item.originalURL ?? "").Trim()
        Title     = ($item.title ?? "").Trim()
        Selection = ""
        Folder    = "Goodlinks"
        Timestamp = $item.addedAt
    }
}

$results | Export-Csv -Path $csvFile -Encoding UTF8 -NoTypeInformation -Delimiter ","

$utf8WithBom = New-Object System.Text.UTF8Encoding $true
$content     = Get-Content $csvFile -Raw
[System.IO.File]::WriteAllText($csvFile, $content, $utf8WithBom)

Write-Host "Done! CSV saved as:" -ForegroundColor Green
Write-Host $csvFile -ForegroundColor Cyan