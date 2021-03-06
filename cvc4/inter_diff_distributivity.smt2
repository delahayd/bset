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

(declare-sort a 0)

(declare-fun a1 () ty)

(declare-fun infix_eqeq (ty uni uni) Bool)

(declare-fun infix_eqeq1 ((set a) (set a)) Bool)

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

(declare-fun inter1 ((set a) (set a)) (set a))

;; mem_inter
  (assert
  (forall ((s (set a)) (t (set a)) (x a))
  (= (mem a1 (t2tb2 x) (t2tb1 (inter1 s t)))
  (and (mem a1 (t2tb2 x) (t2tb1 s)) (mem a1 (t2tb2 x) (t2tb1 t))))))

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

(declare-fun diff1 ((set a) (set a)) (set a))

;; mem_diff
  (assert
  (forall ((s (set a)) (t (set a)) (x a))
  (= (mem a1 (t2tb2 x) (t2tb1 (diff1 s t)))
  (and (mem a1 (t2tb2 x) (t2tb1 s)) (not (mem a1 (t2tb2 x) (t2tb1 t)))))))

;; mem_diff
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem a2 x (diff a2 s t)) (and (mem a2 x s) (not (mem a2 x t)))))))

(declare-fun tuple2 (ty ty) ty)

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
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 b)) (times b a2 x x1)))))

;; mem_times
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((s uni) (t uni) (x uni) (y uni))
  (= (mem (tuple2 a2 b) (Tuple2 a2 b x y) (times b a2 s t))
  (and (mem a2 x s) (mem b y t))))))

;; mem_power
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t uni))
  (and
  (=> (mem (set1 a2) s (power a2 t))
  (forall ((x uni)) (=> (mem a2 x s) (mem a2 x t))))
  (=> (forall ((x uni)) (=> (sort a2 x) (=> (mem a2 x s) (mem a2 x t)))) (mem
  (set1 a2) s (power a2 t)))))))

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
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b)))
  (relation b a2 x x1)))))

;; mem_relation
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((u uni) (v uni) (r uni))
  (and
  (=> (mem (set1 (tuple2 a2 b)) r (relation b a2 u v))
  (forall ((x uni) (y uni))
  (=> (mem (tuple2 a2 b) (Tuple2 a2 b x y) r) (and (mem a2 x u) (mem b y v)))))
  (=>
  (forall ((x uni) (y uni))
  (=> (sort a2 x)
  (=> (sort b y)
  (=> (mem (tuple2 a2 b) (Tuple2 a2 b x y) r) (and (mem a2 x u) (mem b y v))))))
  (mem (set1 (tuple2 a2 b)) r (relation b a2 u v)))))))

(declare-fun inverse (ty ty uni) uni)

;; inverse_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni)) (sort (set1 (tuple2 b a2)) (inverse b a2 x)))))

;; mem_inverse
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((p uni) (x uni) (y uni))
  (= (mem (tuple2 b a2) (Tuple2 b a2 x y) (inverse b a2 p)) (mem
  (tuple2 a2 b) (Tuple2 a2 b y x) p)))))

(declare-fun dom (ty ty uni) uni)

;; dom_sort
  (assert
  (forall ((a2 ty) (b ty)) (forall ((x uni)) (sort (set1 a2) (dom b a2 x)))))

;; mem_dom
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((p uni) (x uni))
  (and
  (=> (mem a2 x (dom b a2 p))
  (exists ((b1 uni))
  (and (sort b b1) (mem (tuple2 a2 b) (Tuple2 a2 b x b1) p))))
  (=> (exists ((b1 uni)) (mem (tuple2 a2 b) (Tuple2 a2 b x b1) p)) (mem a2 x
  (dom b a2 p)))))))

(declare-fun ran (ty ty uni) uni)

;; ran_sort
  (assert
  (forall ((a2 ty) (b ty)) (forall ((x uni)) (sort (set1 b) (ran b a2 x)))))

;; mem_ran
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((p uni) (x uni))
  (and
  (=> (mem b x (ran b a2 p))
  (exists ((a3 uni))
  (and (sort a2 a3) (mem (tuple2 a2 b) (Tuple2 a2 b a3 x) p))))
  (=> (exists ((a3 uni)) (mem (tuple2 a2 b) (Tuple2 a2 b a3 x) p)) (mem b x
  (ran b a2 p)))))))

(declare-fun semicolon (ty ty ty uni uni) uni)

;; semicolon_sort
  (assert
  (forall ((a2 ty) (b ty) (c ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 c))
  (semicolon c b a2 x x1)))))

