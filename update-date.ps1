$files = Get-ChildItem -Path "_posts" -Recurse -Filter "*.md"

foreach ($file in $files) {
    # UTF-8로 명시적으로 읽어오기
    $utf8 = New-Object System.Text.UTF8Encoding $false
    $content = [System.IO.File]::ReadAllLines($file.FullName, $utf8)

    $now = Get-Date
    $newDate = $now.ToString("yyyy-MM-dd HH:mm:ss zzz")

    # date 라인을 찾음
    $dateLineIndex = -1
    for ($i = 0; $i -lt $content.Length; $i++) {
        if ($content[$i] -match "^date:") {
            $dateLineIndex = $i
            break
        }
    }

    if ($dateLineIndex -ge 0) {
        $content[$dateLineIndex] = "date: $newDate"
    } else {
        $insertIndex = 1
        $content = $content[0..($insertIndex - 1)] + @("date: $newDate") + $content[$insertIndex..($content.Count - 1)]
    }

    # UTF-8 without BOM으로 정확하게 저장
    [System.IO.File]::WriteAllLines($file.FullName, $content, $utf8)
    
    Write-Host "✅ Updated $($file.FullName)"
}
