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

(declare-sort b 0)

(declare-fun b1 () ty)

(declare-sort a 0)

(declare-fun a1 () ty)

(declare-sort tuple21 2)

(declare-fun tuple2 (ty ty) ty)

(declare-fun infix_eqeq (ty uni uni) Bool)

(declare-fun infix_eqeq1 ((set a) (set a)) Bool)

(declare-fun infix_eqeq3 ((set b) (set b)) Bool)

(declare-fun infix_eqeq4 ((set (tuple21 a b)) (set (tuple21 a b))) Bool)

(declare-fun infix_eqeq6 ((set (tuple21 b a)) (set (tuple21 b a))) Bool)

(declare-fun t2tb37 ((set (tuple21 b a))) uni)

;; t2tb_sort
  (assert
  (forall ((x (set (tuple21 b a)))) (sort (set1 (tuple2 b1 a1)) (t2tb37 x))))

(declare-fun tb2t37 (uni) (set (tuple21 b a)))

;; BridgeL
  (assert
  (forall ((i (set (tuple21 b a))))
  (! (= (tb2t37 (t2tb37 i)) i) :pattern ((t2tb37 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (set1 (tuple2 b1 a1)) j) (= (t2tb37 (tb2t37 j)) j)) :pattern (
  (t2tb37 (tb2t37 j))) )))

(declare-fun t2tb38 ((tuple21 b a)) uni)

;; t2tb_sort
  (assert (forall ((x (tuple21 b a))) (sort (tuple2 b1 a1) (t2tb38 x))))

(declare-fun tb2t38 (uni) (tuple21 b a))

;; BridgeL
  (assert
  (forall ((i (tuple21 b a)))
  (! (= (tb2t38 (t2tb38 i)) i) :pattern ((t2tb38 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (tuple2 b1 a1) j) (= (t2tb38 (tb2t38 j)) j)) :pattern (
  (t2tb38 (tb2t38 j))) )))

;; infix ==_def
  (assert
  (forall ((s (set (tuple21 b a))) (t (set (tuple21 b a))))
  (= (infix_eqeq6 s t)
  (forall ((x (tuple21 b a)))
  (= (mem (tuple2 b1 a1) (t2tb38 x) (t2tb37 s)) (mem (tuple2 b1 a1)
  (t2tb38 x) (t2tb37 t)))))))

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

(declare-fun t2tb13 ((tuple21 a b)) uni)

;; t2tb_sort
  (assert (forall ((x (tuple21 a b))) (sort (tuple2 a1 b1) (t2tb13 x))))

(declare-fun tb2t13 (uni) (tuple21 a b))

;; BridgeL
  (assert
  (forall ((i (tuple21 a b)))
  (! (= (tb2t13 (t2tb13 i)) i) :pattern ((t2tb13 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (tuple2 a1 b1) j) (= (t2tb13 (tb2t13 j)) j)) :pattern (
  (t2tb13 (tb2t13 j))) )))

;; infix ==_def
  (assert
  (forall ((s (set (tuple21 a b))) (t (set (tuple21 a b))))
  (= (infix_eqeq4 s t)
  (forall ((x (tuple21 a b)))
  (= (mem (tuple2 a1 b1) (t2tb13 x) (t2tb11 s)) (mem (tuple2 a1 b1)
  (t2tb13 x) (t2tb11 t)))))))

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

(declare-fun t2tb14 (b) uni)

;; t2tb_sort
  (assert (forall ((x b)) (sort b1 (t2tb14 x))))

(declare-fun tb2t14 (uni) b)

;; BridgeL
  (assert
  (forall ((i b)) (! (= (tb2t14 (t2tb14 i)) i) :pattern ((t2tb14 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort b1 j) (= (t2tb14 (tb2t14 j)) j)) :pattern ((t2tb14 (tb2t14 j))) )))

;; infix ==_def
  (assert
  (forall ((s (set b)) (t (set b)))
  (= (infix_eqeq3 s t)
  (forall ((x b))
  (= (mem b1 (t2tb14 x) (t2tb12 s)) (mem b1 (t2tb14 x) (t2tb12 t)))))))

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

