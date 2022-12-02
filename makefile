all: README.md

README.md:
	echo "# Coursera: The Unix Workbench" > README.md
	echo "* Make file was executed at:" $$(date "+%Y-%m-%d %H:%M:%S") >> README.md
	echo "* Lines of code in guessinggame.sh: $$(cat guessinggame.sh | wc -l)" >> README.md
