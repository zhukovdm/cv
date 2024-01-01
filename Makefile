OUT_DIR := ./out
TARGETS := cl cv
XELATEX := xelatex -output-directory=$(OUT_DIR)

.PHONY: all

all: $(TARGETS)

$(TARGETS): %: %.tex
	mkdir -p $(OUT_DIR) && $(XELATEX) $? && $(XELATEX) $?

clean:
	rm -rf $(OUT_DIR)
