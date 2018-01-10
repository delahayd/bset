(set-logic AUFBVDTLIRA)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
(declare-sort uni 0)

(declare-sort ty 0)

(declare-fun sort (ty uni) Bool)

(declare-fun witness (ty) uni)

;; witness_sort
  (assert (forall ((a2 ty)) (sort a2 (witness a2))))

(declare-fun int () ty)

(declare-fun real () ty)

(declare-sort set 1)

(declare-fun set1 (ty) ty)

(declare-fun mem (ty uni uni) Bool)

(declare-fun infix_eqeq (ty uni uni) Bool)

;; infix ==_def
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t uni))
  (and
  (=> (infix_eqeq a2 s t) (forall ((x uni)) (= (mem a2 x s) (mem a2 x t))))
  (=> (forall ((x uni)) (=> (sort a2 x) (= (mem a2 x s) (mem a2 x t))))
  (infix_eqeq a2 s t))))))

(declare-fun power (ty uni) uni)

;; power_sort
  (assert
  (forall ((a2 ty)) (forall ((x uni)) (sort (set1 (set1 a2)) (power a2 x)))))

(declare-fun non_empty_power (ty uni) uni)

;; non_empty_power_sort
  (assert
  (forall ((a2 ty))
  (forall ((x uni)) (sort (set1 (set1 a2)) (non_empty_power a2 x)))))

(declare-sort b 0)

(declare-fun b1 () ty)

(declare-sort a 0)

(declare-fun a1 () ty)

(declare-sort tuple21 2)

(declare-fun tuple2 (ty ty) ty)

(declare-fun subset1 (ty uni uni) Bool)

(declare-fun subset2 ((set a) (set a)) Bool)

(declare-fun subset5 ((set b) (set b)) Bool)

(declare-fun subset6 ((set (tuple21 a b)) (set (tuple21 a b))) Bool)

(declare-fun subset7 ((set (set (tuple21 a b))) (set (set (tuple21 a
  b)))) Bool)

(declare-fun t2tb43 ((set (set (set (tuple21 a b))))) uni)

;; t2tb_sort
  (assert
  (forall ((x (set (set (set (tuple21 a b)))))) (sort
  (set1 (set1 (set1 (tuple2 a1 b1)))) (t2tb43 x))))

(declare-fun tb2t43 (uni) (set (set (set (tuple21 a b)))))

;; BridgeL
  (assert
  (forall ((i (set (set (set (tuple21 a b))))))
  (! (= (tb2t43 (t2tb43 i)) i) :pattern ((t2tb43 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (set1 (set1 (set1 (tuple2 a1 b1)))) j)
     (= (t2tb43 (tb2t43 j)) j)) :pattern ((t2tb43 (tb2t43 j))) )))

(declare-fun t2tb10 ((set (set (tuple21 a b)))) uni)

;; t2tb_sort
  (assert
  (forall ((x (set (set (tuple21 a b))))) (sort (set1 (set1 (tuple2 a1 b1)))
  (t2tb10 x))))

(declare-fun tb2t10 (uni) (set (set (tuple21 a b))))

;; BridgeL
  (assert
  (forall ((i (set (set (tuple21 a b)))))
  (! (= (tb2t10 (t2tb10 i)) i) :pattern ((t2tb10 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (set1 (set1 (tuple2 a1 b1))) j) (= (t2tb10 (tb2t10 j)) j)) :pattern (
  (t2tb10 (tb2t10 j))) )))

;; subset_def
  (assert
  (forall ((s (set (set (tuple21 a b)))) (t (set (set (tuple21 a b)))))
  (= (subset7 s t) (mem (set1 (set1 (tuple2 a1 b1))) (t2tb10 s)
  (power (set1 (tuple2 a1 b1)) (t2tb10 t))))))

(declare-fun t2tb11 ((set (tuple21 a b))) uni)

;; t2tb_sort
  (assert
  (forall ((x (set (tuple21 a b)))) (sort (set1 (tuple2 a1 b1)) (t2tb11 x))))

(declare-fun tb2t11 (uni) (set (tuple21 a b)))

