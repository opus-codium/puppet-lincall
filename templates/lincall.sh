#!/bin/sh

if [ $# -ne 1 ]; then
	echo "usage: $0 number" >&2
	exit 1
fi

number=$(echo $1 | sed -e 's/^call://' -e 's/^tel://' -e 's/^sip://')

<%= @linphone_path %> -c "${number}"
