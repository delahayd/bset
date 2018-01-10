fof(witness_sort, axiom, ![A]: (sort(A, witness(A)) = witness(A))).

fof(infix_eqeq_def, axiom, ![A]: ![S, T]: ((infix_eqeq(A, S, T) => ![X]:
  (mem(A, X, S) <=> mem(A, X, T))) & (![X]: ((sort(A, X) = X) => (mem(A, X,
  S) <=> mem(A, X, T))) => infix_eqeq(A, S, T)))).

fof(power_sort, axiom, ![A]: ![X]: (sort(set(set(A)), power(A, X)) = power(A,
  X))).

fof(non_empty_power_sort, axiom, ![A]: ![X]: (sort(set(set(A)),
  non_empty_power(A, X)) = non_empty_power(A, X))).

fof(subset_def, axiom, ![A]: ![S, T]: (subset(A, S, T) <=> mem(set(A), S,
  power(A, T)))).

fof(subsetnoteq_def, axiom, ![A]: ![S, T]: (subsetnoteq(A, S, T)
  <=> (subset(A, S, T) & ~ infix_eqeq(A, S, T)))).

fof(empty_sort, axiom, ![A]: (sort(set(A), empty(A)) = empty(A))).

fof(is_empty_def, axiom, ![A]: ![S]: ((is_empty(A, S) => ![X]: ~ mem(A, X,
  S)) & (![X]: ((sort(A, X) = X) => ~ mem(A, X, S)) => is_empty(A, S)))).

fof(empty_def1, axiom, ![A]: is_empty(A, empty(A))).

fof(empty, axiom, ![A]: ![X]: ~ mem(A, X, empty(A))).

fof(add_sort, axiom, ![A]: ![X, X1]: (sort(set(A), add(A, X, X1)) = add(A, X,
  X1))).

fof(add_def1, axiom, ![A]: ![X, Y]: ![S]: ((mem(A, X, add(A, Y, S))
  => ((sort(A, X) = sort(A, Y)) | mem(A, X, S))) & (((X = Y) | mem(A, X, S))
  => mem(A, X, add(A, Y, S))))).

fof(singleton_sort, axiom, ![A]: ![X]: (sort(set(A), singleton(A,
  X)) = singleton(A, X))).

fof(mem_singleton, axiom, ![A]: ![X, Y]: ((mem(A, X, singleton(A, Y))
  => (sort(A, X) = sort(A, Y))) & ((X = Y) => mem(A, X, singleton(A, Y))))).

fof(remove_sort, axiom, ![A]: ![X, X1]: (sort(set(A), remove(A, X,
  X1)) = remove(A, X, X1))).

fof(remove_def1, axiom, ![A]: ![X, Y, S]: ((mem(A, X, remove(A, Y, S)) => (~
  (X = Y) & mem(A, X, S))) & ((~ (sort(A, X) = sort(A, Y)) & mem(A, X, S))
  => mem(A, X, remove(A, Y, S))))).

fof(all_sort, axiom, ![A]: (sort(set(A), all(A)) = all(A))).

fof(all_def, axiom, ![A]: ![X]: mem(A, X, all(A))).

fof(union_sort, axiom, ![A]: ![X, X1]: (sort(set(A), union(A, X,
  X1)) = union(A, X, X1))).

fof(mem_union, axiom, ![A]: ![S, T, X]: (mem(A, X, union(A, S, T))
  <=> (mem(A, X, S) | mem(A, X, T)))).

fof(inter_sort, axiom, ![A]: ![X, X1]: (sort(set(A), inter(A, X,
  X1)) = inter(A, X, X1))).

fof(mem_inter, axiom, ![A]: ![S, T, X]: (mem(A, X, inter(A, S, T))
  <=> (mem(A, X, S) & mem(A, X, T)))).

fof(diff_sort, axiom, ![A]: ![X, X1]: (sort(set(A), diff(A, X, X1)) = diff(A,
  X, X1))).

fof(mem_diff, axiom, ![A]: ![S, T, X]: (mem(A, X, diff(A, S, T)) <=> (mem(A,
  X, S) & ~ mem(A, X, T)))).

