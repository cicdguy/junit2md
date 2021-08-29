FROM golang:1.17-alpine as builder
COPY . /go/src
WORKDIR /go/src
RUN apk add --no-cache make && \
    make build && \
    rm -rf /var/cache/apk/*


FROM scratch
COPY --from=builder /go/src/dist/junit2md_*_linux-amd64 /junit2md
ENTRYPOINT ["/junit2md"]
