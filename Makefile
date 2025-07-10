.PHONY: clean dats

# Generate summary table.
results.txt: testzipf.py abyss.dat isles.dat last.dat
	python $^ >| $@

# Count words.
dats: isles.dat abyss.dat last.dat

abyss.dat: books/abyss.txt countwords.py
	python countwords.py $< $@

isles.dat: books/isles.txt countwords.py
	python countwords.py $< $@

last.dat: books/last.txt countwords.py
	python countwords.py $< $@

clean:
	rm -rf *.dat clean *.png results.txt