;; BridgeL
  (assert
  (forall ((i (set (tuple21 a b))))
  (! (= (tb2t11 (t2tb11 i)) i) :pattern ((t2tb11 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (set1 (tuple2 a1 b1)) j) (= (t2tb11 (tb2t11 j)) j)) :pattern (
  (t2tb11 (tb2t11 j))) )))

;; subset_def
  (assert
  (forall ((s (set (tuple21 a b))) (t (set (tuple21 a b))))
  (= (subset6 s t) (mem (set1 (tuple2 a1 b1)) (t2tb11 s)
  (power (tuple2 a1 b1) (t2tb11 t))))))

(declare-fun t2tb12 ((set b)) uni)

;; t2tb_sort
  (assert (forall ((x (set b))) (sort (set1 b1) (t2tb12 x))))

(declare-fun tb2t12 (uni) (set b))

;; BridgeL
  (assert
  (forall ((i (set b))) (! (= (tb2t12 (t2tb12 i)) i) :pattern ((t2tb12 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (set1 b1) j) (= (t2tb12 (tb2t12 j)) j)) :pattern ((t2tb12
                                                                 (tb2t12 j))) )))

(declare-fun t2tb44 ((set (set b))) uni)

;; t2tb_sort
  (assert (forall ((x (set (set b)))) (sort (set1 (set1 b1)) (t2tb44 x))))

(declare-fun tb2t44 (uni) (set (set b)))

;; BridgeL
  (assert
  (forall ((i (set (set b))))
  (! (= (tb2t44 (t2tb44 i)) i) :pattern ((t2tb44 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (set1 (set1 b1)) j) (= (t2tb44 (tb2t44 j)) j)) :pattern (
  (t2tb44 (tb2t44 j))) )))

;; subset_def
  (assert
  (forall ((s (set b)) (t (set b)))
  (= (subset5 s t) (mem (set1 b1) (t2tb12 s) (power b1 (t2tb12 t))))))

(declare-fun t2tb ((set (set a))) uni)

;; t2tb_sort
  (assert (forall ((x (set (set a)))) (sort (set1 (set1 a1)) (t2tb x))))

(declare-fun tb2t (uni) (set (set a)))

;; BridgeL
  (assert
  (forall ((i (set (set a)))) (! (= (tb2t (t2tb i)) i) :pattern ((t2tb i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (set1 (set1 a1)) j) (= (t2tb (tb2t j)) j)) :pattern ((t2tb
                                                                    (tb2t j))) )))

(declare-fun t2tb1 ((set a)) uni)

;; t2tb_sort
  (assert (forall ((x (set a))) (sort (set1 a1) (t2tb1 x))))

(declare-fun tb2t1 (uni) (set a))

;; BridgeL
  (assert
  (forall ((i (set a))) (! (= (tb2t1 (t2tb1 i)) i) :pattern ((t2tb1 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (set1 a1) j) (= (t2tb1 (tb2t1 j)) j)) :pattern ((t2tb1
                                                               (tb2t1 j))) )))

;; subset_def
  (assert
  (forall ((s (set a)) (t (set a)))
  (= (subset2 s t) (mem (set1 a1) (t2tb1 s) (power a1 (t2tb1 t))))))

;; subset_def
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t uni))
  (= (subset1 a2 s t) (mem (set1 a2) s (power a2 t))))))

(declare-fun subsetnoteq (ty uni uni) Bool)

;; subsetnoteq_def
  (assert
  (forall ((s (set (set (tuple21 a b)))) (t (set (set (tuple21 a b)))))
  (= (subsetnoteq (set1 (tuple2 a1 b1)) (t2tb10 s) (t2tb10 t))
  (and (subset7 s t)
  (not (infix_eqeq (set1 (tuple2 a1 b1)) (t2tb10 s) (t2tb10 t)))))))

;; subsetnoteq_def
  (assert
  (forall ((s (set (tuple21 a b))) (t (set (tuple21 a b))))
  (= (subsetnoteq (tuple2 a1 b1) (t2tb11 s) (t2tb11 t))
  (and (subset6 s t) (not (infix_eqeq (tuple2 a1 b1) (t2tb11 s) (t2tb11 t)))))))

