# $Id$

MAKEFLAGS += --silent
BENCHS=alt-ergo cvc4 fof tff zf

all:
	for i in $(BENCHS); do cd $$i; make; cd ..; done

summary:
	for i in $(BENCHS); do echo "==== $$i ===="; cd $$i; make summary; \
        cd ..; done

clean:
	rm -f *~ .*~; for i in $(BENCHS); do cd $$i; make clean; cd ..; done
