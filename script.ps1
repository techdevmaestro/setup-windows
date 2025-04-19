# Remember to run: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Set-Location -Path "$HOME\Downloads"

function Show-Menu {
    Clear-Host
    Write-Host "====================="
    Write-Host "      Main Menu      "
    Write-Host "====================="
    Write-Host "1. Run CTT Script and OOShutup10"
    Write-Host "2. Download Chocolatey"
    Write-Host "3. Download Apps"
    Write-Host "R. Reboot"
    Write-Host "Q. Quit"
    Write-Host "====================="
}
do {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection) {
        '1' {
            Write-Host "You chose Run CTT Script and OOShutup10"
            Invoke-WebRequest -Uri https://raw.githubusercontent.com/techdevmaestro/full-windows-setup/refs/heads/main/christitus.json -OutFile .\christitus.json
            Invoke-WebRequest -Uri https://raw.githubusercontent.com/techdevmaestro/full-windows-setup/refs/heads/main/ooshutup10.cfg -OutFile .\ooshutup10.cfg
            Invoke-RestMethod christitus.com/win | Invoke-Expression
                    $OOSU_filepath = "$ENV:temp\OOSU10.exe"
                    $Initial_ProgressPreference = $ProgressPreference
                    $ProgressPreference = "SilentlyContinue" # Disables the Progress Bar to drasticly speed up Invoke-WebRequest
                    Invoke-WebRequest -Uri "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -OutFile $OOSU_filepath
                    Write-Host "Starting OO Shutup 10 ..."
                    Start-Process $OOSU_filepath
                    Write-Host "OO Shutup 10 has been started. Please follow the instructions in the GUI." -ForegroundColor Green
            }
        '2' {
            Write-Host "You chose Download Chocolatey"
            Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
            choco feature enable -n allowGlobalConfirmation
            }
        '3' {
            Write-Host "You chose Download Apps"
            choco install vcredist-all
            choco install 7zip
            choco install epicgameslauncher
            choco install qbittorrent
            choco install steam --ignore-checksums
            choco install vlc
            choco install nbfc
            choco install javaruntime
            choco install bulk-crap-uninstaller
            choco install obsidian
            choco install betterbird
            choco install cryptomator
            choco install slack
            Write-Output Y | winget install 9PFHDD62MXS1
#           Write-Output Y | winget install Apple.iCloud it's not working, you need to download it manually
            Write-Output Y | winget install 9NP83LWLPZ9K      
            Invoke-WebRequest -Uri "https://sideloadly.io/SideloadlySetup64.exe" -OutFile SideloadlySetup64.exe
            Invoke-WebRequest -Uri "https://gitlab.com/api/v4/projects/44042130/packages/generic/librewolf/137.0.2-1/librewolf-137.0.2-1-windows-x86_64-setup.exe" -OutFile Librewolf.exe
            Invoke-WebRequest -Uri "https://pocketcasts.com/get/windows" -OutFile Pocketcast.exe
            Invoke-WebRequest -Uri "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=O365ProPlusRetail&platform=x64&language=en-us&version=O16GA" -OutFile Office.exe
            Invoke-WebRequest -Uri "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x64" -OutFile Discordsetup.exe
            Invoke-WebRequest -Uri "https://languagetool.org/download/windows-desktop/Languagetool.Packaging.appinstaller" -OutFile Languagetool.Packaging.appinstaller
            }
        'r' {
            Restart-Computer
            }
        'q' {
            Write-Host "Exiting the menu."
            }
        default{
            Write-Host "Invalid selection. Please try again."
            }
    }
    if ($selection -ne 'q') {
        Pause
    }
} until ($selection -eq 'q')