FROM golang:1.18 as builder

WORKDIR /app

COPY . .

RUN go build app/main.go

FROM scratch as prod

COPY --from=builder /app/main ./

CMD ["./main"]

