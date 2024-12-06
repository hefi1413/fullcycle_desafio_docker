FROM golang:1.9-alpine AS builder

WORKDIR /src/app

COPY helloworld.go .

RUN go build -o helloworld .

FROM scratch

COPY --from=builder /src/app/helloworld ./helloworld

CMD ["./helloworld"]