## Create Ubuntu VM in VirtualBox

- [ ] Open 'Oracle VM VirtualBox Manager'
- [ ] Click 'New'
- [ ] Name: ubuntu-16.04, Type: Linux, Version: Ubuntu (64 bit)
- [ ] Click 'Continue'
- [ ] 4096 MB
- [ ] Click 'Continue'
- [ ] Create a virtual hard disk now
- [ ] Click 'Create'
- [ ] VDI (VirtualBox Disk Image)
- [ ] Click 'Continue'
- [ ] Fixed size
- [ ] Click 'Continue'
- [ ] 40 GB
- [ ] Click 'Create'
- [ ] In VirtualBox Manager, select your new virtual machine and click 'Settings' button. Click on 'Storage' category and then 'Empty' under Controller:IDE. Click "CD/DVD" icon on right hand side and select the ubuntu ISO file to mount.
- [ ] Click 'OK'
- [ ] In VirtualBox Manager, select your new virtual machine and click 'Start' button.

### Install Ubuntu

- [ ] Select 'English' and 'Install Ubuntu'
- [ ] Check 'Download updates while installing' and 'Install this third-party software'
- [ ] Click 'Continue'
- [ ] Select 'Erase disk and install Ubuntu'
- [ ] Click 'Install Now'
- [ ] Kolkata
- [ ] Click 'Continue'
- [ ] English (US) and English (US)
- [ ] Click 'Continue'
- [ ] Your name: rohan-elear
	  Your computer's name: rohan-elear-ubuntu
	  Pick a username: rohan-elear
- [ ] Select 'Require my password to login'
- [ ] Click 'Continue'
- [ ] Click 'Restart Now'
- [ ] Hit 'Enter' if this message appears - 'Please remove the installation medium and the press Enter'

### Share clipboard between Mac as host and Ubuntu as guest on VirtualBox
- [ ] Click Devices > Insert Guest Additions CD images
- [ ] Click 'Run'
- [ ] When the installation is finished, press Return key to close the terminal window.
- [ ] Restart Ubuntu
- [ ] Right click on the CD icon on the launchbar and click 'Eject'
- [ ] Devices > Shared Clipboard > Bidirectional

### Post Installation
- [ ] Install required build components
	```shell
	sudo apt-get update
	sudo apt-get dist-upgrade
	sudo apt-get install build-essential
	sudo apt-get install git
	sudo apt-get install autoconf
	sudo apt-get install libtool
	sudo apt-get install cmake
	sudo apt-get install makeinfo
	sudo apt-get install texinfo
	sudo apt-get install sqlite3
	```
- [ ] Configure git
	```shell
	git config --global user.name "<username>"
	git config --global user.email "<email>@@users.noreply.github.com"
	```
- [ ] Make workspace
	```shell
	mkdir Developer
	```
- [ ] Clone repositories in workspace
- [ ] Setup lxc
- [ ] Install Chrome
- [ ] Install Dropbox
- [ ] Setup shared folder
	`/Users/<username>/virtual-box-shared`
	
[source](https://linus.nci.nih.gov/bdge/installUbuntu.html)