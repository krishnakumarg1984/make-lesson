.PHONY: clean dats

# Generate summary table.
results.txt: abyss.dat isles.dat last.dat
	python testzipf.py $^ >| $@

# Count words.
dats: isles.dat abyss.dat last.dat

abyss.dat: books/abyss.txt
	python countwords.py $< $@

isles.dat: books/isles.txt
	python countwords.py $< $@

last.dat: books/last.txt
	python countwords.py $< $@

clean:
	rm -rf *.dat clean *.png results.txt
