@echo off
set VERSION=v0.6.2
set RELEASE_TITLE="Release %VERSION%"
set RELEASE_NOTES="Updating to %VERSION%"

echo Starting release process for %VERSION%...

:: 1. Git add and commit updated files
echo Committing version updates...
git add latest.yml ts-sddirect-setup.exe.blockmap
git commit -m "chore: bump version to %VERSION%"
git push origin main

:: 2. Create GitHub Release and upload assets
echo Creating GitHub Release and uploading assets...
:: ts-sddirect-setup.exe is often excluded via .gitignore in Electron projects, but we upload it as a release asset.
gh release create %VERSION% ^
    ts-sddirect-setup.exe ^
    ts-sddirect-setup.exe.blockmap ^
    latest.yml ^
    --title %RELEASE_TITLE% ^
    --notes %RELEASE_NOTES%

echo Release %VERSION% completed successfully!
pause
