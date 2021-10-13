PORT?=8000
PACKAGE:=github.com/oceanbolt/grpc-zerolog
COVERAGE:=coverage.txt
proto:
	protoc -I protos/ protos/*.proto --go_out=module=github.com/oceanbolt/grpc-zerolog:. --go-grpc_out=require_unimplemented_servers=false,module=github.com/oceanbolt/grpc-zerolog:.

godoc:
	echo "localhost:${PORT}/pkg/${PACKAGE}"
	godoc -http=:${PORT}

.PHONY: test

test:
	go test -race -coverprofile=${COVERAGE} -covermode=atomic

coverage:
	go tool cover -html=${COVERAGE}
