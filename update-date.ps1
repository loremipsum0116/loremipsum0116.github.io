$files = Get-ChildItem -Path "_posts" -Recurse -Filter "*.md"

foreach ($file in $files) {
    $utf8 = New-Object System.Text.UTF8Encoding $false
    $content = [System.IO.File]::ReadAllLines($file.FullName, $utf8)

    # date: 항목 탐색
    $dateLineIndex = -1
    for ($i = 0; $i -lt $content.Length; $i++) {
        if ($content[$i] -match "^date:") {
            $dateLineIndex = $i
            break
        }
    }

    # 만약 date:가 없거나 공백이라면 새로 삽입
    if ($dateLineIndex -eq -1 -or ($content[$dateLineIndex] -match "^date:\s*$") -or ($content[$dateLineIndex].Trim() -eq "date:")) {
        $now = Get-Date
        $newDate = $now.ToString("yyyy-MM-dd HH:mm:ss zzz")

        if ($dateLineIndex -ge 0) {
            $content[$dateLineIndex] = "date: $newDate"
        } else {
            $insertIndex = 1
            $content = $content[0..($insertIndex - 1)] + @("date: $newDate") + $content[$insertIndex..($content.Count - 1)]
        }

        # 저장 (UTF-8 without BOM)
        [System.IO.File]::WriteAllLines($file.FullName, $content, $utf8)
        Write-Host "✅ date: 추가됨 → $($file.Name)"
    } else {
        Write-Host "🔒 date: 유지됨 → $($file.Name)"
    }
}
