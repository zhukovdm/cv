OUT_DIR := ./out
TARGETS := cl cv

.PHONY: all

all: $(TARGETS)

$(TARGETS): %: %.tex
	mkdir -p $(OUT_DIR)
	latexmk -output-directory=$(OUT_DIR) -xelatex $?

clean:
	rm -rf $(OUT_DIR)
