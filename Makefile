.PHONY: all cv cl

all: cl cv

cl:
	xelatex cl.tex

cv:
	xelatex cv.tex
