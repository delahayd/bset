% Definitions of the B set theory

tff(power, type, pow: !>[A : $tType]: (set(A) > set(set(A)))).

tff(mem_power, axiom, ![A : $tType]: ![S:set(A), T:set(A)]:
    (mem(set(A), S, pow(A, T)) <=> ![X:A]: (mem(A, X, S) => mem(A, X, T)))).
