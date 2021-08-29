package main

import (
	"os"
	"path/filepath"
	"testing"
)

func TestMain(t *testing.T) {
	files, _ := filepath.Glob("../testdata/*.xml")
	for _, file := range files {
		os.Args = []string{os.Args[0], file}
		main()
	}
}
