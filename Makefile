SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
# .DEFAULT_GOAL := dats

.PHONY: clean dats

COUNT_SRC = countwords.py
ZIPF_SRC = testzipf.py
LANGUAGE = python

# Generate summary table.
results.txt: $(ZIPF_SRC) abyss.dat isles.dat last.dat
	python $^ >| $@

# Count words.
dats: isles.dat abyss.dat last.dat

%.dat: $(COUNT_SRC) books/%.txt
	python $^ $@

clean:
	rm -rf *.dat clean *.png results.txt __pycache__ .venv
