FROM golang:1.17-alpine as builder
COPY . /go/src
WORKDIR /go/src
RUN apk add make && \
    make deps && \
    make build


FROM alpine:3.14
ARG PACKAGE=github.com/dinakar29/junit2md
ENTRYPOINT ["junit2md"]
COPY --from=builder /go/src/${PACKAGE}/junit2md /bin/
