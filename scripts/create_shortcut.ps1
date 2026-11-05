$wsh = New-Object -ComObject WScript.Shell
$root = "c:\Users\duy.nguyenhk\OneDrive - HA Group\Desktop\it_asset"
$targetExe = Join-Path $root "publish\ITAssetManagement.exe"
$workingDir = Join-Path $root "publish"
$shortcutPath = Join-Path $root "QuanLyTaiSanIT.lnk"

$shortcut = $wsh.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $targetExe
$shortcut.WorkingDirectory = $workingDir
$shortcut.Description = "Phần mềm Quản lý Tài sản IT - HA Group"
$shortcut.Save()
Write-Host "Shortcut created successfully at $shortcutPath"

