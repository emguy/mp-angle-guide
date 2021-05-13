project_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
project_name := $(shell basename $(project_dir))

all:
	context main.mp
	cat main.pdf > /home/emguy/share/$(project_name).pdf

clean:
	rm -f *.pdf *.tuo *.log *.tuc
