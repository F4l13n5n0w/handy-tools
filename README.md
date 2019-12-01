# handy-tools

This is a bash script to automatically install tools when setup a Kali linux or ubuntu linux. 

## Tools List

- [testssl.sh][0]
- [sslyze][24]
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
- [aquatone][25] (Fast Web Screenshots)
- [takeover][26] (Subdomain Takeover Finder)
- [interlace][27] (single-thread to multi-thread)
- [webscreenshot][28] (python based url to screenshot image tool)
- [altdns][29] (subdomain discovery tool)
- [rtfm][30] (searchable RTFM)
- [Winpayloads][31] (AV Bypassed Windows payload generator)
- [dirsearch][32] (brute force directories and files in websites)
- [amass][33](OWASP Amass subdomain discovery, have to manually install for latest version)
- [massdns][34](A high-performance DNS stub resolver)
- [SubOver][35](A Powerfull Subdomain Takeover Tool -- Discontinued)
- [dnsvalidator][36](A very fast subdomain validator)
- [findomain][37](The fastest and cross-platform subdomain enumerator)


Burpsuite Pro

- [vscode][vscode]
	- install Python extension
	- install Gist extension
	- install ESLint extension

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
[24]: https://github.com/nabla-c0d3/sslyze
[25]: https://github.com/michenriksen/aquatone
[26]: https://github.com/m4ll0k/takeover
[27]: https://github.com/codingo/Interlace
[28]: https://github.com/maaaaz/webscreenshot
[29]: https://github.com/infosec-au/altdns
[30]: https://github.com/leostat/rtfm
[31]: https://github.com/nccgroup/Winpayloads
[32]: https://github.com/maurosoria/dirsearch
[33]: https://github.com/OWASP/Amass/releases
[34]: https://github.com/blechschmidt/massdns/
[35]: https://github.com/Ice3man543/SubOver
[36]: https://github.com/vortexau/dnsvalidator
[37]: https://github.com/Edu4rdSHL/findomain



[sublime]: https://www.sublimetext.com/3
[vscode]: https://medium.com/@calypsobronte/vs-code-in-kali-linux-2018-4-9e96e92d13ca

---
```
git clone https://github.com/F4l13n5n0w/handy-tools
cd handy-tools
<after any changing>
git add *
git commit -m "updated something"
git push -u origin master
```