fof(tuple2_sort, axiom, ![A, A1]: ![X, X1]: (sort(tuple2(A1, A), tuple21(A1,
  A, X, X1)) = tuple21(A1, A, X, X1))).

fof(tuple2_proj_1_sort, axiom, ![A, A1]: ![X]: (sort(A1, tuple2_proj_1(A1, A,
  X)) = tuple2_proj_1(A1, A, X))).

fof(tuple2_proj_1_def, axiom, ![A, A1]: ![U, U1]: (tuple2_proj_1(A1, A,
  tuple21(A1, A, U, U1)) = sort(A1, U))).

fof(tuple2_proj_2_sort, axiom, ![A, A1]: ![X]: (sort(A, tuple2_proj_2(A1, A,
  X)) = tuple2_proj_2(A1, A, X))).

fof(tuple2_proj_2_def, axiom, ![A, A1]: ![U, U1]: (tuple2_proj_2(A1, A,
  tuple21(A1, A, U, U1)) = sort(A, U1))).

fof(tuple2_inversion, axiom, ![A, A1]: ![U]: (sort(tuple2(A1, A),
  U) = tuple21(A1, A, tuple2_proj_1(A1, A, U), tuple2_proj_2(A1, A, U)))).

fof(times_sort, axiom, ![A, B]: ![X, X1]: (sort(set(tuple2(A, B)), times(B,
  A, X, X1)) = times(B, A, X, X1))).

fof(mem_times, axiom, ![A, B]: ![S, T, X, Y]: (mem(tuple2(A, B), tuple21(A,
  B, X, Y), times(B, A, S, T)) <=> (mem(A, X, S) & mem(B, Y, T)))).

fof(mem_power, axiom, ![A]: ![S, T]: ((mem(set(A), S, power(A, T)) => ![X]:
  (mem(A, X, S) => mem(A, X, T))) & (![X]: ((sort(A, X) = X) => (mem(A, X, S)
  => mem(A, X, T))) => mem(set(A), S, power(A, T))))).

fof(mem_non_empty_power, axiom, ![A]: ![S, T]: ((mem(set(A), S,
  non_empty_power(A, T)) => (![X]: (mem(A, X, S) => mem(A, X, T)) & ~
  infix_eqeq(A, S, empty(A)))) & ((![X]: ((sort(A, X) = X) => (mem(A, X, S)
  => mem(A, X, T))) & ~ infix_eqeq(A, S, empty(A))) => mem(set(A), S,
  non_empty_power(A, T))))).

fof(choose_sort, axiom, ![A]: ![X]: (sort(A, choose(A, X)) = choose(A, X))).

fof(relation_sort, axiom, ![A, B]: ![X, X1]: (sort(set(set(tuple2(A, B))),
  relation(B, A, X, X1)) = relation(B, A, X, X1))).

fof(mem_relation, axiom, ![A, B]: ![U, V, R]: ((mem(set(tuple2(A, B)), R,
  relation(B, A, U, V)) => ![X, Y]: (mem(tuple2(A, B), tuple21(A, B, X, Y),
  R) => (mem(A, X, U) & mem(B, Y, V)))) & (![X, Y]: ((sort(A, X) = X)
  => ((sort(B, Y) = Y) => (mem(tuple2(A, B), tuple21(A, B, X, Y), R)
  => (mem(A, X, U) & mem(B, Y, V))))) => mem(set(tuple2(A, B)), R,
  relation(B, A, U, V))))).

fof(inverse_sort, axiom, ![A, B]: ![X]: (sort(set(tuple2(B, A)), inverse(B,
  A, X)) = inverse(B, A, X))).

fof(mem_inverse, axiom, ![A, B]: ![P, X, Y]: (mem(tuple2(B, A), tuple21(B, A,
  X, Y), inverse(B, A, P)) <=> mem(tuple2(A, B), tuple21(A, B, Y, X), P))).

fof(dom_sort, axiom, ![A, B]: ![X]: (sort(set(A), dom(B, A, X)) = dom(B, A,
  X))).

fof(mem_dom, axiom, ![A, B]: ![P, X]: ((mem(A, X, dom(B, A, P)) => ?[B1]:
  ((sort(B, B1) = B1) & mem(tuple2(A, B), tuple21(A, B, X, B1), P)))
  & (?[B1]: mem(tuple2(A, B), tuple21(A, B, X, B1), P) => mem(A, X, dom(B, A,
  P))))).

