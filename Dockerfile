FROM golang:1.22

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .
RUN go build -o ./sender sender.go
RUN go build -o .receiver receiver.go

CMD ["./sender"]
CMD ["./receiver"]