(declare-fun t2tb2 (a) uni)

;; t2tb_sort
  (assert (forall ((x a)) (sort a1 (t2tb2 x))))

(declare-fun tb2t2 (uni) a)

;; BridgeL
  (assert (forall ((i a)) (! (= (tb2t2 (t2tb2 i)) i) :pattern ((t2tb2 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort a1 j) (= (t2tb2 (tb2t2 j)) j)) :pattern ((t2tb2 (tb2t2 j))) )))

;; infix ==_def
  (assert
  (forall ((s (set a)) (t (set a)))
  (= (infix_eqeq1 s t)
  (forall ((x a))
  (= (mem a1 (t2tb2 x) (t2tb1 s)) (mem a1 (t2tb2 x) (t2tb1 t)))))))

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

(declare-fun subset1 (ty uni uni) Bool)

;; subset_def
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t uni))
  (= (subset1 a2 s t) (mem (set1 a2) s (power a2 t))))))

(declare-fun subsetnoteq (ty uni uni) Bool)

;; subsetnoteq_def
  (assert
  (forall ((s (set (tuple21 b a))) (t (set (tuple21 b a))))
  (= (subsetnoteq (tuple2 b1 a1) (t2tb37 s) (t2tb37 t))
  (and (subset1 (tuple2 b1 a1) (t2tb37 s) (t2tb37 t))
  (not (infix_eqeq6 s t))))))

;; subsetnoteq_def
  (assert
  (forall ((s (set (tuple21 a b))) (t (set (tuple21 a b))))
  (= (subsetnoteq (tuple2 a1 b1) (t2tb11 s) (t2tb11 t))
  (and (subset1 (tuple2 a1 b1) (t2tb11 s) (t2tb11 t))
  (not (infix_eqeq4 s t))))))

;; subsetnoteq_def
  (assert
  (forall ((s (set b)) (t (set b)))
  (= (subsetnoteq b1 (t2tb12 s) (t2tb12 t))
  (and (subset1 b1 (t2tb12 s) (t2tb12 t)) (not (infix_eqeq3 s t))))))

;; subsetnoteq_def
  (assert
  (forall ((s (set a)) (t (set a)))
  (= (subsetnoteq a1 (t2tb1 s) (t2tb1 t))
  (and (subset1 a1 (t2tb1 s) (t2tb1 t)) (not (infix_eqeq1 s t))))))

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

(declare-fun times2 ((set a) (set b)) (set (tuple21 a b)))

(declare-fun times11 ((set b) (set a)) (set (tuple21 b a)))

;; mem_times
  (assert
  (forall ((s (set b)) (t (set a)) (x b) (y a))
  (= (mem (tuple2 b1 a1) (Tuple2 b1 a1 (t2tb14 x) (t2tb2 y))
  (t2tb37 (times11 s t)))
  (and (mem b1 (t2tb14 x) (t2tb12 s)) (mem a1 (t2tb2 y) (t2tb1 t))))))

;; mem_times
  (assert
  (forall ((s (set a)) (t (set b)) (x a) (y b))
  (= (mem (tuple2 a1 b1) (Tuple2 a1 b1 (t2tb2 x) (t2tb14 y))
  (t2tb11 (times2 s t)))
  (and (mem a1 (t2tb2 x) (t2tb1 s)) (mem b1 (t2tb14 y) (t2tb12 t))))))

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

(declare-fun t2tb56 ((set (set (tuple21 b a)))) uni)

;; t2tb_sort
  (assert
  (forall ((x (set (set (tuple21 b a))))) (sort (set1 (set1 (tuple2 b1 a1)))
  (t2tb56 x))))

(declare-fun tb2t56 (uni) (set (set (tuple21 b a))))

;; BridgeL
  (assert
  (forall ((i (set (set (tuple21 b a)))))
  (! (= (tb2t56 (t2tb56 i)) i) :pattern ((t2tb56 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (set1 (set1 (tuple2 b1 a1))) j) (= (t2tb56 (tb2t56 j)) j)) :pattern (
  (t2tb56 (tb2t56 j))) )))

