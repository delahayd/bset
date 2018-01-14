# $Id$

include ../config

SHELL:=/bin/bash
PRINCESS=princess-casc
E=eprover
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
	-@wc -l princess.*; echo -n "Total time (valid): "; \
        grep "Valid time" *.res.princess | cut -d: -f3 | paste -s -d + - | bc; \
        wc -l e.*; echo -n "Total time (valid): "; \
        grep "Valid time" *.res.e | cut -d: -f3 | paste -s -d + - | bc

clean:
	rm -f *~ *.res* *.time princess.* e.*

.SUFFIXES: .p .res

%.res: %.p
	-@echo -n "[Princess] **** Testing file $<: "; touch $@; \
        { /usr/bin/time -f "%U + %S" bash -c \
        "ulimit -v `expr $(MEMLIMIT) \* 1000`; \
        $(PRINCESS) -timeout=$(TIMEOUT) $< &> $@.princess"; } 2> $@.time; \
        tmp=`cat $@.princess | grep "SZS status Theorem"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        echo "Valid time: `cat $@.time | bc`" >> $@.princess;  \
        else echo -e "\033[31mFail\033[39m"; fi; rm $@.time; \
        echo -n "[E] **** Testing file $<: "; \
        { /usr/bin/time -f "%U + %S" bash -c \
        "$(E) -s --auto --cpu-limit=$(TIMEOUT) --memory-limit=$(MEMLIMIT) $< \
        &> $@.e"; } 2> $@.time; tmp=`cat $@.e | grep "SZS status Theorem"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        echo "Valid time: `cat $@.time | bc`" >> $@.e;  \
        else echo -e "\033[31mFail\033[39m"; fi; rm $@.time
