FROM golang:1.18-alpine3.15

RUN go install github.com/uw-labs/lichen@latest

COPY entrypoint.sh /entrypoint.sh
COPY lichen.sh /lichen.sh
COPY lichen-cfg.yaml /lichen-cfg.yaml

ENTRYPOINT ["/entrypoint.sh"]
