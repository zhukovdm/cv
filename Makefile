OUT_DIR := ./out
TARGETS := cl cv

.PHONY: all

all: $(TARGETS:%=%.pdf)

%.pdf: %.tex
	mkdir -p $(OUT_DIR)
	xelatex --output-directory=$(OUT_DIR) $?
	xelatex --output-directory=$(OUT_DIR) $?

clean:
	rm -rf $(OUT_DIR)