;; subsetnoteq_def
  (assert
  (forall ((s (set b)) (t (set b)))
  (= (subsetnoteq b1 (t2tb12 s) (t2tb12 t))
  (and (subset5 s t) (not (infix_eqeq b1 (t2tb12 s) (t2tb12 t)))))))

;; subsetnoteq_def
  (assert
  (forall ((s (set a)) (t (set a)))
  (= (subsetnoteq a1 (t2tb1 s) (t2tb1 t))
  (and (subset2 s t) (not (infix_eqeq a1 (t2tb1 s) (t2tb1 t)))))))

;; subsetnoteq_def
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t uni))
  (= (subsetnoteq a2 s t) (and (subset1 a2 s t) (not (infix_eqeq a2 s t)))))))

(declare-fun empty (ty) uni)

;; empty_sort
  (assert (forall ((a2 ty)) (sort (set1 a2) (empty a2))))

(declare-fun is_empty (ty uni) Bool)

;; is_empty_def
  (assert
  (forall ((a2 ty))
  (forall ((s uni))
  (and (=> (is_empty a2 s) (forall ((x uni)) (not (mem a2 x s))))
  (=> (forall ((x uni)) (=> (sort a2 x) (not (mem a2 x s)))) (is_empty a2 s))))))

;; empty_def1
  (assert (forall ((a2 ty)) (is_empty a2 (empty a2))))

;; empty
  (assert (forall ((a2 ty)) (forall ((x uni)) (not (mem a2 x (empty a2))))))

(declare-fun add (ty uni uni) uni)

;; add_sort
  (assert
  (forall ((a2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 a2) (add a2 x x1)))))

;; add_def1
  (assert
  (forall ((a2 ty))
  (forall ((x uni) (y uni))
  (=> (sort a2 x)
  (=> (sort a2 y)
  (forall ((s uni)) (= (mem a2 x (add a2 y s)) (or (= x y) (mem a2 x s)))))))))

(declare-fun singleton (ty uni) uni)

;; singleton_sort
  (assert
  (forall ((a2 ty)) (forall ((x uni)) (sort (set1 a2) (singleton a2 x)))))

;; mem_singleton
  (assert
  (forall ((a2 ty))
  (forall ((x uni) (y uni))
  (=> (sort a2 x) (=> (sort a2 y) (= (mem a2 x (singleton a2 y)) (= x y)))))))

(declare-fun remove (ty uni uni) uni)

;; remove_sort
  (assert
  (forall ((a2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 a2) (remove a2 x x1)))))

;; remove_def1
  (assert
  (forall ((a2 ty))
  (forall ((x uni) (y uni) (s uni))
  (=> (sort a2 x)
  (=> (sort a2 y)
  (= (mem a2 x (remove a2 y s)) (and (not (= x y)) (mem a2 x s))))))))

(declare-fun all (ty) uni)

;; all_sort
  (assert (forall ((a2 ty)) (sort (set1 a2) (all a2))))

;; all_def
  (assert (forall ((a2 ty)) (forall ((x uni)) (mem a2 x (all a2)))))

(declare-fun union1 (ty uni uni) uni)

;; union_sort
  (assert
  (forall ((a2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 a2) (union1 a2 x x1)))))

;; mem_union
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem a2 x (union1 a2 s t)) (or (mem a2 x s) (mem a2 x t))))))

(declare-fun inter (ty uni uni) uni)

;; inter_sort
  (assert
  (forall ((a2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 a2) (inter a2 x x1)))))

;; mem_inter
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem a2 x (inter a2 s t)) (and (mem a2 x s) (mem a2 x t))))))

(declare-fun diff (ty uni uni) uni)

;; diff_sort
  (assert
  (forall ((a2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 a2) (diff a2 x x1)))))

;; mem_diff
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem a2 x (diff a2 s t)) (and (mem a2 x s) (not (mem a2 x t)))))))

(declare-fun Tuple2 (ty ty uni uni) uni)

;; Tuple2_sort
  (assert
  (forall ((a2 ty) (a3 ty))
  (forall ((x uni) (x1 uni)) (sort (tuple2 a3 a2) (Tuple2 a3 a2 x x1)))))