fof(ran_sort, axiom, ![A, B]: ![X]: (sort(set(B), ran(B, A, X)) = ran(B, A,
  X))).

fof(mem_ran, axiom, ![A, B]: ![P, X]: ((mem(B, X, ran(B, A, P)) => ?[A1]:
  ((sort(A, A1) = A1) & mem(tuple2(A, B), tuple21(A, B, A1, X), P)))
  & (?[A1]: mem(tuple2(A, B), tuple21(A, B, A1, X), P) => mem(B, X, ran(B, A,
  P))))).

fof(semicolon_sort, axiom, ![A, B, C]: ![X, X1]: (sort(set(tuple2(A, C)),
  semicolon(C, B, A, X, X1)) = semicolon(C, B, A, X, X1))).

fof(mem_semicolon, axiom, ![A, B, C]: ![P, Q, X, Y]: ((mem(tuple2(A, C),
  tuple21(A, C, X, Y), semicolon(C, B, A, P, Q)) => ?[B1]: ((sort(B,
  B1) = B1) & (mem(tuple2(A, B), tuple21(A, B, X, B1), P) & mem(tuple2(B, C),
  tuple21(B, C, B1, Y), Q)))) & (?[B1]: (mem(tuple2(A, B), tuple21(A, B, X,
  B1), P) & mem(tuple2(B, C), tuple21(B, C, B1, Y), Q)) => mem(tuple2(A, C),
  tuple21(A, C, X, Y), semicolon(C, B, A, P, Q))))).

fof(semicolon_back_sort, axiom, ![A, B, C]: ![X, X1]: (sort(set(tuple2(A,
  C)), semicolon_back(C, B, A, X, X1)) = semicolon_back(C, B, A, X, X1))).

fof(semicolon_back, axiom, ![A, B, C]: ![P, Q]: (semicolon_back(C, B, A, Q,
  P) = semicolon(C, B, A, P, Q))).

fof(id_sort, axiom, ![A]: ![X]: (sort(set(tuple2(A, A)), id(A, X)) = id(A,
  X))).

fof(mem_id, axiom, ![A]: ![U, X, Y]: ((mem(tuple2(A, A), tuple21(A, A, X, Y),
  id(A, U)) => (mem(A, X, U) & (sort(A, X) = sort(A, Y)))) & ((mem(A, X, U)
  & (X = Y)) => mem(tuple2(A, A), tuple21(A, A, X, Y), id(A, U))))).

fof(domain_restriction_sort, axiom, ![A, B]: ![X, X1]: (sort(set(tuple2(A,
  B)), domain_restriction(B, A, X, X1)) = domain_restriction(B, A, X, X1))).

fof(mem_domain_restriction, axiom, ![A, B]: ![P, S, X, Y]: (mem(tuple2(A, B),
  tuple21(A, B, X, Y), domain_restriction(B, A, S, P)) <=> (mem(tuple2(A, B),
  tuple21(A, B, X, Y), P) & mem(A, X, S)))).

fof(range_restriction_sort, axiom, ![A, B]: ![X, X1]: (sort(set(tuple2(A,
  B)), range_restriction(B, A, X, X1)) = range_restriction(B, A, X, X1))).

fof(mem_range_restriction, axiom, ![A, B]: ![P, T, X, Y]: (mem(tuple2(A, B),
  tuple21(A, B, X, Y), range_restriction(B, A, P, T)) <=> (mem(tuple2(A, B),
  tuple21(A, B, X, Y), P) & mem(B, Y, T)))).

fof(domain_substraction_sort, axiom, ![A, B]: ![X, X1]: (sort(set(tuple2(A,
  B)), domain_substraction(B, A, X, X1)) = domain_substraction(B, A, X,
  X1))).

fof(mem_domain_substraction, axiom, ![A, B]: ![P, S, X, Y]: (mem(tuple2(A,
  B), tuple21(A, B, X, Y), domain_substraction(B, A, S, P))
  <=> (mem(tuple2(A, B), tuple21(A, B, X, Y), P) & ~ mem(A, X, S)))).

