# Windows
Setting up a reliable development enviornment for the Windows OS is slightly more challenging than Linux, but we prefer you use WSL to get running. Once WSL is running you can simply run the [setup-enviornment.sh](https://github.com/E-Commerce-Umbrella/Documents/blob/main/setup-enviornment.sh) script to automate the setup or follow along [step by step](https://github.com/E-Commerce-Umbrella/Documents/blob/main/Linux.md).

### 1) Install the Windows Subsystem for Linux
Before installing any Linux distributions on Windows, you must enable the "Windows Subsystem for Linux" optional feature.

### 2) Open PowerShell as Administrator and run: PowerShell
```PowerShell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

To only install WSL 1, you should now restart your machine and move on to Install your Linux distribution of choice, **otherwise wait to restart and move on to update to WSL 2**. Read more about Comparing WSL 2 and WSL 1.

### 3) Update to WSL 2
To update to WSL 2, you must meet the following criteria:
* Running Windows 10, updated to version 1903 or higher, Build 18362 or higher for x64 systems.
* Running Windows 10, updated to version 2004 or higher, build 19041, for ARM64 systems.
Please note if you are on [updated to version 1903 or higher](ms-settings:windowsupdate) you will need to ensure that you have the proper backport, instructions can be [found here](https://devblogs.microsoft.com/commandline/wsl-2-support-is-coming-to-windows-10-versions-1903-and-1909/#how-do-i-get-it).

Check your Windows version by selecting the Windows logo key + R, type winver, select OK. (Or enter the ver command in Windows Command Prompt). Please update to the latest Windows version if your build is lower than 18361. Get Windows Update Assistant.

### 4) Enable the 'Virtual Machine Platform' optional component
Before installing WSL 2, you must enable the "Virtual Machine Platform" optional feature.

Open PowerShell as Administrator and run: 
```PowerShell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
Restart your machine to complete the WSL install and update to WSL 2.

### 5) Set WSL 2 as your default version
Open PowerShell as Administrator and run this command to set WSL 2 as the default version when installing a new Linux distribution: PowerShell

```PowerShell
wsl --set-default-version 2
```
You might see this message after running that command: WSL 2 requires an update to its kernel component. For information please visit https://aka.ms/wsl2kernel. Please follow the link (https://aka.ms/wsl2kernel) and install the MSI from that page on our documentation to install a Linux kernel on your machine for WSL 2 to use. Once you have the kernel installed, please run the command again and it should complete successfully without showing the message.

### 5) Install your Linux distribution of choice
1. Open the Microsoft Store and select your favorite Linux distribution.
![Store](https://docs.microsoft.com/en-us/windows/wsl/media/store.png)
2. From the distribution's page, select "Get".
![Store Get](https://docs.microsoft.com/en-us/windows/wsl/media/ubuntustore.png)
3. Set up a new distribution
The first time you launch a newly installed Linux distribution, a console window will open and you'll be asked to wait for a minute or two for files to de-compress and be stored on your PC. All future launches should take less than a second.

You will then need to [create a user account and password for your new Linux distribution](https://docs.microsoft.com/en-us/windows/wsl/user-support).
![new](https://docs.microsoft.com/en-us/windows/wsl/media/ubuntuinstall.png)

