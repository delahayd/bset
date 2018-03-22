# Benchmark "bset" of Problems in the B Set Theory

----

## Contents

This repository gathers 319 problems in the B set theory coming from Chap. 2 of
the B-Book [1].

Several formats are available and can be used by several automated deduction
tools:

* Why3 (in directory *why*): this is a generic format that can be used to
produce, by means of the Why3 tool, several input formats for automated
deduction tools
* FOF (in directory *fof*): the TPTP FOF format for first order formulas
* TFF (in directory *tff*): the TPTP TFF format for monomorphic and polymorphic
typed first order formulas
* ZF (in directory *zf*): a format for polymorphic typed first order formulas
with rewriting rules (used by Zipperposition and ArchSat)
* SMT-LIB (in directory *cvc4*): the SMT-LIB format for first order (sorted)
formulas (used by SMT solvers)
* Alt-Ergo (in directory *alt-ergo*): a format for polymorphic typed first order
formulas used by the Alt-Ergo SMT solver

[1] J.-R. Abrial. *The B-Book, Assigning Programs to Meanings.* Cambridge
University Press, Cambridge (UK), 1996. ISBN 0521496195.

## Considered Tools

The automated deduction tools considered in this experiment are the following:

* E and Princess (using the FOF format)
* Zenon Modulo (using the TFF format)
* Zipperposition and ArchSat (using the ZF format)
* CVC4 (using the SMT-LIB format)
* Alt-Ergo (using the native Alt-Ergo format)

These tools are not part of this repository. You have to install them
separately.

## Running the Tests

To run the tests, you must:

1. Edit the file *config* the set the timeout (in second) and the memory limit
(in Mo)
2. Edit the file *Makefile* and set the variable BENCHS appropriately according
to the tools that you want to run (by default, only Zipperposition, ArchSat,
Zenon Modulo, and Alt-Ergo are run)
3. Run *make* to start the tests
4. Once finished, run *make summary* to display the results; a file is also
created in directory *results* with the date and the configuration of the test
(timeout and memory limit)

Note: you must have the GNU *time* command available (and installed in the
directory */usr/bin*).

## Running Another Tool

To run your own tool, there are two cases:

1. Either your tool recognizes one of the provided input formats. In this case,
you just have to copy the directory corresponding to your input format and adapt
the Makefile (within the directory) to call your tool. You also have to set the
variable BENCHS of the root Makefile adding your directory.
2. Or your tool uses another input format. In this case, you have to use the
Why3 tool to produce your input proof formats from the files in the *why*
directory. If your input format is not handled by Why3, you will have to convert
the files manually or you may contact the Why3 team to include your tool and
format to their set of recognized tools. Once done, go to (1) and follow the
instructions.

## Contacts

If you have any question or problem using this benchmark, or just want to give
us feedback, please feel free to contact us at the following addresses:

* [David Delahaye](http://www.lirmm.fr/~delahaye/)
([David.Delahaye@lirmm.fr](mailto:David.Delahaye@lirmm.fr), LIRMM, Université de
Montpellier, CNRS, Montpellier, France)
* [Simon Cruanes](http://cedeela.fr/~simon/)
([simon@aestheticintegration.com](mailto:simon@aestheticintegration.com),
Aesthetic Integration, Austin (Texas), USA)
* [Guillaume Bury](https://gbury.eu/)
([Guillaume.Bury@inria.fr](mailto:Guillaume.Bury@inria.fr), LSV, ENS
Paris-Saclay, Inria, Cachan, France)