(declare-fun Tuple2_proj_1 (ty ty uni) uni)

;; Tuple2_proj_1_sort
  (assert
  (forall ((a2 ty) (a3 ty))
  (forall ((x uni)) (sort a3 (Tuple2_proj_1 a3 a2 x)))))

;; Tuple2_proj_1_def
  (assert
  (forall ((a2 ty) (a3 ty))
  (forall ((u uni) (u1 uni))
  (=> (sort a3 u) (= (Tuple2_proj_1 a3 a2 (Tuple2 a3 a2 u u1)) u)))))

(declare-fun Tuple2_proj_2 (ty ty uni) uni)

;; Tuple2_proj_2_sort
  (assert
  (forall ((a2 ty) (a3 ty))
  (forall ((x uni)) (sort a2 (Tuple2_proj_2 a3 a2 x)))))

;; Tuple2_proj_2_def
  (assert
  (forall ((a2 ty) (a3 ty))
  (forall ((u uni) (u1 uni))
  (=> (sort a2 u1) (= (Tuple2_proj_2 a3 a2 (Tuple2 a3 a2 u u1)) u1)))))

;; tuple2_inversion
  (assert
  (forall ((a2 ty) (a3 ty))
  (forall ((u uni))
  (=> (sort (tuple2 a3 a2) u)
  (= u (Tuple2 a3 a2 (Tuple2_proj_1 a3 a2 u) (Tuple2_proj_2 a3 a2 u)))))))

(declare-fun times (ty ty uni uni) uni)

;; times_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 b2)) (times b2 a2 x x1)))))

;; mem_times
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((s uni) (t uni) (x uni) (y uni))
  (= (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) (times b2 a2 s t))
  (and (mem a2 x s) (mem b2 y t))))))

;; mem_power
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t uni))
  (and
  (=> (mem (set1 a2) s (power a2 t))
  (forall ((x uni)) (=> (mem a2 x s) (mem a2 x t))))
  (=> (forall ((x uni)) (=> (sort a2 x) (=> (mem a2 x s) (mem a2 x t)))) (mem
  (set1 a2) s (power a2 t)))))))

;; mem_non_empty_power
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t uni))
  (and
  (=> (mem (set1 a2) s (non_empty_power a2 t))
  (and (forall ((x uni)) (=> (mem a2 x s) (mem a2 x t)))
  (not (infix_eqeq a2 s (empty a2)))))
  (=>
  (and (forall ((x uni)) (=> (sort a2 x) (=> (mem a2 x s) (mem a2 x t))))
  (not (infix_eqeq a2 s (empty a2)))) (mem (set1 a2) s
  (non_empty_power a2 t)))))))

(declare-fun choose (ty uni) uni)

;; choose_sort
  (assert (forall ((a2 ty)) (forall ((x uni)) (sort a2 (choose a2 x)))))

(declare-fun relation (ty ty uni uni) uni)

;; relation_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b2)))
  (relation b2 a2 x x1)))))

;; mem_relation
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((u uni) (v uni) (r uni))
  (and
  (=> (mem (set1 (tuple2 a2 b2)) r (relation b2 a2 u v))
  (forall ((x uni) (y uni))
  (=> (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) r)
  (and (mem a2 x u) (mem b2 y v)))))
  (=>
  (forall ((x uni) (y uni))
  (=> (sort a2 x)
  (=> (sort b2 y)
  (=> (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) r)
  (and (mem a2 x u) (mem b2 y v)))))) (mem (set1 (tuple2 a2 b2)) r
  (relation b2 a2 u v)))))))

(declare-fun inverse (ty ty uni) uni)

;; inverse_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni)) (sort (set1 (tuple2 b2 a2)) (inverse b2 a2 x)))))

;; mem_inverse
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((p uni) (x uni) (y uni))
  (= (mem (tuple2 b2 a2) (Tuple2 b2 a2 x y) (inverse b2 a2 p)) (mem
  (tuple2 a2 b2) (Tuple2 a2 b2 y x) p)))))

(declare-fun dom (ty ty uni) uni)

