#!/bin/sh

docker run --rm -v `pwd`:/dir -v `pwd`/{{GIT_DIRECTORY}}:/source \
	-e RUSTC=/dir/$RUSTC_RELATIVE -e CARGO_RELATIVE jimmycuadra/rust \
	bash -c 'cd /source && rm -fr target ; /dir/$CARGO_RELATIVE test' \
	2>&1 | rg -q '{{ERROR MESSAGE}}'
