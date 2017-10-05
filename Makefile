#! /usr/bin/env make

# TODO : use xelatex as latex-engine

PROJECT		= git-training
TEAM		= photobox
OUTPUT		= ${PROJECT}_${TEAM}.pdf
CWD		= `pwd`
SRCDIR		= 'src'

DOCKER_OUTDIR	= /srv/slides/output

S3_BUCKET	= https://s3.eu-west-2.amazonaws.com/formation-conteneurs

# That's so sad.
# https://stackoverflow.com/questions/8077010/how-to-use-parenthesis-in-dependency-in-makefile
# http://www.linuxforums.org/forum/programming-scripting/129073-makefile-shell-parenthesis.html
LPAR		:=(
IMAGES		= $(shell grep -oh '[^${LPAR}]\+.\(png\|jpg\)' src/ -R)
SOURCES		= `find ${SRCDIR} -iname '[[:digit:]]-*.md' | sort`

html:: get_images
	@mkdir -p output
	docker run -it --rm \
	  -v ${CWD}/output:${DOCKER_OUTDIR} \
	  -v ${CWD}/src/:/srv/slides/src \
	  -v ${CWD}/theme:/srv/slides/theme \
	  -v ${CWD}/images/:/srv/slides/theme/images \
	  --workdir=/srv/slides/theme \
	  horgix/pandoc pandoc \
	    /srv/slides/src/0-metadata.yml                    \
	    /srv/slides/src/1-vcs-generalities.md             \
	    /srv/slides/src/2-git.md                          \
	    /srv/slides/src/3-hands-on-cli.md                 \
	    /srv/slides/src/4-real-life-git.md                \
	    /srv/slides/src/5-hands-on-github.md              \
	    --from markdown \
	    --to beamer \
	    --standalone \
	    --smart \
	    --variable theme=metropolis \
	    --variable links-as-notes \
	    --output ${DOCKER_OUTDIR}/${OUTPUT}
	@ln -sf output/${OUTPUT} ${OUTPUT}
	#--toc \

lint::
	docker run --rm \
	  -v ${CWD}/src:/srv/src                            \
	  -v ${CWD}/tests/lint_style.rb:/srv/lint_style.rb  \
	  --workdir /srv                                    \
	    mivok/markdownlint:0.4.0 --style lint_style.rb .

spell::
	docker run --rm -it \
	  -v ${CWD}/src:/srv/src                            \
	  -v ${CWD}/tests/hunspell.dic:/srv/hunspell.dic    \
	  --workdir=/srv                                    \
	    jbonachera/hunspell -d fr -p /srv/hunspell.dic  \
	      ${SOURCES}

test:: lint

get_images: ${IMAGES}

images/%.png images/%.jpg:
	@mkdir -p images
	wget ${S3_BUCKET}/$@ -O $@

clean::
	rm -rf output
	rm -rf images
	rm -f ${OUTPUT}
