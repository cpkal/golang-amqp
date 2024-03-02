FROM golang:1.22

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .
RUN go build -o ./emit emit.go
RUN go build -o ./receive receive.go

CMD ["./emit"]
CMD ["./receive"]

