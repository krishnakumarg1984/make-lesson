SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c

# .DEFAULT_GOAL := dats

.PHONY: clean dats variables

include config.mk

# Generate summary table.
results.txt: $(ZIPF_SRC) $(DAT_FILES)
	$(LANGUAGE) $^ >| $@

# Count words.
dats: $(DAT_FILES)

%.dat: $(COUNT_SRC) books/%.txt
	$(LANGUAGE) $^ $@

clean:
	rm -f $(DAT_FILES)
	rm -f results.txt
	rm -f $(PNG_FILES)
	rm -rf __pycache__ .venv

variables:
	@echo TXT_FILES: $(TXT_FILES)
	@echo DAT_FILES: $(DAT_FILES)
	@echo PNG_FILES: $(PNG_FILES)
