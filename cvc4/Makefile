# $Id$

include ../config

SHELL:=/bin/bash
CVC4=cvc4
BFILES=$(shell ls *.smt2)
BRESFILES=$(BFILES:%.smt2=%.res)

test: $(BRESFILES)

analyze:
	-@grep -l "unsat" *.res.cvc4 | sort -V > cvc4.valid; \
	grep -l "unknow" *.res.cvc4 | sort -V > cvc4.unknown

summary: analyze
	-@wc -l cvc4.*; echo -n "Total time (valid): "; \
        grep "Valid time" *.res.cvc4 | cut -d: -f3 | paste -s -d + - | bc

clean:
	rm -f *~ *.res* *.time cvc4.*

.SUFFIXES: .smt2 .res

%.res: %.smt2
	-@echo -n "[CVC4] **** Testing file $<: "; touch $@; \
        { /usr/bin/time -f "%U + %S" bash -c \
        "ulimit -v `expr $(MEMLIMIT) \* 1000`; \
        $(CVC4) --tlimit=`expr $(TIMEOUT) \* 1000` $< > $@.cvc4"; } \
        2> $@.time; tmp=`cat $@.cvc4 | grep "unsat"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        echo "Valid time: `cat $@.time | bc`" >> $@.cvc4; \
        else echo -e "\033[31mFail\033[39m"; fi; rm $@.time
