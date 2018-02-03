# $Id$

include config

MAKEFLAGS += --silent
BENCHS=alt-ergo tff zf
RESDIR=results
RES=results_`date +%d-%m-%y`_$(TIMEOUT)s_$(MEMLIMIT)Mo

all:
	for i in $(BENCHS); do cd $$i; make; cd ..; done

summary:
	for i in $(BENCHS); do echo "==== $$i ====" | tee -a $(RESDIR)/$(RES); \
        cd $$i; make summary | tee -a ../$(RESDIR)/$(RES); cd ..; done

clean:
	rm -f *~ .*~; for i in $(BENCHS); do cd $$i; make clean; cd ..; done