;; dom_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni)) (sort (set1 a2) (dom b2 a2 x)))))

;; mem_dom
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((p uni) (x uni))
  (and
  (=> (mem a2 x (dom b2 a2 p))
  (exists ((b3 uni))
  (and (sort b2 b3) (mem (tuple2 a2 b2) (Tuple2 a2 b2 x b3) p))))
  (=> (exists ((b3 uni)) (mem (tuple2 a2 b2) (Tuple2 a2 b2 x b3) p)) (mem a2
  x (dom b2 a2 p)))))))

(declare-fun ran (ty ty uni) uni)

;; ran_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni)) (sort (set1 b2) (ran b2 a2 x)))))

;; mem_ran
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((p uni) (x uni))
  (and
  (=> (mem b2 x (ran b2 a2 p))
  (exists ((a3 uni))
  (and (sort a2 a3) (mem (tuple2 a2 b2) (Tuple2 a2 b2 a3 x) p))))
  (=> (exists ((a3 uni)) (mem (tuple2 a2 b2) (Tuple2 a2 b2 a3 x) p)) (mem b2
  x (ran b2 a2 p)))))))

(declare-fun semicolon (ty ty ty uni uni) uni)

;; semicolon_sort
  (assert
  (forall ((a2 ty) (b2 ty) (c2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 c2))
  (semicolon c2 b2 a2 x x1)))))

;; mem_semicolon
  (assert
  (forall ((a2 ty) (b2 ty) (c2 ty))
  (forall ((p uni) (q uni) (x uni) (y uni))
  (and
  (=> (mem (tuple2 a2 c2) (Tuple2 a2 c2 x y) (semicolon c2 b2 a2 p q))
  (exists ((b3 uni))
  (and (sort b2 b3)
  (and (mem (tuple2 a2 b2) (Tuple2 a2 b2 x b3) p) (mem (tuple2 b2 c2)
  (Tuple2 b2 c2 b3 y) q)))))
  (=>
  (exists ((b3 uni))
  (and (mem (tuple2 a2 b2) (Tuple2 a2 b2 x b3) p) (mem (tuple2 b2 c2)
  (Tuple2 b2 c2 b3 y) q))) (mem (tuple2 a2 c2) (Tuple2 a2 c2 x y)
  (semicolon c2 b2 a2 p q)))))))

(declare-fun semicolon_back (ty ty ty uni uni) uni)

;; semicolon_back_sort
  (assert
  (forall ((a2 ty) (b2 ty) (c2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 c2))
  (semicolon_back c2 b2 a2 x x1)))))

;; semicolon_back
  (assert
  (forall ((a2 ty) (b2 ty) (c2 ty))
  (forall ((p uni) (q uni))
  (= (semicolon_back c2 b2 a2 q p) (semicolon c2 b2 a2 p q)))))

(declare-fun id (ty uni) uni)

;; id_sort
  (assert
  (forall ((a2 ty))
  (forall ((x uni)) (sort (set1 (tuple2 a2 a2)) (id a2 x)))))

;; mem_id
  (assert
  (forall ((a2 ty))
  (forall ((u uni) (x uni) (y uni))
  (=> (sort a2 x)
  (=> (sort a2 y)
  (= (mem (tuple2 a2 a2) (Tuple2 a2 a2 x y) (id a2 u))
  (and (mem a2 x u) (= x y))))))))

(declare-fun domain_restriction (ty ty uni uni) uni)

;; domain_restriction_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 b2))
  (domain_restriction b2 a2 x x1)))))

;; mem_domain_restriction
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((p uni) (s uni) (x uni) (y uni))
  (= (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) (domain_restriction b2 a2 s p))
  (and (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) p) (mem a2 x s))))))

(declare-fun range_restriction (ty ty uni uni) uni)

;; range_restriction_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 b2))
  (range_restriction b2 a2 x x1)))))

;; mem_range_restriction
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((p uni) (t uni) (x uni) (y uni))
  (= (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) (range_restriction b2 a2 p t))
  (and (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) p) (mem b2 y t))))))

(declare-fun domain_substraction (ty ty uni uni) uni)

;; domain_substraction_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 b2))
  (domain_substraction b2 a2 x x1)))))