fof(range_substraction_sort, axiom, ![A, B]: ![X, X1]: (sort(set(tuple2(A,
  B)), range_substraction(B, A, X, X1)) = range_substraction(B, A, X, X1))).

fof(mem_range_substraction, axiom, ![A, B]: ![P, T, X, Y]: (mem(tuple2(A, B),
  tuple21(A, B, X, Y), range_substraction(B, A, P, T)) <=> (mem(tuple2(A, B),
  tuple21(A, B, X, Y), P) & ~ mem(B, Y, T)))).

fof(image_sort, axiom, ![A, B]: ![X, X1]: (sort(set(B), image(B, A, X,
  X1)) = image(B, A, X, X1))).

fof(mem_image, axiom, ![A, B]: ![P, W, X]: ((mem(B, X, image(B, A, P, W))
  => ?[A1]: ((sort(A, A1) = A1) & (mem(A, A1, W) & mem(tuple2(A, B),
  tuple21(A, B, A1, X), P)))) & (?[A1]: (mem(A, A1, W) & mem(tuple2(A, B),
  tuple21(A, B, A1, X), P)) => mem(B, X, image(B, A, P, W))))).

fof(infix_lspl_sort, axiom, ![A, B]: ![X, X1]: (sort(set(tuple2(A, B)),
  infix_lspl(B, A, X, X1)) = infix_lspl(B, A, X, X1))).

fof(mem_overriding, axiom, ![A, B]: ![Q, P, X, Y]: (mem(tuple2(A, B),
  tuple21(A, B, X, Y), infix_lspl(B, A, Q, P)) <=> ((mem(tuple2(A, B),
  tuple21(A, B, X, Y), Q) & ~ mem(A, X, dom(B, A, P))) | mem(tuple2(A, B),
  tuple21(A, B, X, Y), P)))).

fof(direct_product_sort, axiom, ![A, B, C]: ![X, X1]: (sort(set(tuple2(A,
  tuple2(B, C))), direct_product(C, B, A, X, X1)) = direct_product(C, B, A,
  X, X1))).

fof(mem_direct_product, axiom, ![A, B, C]: ![F, G, X, Y, Z]: (mem(tuple2(A,
  tuple2(B, C)), tuple21(A, tuple2(B, C), X, tuple21(B, C, Y, Z)),
  direct_product(C, B, A, F, G)) <=> (mem(tuple2(A, B), tuple21(A, B, X, Y),
  F) & mem(tuple2(A, C), tuple21(A, C, X, Z), G)))).

fof(prj1_sort, axiom, ![A, B]: ![X]: (sort(set(tuple2(tuple2(A, B), A)),
  prj1(B, A, X)) = prj1(B, A, X))).

fof(mem_proj_op_1, axiom, ![A, B]: ![S, T, X, Y, Z]: ((mem(tuple2(tuple2(A,
  B), A), tuple21(tuple2(A, B), A, tuple21(A, B, X, Y), Z), prj1(B, A,
  tuple21(set(A), set(B), S, T))) => (mem(tuple2(tuple2(A, B), A),
  tuple21(tuple2(A, B), A, tuple21(A, B, X, Y), Z), times(A, tuple2(A, B),
  times(B, A, S, T), S)) & (sort(A, Z) = sort(A, X))))
  & ((mem(tuple2(tuple2(A, B), A), tuple21(tuple2(A, B), A, tuple21(A, B, X,
  Y), Z), times(A, tuple2(A, B), times(B, A, S, T), S)) & (Z = X))
  => mem(tuple2(tuple2(A, B), A), tuple21(tuple2(A, B), A, tuple21(A, B, X,
  Y), Z), prj1(B, A, tuple21(set(A), set(B), S, T)))))).

fof(prj2_sort, axiom, ![A, B]: ![X]: (sort(set(tuple2(tuple2(A, B), B)),
  prj2(B, A, X)) = prj2(B, A, X))).

