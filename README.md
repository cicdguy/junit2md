# junit2md

[![Changelog](https://img.shields.io/badge/changelog-Keep%20a%20Changelog-%23E05735)](CHANGELOG.md)
[![GitHub Releases](https://img.shields.io/github/v/release/cicdguy/junit2md)](https://github.com/cicdguy/junit2md/releases)
[![go.mod](https://img.shields.io/github/go-mod/go-version/cicdguy/junit2md)](go.mod)
[![LICENSE](https://img.shields.io/github/license/cicdguy/junit2md)](LICENSE.md)
[![CodeQL](https://github.com/cicdguy/junit2md/actions/workflows/codeql.yml/badge.svg)](https://github.com/cicdguy/junit2md/actions/workflows/codeql.yml)
[![Go Report Card](https://goreportcard.com/badge/github.com/cicdguy/junit2md)](https://goreportcard.com/report/github.com/cicdguy/junit2md)
[![Codecov](https://codecov.io/gh/cicdguy/junit2md/branch/main/graph/badge.svg)](https://codecov.io/gh/cicdguy/junit2md)
[![Lint Code Base](https://github.com/cicdguy/junit2md/actions/workflows/linter.yml/badge.svg)](https://github.com/cicdguy/junit2md/actions/workflows/linter.yml)
[![Tests](https://github.com/cicdguy/junit2md/actions/workflows/test.yml/badge.svg)](https://github.com/cicdguy/junit2md/actions/workflows/test.yml)

Tool to convert a JUnit XML report to Markdown.

This project is based on https://github.com/pagero/junit-to-markdown.

## Installation

Simply download the binary for your platform from the [releases section](https://github.com/cicdguy/junit2md/releases) on this repository.

You may also run the following to auto-install the binary to your `$GOPATH/bin` directory:

```shell
go get github.com/cicdguy/junit2md
```

## Usage

`junit2md` simply prints the Markdown output to stdout and takes the JUnit XML report as the only argument.

```shell
junit2md <file>
```

Using Docker, you can run the following command:

```
docker run -v <file>:/tmp/ ghcr.io/cicdguy/junit2md:latest /tmp/<file>
```