;; mem_semicolon
  (assert
  (forall ((a2 ty) (b ty) (c ty))
  (forall ((p uni) (q uni) (x uni) (y uni))
  (and
  (=> (mem (tuple2 a2 c) (Tuple2 a2 c x y) (semicolon c b a2 p q))
  (exists ((b1 uni))
  (and (sort b b1)
  (and (mem (tuple2 a2 b) (Tuple2 a2 b x b1) p) (mem (tuple2 b c)
  (Tuple2 b c b1 y) q)))))
  (=>
  (exists ((b1 uni))
  (and (mem (tuple2 a2 b) (Tuple2 a2 b x b1) p) (mem (tuple2 b c)
  (Tuple2 b c b1 y) q))) (mem (tuple2 a2 c) (Tuple2 a2 c x y)
  (semicolon c b a2 p q)))))))

(declare-fun semicolon_back (ty ty ty uni uni) uni)

;; semicolon_back_sort
  (assert
  (forall ((a2 ty) (b ty) (c ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 c))
  (semicolon_back c b a2 x x1)))))

;; semicolon_back
  (assert
  (forall ((a2 ty) (b ty) (c ty))
  (forall ((p uni) (q uni))
  (= (semicolon_back c b a2 q p) (semicolon c b a2 p q)))))

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
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 b))
  (domain_restriction b a2 x x1)))))

;; mem_domain_restriction
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((p uni) (s uni) (x uni) (y uni))
  (= (mem (tuple2 a2 b) (Tuple2 a2 b x y) (domain_restriction b a2 s p))
  (and (mem (tuple2 a2 b) (Tuple2 a2 b x y) p) (mem a2 x s))))))

(declare-fun range_restriction (ty ty uni uni) uni)

;; range_restriction_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 b))
  (range_restriction b a2 x x1)))))

;; mem_range_restriction
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((p uni) (t uni) (x uni) (y uni))
  (= (mem (tuple2 a2 b) (Tuple2 a2 b x y) (range_restriction b a2 p t))
  (and (mem (tuple2 a2 b) (Tuple2 a2 b x y) p) (mem b y t))))))

(declare-fun domain_substraction (ty ty uni uni) uni)

;; domain_substraction_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 b))
  (domain_substraction b a2 x x1)))))

;; mem_domain_substraction
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((p uni) (s uni) (x uni) (y uni))
  (= (mem (tuple2 a2 b) (Tuple2 a2 b x y) (domain_substraction b a2 s p))
  (and (mem (tuple2 a2 b) (Tuple2 a2 b x y) p) (not (mem a2 x s)))))))

(declare-fun range_substraction (ty ty uni uni) uni)

;; range_substraction_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 b))
  (range_substraction b a2 x x1)))))

;; mem_range_substraction
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((p uni) (t uni) (x uni) (y uni))
  (= (mem (tuple2 a2 b) (Tuple2 a2 b x y) (range_substraction b a2 p t))
  (and (mem (tuple2 a2 b) (Tuple2 a2 b x y) p) (not (mem b y t)))))))

(declare-fun image (ty ty uni uni) uni)

;; image_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 b) (image b a2 x x1)))))

;; mem_image
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((p uni) (w uni) (x uni))
  (and
  (=> (mem b x (image b a2 p w))
  (exists ((a3 uni))
  (and (sort a2 a3)
  (and (mem a2 a3 w) (mem (tuple2 a2 b) (Tuple2 a2 b a3 x) p)))))
  (=>
  (exists ((a3 uni))
  (and (mem a2 a3 w) (mem (tuple2 a2 b) (Tuple2 a2 b a3 x) p))) (mem b x
  (image b a2 p w)))))))

(declare-fun infix_lspl (ty ty uni uni) uni)

;; infix <+_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 b))
  (infix_lspl b a2 x x1)))))

;; mem_overriding
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((q uni) (p uni) (x uni) (y uni))
  (= (mem (tuple2 a2 b) (Tuple2 a2 b x y) (infix_lspl b a2 q p))
  (or
  (and (mem (tuple2 a2 b) (Tuple2 a2 b x y) q) (not (mem a2 x (dom b a2 p))))
  (mem (tuple2 a2 b) (Tuple2 a2 b x y) p))))))

(declare-fun direct_product (ty ty ty uni uni) uni)

;; direct_product_sort
  (assert
  (forall ((a2 ty) (b ty) (c ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 a2 (tuple2 b c)))
  (direct_product c b a2 x x1)))))

;; mem_direct_product
  (assert
  (forall ((a2 ty) (b ty) (c ty))
  (forall ((f uni) (g uni) (x uni) (y uni) (z uni))
  (= (mem (tuple2 a2 (tuple2 b c))
  (Tuple2 a2 (tuple2 b c) x (Tuple2 b c y z)) (direct_product c b a2 f g))
  (and (mem (tuple2 a2 b) (Tuple2 a2 b x y) f) (mem (tuple2 a2 c)
  (Tuple2 a2 c x z) g))))))

