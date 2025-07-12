SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c

# .DEFAULT_GOAL := dats

.PHONY: clean dats help pngs variables

include config.mk
include makext.mk

help: .help

all: results.txt $(PNG_FILES)  # make results.txt and pngs

results.txt: $(ZIPF_SRC) $(DAT_FILES) # Generate Zipf summary table.
	$(LANGUAGE) $^ >| $@

pngs: $(PNG_FILES) # produce a png plot for each dat file using plotcounts.py

%.png: $(PLOT_SRC) %.dat
	$(LANGUAGE) $^ $@

dats: $(DAT_FILES) # Count words in text files.

%.dat: $(COUNT_SRC) books/%.txt
	$(LANGUAGE) $^ $@

clean: # Remove auto-generated files.
	rm -f $(DAT_FILES)
	rm -f results.txt
	rm -f $(PNG_FILES)
	rm -rf __pycache__ .venv out.png

variables: # Print variables.
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
	@echo PNG_FILES: $(PNG_FILES)

# help: Makefile
# 	@sed -n 's/^##//p' $<
