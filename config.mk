# Count words script.
LANGUAGE = python
COUNT_SRC = countwords.py
PLOT_SRC = plotcounts.py

# Test Zipf's rule
ZIPF_SRC = testzipf.py

TXT_FILES = $(wildcard books/*.txt)
DAT_FILES = $(patsubst books/%.txt, %.dat, $(TXT_FILES))
PNG_FILES = $(patsubst %.dat, %.png, $(DAT_FILES))