(declare-fun prj1 (ty ty uni) uni)

;; prj1_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni)) (sort (set1 (tuple2 (tuple2 a2 b) a2)) (prj1 b a2 x)))))

;; mem_proj_op_1
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((s uni) (t uni) (x uni) (y uni) (z uni))
  (=> (sort a2 x)
  (=> (sort a2 z)
  (= (mem (tuple2 (tuple2 a2 b) a2)
  (Tuple2 (tuple2 a2 b) a2 (Tuple2 a2 b x y) z)
  (prj1 b a2 (Tuple2 (set1 a2) (set1 b) s t)))
  (and (mem (tuple2 (tuple2 a2 b) a2)
  (Tuple2 (tuple2 a2 b) a2 (Tuple2 a2 b x y) z)
  (times a2 (tuple2 a2 b) (times b a2 s t) s)) (= z x))))))))

(declare-fun prj2 (ty ty uni) uni)

;; prj2_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni)) (sort (set1 (tuple2 (tuple2 a2 b) b)) (prj2 b a2 x)))))

;; mem_proj_op_2
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((s uni) (t uni) (x uni) (y uni) (z uni))
  (=> (sort b y)
  (=> (sort b z)
  (= (mem (tuple2 (tuple2 a2 b) b)
  (Tuple2 (tuple2 a2 b) b (Tuple2 a2 b x y) z)
  (prj2 b a2 (Tuple2 (set1 a2) (set1 b) s t)))
  (and (mem (tuple2 (tuple2 a2 b) b)
  (Tuple2 (tuple2 a2 b) b (Tuple2 a2 b x y) z)
  (times b (tuple2 a2 b) (times b a2 s t) t)) (= z y))))))))

(declare-fun parallel_product (ty ty ty ty uni uni) uni)

;; parallel_product_sort
  (assert
  (forall ((a2 ty) (b ty) (c ty) (d ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (tuple2 (tuple2 a2 c) (tuple2 b d)))
  (parallel_product d c b a2 x x1)))))

;; mem_parallel_product
  (assert
  (forall ((a2 ty) (b ty) (c ty) (d ty))
  (forall ((h uni) (k uni) (x uni) (y uni) (z uni) (w uni))
  (= (mem (tuple2 (tuple2 a2 c) (tuple2 b d))
  (Tuple2 (tuple2 a2 c) (tuple2 b d) (Tuple2 a2 c x y) (Tuple2 b d z w))
  (parallel_product d c b a2 h k))
  (and (mem (tuple2 a2 b) (Tuple2 a2 b x z) h) (mem (tuple2 c d)
  (Tuple2 c d y w) k))))))

(declare-fun infix_plmngt (ty ty uni uni) uni)

;; infix +->_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b)))
  (infix_plmngt b a2 x x1)))))

;; mem_partial_function_set
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((s uni) (t uni) (f uni))
  (and
  (=> (mem (set1 (tuple2 a2 b)) f (infix_plmngt b a2 s t))
  (and (mem (set1 (tuple2 a2 b)) f (relation b a2 s t))
  (forall ((x uni) (y1 uni) (y2 uni))
  (=> (sort b y1)
  (=> (sort b y2)
  (=>
  (and (mem (tuple2 a2 b) (Tuple2 a2 b x y1) f) (mem (tuple2 a2 b)
  (Tuple2 a2 b x y2) f)) (= y1 y2)))))))
  (=>
  (and (mem (set1 (tuple2 a2 b)) f (relation b a2 s t))
  (forall ((x uni) (y1 uni) (y2 uni))
  (=> (sort a2 x)
  (=> (sort b y1)
  (=> (sort b y2)
  (=>
  (and (mem (tuple2 a2 b) (Tuple2 a2 b x y1) f) (mem (tuple2 a2 b)
  (Tuple2 a2 b x y2) f)) (= y1 y2))))))) (mem (set1 (tuple2 a2 b)) f
  (infix_plmngt b a2 s t)))))))

(declare-fun infix_mnmngt (ty ty uni uni) uni)

;; infix -->_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b)))
  (infix_mnmngt b a2 x x1)))))

;; mem_total_function_set
  (assert
  (forall ((b ty))
  (forall ((s (set a)) (t uni) (x uni))
  (= (mem (set1 (tuple2 a1 b)) x (infix_mnmngt b a1 (t2tb1 s) t))
  (and (mem (set1 (tuple2 a1 b)) x (infix_plmngt b a1 (t2tb1 s) t))
  (infix_eqeq1 (tb2t1 (dom b a1 x)) s))))))