;; mem_non_empty_power
  (assert
  (forall ((s (set (tuple21 b a))) (t (set (tuple21 b a))))
  (= (mem (set1 (tuple2 b1 a1)) (t2tb37 s)
  (non_empty_power (tuple2 b1 a1) (t2tb37 t)))
  (and
  (forall ((x (tuple21 b a)))
  (=> (mem (tuple2 b1 a1) (t2tb38 x) (t2tb37 s)) (mem (tuple2 b1 a1)
  (t2tb38 x) (t2tb37 t))))
  (not (infix_eqeq6 s (tb2t37 (empty (tuple2 b1 a1)))))))))

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

;; mem_non_empty_power
  (assert
  (forall ((s (set (tuple21 a b))) (t (set (tuple21 a b))))
  (= (mem (set1 (tuple2 a1 b1)) (t2tb11 s)
  (non_empty_power (tuple2 a1 b1) (t2tb11 t)))
  (and
  (forall ((x (tuple21 a b)))
  (=> (mem (tuple2 a1 b1) (t2tb13 x) (t2tb11 s)) (mem (tuple2 a1 b1)
  (t2tb13 x) (t2tb11 t))))
  (not (infix_eqeq4 s (tb2t11 (empty (tuple2 a1 b1)))))))))

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

;; mem_non_empty_power
  (assert
  (forall ((s (set b)) (t (set b)))
  (= (mem (set1 b1) (t2tb12 s) (non_empty_power b1 (t2tb12 t)))
  (and
  (forall ((x b))
  (=> (mem b1 (t2tb14 x) (t2tb12 s)) (mem b1 (t2tb14 x) (t2tb12 t))))
  (not (infix_eqeq3 s (tb2t12 (empty b1))))))))

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

;; mem_non_empty_power
  (assert
  (forall ((s (set a)) (t (set a)))
  (= (mem (set1 a1) (t2tb1 s) (non_empty_power a1 (t2tb1 t)))
  (and
  (forall ((x a))
  (=> (mem a1 (t2tb2 x) (t2tb1 s)) (mem a1 (t2tb2 x) (t2tb1 t))))
  (not (infix_eqeq1 s (tb2t1 (empty a1))))))))

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

(declare-fun inverse1 ((set (tuple21 b a))) (set (tuple21 a b)))

(declare-fun inverse2 ((set (tuple21 a b))) (set (tuple21 b a)))

;; mem_inverse
  (assert
  (forall ((p (set (tuple21 b a))) (x a) (y b))
  (= (mem (tuple2 a1 b1) (Tuple2 a1 b1 (t2tb2 x) (t2tb14 y))
  (t2tb11 (inverse1 p))) (mem (tuple2 b1 a1)
  (Tuple2 b1 a1 (t2tb14 y) (t2tb2 x)) (t2tb37 p)))))

;; mem_inverse
  (assert
  (forall ((p (set (tuple21 a b))) (x b) (y a))
  (= (mem (tuple2 b1 a1) (Tuple2 b1 a1 (t2tb14 x) (t2tb2 y))
  (t2tb37 (inverse2 p))) (mem (tuple2 a1 b1)
  (Tuple2 a1 b1 (t2tb2 y) (t2tb14 x)) (t2tb11 p)))))

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

(declare-fun t2tb1808 ((tuple21 (set b) (set a))) uni)

;; t2tb_sort
  (assert
  (forall ((x (tuple21 (set b) (set a)))) (sort (tuple2 (set1 b1) (set1 a1))
  (t2tb1808 x))))

(declare-fun tb2t1808 (uni) (tuple21 (set b) (set a)))

;; BridgeL
  (assert
  (forall ((i (tuple21 (set b) (set a))))
  (! (= (tb2t1808 (t2tb1808 i)) i) :pattern ((t2tb1808 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (tuple2 (set1 b1) (set1 a1)) j) (= (t2tb1808 (tb2t1808 j)) j)) :pattern (
  (t2tb1808 (tb2t1808 j))) )))

