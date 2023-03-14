$path = ""
$target = ""
$ffmpeg = "C:\Program Files\Jellyfin\Server"

while ($path -eq "" -or -not (Test-Path $path)) {
    $path = Read-Host "Please enter a valid source path:"
    $target = Read-Host "Please enter a valid target path:"
    if (-not (Test-Path $path)) {
        Write-Host "Invalid path. Please try again."
    }
    elseif (-not (Test-Path $target)){
        Write-Host "Invalid path. Please try again."
    }
    else
    {
        $parentfolder = (Get-Item $path).Name

        if ($target.EndsWith("\")) {
            $targetFull = "$($target)$($parentfolder).dvmkv"
        } else {
            $targetFull = "$($target)\$($parentfolder).dvmkv"   
        }
        #Write-Host "Creating new target directorty: $($targetFull)"
        New-Item -ItemType Directory -Path "$targetFull"

        $file_list = Get-ChildItem -Path $path -Include *.mp4 -File -Recurse -Exclude *dvmkv*

        foreach($file in $file_list)
        {
            #Write-Host "$($file.FullName)"
            $addon = "$($file.BaseName).dvmkv.mkv"
            #Write-Host "$($targetFull)\$($addon)"
            & $ffmpeg\ffmpeg.exe -y -i file:$($file.FullName) -map 0 -c copy -c:s srt -vtag hevc "$($targetFull)\$($addon)"

        }

    }
}