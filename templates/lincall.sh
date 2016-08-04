#!/bin/sh

if [ $# -ne 1 ]; then
	echo "usage: $0 number" >&2
	exit 1
fi

number=$(echo $1 | sed <% @protocols.each do |protocol| %>-e 's/^<%= protocol %>://' <% end %>)

<%= @linphone_path %> -c "${number}"
