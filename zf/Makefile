# $Id$

SHELL:=/bin/bash
ZIPPER=zipperposition
ARCHSAT=archsat
TIMEOUT=3
MEMLIMIT=2000
BFILES=$(shell find \( -name '*.zf' \) -and \( -not -name bset.zf \))
BRESFILES=$(BFILES:%.zf=%.res)

test: $(BRESFILES)

analyze:
	-@grep -l 'Counter' *.res.archsat | sort -V > archsat.fail; \
	grep -l 'Counter' *.res.zipper | sort -V > zipper.fail; \
	grep -l 'Theorem' *.res.archsat | sort -V > archsat.valid; \
	grep -l 'Theorem' *.res.zipper | sort -V > zipper.valid; \
	egrep -l 'TimeOut|MemoryOut|ResourceOut' *.res.archsat | \
        sort -V > archsat.limit; \
	egrep -l 'TimeOut|MemoryOut|ResourceOut' *.res.zipper | \
        sort -V > zipper.limit; \
	egrep -l 'Unknown|GaveUp' *.res.archsat | sort -V > archsat.unkown; \
	egrep -l 'Unknown|GaveUp' *.res.zipper | sort -V > zipper.unkown; \
	grep -l 'Error' *.res.archsat | sort -V > archsat.error; \
	grep -l 'Error' *.res.zipper | sort -V > zipper.error

summary: analyze
	-@wc -l zipper.*; wc -l archsat.*

frogtest:
	frogtest run -c conf.toml

clean:
	rm -f *~ *.res* zipper.* archsat.*

.SUFFIXES: .zf .res

%.res: %.zf bset.zf
	-@echo -n "[Zipper] **** Testing file $<: "; touch $@; \
        $(ZIPPER) --timeout $(TIMEOUT) --mem-limit $(MEMLIMIT) $< > $@.zipper; \
        tmp=`cat $@.zipper | grep "SZS status Theorem"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        else echo -e "\033[31mFail\033[39m"; fi ; \
        echo -n "[ArchSat] **** Testing file $<: "; \
        $(ARCHSAT) -x +rwrt,+meta --meta.find=simple -t $(TIMEOUT)s \
        -s $(MEMLIMIT)M -o SZS $< &> $@.archsat; \
        tmp=`cat $@.archsat | grep "SZS status Theorem"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        else echo -e "\033[31mFail\033[39m"; fi
