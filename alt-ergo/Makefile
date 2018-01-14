# $Id$

include ../config

SHELL:=/bin/bash
ALTERGO=alt-ergo
BFILES=$(shell ls *.why)
BRESFILES=$(BFILES:%.why=%.res)

test: $(BRESFILES)

analyze:
	-@grep -l "Valid" *.res.alt-ergo | sort -V > alt-ergo.valid; \
	grep -l "I don't know" *.res.alt-ergo | sort -V > alt-ergo.unknown; \
        grep -l "Timeout" *.res.alt-ergo | sort -V > alt-ergo.limit

summary: analyze
	-@wc -l alt-ergo.*; echo -n "Total time (valid): "; \
        grep "Valid time" *.res.alt-ergo | cut -d: -f3 | paste -s -d + - | bc

clean:
	rm -f *~ *.res* *.time alt-ergo.*

.SUFFIXES: .why .res

%.res: %.why
	-@echo -n "[Alt-Ergo] **** Testing file $<: "; touch $@; \
        { /usr/bin/time -f "%U + %S" bash -c \
        "ulimit -v `expr $(MEMLIMIT) \* 1000`; \
        $(ALTERGO) -timelimit $(TIMEOUT) $< > $@.alt-ergo"; } 2> $@.time; \
        tmp=`cat $@.alt-ergo | grep "Valid"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        echo "Valid time: `cat $@.time | bc`" >> $@.alt-ergo; \
        else echo -e "\033[31mFail\033[39m"; fi; rm $@.time
