# $Id$

include ../config

SHELL:=/bin/bash
ZIPPER=zipperposition
ARCHSAT=archsat
BFILES=$(shell find \( -name '*.zf' \) -and \( -not -name bset.zf \))
BRESFILES=$(BFILES:%.zf=%.res)

test: $(BRESFILES)

analyze:
	-@grep -l 'Counter' *.res.archsat | sort -V > archsat.fail; \
        grep -l 'Counter' *.res.archsat-norew | sort -V > archsat-norew.fail; \
	grep -l 'Counter' *.res.zipper | sort -V > zipper.fail; \
	grep -l 'Theorem' *.res.archsat | sort -V > archsat.valid; \
	grep -l 'Theorem' *.res.archsat-norew | sort -V > archsat-norew.valid; \
	grep -l 'Theorem' *.res.zipper | sort -V > zipper.valid; \
	egrep -l 'TimeOut|MemoryOut|ResourceOut' *.res.archsat | \
        sort -V > archsat.limit; \
	egrep -l 'TimeOut|MemoryOut|ResourceOut' *.res.archsat-norew | \
        sort -V > archsat-norew.limit; \
        echo "[`$(ZIPPER) --version`]"; \
	egrep -l 'TimeOut|MemoryOut|ResourceOut' *.res.zipper | \
        sort -V > zipper.limit; \
	egrep -l 'Unknown|GaveUp' *.res.archsat | sort -V > archsat.unkown; \
	egrep -l 'Unknown|GaveUp' *.res.archsat-norew | \
        sort -V > archsat-norew.unkown; \
	egrep -l 'Unknown|GaveUp' *.res.zipper | sort -V > zipper.unkown; \
	grep -l 'Error' *.res.archsat | sort -V > archsat.error; \
	grep -l 'Error' *.res.archsat-norew | sort -V > archsat-norew.error; \
	grep -l 'Error' *.res.zipper | sort -V > zipper.error

summary: analyze
	-@wc -l zipper.*; echo -n "Total time (valid): "; \
        grep "Valid time" *.res.zipper | cut -d: -f3 | paste -s -d + - | bc; \
        wc -l archsat.*; echo -n "Total time (valid): "; \
        grep "Valid time" *.res.archsat | cut -d: -f3 | paste -s -d + - | bc; \
        wc -l archsat-norew.*; echo -n "Total time (valid): "; \
        grep "Valid time" *.res.archsat-norew | cut -d: -f3 | \
        paste -s -d + - | bc

frogtest:
	frogtest run -c conf.toml

clean:
	rm -f *~ *.res* *.time zipper.* archsat.*

.SUFFIXES: .zf .res

%.res: %.zf bset.zf
	-@echo -n "[Zipper] **** Testing file $<: "; touch $@; \
        { /usr/bin/time -f "%U + %S" bash -c \
        "$(ZIPPER) --timeout $(TIMEOUT) --mem-limit $(MEMLIMIT) $< \
        > $@.zipper"; } 2> $@.time; \
        tmp=`cat $@.zipper | grep "SZS status Theorem"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        echo "Valid time: `cat $@.time | bc`" >> $@.zipper; \
        else echo -e "\033[31mFail\033[39m"; fi; rm $@.time; \
        echo -n "[ArchSat (Rewrite)] **** Testing file $<: "; \
        { /usr/bin/time -f "%U + %S" bash -c \
        "$(ARCHSAT) -x +rwrt,+meta --meta.find=super -t $(TIMEOUT)s \
        -s $(MEMLIMIT)M -o SZS $< &> $@.archsat"; } 2> $@.time; \
        tmp=`cat $@.archsat | grep "SZS status Theorem"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        echo "Valid time: `cat $@.time | bc`" >> $@.archsat; \
        else echo -e "\033[31mFail\033[39m"; fi; rm $@.time; \
        echo -n "[ArchSat (No Rewrite)] **** Testing file $<: "; \
        { /usr/bin/time -f "%U + %S" bash -c \
        "$(ARCHSAT) -x +meta --meta.find=super -t $(TIMEOUT)s \
        -s $(MEMLIMIT)M -o SZS $< &> $@.archsat-norew"; } 2> $@.time; \
        tmp=`cat $@.archsat-norew | grep "SZS status Theorem"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        echo "Valid time: `cat $@.time | bc`" >> $@.archsat-norew; \
        else echo -e "\033[31mFail\033[39m"; fi; rm $@.time