(declare-fun t2tb1063 ((set (tuple21 (tuple21 b a) b))) uni)

;; t2tb_sort
  (assert
  (forall ((x (set (tuple21 (tuple21 b a) b)))) (sort
  (set1 (tuple2 (tuple2 b1 a1) b1)) (t2tb1063 x))))

(declare-fun tb2t1063 (uni) (set (tuple21 (tuple21 b a) b)))

;; BridgeL
  (assert
  (forall ((i (set (tuple21 (tuple21 b a) b))))
  (! (= (tb2t1063 (t2tb1063 i)) i) :pattern ((t2tb1063 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (set1 (tuple2 (tuple2 b1 a1) b1)) j)
     (= (t2tb1063 (tb2t1063 j)) j)) :pattern ((t2tb1063 (tb2t1063 j))) )))

(declare-fun t2tb1064 ((tuple21 (tuple21 b a) b)) uni)

;; t2tb_sort
  (assert
  (forall ((x (tuple21 (tuple21 b a) b))) (sort (tuple2 (tuple2 b1 a1) b1)
  (t2tb1064 x))))

(declare-fun tb2t1064 (uni) (tuple21 (tuple21 b a) b))

;; BridgeL
  (assert
  (forall ((i (tuple21 (tuple21 b a) b)))
  (! (= (tb2t1064 (t2tb1064 i)) i) :pattern ((t2tb1064 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (tuple2 (tuple2 b1 a1) b1) j) (= (t2tb1064 (tb2t1064 j)) j)) :pattern (
  (t2tb1064 (tb2t1064 j))) )))

;; mem_proj_op_1
  (assert
  (forall ((s (set b)) (t (set a)) (x b) (y a) (z b))
  (= (mem (tuple2 (tuple2 b1 a1) b1)
  (Tuple2 (tuple2 b1 a1) b1 (Tuple2 b1 a1 (t2tb14 x) (t2tb2 y)) (t2tb14 z))
  (prj1 a1 b1 (Tuple2 (set1 b1) (set1 a1) (t2tb12 s) (t2tb1 t))))
  (and (mem (tuple2 (tuple2 b1 a1) b1)
  (Tuple2 (tuple2 b1 a1) b1 (Tuple2 b1 a1 (t2tb14 x) (t2tb2 y)) (t2tb14 z))
  (times b1 (tuple2 b1 a1) (t2tb37 (times11 s t)) (t2tb12 s))) (= z x)))))

(declare-fun t2tb29 ((set (tuple21 (tuple21 a b) a))) uni)

;; t2tb_sort
  (assert
  (forall ((x (set (tuple21 (tuple21 a b) a)))) (sort
  (set1 (tuple2 (tuple2 a1 b1) a1)) (t2tb29 x))))

(declare-fun tb2t29 (uni) (set (tuple21 (tuple21 a b) a)))

;; BridgeL
  (assert
  (forall ((i (set (tuple21 (tuple21 a b) a))))
  (! (= (tb2t29 (t2tb29 i)) i) :pattern ((t2tb29 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (set1 (tuple2 (tuple2 a1 b1) a1)) j)
     (= (t2tb29 (tb2t29 j)) j)) :pattern ((t2tb29 (tb2t29 j))) )))

(declare-fun t2tb30 ((tuple21 (tuple21 a b) a)) uni)

;; t2tb_sort
  (assert
  (forall ((x (tuple21 (tuple21 a b) a))) (sort (tuple2 (tuple2 a1 b1) a1)
  (t2tb30 x))))

(declare-fun tb2t30 (uni) (tuple21 (tuple21 a b) a))

;; BridgeL
  (assert
  (forall ((i (tuple21 (tuple21 a b) a)))
  (! (= (tb2t30 (t2tb30 i)) i) :pattern ((t2tb30 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (tuple2 (tuple2 a1 b1) a1) j) (= (t2tb30 (tb2t30 j)) j)) :pattern (
  (t2tb30 (tb2t30 j))) )))

