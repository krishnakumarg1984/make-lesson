# Count words script.
LANGUAGE = python
COUNT_SRC = countwords.py
PLOT_SRC = plotcounts.py

# Test Zipf's rule
ZIPF_SRC = testzipf.py

TXT_DIR = books

DAT_FILES = $(patsubst $(TXT_DIR)/%.txt, %.dat, $(TXT_FILES))
PNG_FILES = $(patsubst %.dat, %.png, $(DAT_FILES))
RESULTS_FILE = results.txt
TXT_FILES = $(wildcard $(TXT_DIR)/*.txt)

ZIPF_DIR = zipf_analysis
ZIPF_ARCHIVE = $(ZIPF_DIR).tar.gz
