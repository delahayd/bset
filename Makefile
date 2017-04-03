# Makefile

ZIPPER=zipperposition
TIMEOUT=3
MEMLIMIT=2000
BFILES=$(shell find \( -name '*.zf' \) -and \( -not -name bset.zf \))
BRESFILES=$(BFILES:%.zf=%.res)

test: $(BRESFILES)

clean:
	rm -f *~ *.res

frogtest:
	frogtest run -c conf.toml

.SUFFIXES: .zf .res

%.res: %.zf bset.zf
	-@echo -n "**** Testing file $<: "; \
        $(ZIPPER) --timeout $(TIMEOUT) --mem-limit $(MEMLIMIT) $< > $@; \
        tmp=`cat $@ | grep "% SZS status Theorem"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        else echo -e "\033[31mFail\033[39m"; fi
