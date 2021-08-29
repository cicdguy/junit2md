# junit2md

[![Keep a Changelog](https://img.shields.io/badge/changelog-Keep%20a%20Changelog-%23E05735)](CHANGELOG.md)
[![GitHub Release](https://img.shields.io/github/v/release/dinakar29/junit2md)](https://github.com/dinakar29/junit2md/releases)
[![Go Reference](https://pkg.go.dev/badge/github.com/dinakar29/junit2md.svg)](https://pkg.go.dev/github.com/dinakar29/junit2md)
[![go.mod](https://img.shields.io/github/go-mod/go-version/dinakar29/junit2md)](go.mod)
[![LICENSE](https://img.shields.io/github/license/dinakar29/junit2md)](LICENSE)
[![Build Status](https://img.shields.io/github/workflow/status/dinakar29/junit2md/build)](https://github.com/dinakar29/junit2md/actions?query=workflow%3Abuild+branch%3Amain)
[![Go Report Card](https://goreportcard.com/badge/github.com/dinakar29/junit2md)](https://goreportcard.com/report/github.com/dinakar29/junit2md)
[![Codecov](https://codecov.io/gh/dinakar29/junit2md/branch/main/graph/badge.svg)](https://codecov.io/gh/dinakar29/junit2md)

Tool to convert a JUnit XML report to Markdown.

## Installation

Simply download the binary for your platform from the [releases section](https://github.com/dinakar29/junit2md/releases) on this repository.

You may also run the following to auto-install the binary to your `$GOPATH/bin` directory:

```shell
go get github.com/dinakar29/junit2md
```

## Usage

```
$ make dockerbuild
$ cd *application*
$ docker run -v target/test-reports:/test-reports junit2md /test-reports
# Test results
### com.example.handlers.HelloRequestHandlerTest
|Success|Test|
|-------|----|
|✅|getResponse should say hello to someone when asked|
|❌|getResponse should be extra polite when speaking to a queen|
```

# -->

# Test results
### com.example.handlers.HelloRequestHandlerTest
|Success|Test|
|-------|----|
|✅|getResponse should say hello to someone when asked|
|❌|getResponse should be extra polite when speaking to a queen|
