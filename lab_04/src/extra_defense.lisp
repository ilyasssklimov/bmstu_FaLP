; first variant of exp (difficulty in raising a degree)

(defun is_prime_help (x i)
  (cond ((> (square i) x) T)
	((= (mod x i) 0) NIL)
	(T (is_prime_help x (inc i)))))

(defun is_prime (x)
  (cond ((< x 2) NIL)
	(T (is_prime_help x 2))))

(defun help_mobius (x p i)
  (cond ((> i x) p)
	((and (= (mod x i) 0) (is_prime i))
         (cond ((= (mod x (square i)) 0) 0)
	       (T (help_mobius x (+ p 1) (inc i)))))
	(T (help_mobius x p (inc i)))))

(defun mobius (x)
  (cond ((= x 1) 1)
	(T (let ((p (help_mobius x 0 1)))
	     (cond ((= p 0) 0)
		   ((= (mod p 2) 0) 1)
		   (T -1))))))

(defun pow_negative (x k)
  (if (< k 0) (/ 1 x) x))
  

; second variant of exp (low accuracy, but using infinite product)

(defun pow_integer (x k &optional (result 1))
  (cond ((= k 0) result)
	(T (pow_integer x (- k 1) (* result x)))))

(defun my_exp_help (x accuracy &optional (current 0) (result 1))
  (cond ((= accuracy current) result)
	(T (let ((inc_cur (inc current)))
	     (my_exp_help x accuracy inc_cur
			  (* result (/ (float (pow_integer (+ 1 (/ 1 inc_cur)) inc_cur))
				       (* (pow_integer (+ 1 (/ 1 (+ inc_cur x))) inc_cur)
					  (+ 1 (/ x (+ inc_cur 1)))))))))))

(defun my_exp (x &optional (accuracy 500))
  (/ (+ x 1) (my_exp_help x accuracy)))
  

; using variant of exp in defense is bad for big negative numbers