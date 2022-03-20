; log       натуральный логарифм 
; log2      логарифм по основанию 2
; log10     десятичный логарифм
; exp       e^x
; exp2      2^x
; exp10     10^x
; cos       косинус
; sin
; tan
; sin-cos
; sec
; csc
; cot
; acos
; asin
; atan
; cosh      гиперболический косинус
; sinh      гиперболический синус
; tanh
; sinh-cosh
; sech
; csch
; coth
; acosh
; asinh
; atanh



(defun square (x)
  (* x x))

(defun inc (x)
  (+ x 1))


; log
(defun my_log_help (x accuracy
		    &optional (result 1) (current 0) (cur_sqrt (sqrt x)))
  (cond ((= accuracy current) result)
        (T (my_log_help x accuracy
			(* result (/ 2 (inc cur_sqrt)))
			(inc current)
			(sqrt cur_sqrt)))))

(defun my_log (x &optional (accuracy 25))
  (* (my_log_help x accuracy) (- x 1)))


; log2
(defun my_log2 (x &optional (accuracy 25))
  (/ (my_log x accuracy) (my_log 2 accuracy)))


; log10
(defun my_log10 (x &optional (accuracy 25))
  (/ (my_log x accuracy) (my_log 10 accuracy)))


(defconstant pi_2 (square pi))

; sinh
(defun my_sinh_help (x_2 accuracy &optional (current 0) (result 1))
  (cond ((= accuracy current) result)
	(T (my_sinh_help x_2 accuracy (inc current)
			 (* result
			    (+ 1 (/ x_2 (* (square (inc current)) pi_2))))))))

(defun my_sinh (x &optional (accuracy 100000))
  (* x (my_sinh_help (square x) accuracy)))


; cosh
(defun my_cosh_help (x_2 accuracy &optional (current 0) (result 1))
  (cond ((= accuracy current) result)
	(T (my_cosh_help x_2 accuracy (inc current)
			 (* result
			    (+ 1 (/ x_2 (* (square (- (inc current) 0.5)) pi_2))))))))

(defun my_cosh (x &optional (accuracy 100000))
  (my_cosh_help (square x) accuracy))



; exp
(defun my_exp (x &optional (accuracy 100000))
  (+ (my_cosh x accuracy) (my_sinh x accuracy)))


; exp2
(defun my_exp2 (x &optional (accuracy 100000))
  (my_exp (* x (my_log 2)) accuracy))


; exp10
(defun my_exp10 (x &optional (accuracy 100000))
  (my_exp (* x (my_log 10)) accuracy))


; cos
(defun my_cos_help (x_2 accuracy &optional (current 0) (result 1))
  (cond ((= accuracy current) result)
	(T (my_cos_help x_2 accuracy (inc current)
			(* result (- 1 (/ x_2 (* (square (- (inc current) 0.5)) pi_2))))))))

(defun my_cos (x &optional (accuracy 100000))
  (my_cos_help (square x) accuracy))
