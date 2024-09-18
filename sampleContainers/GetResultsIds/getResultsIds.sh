#!/bin/sh

if [ $# = 3 ] ; then
	testEventId="$1"
	input="$2"
	output="$3"
	cat<<EOF > "$output"
{
	"testEventId": "$testEventId",
	"resultIds": [
		"$(gunzip -c "$input" | sha256sum -b - | cut -f 1 -d ' ')"
	]
}
EOF
	exit $?
else
	echo "Usage: $0 {testEventId} {input} {resultsIdsFile}" 1>&2
	exit 1
fi
