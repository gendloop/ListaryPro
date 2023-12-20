[CmdletBinding()]
param (
    [Parameter()]
    [string]
    $folder
)

# 检查 ..\config.txt 文件
if((Test-Path ..\config.txt) -eq $false) {
    Write-Warning "..\config.txt doesn't exist"
    return
}

# 获取项目名称, 版本号
$content= Get-Content -Raw "..\config.txt"
$regex = "(?<=PROJECT_NAME=)[\-\[\w\]]+(?=`r`n)"
$project_name = [regex]::Match($content, $regex).Value
[string[]]$version_num = @(
    'MAJOR',
    'MINOR',
    'PATCH'
)
[int32[]]$version = 1, 0, 0
for($i = 0; $i -lt $version_num.Count; $i++) {
    $regex = "(?<=${project_name}_VERSION_$($version_num[$i])=)\d+(?=`r`n)"
    $version[$i] = [regex]::Match($content, $regex).Value
}
echo $version

# package
7z a $env:userprofile\desktop\${project_name}-$($version[0]).$($version[1]).$($version[2])-win64.7z $folder\* -aoa