(declare-fun t2tb495 ((tuple21 (set a) (set b))) uni)

;; t2tb_sort
  (assert
  (forall ((x (tuple21 (set a) (set b)))) (sort (tuple2 (set1 a1) (set1 b1))
  (t2tb495 x))))

(declare-fun tb2t495 (uni) (tuple21 (set a) (set b)))

;; BridgeL
  (assert
  (forall ((i (tuple21 (set a) (set b))))
  (! (= (tb2t495 (t2tb495 i)) i) :pattern ((t2tb495 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (tuple2 (set1 a1) (set1 b1)) j) (= (t2tb495 (tb2t495 j)) j)) :pattern (
  (t2tb495 (tb2t495 j))) )))

;; mem_proj_op_1
  (assert
  (forall ((s (set a)) (t (set b)) (x a) (y b) (z a))
  (= (mem (tuple2 (tuple2 a1 b1) a1)
  (Tuple2 (tuple2 a1 b1) a1 (Tuple2 a1 b1 (t2tb2 x) (t2tb14 y)) (t2tb2 z))
  (prj1 b1 a1 (Tuple2 (set1 a1) (set1 b1) (t2tb1 s) (t2tb12 t))))
  (and (mem (tuple2 (tuple2 a1 b1) a1)
  (Tuple2 (tuple2 a1 b1) a1 (Tuple2 a1 b1 (t2tb2 x) (t2tb14 y)) (t2tb2 z))
  (times a1 (tuple2 a1 b1) (t2tb11 (times2 s t)) (t2tb1 s))) (= z x)))))

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

(declare-fun t2tb1065 ((set (tuple21 (tuple21 b a) a))) uni)

;; t2tb_sort
  (assert
  (forall ((x (set (tuple21 (tuple21 b a) a)))) (sort
  (set1 (tuple2 (tuple2 b1 a1) a1)) (t2tb1065 x))))

(declare-fun tb2t1065 (uni) (set (tuple21 (tuple21 b a) a)))

;; BridgeL
  (assert
  (forall ((i (set (tuple21 (tuple21 b a) a))))
  (! (= (tb2t1065 (t2tb1065 i)) i) :pattern ((t2tb1065 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (set1 (tuple2 (tuple2 b1 a1) a1)) j)
     (= (t2tb1065 (tb2t1065 j)) j)) :pattern ((t2tb1065 (tb2t1065 j))) )))

(declare-fun t2tb1066 ((tuple21 (tuple21 b a) a)) uni)

;; t2tb_sort
  (assert
  (forall ((x (tuple21 (tuple21 b a) a))) (sort (tuple2 (tuple2 b1 a1) a1)
  (t2tb1066 x))))

(declare-fun tb2t1066 (uni) (tuple21 (tuple21 b a) a))

;; BridgeL
  (assert
  (forall ((i (tuple21 (tuple21 b a) a)))
  (! (= (tb2t1066 (t2tb1066 i)) i) :pattern ((t2tb1066 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (tuple2 (tuple2 b1 a1) a1) j) (= (t2tb1066 (tb2t1066 j)) j)) :pattern (
  (t2tb1066 (tb2t1066 j))) )))

;; mem_proj_op_2
  (assert
  (forall ((s (set b)) (t (set a)) (x b) (y a) (z a))
  (= (mem (tuple2 (tuple2 b1 a1) a1)
  (Tuple2 (tuple2 b1 a1) a1 (Tuple2 b1 a1 (t2tb14 x) (t2tb2 y)) (t2tb2 z))
  (prj2 a1 b1 (Tuple2 (set1 b1) (set1 a1) (t2tb12 s) (t2tb1 t))))
  (and (mem (tuple2 (tuple2 b1 a1) a1)
  (Tuple2 (tuple2 b1 a1) a1 (Tuple2 b1 a1 (t2tb14 x) (t2tb2 y)) (t2tb2 z))
  (times a1 (tuple2 b1 a1) (t2tb37 (times11 s t)) (t2tb1 t))) (= z y)))))

