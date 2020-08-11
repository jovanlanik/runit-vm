# runit-vm
QEMU wrapper using runit to manage vms
## Installation
`$ ./install.sh` will install runit-vm to $VMDIR. If not set defaults to `~/.local/vms`
Afterwards add `./vm` to $PATH and start the vmd service with runit.
## Usage
`$ vm help` shows usage of all commands and enviroment variables.
## Behaviour
When a vm is started it reads all templates in its directory and adds them to QEMU arguments.
The special template `once` is deleted after being added.
A named pipe is opened at `./supervise/monitor` for the QEMU monitor input.
The monitor output is logged if the log folder is linked from the default vm.
When the vm receives a TERM signal it sends `system_powerdown` to QEMU and waits for `./wait` seconds before killing QEMU.
This is so that ACPI compliant systems have time to gracefully poweroff.
## Autostart
To autostart a vm with the vmd service remove `./down' in the vm directory.
It's recommended to use with the `nographic` template.
