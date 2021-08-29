package main

const mdtemplate = `
{{- range .}}
	{{- if gt .Totals.Failed 0 }}
### 💔 One or more tests have failed.
<details><summary>Expand to view details</summary>

#### {{.Name}}

|Status|Test|Classname|Duration|
|------|----|---------|--------|
		{{- range .Tests}}
			{{- if .Error}}
|❌|{{.Name}}|{{.Classname}}|{{.Duration}}|
			{{- else}}
|✔|{{.Name}}|{{.Classname}}|{{.Duration}}|			
			{{- end}}
		{{- end}}

</details>

	{{- end}}
{{- end}}
`
