# $Id$

WHY=why3
FLAGS=-L . -o .
DRIVERS=/home/delahaye/.opam/4.04.0/share/why3/drivers
FILE=lemmes_bbook.why

fof:
	$(WHY) prove $(FLAGS) -D $(DRIVERS)/tptp.gen $(FILE); \
        make rename; rm -f ../fof/*.p; mv *.p ../fof

tff:
	$(WHY) prove $(FLAGS) -D $(DRIVERS)/tptp-tff1.drv $(FILE); \
        make rename; rm -f ../tff/*.p; mv *.p ../tff

cvc4:
	$(WHY) prove $(FLAGS) -D $(DRIVERS)/cvc4_15.drv $(FILE); \
        make rename; rm -f ../cvc4/*.smt2; mv *.smt2 ../cvc4

alt-ergo:
	$(WHY) prove $(FLAGS) -D $(DRIVERS)/alt_ergo.drv ../why/$(FILE); \
        rm -f ../alt-ergo/*.why; for file in lemmes_bbook-B_book_lemmas-*; \
        do mv "$$file" "../alt-ergo/$${file#lemmes_bbook-B_book_lemmas-}"; done

rename:
	for file in lemmes_bbook-B_book_lemmas-*; \
        do mv "$$file" "$${file#lemmes_bbook-B_book_lemmas-}"; done

clean:
	rm -rf *~