;; mem_domain_substraction
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((p uni) (s uni) (x uni) (y uni))
  (= (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) (domain_substraction b2 a2 s p))
  (and (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) p) (not (mem a2 x s)))))))

(declare-fun range_substraction (ty ty uni uni) uni)

;; range_substraction_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 b2))
  (range_substraction b2 a2 x x1)))))

;; mem_range_substraction
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((p uni) (t uni) (x uni) (y uni))
  (= (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) (range_substraction b2 a2 p t))
  (and (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) p) (not (mem b2 y t)))))))

(declare-fun image (ty ty uni uni) uni)

;; image_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 b2) (image b2 a2 x x1)))))

;; mem_image
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((p uni) (w uni) (x uni))
  (and
  (=> (mem b2 x (image b2 a2 p w))
  (exists ((a3 uni))
  (and (sort a2 a3)
  (and (mem a2 a3 w) (mem (tuple2 a2 b2) (Tuple2 a2 b2 a3 x) p)))))
  (=>
  (exists ((a3 uni))
  (and (mem a2 a3 w) (mem (tuple2 a2 b2) (Tuple2 a2 b2 a3 x) p))) (mem b2 x
  (image b2 a2 p w)))))))

(declare-fun infix_lspl (ty ty uni uni) uni)

;; infix <+_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 b2))
  (infix_lspl b2 a2 x x1)))))

;; mem_overriding
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((q uni) (p uni) (x uni) (y uni))
  (= (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) (infix_lspl b2 a2 q p))
  (or
  (and (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) q)
  (not (mem a2 x (dom b2 a2 p)))) (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) p))))))

(declare-fun direct_product (ty ty ty uni uni) uni)

;; direct_product_sort
  (assert
  (forall ((a2 ty) (b2 ty) (c2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 (tuple2 b2 c2)))
  (direct_product c2 b2 a2 x x1)))))

;; mem_direct_product
  (assert
  (forall ((a2 ty) (b2 ty) (c2 ty))
  (forall ((f uni) (g uni) (x uni) (y uni) (z uni))
  (= (mem (tuple2 a2 (tuple2 b2 c2))
  (Tuple2 a2 (tuple2 b2 c2) x (Tuple2 b2 c2 y z))
  (direct_product c2 b2 a2 f g))
  (and (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y) f) (mem (tuple2 a2 c2)
  (Tuple2 a2 c2 x z) g))))))

(declare-fun prj1 (ty ty uni) uni)

;; prj1_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni)) (sort (set1 (tuple2 (tuple2 a2 b2) a2)) (prj1 b2 a2 x)))))

;; mem_proj_op_1
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((s uni) (t uni) (x uni) (y uni) (z uni))
  (=> (sort a2 x)
  (=> (sort a2 z)
  (= (mem (tuple2 (tuple2 a2 b2) a2)
  (Tuple2 (tuple2 a2 b2) a2 (Tuple2 a2 b2 x y) z)
  (prj1 b2 a2 (Tuple2 (set1 a2) (set1 b2) s t)))
  (and (mem (tuple2 (tuple2 a2 b2) a2)
  (Tuple2 (tuple2 a2 b2) a2 (Tuple2 a2 b2 x y) z)
  (times a2 (tuple2 a2 b2) (times b2 a2 s t) s)) (= z x))))))))

(declare-fun prj2 (ty ty uni) uni)

;; prj2_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni)) (sort (set1 (tuple2 (tuple2 a2 b2) b2)) (prj2 b2 a2 x)))))

;; mem_proj_op_2
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((s uni) (t uni) (x uni) (y uni) (z uni))
  (=> (sort b2 y)
  (=> (sort b2 z)
  (= (mem (tuple2 (tuple2 a2 b2) b2)
  (Tuple2 (tuple2 a2 b2) b2 (Tuple2 a2 b2 x y) z)
  (prj2 b2 a2 (Tuple2 (set1 a2) (set1 b2) s t)))
  (and (mem (tuple2 (tuple2 a2 b2) b2)
  (Tuple2 (tuple2 a2 b2) b2 (Tuple2 a2 b2 x y) z)
  (times b2 (tuple2 a2 b2) (times b2 a2 s t) t)) (= z y))))))))

