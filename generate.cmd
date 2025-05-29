@echo off
setlocal enabledelayedexpansion

set "VIDEO_FOLDER=videos"
set "OUTPUT=video-list.js"
set /a count=0

:: First, count files
for %%F in ("%VIDEO_FOLDER%\*.mp4") do (
  set /a count+=1
)

> "%OUTPUT%" echo // This file is auto-generated. Use `video-config.js` to set the start and end offsets, as well as skipped segments, for each video.
>> "%OUTPUT%" echo let videoFiles = [

set /a index=0

for %%F in ("%VIDEO_FOLDER%\*.mp4") do (
  set "file=%%~nxF"
  set "name=%%~nF"

  set /a index+=1
  if !index! LSS %count% (
    >> "%OUTPUT%" echo   { src: 'videos/!file!' },
  ) else (
    >> "%OUTPUT%" echo   { src: 'videos/!file!' }
  )
)

>> "%OUTPUT%" echo ];