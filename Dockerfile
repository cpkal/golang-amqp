FROM golang:1.22

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .
RUN go build -o ./emit emit_route.go
RUN go build -o ./receive receive_route.go


