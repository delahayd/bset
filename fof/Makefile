# $Id$

SHELL:=/bin/bash
PRINCESS=princess-casc
E=eprover
TIMEOUT=3
MEMLIMIT=2000
BFILES=$(shell ls *.p)
BRESFILES=$(BFILES:%.p=%.res)

test: $(BRESFILES)

analyze:
	-@grep -l 'SZS status Theorem' *.res.princess | sort -V > \
        princess.valid; \
	grep -l 'SZS status Theorem' *.res.e | sort -V > e.valid; \
	grep -l 'SZS status Timeout' *.res.princess | \
        sort -V > princess.limit; \
	grep -l 'SZS status ResourceOut' *.res.e | sort -V > e.limit

summary: analyze
	-@wc -l princess.*; wc -l e.*

clean:
	rm -f *~ *.res*

.SUFFIXES: .p .res

%.res: %.p
	-@echo -n "[Princess] **** Testing file $<: "; touch $@; \
        $(PRINCESS) -timeout=$(TIMEOUT) $< &> $@.princess; \
        tmp=`cat $@.princess | grep "SZS status Theorem"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        else echo -e "\033[31mFail\033[39m"; fi; \
        echo -n "[E] **** Testing file $<: "; \
        $(E) -s --auto --cpu-limit=$(TIMEOUT) --memory-limit=$(MEMLIMIT) $< &> \
        $@.e; tmp=`cat $@.e | grep "SZS status Theorem"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        else echo -e "\033[31mFail\033[39m"; fi
