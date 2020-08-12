# runit-vm
QEMU wrapper using runit to manage vms
## Installation
### Dependencies
- runit

Distros with runit like void work out of the box.
Some distros package it as an alternative (devuan, artix).
Others package `runit-systemd` (debian, arch).
Arch also includes a runit implementation in busybox but it is the only distro I know of that does.
You can also try installing runit manually or building busybox yourself.
- qemu
### Automatic install
`$ ./install.sh` will install runit-vm to $VMDIR.
If not set it defaults to `~/.local/vms`.
### Manual install
Create a directory for your vms.
In the directory make a symlink to `./default`.
Set $VMDIR in profile.
### Post install
Add `./vm` to $PATH and start the vmd service with runit.
## Usage
`$ vm help` shows usage of all commands and enviroment variables.
## Behaviour
When a vm is started it reads all templates in `./templates/` and adds them to QEMU arguments.
The special template `once` is deleted after being added.
A named pipe is opened at `./supervise/monitor` for the QEMU monitor input.
The monitor output is logged if the log folder is linked from the default vm.
When the vm receives a TERM signal it sends `system_powerdown` to QEMU and waits for `./wait` seconds before killing QEMU.
This is so that ACPI compliant systems have time to gracefully poweroff.
## Autostart
To autostart a vm with the vmd service remove `./down` in the vm directory.
It's recommended to use with the `display-none` template.
The vm will restart if it crashes or is powered off.
Use `$ vm sv` to manage it.
