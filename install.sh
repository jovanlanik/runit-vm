#!/bin/sh
[ -z $VMDIR ] && VMDIR="$HOME/.local/vms"
echo "Installing to $VMDIR..."
[ ! -d "$VMDIR" ] && mkdir -p $VMDIR
[ ! -e "$VMDIR/default" ] && ln -s ./default "$VMDIR/default"
echo "Done. Only thing left to do is link vm somewhere in PATH:"
echo "$PATH"
echo "~/.local/bin/ is recommended"
