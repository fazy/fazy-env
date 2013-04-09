#!/bin/sh

# This can be used to copy a directory from one host to another.
# It eliminates latency problems with many small files by using
# tar at both ends.

# TODO - get rid of hard coding; this is just an example for now.

rm -rf ~/www/sf2pwn/vendor ; \
	ssh lars@lars-vm "cd /var/www/sf2pwn && tar czpf - vendor --strip-components=3" \
	| tar xzpf - -C ~/www/sf2pwn

