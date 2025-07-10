.PHONY: clean dats

# Generate summary table.
results.txt: testzipf.py abyss.dat isles.dat last.dat
	python $^ >| $@

# Count words.
dats: isles.dat abyss.dat last.dat

%.dat: countwords.py books/%.txt
	python $^ $@

clean:
	rm -rf *.dat clean *.png results.txt
