# FFMPEG-dovi-mp4-to-mkv
Remux DoVi MP4 into MKV container

Windows only. Powershell script to call FFMPEG and remux MP4 to MKV.

To use this script basiaclly run it, provide folder path with input files: E:\Series\TWD\S01 and output directory. E:\Series\TWD\S01 You can use the same input/output directory as script will create new folder and files with .dvmkv appended before file extension.
All streams are copied, only subtitles are converted into SRT.

This script uses FFMPEG build by https://github.com/jellyfin/jellyfin Jellyfin. By default exe is available in your jellyfin server install folder under C:\Program Files\Jellyfin\Server. I did not test it with other FFMPEG buids, it might or might not work.

Feel free to adjust this script as you need.
