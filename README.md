# handy-tools

## Tools List

- [testssl.sh][0]
- [empire][1]
- [CMSmap][2]
	- Do not forget to update Plugins after install
		- `cmsmap -U P`
- [subfinder][3]
- [recursebuster][4]
	- Update error fix
		- `rm ~/go/bin/recursebuster`
		- `rm -rf ~/go/src/github.com/c-sto`
		- `go get github.com/c-sto/recursebuster`
		- ```
		  rm ~/go/bin/recursebuster
		  rm -rf ~/go/src/github.com/c-sto
		  go get github.com/c-sto/recursebuster 
		  ```
- [jwt_tool][5]
- [SecLists][6]
- [nullinux][7]
- [venom][8] (Meterpreter Payload AV Bypass Tool)
- [LinEnum][9]
- [linuxprivchecker][10]
- [crackmapexec][11]
- [ps1-toolkit][12] (Obfucation version of PowerSploit)
- [WindowsEnum][13]
- [Windows-Exploit-Suggester][14]
- [Seth][15] (Windows RDP MiTM Exploit Tool)
- [MITMf][16]
- [SigThief][17]
- [SIET][18] (Cisco Smart Installation Exploit Tool)
- [CloudFail][19]
- [nmap-vulners][20]
- [Infoga][21] (Emails harvester)
- [eyeBeam][22] (WEB Screenshot Tool)
- [ObfuscatedEmpire][23] (AV Bypass Empire)

Burpsuite Pro

- [sublime-text][sublime]
	- install Material theme
		- Preference -> Package Settings -> Material Theme -> Active
	- install Emmet plugins
	- install SublimeLinter
	- install SublimeCodeIntel
	- install SublimeREPL
	- install FileDiffs
	- install Alignment
	- install OmniMarkupPreviewer

[0]: https://testssl.sh/
[1]: https://github.com/EmpireProject/Empire
[2]: https://github.com/Dionach/CMSmap
[3]: https://github.com/subfinder/subfinder#direct-installation
[4]: https://github.com/C-Sto/recursebuster
[5]: https://github.com/ticarpi/jwt_tool
[6]: https://github.com/danielmiessler/SecLists
[7]: https://github.com/m8r0wn/nullinux
[8]: https://github.com/r00t-3xp10it/venom
[9]: https://github.com/rebootuser/LinEnum
[10]: https://github.com/sleventyeleven/linuxprivchecker
[11]: https://github.com/byt3bl33d3r/CrackMapExec
[12]: https://github.com/vysec/ps1-toolkit.git
[13]: https://github.com/absolomb/WindowsEnum
[14]: https://github.com/GDSSecurity/Windows-Exploit-Suggester
[15]: https://github.com/SySS-Research/Seth
[16]: https://github.com/byt3bl33d3r/MITMf
[17]: https://github.com/secretsquirrel/SigThief
[18]: https://github.com/Sab0tag3d/SIET
[19]: https://github.com/m0rtem/CloudFail
[20]: https://github.com/vulnersCom/nmap-vulners
[21]: https://github.com/The404Hacking/Infoga
[22]: https://github.com/F4l13n5n0w/eyeBeam
[23]: https://github.com/cobbr/ObfuscatedEmpire

[sublime]: https://www.sublimetext.com/3

---
```
git clone https://github.com/F4l13n5n0w/handy-tools
cd handy-tools
<after any changing>
git add *
git commit -m "updated something"
git push -u origin master
```

