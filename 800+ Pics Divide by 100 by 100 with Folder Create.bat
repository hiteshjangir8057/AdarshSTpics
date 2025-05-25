@echo off
setlocal enabledelayedexpansion

:: Supported image formats
set "exts=jpg jpeg png gif bmp"

:: Initialize counters
set count=0
set folderIndex=1

:: Create first folder
set "folderName=Batch_1"
mkdir "!folderName!" 2>nul

:: Loop over all image files
for %%e in (%exts%) do (
    for %%f in (*.%%e) do (
        set /a fileIndex=!count! %% 100

        :: If fileIndex is 0 and it's not the first file, make new folder
        if !fileIndex! == 0 if not !count! == 0 (
            set /a folderIndex+=1
            set "folderName=Batch_!folderIndex!"
            mkdir "!folderName!" 2>nul
        )

        move "%%f" "!folderName!\" >nul
        set /a count+=1
    )
)

echo.
echo ✅ Done! Moved !count! images into !folderIndex! folder(s) with 100 per folder.
pause
