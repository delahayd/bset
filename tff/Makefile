# $Id$

include ../config

SHELL:=/bin/bash
ZENMOD=zenon_modulo
BFILES=$(shell ls *.p)
BRESFILES=$(BFILES:%.p=%.res)

test: $(BRESFILES)

analyze:
	-@grep -l "PROOF-FOUND" *.res.zen-mod | sort -V > zen-mod.valid; \
	grep -l "NO-PROOF" *.res.zen-mod | sort -V > zen-mod.fail

summary: analyze
	-@wc -l zen-mod.*; echo -n "Total time (valid): "; \
        grep "Valid time" *.res.zen-mod | cut -d: -f3 | paste -s -d + - | bc

clean:
	rm -f *~ *.res* *.time zen-mod.*

.SUFFIXES: .p .res

%.res: %.p
	-@echo -n "[Zenon Modulo] **** Testing file $<: "; touch $@; \
        { /usr/bin/time -f "%U + %S" bash -c \
        "$(ZENMOD) -p0 -itptp -modulo-heuri -max-size $(MEMLIMIT)M \
        -max-time $(TIMEOUT)s $< > $@.zen-mod"; } 2> $@.time; \
        tmp=`cat $@.zen-mod | grep "PROOF-FOUND"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        echo "Valid time: `cat $@.time | bc`" >> $@.zen-mod; \
        else echo -e "\033[31mFail\033[39m"; fi; rm $@.time
