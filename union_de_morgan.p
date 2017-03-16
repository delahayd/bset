tff(union_de_morgan, conjecture, ![A : $tType]: ![S:set(A), A1:set(A), B:
    set(A)]: ((subset(A, A1, S) & subset(A, B, S)) =>
    diff(A, S, union(A, A1, B)) = inter(A, diff(A, S, A1), diff(A, S, B)))).
