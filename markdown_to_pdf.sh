#!/bin/bash

main() {
    pandoc "${1}.md" --pdf-engine=xelatex -o "${1}.pdf"
    echo "Created ${1}.pdf from ${1}.md"
}

main "$1"
