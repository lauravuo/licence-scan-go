FROM golang:1.16-alpine3.13

RUN go get github.com/uw-labs/lichen

COPY entrypoint.sh /entrypoint.sh
COPY lichen.sh /lichen.sh
COPY lichen-cfg.yaml /lichen-cfg.yaml

ENTRYPOINT ["/entrypoint.sh"]