fof(mem_proj_op_2, axiom, ![A, B]: ![S, T, X, Y, Z]: ((mem(tuple2(tuple2(A,
  B), B), tuple21(tuple2(A, B), B, tuple21(A, B, X, Y), Z), prj2(B, A,
  tuple21(set(A), set(B), S, T))) => (mem(tuple2(tuple2(A, B), B),
  tuple21(tuple2(A, B), B, tuple21(A, B, X, Y), Z), times(B, tuple2(A, B),
  times(B, A, S, T), T)) & (sort(B, Z) = sort(B, Y))))
  & ((mem(tuple2(tuple2(A, B), B), tuple21(tuple2(A, B), B, tuple21(A, B, X,
  Y), Z), times(B, tuple2(A, B), times(B, A, S, T), T)) & (Z = Y))
  => mem(tuple2(tuple2(A, B), B), tuple21(tuple2(A, B), B, tuple21(A, B, X,
  Y), Z), prj2(B, A, tuple21(set(A), set(B), S, T)))))).

fof(parallel_product_sort, axiom, ![A, B, C, D]: ![X, X1]:
  (sort(set(tuple2(tuple2(A, C), tuple2(B, D))), parallel_product(D, C, B, A,
  X, X1)) = parallel_product(D, C, B, A, X, X1))).

fof(mem_parallel_product, axiom, ![A, B, C, D]: ![H, K, X, Y, Z, W]:
  (mem(tuple2(tuple2(A, C), tuple2(B, D)), tuple21(tuple2(A, C), tuple2(B,
  D), tuple21(A, C, X, Y), tuple21(B, D, Z, W)), parallel_product(D, C, B, A,
  H, K)) <=> (mem(tuple2(A, B), tuple21(A, B, X, Z), H) & mem(tuple2(C, D),
  tuple21(C, D, Y, W), K)))).

fof(infix_plmngt_sort, axiom, ![A, B]: ![X, X1]: (sort(set(set(tuple2(A,
  B))), infix_plmngt(B, A, X, X1)) = infix_plmngt(B, A, X, X1))).

fof(mem_partial_function_set, axiom, ![A, B]: ![S, T, F]: ((mem(set(tuple2(A,
  B)), F, infix_plmngt(B, A, S, T)) => (mem(set(tuple2(A, B)), F, relation(B,
  A, S, T)) & ![X, Y1, Y2]: ((mem(tuple2(A, B), tuple21(A, B, X, Y1), F)
  & mem(tuple2(A, B), tuple21(A, B, X, Y2), F)) => (sort(B, Y1) = sort(B,
  Y2))))) & ((mem(set(tuple2(A, B)), F, relation(B, A, S, T)) & ![X, Y1, Y2]:
  ((sort(A, X) = X) => ((sort(B, Y1) = Y1) => ((sort(B, Y2) = Y2)
  => ((mem(tuple2(A, B), tuple21(A, B, X, Y1), F) & mem(tuple2(A, B),
  tuple21(A, B, X, Y2), F)) => (Y1 = Y2)))))) => mem(set(tuple2(A, B)), F,
  infix_plmngt(B, A, S, T))))).

fof(infix_mnmngt_sort, axiom, ![A, B]: ![X, X1]: (sort(set(set(tuple2(A,
  B))), infix_mnmngt(B, A, X, X1)) = infix_mnmngt(B, A, X, X1))).

fof(mem_total_function_set, axiom, ![A, B]: ![S, T, X]: (mem(set(tuple2(A,
  B)), X, infix_mnmngt(B, A, S, T)) <=> (mem(set(tuple2(A, B)), X,
  infix_plmngt(B, A, S, T)) & infix_eqeq(A, dom(B, A, X), S)))).

fof(infix_gtplgt_sort, axiom, ![A, B]: ![X, X1]: (sort(set(set(tuple2(A,
  B))), infix_gtplgt(B, A, X, X1)) = infix_gtplgt(B, A, X, X1))).

fof(mem_partial_injection_set, axiom, ![A, B]: ![S, T, X]: (mem(set(tuple2(A,
  B)), X, infix_gtplgt(B, A, S, T)) <=> (mem(set(tuple2(A, B)), X,
  infix_plmngt(B, A, S, T)) & mem(set(tuple2(B, A)), inverse(B, A, X),
  infix_plmngt(A, B, T, S))))).

