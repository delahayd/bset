# Makefile

ZIPPER=zipperposition
TIMEOUT=3
MEMLIMIT=2000
SBFILES=subset_reflexivity.zf subset_antisymmetry.zf subset_monotonicity_1.zf \
  subset_monotonicity_2.zf subset_inclusion_2.zf property_211.zf \
  union_commutativity.zf inter_commutativity.zf union_associativity.zf \
  inter_associativity.zf inter_union_distributivity.zf \
  union_inter_distributivity.zf diff_union_distributivity.zf \
  diff_inter_distributivity.zf diff_diff_distributivity.zf \
  union_diff_distributivity.zf inter_diff_distributivity.zf \
  union_times_distributivity.zf inter_times_distributivity.zf \
  diff_times_distributivity.zf times_union_distributivity.zf \
  times_inter_distributivity.zf times_diff_distributivity.zf \
  union_excluded_middle.zf inter_excluded_middle.zf \
  union_idempotence.zf inter_idempotence.zf union_neutral_element.zf inter_neutral_element.zf \
  inter_union_absorption.zf union_inter_absorption.zf inter_absorption.zf \
  union_absorption.zf diff_absorption_1.zf diff_absorption_2.zf diff_empty.zf \
  double_complementation.zf monotonicity_1.zf monotonicity_2.zf monotonicity_3.zf \
  monotonicity_4.zf monotonicity_5.zf union_de_morgan.zf inter_de_morgan.zf \
  inclusion_1.zf inclusion_2.zf inclusion_3.zf \
  subset_transitivity.zf  equal_domain_1.zf equal_domain_2.zf equal_domain_3.zf \
  equal_domain_4.zf equal_domain_5.zf equal_domain_6.zf equal_domain_7.zf equal_domain_8.zf

SBRESFILES=$(SBFILES:%.zf=%.res)
BFILES=$(shell find \( -name '*.zf' \) -and \( -not -name bset.zf \))
BRESFILES=$(BFILES:%.zf=%.res)

test: $(SBRESFILES)

test-all: $(BRESFILES)

clean:
	rm -f *~ *.res

.SUFFIXES: .zf .res

%.res: %.zf bset.zf
	-@echo -n "**** Testing file $<: "; \
        $(ZIPPER) --timeout $(TIMEOUT) --mem-limit $(MEMLIMIT) $< > $@; \
        tmp=`cat $@ | grep "% SZS status Theorem"`; \
        if test -n "$$tmp"; then echo -e "\033[32mValid\033[39m"; \
        else echo -e "\033[31mFail\033[39m"; fi
