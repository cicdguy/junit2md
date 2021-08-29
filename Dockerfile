ARG APP_NAME=junit2md

FROM golang:1.17-alpine as builder
ARG APP_NAME
COPY . /go/src
WORKDIR /go/src
RUN CGO_ENABLED=0 GOARCH=linux GOOS=amd64 GO111MODULE=on go build -o dist/$APP_NAME ./...


FROM scratch
ARG APP_NAME
ENV APP_NAME=$APP_NAME
COPY --from=builder /go/src/dist/$APP_NAME /$APP_NAME
ENTRYPOINT /$APP_NAME
