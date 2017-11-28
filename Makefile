# Makefile

SHELL:=/bin/bash
ZIPPER=zipperposition
ARCHSAT=/home/guigui/build/archsat/archsat
TIMEOUT=3
MEMLIMIT=2000
BFILES=$(shell find \( -name '*.zf' \) -and \( -not -name bset.zf \))
BRESFILES=$(BFILES:%.zf=%.res)

test: $(BRESFILES)

clean:
	rm -f *~ *.res*

frogtest:
	frogtest run -c conf.toml

.SUFFIXES: .zf .res

%.res: %.zf bset.zf
	-@echo -n "[Zipper] **** Testing file $<: "; touch $@; \
        $(ZIPPER) --timeout $(TIMEOUT) --mem-limit $(MEMLIMIT) $< > $@.zipper; \
        tmp=`cat $@.zipper | grep "SZS status Theorem"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        else echo -e "\033[31mFail\033[39m"; fi ; \
        echo -n "[ArchSat] **** Testing file $<: "; \
        $(ARCHSAT) -x +rwrt,+meta --meta.find=simple -t 3 -s $(MEMLIMIT)M -o SZS $< &> $@.archsat; \
        tmp=`cat $@.archsat | grep "SZS status Theorem"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        else echo -e "\033[31mFail\033[39m"; fi

analyze: $(BRESFILES)
	grep -l 'Counter' *.res.archsat | sort -V > archsat.fail
	grep -l 'Theorem' *.res.archsat | sort -V > archsat.valid
	egrep -l 'TimeOut|MemoryOut' *.res.archsat | sort -V > archsat.limit
	grep -l 'Unknown' *.res.archsat | sort -V > archsat.unkown
