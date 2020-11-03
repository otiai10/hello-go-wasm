.DEFAULT: all

all: clean build

build:	server/static/wasm/main.wasm server/static/js/wasm_exec.js

server/static/wasm/main.wasm:
	GOOS=js GOARCH=wasm go build  -o ./server/static/wasm/main.wasm ./client/main.go

server/static/js/wasm_exec.js:
	mkdir -p ./server/static/js
	cp "${GOROOT}/misc/wasm/wasm_exec.js" ./server/static/js/wasm_exec.js

clean:
	rm -rf server/static/wasm/*.wasm
