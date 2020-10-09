#!/bin/sh
[ -z $VMDIR ] && VMDIR="$HOME/.local/vms"
echo "Installing to $VMDIR..."
[ ! -d "$VMDIR" ] && mkdir -p $VMDIR
[ ! -e "$VMDIR/default" ] && ln -s $(realpath ./default) "$VMDIR/.default"
echo "Done."
