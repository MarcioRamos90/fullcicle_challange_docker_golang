FROM golang:1.22.0-alpine3.19 AS builder
WORKDIR /app
COPY . .
RUN go build -ldflags="-s -w" -o main .

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .
ENTRYPOINT [ "./main" ]
