package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"text/template"

	"github.com/joshdk/go-junit"
)

func main() {
	// Validate args
	if len(os.Args) != 2 {
		fmt.Printf("Usage: %s [filename]\n", os.Args[0])
		os.Exit(1)
	}

	// Read report
	file := os.Args[1]
	f, err := ioutil.ReadFile(file)
	if err != nil {
		log.Fatal(err)
	}

	// Ingest results
	suites, err := junit.Ingest(f)
	if err != nil {
		log.Fatal(err)
	}

	// Determine whether any tests were failed
	var noFailingBuilds = true
	for _, suite := range suites {
		if suite.Totals.Failed > 0 {
			noFailingBuilds = false
		}
	}

	// Define template
	tmpl, err := template.New("md").Parse(mdtemplate)
	if err != nil {
		log.Fatal(err)
	}

	// Print markdown
	err = tmpl.Execute(os.Stdout, suites)
	if err != nil {
		log.Fatal(err)
	}

	if noFailingBuilds {
		fmt.Println("#### 🙌 All tests passed!")
	}
}