(declare-fun t2tb27 ((set (tuple21 (tuple21 a b) b))) uni)

;; t2tb_sort
  (assert
  (forall ((x (set (tuple21 (tuple21 a b) b)))) (sort
  (set1 (tuple2 (tuple2 a1 b1) b1)) (t2tb27 x))))

(declare-fun tb2t27 (uni) (set (tuple21 (tuple21 a b) b)))

;; BridgeL
  (assert
  (forall ((i (set (tuple21 (tuple21 a b) b))))
  (! (= (tb2t27 (t2tb27 i)) i) :pattern ((t2tb27 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (set1 (tuple2 (tuple2 a1 b1) b1)) j)
     (= (t2tb27 (tb2t27 j)) j)) :pattern ((t2tb27 (tb2t27 j))) )))

(declare-fun t2tb28 ((tuple21 (tuple21 a b) b)) uni)

;; t2tb_sort
  (assert
  (forall ((x (tuple21 (tuple21 a b) b))) (sort (tuple2 (tuple2 a1 b1) b1)
  (t2tb28 x))))

(declare-fun tb2t28 (uni) (tuple21 (tuple21 a b) b))

;; BridgeL
  (assert
  (forall ((i (tuple21 (tuple21 a b) b)))
  (! (= (tb2t28 (t2tb28 i)) i) :pattern ((t2tb28 i)) )))

;; BridgeR
  (assert
  (forall ((j uni))
  (! (=> (sort (tuple2 (tuple2 a1 b1) b1) j) (= (t2tb28 (tb2t28 j)) j)) :pattern (
  (t2tb28 (tb2t28 j))) )))

;; mem_proj_op_2
  (assert
  (forall ((s (set a)) (t (set b)) (x a) (y b) (z b))
  (= (mem (tuple2 (tuple2 a1 b1) b1)
  (Tuple2 (tuple2 a1 b1) b1 (Tuple2 a1 b1 (t2tb2 x) (t2tb14 y)) (t2tb14 z))
  (prj2 b1 a1 (Tuple2 (set1 a1) (set1 b1) (t2tb1 s) (t2tb12 t))))
  (and (mem (tuple2 (tuple2 a1 b1) b1)
  (Tuple2 (tuple2 a1 b1) b1 (Tuple2 a1 b1 (t2tb2 x) (t2tb14 y)) (t2tb14 z))
  (times b1 (tuple2 a1 b1) (t2tb11 (times2 s t)) (t2tb12 t))) (= z y)))))

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
  (forall ((b2 ty))
  (forall ((s (set (tuple21 b a))) (t uni) (x uni))
  (= (mem (set1 (tuple2 (tuple2 b1 a1) b2)) x
  (infix_mnmngt b2 (tuple2 b1 a1) (t2tb37 s) t))
  (and (mem (set1 (tuple2 (tuple2 b1 a1) b2)) x
  (infix_plmngt b2 (tuple2 b1 a1) (t2tb37 s) t)) (infix_eqeq6
  (tb2t37 (dom b2 (tuple2 b1 a1) x)) s))))))

;; mem_total_function_set
  (assert
  (forall ((b2 ty))
  (forall ((s (set (tuple21 a b))) (t uni) (x uni))
  (= (mem (set1 (tuple2 (tuple2 a1 b1) b2)) x
  (infix_mnmngt b2 (tuple2 a1 b1) (t2tb11 s) t))
  (and (mem (set1 (tuple2 (tuple2 a1 b1) b2)) x
  (infix_plmngt b2 (tuple2 a1 b1) (t2tb11 s) t)) (infix_eqeq4
  (tb2t11 (dom b2 (tuple2 a1 b1) x)) s))))))

;; mem_total_function_set
  (assert
  (forall ((b2 ty))
  (forall ((s (set b)) (t uni) (x uni))
  (= (mem (set1 (tuple2 b1 b2)) x (infix_mnmngt b2 b1 (t2tb12 s) t))
  (and (mem (set1 (tuple2 b1 b2)) x (infix_plmngt b2 b1 (t2tb12 s) t))
  (infix_eqeq3 (tb2t12 (dom b2 b1 x)) s))))))