;; mem_total_function_set
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b)) x (infix_mnmngt b a2 s t))
  (and (mem (set1 (tuple2 a2 b)) x (infix_plmngt b a2 s t)) (infix_eqeq a2
  (dom b a2 x) s))))))

(declare-fun infix_gtplgt (ty ty uni uni) uni)

;; infix >+>_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b)))
  (infix_gtplgt b a2 x x1)))))

;; mem_partial_injection_set
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b)) x (infix_gtplgt b a2 s t))
  (and (mem (set1 (tuple2 a2 b)) x (infix_plmngt b a2 s t)) (mem
  (set1 (tuple2 b a2)) (inverse b a2 x) (infix_plmngt a2 b t s)))))))

(declare-fun infix_gtmngt (ty ty uni uni) uni)

;; infix >->_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b)))
  (infix_gtmngt b a2 x x1)))))

;; mem_total_injection_set
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b)) x (infix_gtmngt b a2 s t))
  (and (mem (set1 (tuple2 a2 b)) x (infix_gtplgt b a2 s t)) (mem
  (set1 (tuple2 a2 b)) x (infix_mnmngt b a2 s t)))))))

(declare-fun infix_plmngtgt (ty ty uni uni) uni)

;; infix +->>_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b)))
  (infix_plmngtgt b a2 x x1)))))

;; mem_partial_surjection_set
  (assert
  (forall ((a2 ty))
  (forall ((s uni) (t (set a)) (x uni))
  (= (mem (set1 (tuple2 a2 a1)) x (infix_plmngtgt a1 a2 s (t2tb1 t)))
  (and (mem (set1 (tuple2 a2 a1)) x (infix_plmngt a1 a2 s (t2tb1 t)))
  (infix_eqeq1 (tb2t1 (ran a1 a2 x)) t))))))

;; mem_partial_surjection_set
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b)) x (infix_plmngtgt b a2 s t))
  (and (mem (set1 (tuple2 a2 b)) x (infix_plmngt b a2 s t)) (infix_eqeq b
  (ran b a2 x) t))))))

(declare-fun infix_mnmngtgt (ty ty uni uni) uni)

;; infix -->>_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b)))
  (infix_mnmngtgt b a2 x x1)))))

;; mem_total_surjection_set
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b)) x (infix_mnmngtgt b a2 s t))
  (and (mem (set1 (tuple2 a2 b)) x (infix_plmngtgt b a2 s t)) (mem
  (set1 (tuple2 a2 b)) x (infix_mnmngt b a2 s t)))))))

(declare-fun infix_gtplgtgt (ty ty uni uni) uni)

;; infix >+>>_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b)))
  (infix_gtplgtgt b a2 x x1)))))

;; mem_partial_bijection_set
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b)) x (infix_gtplgtgt b a2 s t))
  (and (mem (set1 (tuple2 a2 b)) x (infix_gtplgt b a2 s t)) (mem
  (set1 (tuple2 a2 b)) x (infix_plmngtgt b a2 s t)))))))

(declare-fun infix_gtmngtgt (ty ty uni uni) uni)

;; infix >->>_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort (set1 (set1 (tuple2 a2 b)))
  (infix_gtmngtgt b a2 x x1)))))

;; mem_total_bijection_set
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((s uni) (t uni) (x uni))
  (= (mem (set1 (tuple2 a2 b)) x (infix_gtmngtgt b a2 s t))
  (and (mem (set1 (tuple2 a2 b)) x (infix_gtmngt b a2 s t)) (mem
  (set1 (tuple2 a2 b)) x (infix_mnmngtgt b a2 s t)))))))

(declare-fun apply (ty ty uni uni) uni)

;; apply_sort
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((x uni) (x1 uni)) (sort b (apply b a2 x x1)))))

;; apply_def0
  (assert
  (forall ((a2 ty) (b ty))
  (forall ((f uni) (s uni) (t uni) (a3 uni))
  (=>
  (and (mem (set1 (tuple2 a2 b)) f (infix_plmngt b a2 s t)) (mem a2 a3
  (dom b a2 f))) (mem (tuple2 a2 b) (Tuple2 a2 b a3 (apply b a2 f a3)) f)))))

(assert
;; inter_diff_distributivity
 ;; File "lemmes_bbook.why", line 123, characters 7-32
  (not
  (forall ((a2 (set a)) (b (set a)) (c (set a))) (infix_eqeq1
  (diff1 (inter1 a2 b) c) (inter1 (diff1 a2 c) b)))))
(check-sat)
