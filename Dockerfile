FROM golang:1.22

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .
RUN go build -o ./emit emit_topic.go
RUN go build -o ./receive receive_topic.go