;; mem_total_function_set
  (assert
  (forall ((b2 ty))
  (forall ((s (set a)) (t uni) (x uni))
  (= (mem (set1 (tuple2 a1 b2)) x (infix_mnmngt b2 a1 (t2tb1 s) t))
  (and (mem (set1 (tuple2 a1 b2)) x (infix_plmngt b2 a1 (t2tb1 s) t))
  (infix_eqeq1 (tb2t1 (dom b2 a1 x)) s))))))

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
  (forall ((s (set b)) (t (set a)) (x (set (tuple21 b a))))
  (= (mem (set1 (tuple2 b1 a1)) (t2tb37 x)
  (infix_gtplgt a1 b1 (t2tb12 s) (t2tb1 t)))
  (and (mem (set1 (tuple2 b1 a1)) (t2tb37 x)
  (infix_plmngt a1 b1 (t2tb12 s) (t2tb1 t))) (mem (set1 (tuple2 a1 b1))
  (t2tb11 (inverse1 x)) (infix_plmngt b1 a1 (t2tb1 t) (t2tb12 s)))))))

;; mem_partial_injection_set
  (assert
  (forall ((s (set a)) (t (set b)) (x (set (tuple21 a b))))
  (= (mem (set1 (tuple2 a1 b1)) (t2tb11 x)
  (infix_gtplgt b1 a1 (t2tb1 s) (t2tb12 t)))
  (and (mem (set1 (tuple2 a1 b1)) (t2tb11 x)
  (infix_plmngt b1 a1 (t2tb1 s) (t2tb12 t))) (mem (set1 (tuple2 b1 a1))
  (t2tb37 (inverse2 x)) (infix_plmngt a1 b1 (t2tb12 t) (t2tb1 s)))))))

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
  (forall ((a2 ty))
  (forall ((s uni) (t (set (tuple21 b a))) (x uni))
  (= (mem (set1 (tuple2 a2 (tuple2 b1 a1))) x
  (infix_plmngtgt (tuple2 b1 a1) a2 s (t2tb37 t)))
  (and (mem (set1 (tuple2 a2 (tuple2 b1 a1))) x
  (infix_plmngt (tuple2 b1 a1) a2 s (t2tb37 t))) (infix_eqeq6
  (tb2t37 (ran (tuple2 b1 a1) a2 x)) t))))))

;; mem_partial_surjection_set
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t (set (tuple21 a b))) (x uni))
  (= (mem (set1 (tuple2 a2 (tuple2 a1 b1))) x
  (infix_plmngtgt (tuple2 a1 b1) a2 s (t2tb11 t)))
  (and (mem (set1 (tuple2 a2 (tuple2 a1 b1))) x
  (infix_plmngt (tuple2 a1 b1) a2 s (t2tb11 t))) (infix_eqeq4
  (tb2t11 (ran (tuple2 a1 b1) a2 x)) t))))))

;; mem_partial_surjection_set
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t (set b)) (x uni))
  (= (mem (set1 (tuple2 a2 b1)) x (infix_plmngtgt b1 a2 s (t2tb12 t)))
  (and (mem (set1 (tuple2 a2 b1)) x (infix_plmngt b1 a2 s (t2tb12 t)))
  (infix_eqeq3 (tb2t12 (ran b1 a2 x)) t))))))

;; mem_partial_surjection_set
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t (set a)) (x uni))
  (= (mem (set1 (tuple2 a2 a1)) x (infix_plmngtgt a1 a2 s (t2tb1 t)))
  (and (mem (set1 (tuple2 a2 a1)) x (infix_plmngt a1 a2 s (t2tb1 t)))
  (infix_eqeq1 (tb2t1 (ran a1 a2 x)) t))))))

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
;; equal_inverse_15
 ;; File "lemmes_bbook.why", line 1207, characters 7-23
  (not
  (forall ((s (set a)) (t (set b))) (infix_eqeq6 (inverse2 (times2 s t))
  (times11 t s)))))
(check-sat)
