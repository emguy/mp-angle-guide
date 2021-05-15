project_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
project_name := $(shell basename $(project_dir))

all:
	context main.mp
	mkdir -p dist
	cp main.pdf dist/$(project_name).pdf
	if [ -d ${HOME}/share ]; then \
    cat main.pdf > ${HOME}/share/$(project_name).pdf; \
  fi

gfx:
	pdftoppm -png -scale-to 700 main.pdf > graphics/${project_name}.png

clean:
	rm -f *.pdf *.tuo *.log *.tuc