(declare-fun parallel_product (ty ty ty ty uni uni) uni)

;; parallel_product_sort
  (assert
  (forall ((a2 ty) (b2 ty) (c2 ty) (d2 ty))
  (forall ((x uni) (x1 uni)) (sort
  (set1 (tuple2 (tuple2 a2 c2) (tuple2 b2 d2)))
  (parallel_product d2 c2 b2 a2 x x1)))))

;; mem_parallel_product
  (assert
  (forall ((a2 ty) (b2 ty) (c2 ty) (d2 ty))
  (forall ((h uni) (k uni) (x uni) (y uni) (z uni) (w uni))
  (= (mem (tuple2 (tuple2 a2 c2) (tuple2 b2 d2))
  (Tuple2 (tuple2 a2 c2) (tuple2 b2 d2) (Tuple2 a2 c2 x y)
  (Tuple2 b2 d2 z w)) (parallel_product d2 c2 b2 a2 h k))
  (and (mem (tuple2 a2 b2) (Tuple2 a2 b2 x z) h) (mem (tuple2 c2 d2)
  (Tuple2 c2 d2 y w) k))))))

(declare-fun infix_plmngt (ty ty uni uni) uni)

;; infix +->_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b2)))
  (infix_plmngt b2 a2 x x1)))))

;; mem_partial_function_set
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((s uni) (t uni) (f uni))
  (and
  (=> (mem (set1 (tuple2 a2 b2)) f (infix_plmngt b2 a2 s t))
  (and (mem (set1 (tuple2 a2 b2)) f (relation b2 a2 s t))
  (forall ((x uni) (y1 uni) (y2 uni))
  (=> (sort b2 y1)
  (=> (sort b2 y2)
  (=>
  (and (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y1) f) (mem (tuple2 a2 b2)
  (Tuple2 a2 b2 x y2) f)) (= y1 y2)))))))
  (=>
  (and (mem (set1 (tuple2 a2 b2)) f (relation b2 a2 s t))
  (forall ((x uni) (y1 uni) (y2 uni))
  (=> (sort a2 x)
  (=> (sort b2 y1)
  (=> (sort b2 y2)
  (=>
  (and (mem (tuple2 a2 b2) (Tuple2 a2 b2 x y1) f) (mem (tuple2 a2 b2)
  (Tuple2 a2 b2 x y2) f)) (= y1 y2))))))) (mem (set1 (tuple2 a2 b2)) f
  (infix_plmngt b2 a2 s t)))))))

(declare-fun infix_mnmngt (ty ty uni uni) uni)

;; infix -->_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b2)))
  (infix_mnmngt b2 a2 x x1)))))

;; mem_total_function_set
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b2)) x (infix_mnmngt b2 a2 s t))
  (and (mem (set1 (tuple2 a2 b2)) x (infix_plmngt b2 a2 s t)) (infix_eqeq a2
  (dom b2 a2 x) s))))))

(declare-fun infix_gtplgt (ty ty uni uni) uni)

;; infix >+>_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b2)))
  (infix_gtplgt b2 a2 x x1)))))

;; mem_partial_injection_set
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b2)) x (infix_gtplgt b2 a2 s t))
  (and (mem (set1 (tuple2 a2 b2)) x (infix_plmngt b2 a2 s t)) (mem
  (set1 (tuple2 b2 a2)) (inverse b2 a2 x) (infix_plmngt a2 b2 t s)))))))

(declare-fun infix_gtmngt (ty ty uni uni) uni)

;; infix >->_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b2)))
  (infix_gtmngt b2 a2 x x1)))))

(declare-fun infix_gtmngt1 ((set a) (set b)) (set (set (tuple21 a b))))

;; mem_total_injection_set
  (assert
  (forall ((s (set a)) (t (set b)) (x (set (tuple21 a b))))
  (= (mem (set1 (tuple2 a1 b1)) (t2tb11 x) (t2tb10 (infix_gtmngt1 s t)))
  (and (mem (set1 (tuple2 a1 b1)) (t2tb11 x)
  (infix_gtplgt b1 a1 (t2tb1 s) (t2tb12 t))) (mem (set1 (tuple2 a1 b1))
  (t2tb11 x) (infix_mnmngt b1 a1 (t2tb1 s) (t2tb12 t)))))))

