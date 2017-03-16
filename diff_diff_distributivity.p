tff(diff_diff_distributivity, conjecture, ![A : $tType]: ![A1:set(A), B:
    set(A), C:set(A)]: diff(A, A1, diff(A, B, C)) =
    union(A, diff(A, A1, B), inter(A, A1, C))).
