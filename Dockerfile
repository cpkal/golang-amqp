FROM golang:1.22

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .
RUN go build -o ./emit rpc_client.go
RUN go build -o ./receive rpc_server.go