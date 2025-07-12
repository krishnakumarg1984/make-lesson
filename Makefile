SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c

# .DEFAULT_GOAL := dats

.PHONY: all clean dats help pngs variables

include config.mk
include makext.mk

all: $(ZIPF_ARCHIVE) # Generate archive of code, data, plots, summary table, Makefile, and config.mk.

$(ZIPF_ARCHIVE) : $(ZIPF_DIR)
	tar -czf $@ $<

$(ZIPF_DIR): Makefile config.mk makext.mk $(RESULTS_FILE) \
             $(DAT_FILES) $(PNG_FILES) $(TXT_DIR) \
             $(COUNT_SRC) $(PLOT_SRC) $(ZIPF_SRC)
	mkdir -p $@
	cp -r $^ $@
	touch $@

$(RESULTS_FILE): $(ZIPF_SRC) $(DAT_FILES) # Generate Zipf summary table.
	$(LANGUAGE) $^ >| $@

pngs: $(PNG_FILES) # produce a png plot for each dat file using plotcounts.py

%.png: $(PLOT_SRC) %.dat
	$(LANGUAGE) $^ $@

dats: $(DAT_FILES) # Count words in text files.

%.dat: $(COUNT_SRC) books/%.txt
	$(LANGUAGE) $^ $@

clean: # Remove auto-generated files.
	rm -f $(DAT_FILES)
	rm -f $(RESULTS_FILE)
	rm -f $(PNG_FILES)
	rm -rf $(ZIPF_DIR)
	rm -f $(ZIPF_ARCHIVE)
	rm -rf __pycache__ out.png

variables: # Print variables.
	@echo TXT_DIR: $(TXT_DIR)
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
	@echo PNG_FILES: $(PNG_FILES)
	@echo ZIPF_DIR: $(ZIPF_DIR)
	@echo ZIPF_ARCHIVE: $(ZIPF_ARCHIVE)

# help: Makefile
# 	@sed -n 's/^##//p' $<

help: .help