;; mem_total_injection_set
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b2)) x (infix_gtmngt b2 a2 s t))
  (and (mem (set1 (tuple2 a2 b2)) x (infix_gtplgt b2 a2 s t)) (mem
  (set1 (tuple2 a2 b2)) x (infix_mnmngt b2 a2 s t)))))))

(declare-fun infix_plmngtgt (ty ty uni uni) uni)

;; infix +->>_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b2)))
  (infix_plmngtgt b2 a2 x x1)))))

;; mem_partial_surjection_set
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b2)) x (infix_plmngtgt b2 a2 s t))
  (and (mem (set1 (tuple2 a2 b2)) x (infix_plmngt b2 a2 s t)) (infix_eqeq b2
  (ran b2 a2 x) t))))))

(declare-fun infix_mnmngtgt (ty ty uni uni) uni)

;; infix -->>_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b2)))
  (infix_mnmngtgt b2 a2 x x1)))))

;; mem_total_surjection_set
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b2)) x (infix_mnmngtgt b2 a2 s t))
  (and (mem (set1 (tuple2 a2 b2)) x (infix_plmngtgt b2 a2 s t)) (mem
  (set1 (tuple2 a2 b2)) x (infix_mnmngt b2 a2 s t)))))))

(declare-fun infix_gtplgtgt (ty ty uni uni) uni)

;; infix >+>>_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b2)))
  (infix_gtplgtgt b2 a2 x x1)))))

;; mem_partial_bijection_set
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b2)) x (infix_gtplgtgt b2 a2 s t))
  (and (mem (set1 (tuple2 a2 b2)) x (infix_gtplgt b2 a2 s t)) (mem
  (set1 (tuple2 a2 b2)) x (infix_plmngtgt b2 a2 s t)))))))

(declare-fun infix_gtmngtgt (ty ty uni uni) uni)

;; infix >->>_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b2)))
  (infix_gtmngtgt b2 a2 x x1)))))

(declare-fun infix_gtmngtgt1 ((set a) (set b)) (set (set (tuple21 a b))))

;; mem_total_bijection_set
  (assert
  (forall ((s (set a)) (t (set b)) (x (set (tuple21 a b))))
  (= (mem (set1 (tuple2 a1 b1)) (t2tb11 x) (t2tb10 (infix_gtmngtgt1 s t)))
  (and (mem (set1 (tuple2 a1 b1)) (t2tb11 x) (t2tb10 (infix_gtmngt1 s t)))
  (mem (set1 (tuple2 a1 b1)) (t2tb11 x)
  (infix_mnmngtgt b1 a1 (t2tb1 s) (t2tb12 t)))))))

;; mem_total_bijection_set
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b2)) x (infix_gtmngtgt b2 a2 s t))
  (and (mem (set1 (tuple2 a2 b2)) x (infix_gtmngt b2 a2 s t)) (mem
  (set1 (tuple2 a2 b2)) x (infix_mnmngtgt b2 a2 s t)))))))

(declare-fun apply (ty ty uni uni) uni)

;; apply_sort
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((x uni) (x1 uni)) (sort b2 (apply b2 a2 x x1)))))

;; apply_def0
  (assert
  (forall ((a2 ty) (b2 ty))
  (forall ((f uni) (s uni) (t uni) (a3 uni))
  (=>
  (and (mem (set1 (tuple2 a2 b2)) f (infix_plmngt b2 a2 s t)) (mem a2 a3
  (dom b2 a2 f))) (mem (tuple2 a2 b2) (Tuple2 a2 b2 a3 (apply b2 a2 f a3))
  f)))))

(assert
;; inclusion_function_2
 ;; File "lemmes_bbook.why", line 892, characters 7-27
  (not
  (forall ((s (set a)) (t (set b))) (subset7 (infix_gtmngtgt1 s t)
  (infix_gtmngt1 s t)))))
(check-sat)