fof(infix_gtmngt_sort, axiom, ![A, B]: ![X, X1]: (sort(set(set(tuple2(A,
  B))), infix_gtmngt(B, A, X, X1)) = infix_gtmngt(B, A, X, X1))).

fof(mem_total_injection_set, axiom, ![A, B]: ![S, T, X]: (mem(set(tuple2(A,
  B)), X, infix_gtmngt(B, A, S, T)) <=> (mem(set(tuple2(A, B)), X,
  infix_gtplgt(B, A, S, T)) & mem(set(tuple2(A, B)), X, infix_mnmngt(B, A, S,
  T))))).

fof(infix_plmngtgt_sort, axiom, ![A, B]: ![X, X1]: (sort(set(set(tuple2(A,
  B))), infix_plmngtgt(B, A, X, X1)) = infix_plmngtgt(B, A, X, X1))).

fof(mem_partial_surjection_set, axiom, ![A, B]: ![S, T, X]:
  (mem(set(tuple2(A, B)), X, infix_plmngtgt(B, A, S, T))
  <=> (mem(set(tuple2(A, B)), X, infix_plmngt(B, A, S, T)) & infix_eqeq(B,
  ran(B, A, X), T)))).

fof(infix_mnmngtgt_sort, axiom, ![A, B]: ![X, X1]: (sort(set(set(tuple2(A,
  B))), infix_mnmngtgt(B, A, X, X1)) = infix_mnmngtgt(B, A, X, X1))).

fof(mem_total_surjection_set, axiom, ![A, B]: ![S, T, X]: (mem(set(tuple2(A,
  B)), X, infix_mnmngtgt(B, A, S, T)) <=> (mem(set(tuple2(A, B)), X,
  infix_plmngtgt(B, A, S, T)) & mem(set(tuple2(A, B)), X, infix_mnmngt(B, A,
  S, T))))).

fof(infix_gtplgtgt_sort, axiom, ![A, B]: ![X, X1]: (sort(set(set(tuple2(A,
  B))), infix_gtplgtgt(B, A, X, X1)) = infix_gtplgtgt(B, A, X, X1))).

fof(mem_partial_bijection_set, axiom, ![A, B]: ![S, T, X]: (mem(set(tuple2(A,
  B)), X, infix_gtplgtgt(B, A, S, T)) <=> (mem(set(tuple2(A, B)), X,
  infix_gtplgt(B, A, S, T)) & mem(set(tuple2(A, B)), X, infix_plmngtgt(B, A,
  S, T))))).

fof(infix_gtmngtgt_sort, axiom, ![A, B]: ![X, X1]: (sort(set(set(tuple2(A,
  B))), infix_gtmngtgt(B, A, X, X1)) = infix_gtmngtgt(B, A, X, X1))).

fof(mem_total_bijection_set, axiom, ![A, B]: ![S, T, X]: (mem(set(tuple2(A,
  B)), X, infix_gtmngtgt(B, A, S, T)) <=> (mem(set(tuple2(A, B)), X,
  infix_gtmngt(B, A, S, T)) & mem(set(tuple2(A, B)), X, infix_mnmngtgt(B, A,
  S, T))))).

fof(apply_sort, axiom, ![A, B]: ![X, X1]: (sort(B, apply(B, A, X,
  X1)) = apply(B, A, X, X1))).

fof(apply_def0, axiom, ![A, B]: ![F, S, T, A1]: ((mem(set(tuple2(A, B)), F,
  infix_plmngt(B, A, S, T)) & mem(A, A1, dom(B, A, F))) => mem(tuple2(A, B),
  tuple21(A, B, A1, apply(B, A, F, A1)), F))).

fof(equal_image_7, conjecture, ![S, U, T, V, R]: ((sort(set(a), S) = S)
  => ((sort(set(a), U) = U) => ((sort(set(b), T) = T) => ((sort(set(b),
  V) = V) => ((sort(set(tuple2(a, b)), R) = R) => ((mem(set(tuple2(a, b)), R,
  relation(b, a, S, T)) & (subset(b, V, T) & subset(a, U, S)))
  => infix_eqeq(b, image(b, a, range_substraction(b, a, R, V), U), diff(b,
  image(b, a, R, U), V))))))))).
