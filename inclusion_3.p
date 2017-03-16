tff(inclusion_3, conjecture, ![A : $tType]: ![S:set(A), A1:set(A), B:
    set(A), C:set(A)]: ((subset(A, A1, S) & (subset(A, B, S) &
    subset(A, C, S))) => (subset(A, inter(A, A1, B), C) <=>
    subset(A, A1, union(A, diff(A, S, B), C))))).
