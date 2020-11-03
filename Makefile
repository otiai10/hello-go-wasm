.DEFAULT: all

all: clean build

build:	server/static/wasm/main.wasm

server/static/wasm/main.wasm:
	GOOS=js GOARCH=wasm go build  -o ./server/static/wasm/main.wasm ./client/main.go

clean:
	rm -rf server/static/wasm/*.wasm
