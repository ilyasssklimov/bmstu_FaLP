; log        натуральный логарифм 
; log2       логарифм по основанию 2
; log10      десятичный логарифм
; exp        e^x
; exp2       2^x
; exp10      10^x
; cos        косинус
; sin        синус
; tan        тангенс
; sin-cos    (синус . косинус)
; sec        секанс
; csc        косеканс
; cot        котангенс
; acos       арккосинус
; asin       арксинус
; atan       арктангенс
; cosh       гиперболический косинус
; sinh       гиперболический синус
; tanh       гиперболический тангенс
; sinh-cosh  (гиперболический синус . гиперболический косинус)
; sech       гиперболический секанс
; csch       гиперболический косеканс
; coth       гиперболический котангенс
; acosh      гиперболический арккосинус
; asinh      гиперболический арксинус
; atanh      гиперболический арктангенс



(defun square (x)
  (* x x))

(defun inc (x)
  (+ x 1))


;;; log
(defun my_log_help (x accuracy
		    &optional (result 1) (current 0) (cur_sqrt (sqrt x)))
  (cond ((= accuracy current) result)
        (T (my_log_help x accuracy
			(* result (/ 2 (inc cur_sqrt)))
			(inc current)
			(sqrt cur_sqrt)))))

(defun my_log (x &optional (accuracy 25))
  (* (my_log_help x accuracy) (- x 1)))


;;; log2
(defun my_log2 (x &optional (accuracy 25))
  (/ (my_log x accuracy) (my_log 2 accuracy)))


;;; log10
(defun my_log10 (x &optional (accuracy 25))
  (/ (my_log x accuracy) (my_log 10 accuracy)))


(defconstant pi_2 (square pi))

;;; sinh
(defun my_sinh_help (x_2 accuracy &optional (current 0) (result 1))
  (cond ((= accuracy current) result)
	(T (my_sinh_help x_2 accuracy (inc current)
			 (* result
			    (+ 1 (/ x_2 (* (square (inc current)) pi_2))))))))

(defun my_sinh (x &optional (accuracy 100000))
  (* x (my_sinh_help (square x) accuracy)))


;;; cosh
(defun my_cosh_help (x_2 accuracy &optional (current 0) (result 1))
  (cond ((= accuracy current) result)
	(T (my_cosh_help x_2 accuracy (inc current)
			 (* result
			    (+ 1 (/ x_2 (* (square (- (inc current) 0.5)) pi_2))))))))

(defun my_cosh (x &optional (accuracy 100000))
  (my_cosh_help (square x) accuracy))



;;; exp
(defun my_exp (x &optional (accuracy 100000))
  (+ (my_cosh x accuracy) (my_sinh x accuracy)))


;;; exp2
(defun my_exp2 (x &optional (accuracy 100000))
  (my_exp (* x (my_log 2)) accuracy))


;;; exp10
(defun my_exp10 (x &optional (accuracy 100000))
  (my_exp (* x (my_log 10)) accuracy))


;;; cos
(defun my_cos_help (x_2 accuracy &optional (current 0) (result 1))
  (cond ((= accuracy current) result)
	(T (my_cos_help x_2 accuracy (inc current)
			(* result (- 1 (/ x_2 (* (square (- (inc current) 0.5)) pi_2))))))))

(defun my_cos (x &optional (accuracy 100000))
  (my_cos_help (square x) accuracy))


;;; sin
(defun my_sin_help (x_2 accuracy &optional (current 0) (result 1))
  (cond ((= accuracy current) result)
	(T (my_sin_help x_2 accuracy (inc current)
			(* result (- 1 (/ x_2 (* (square (inc current)) pi_2))))))))

(defun my_sin (x &optional (accuracy 100000))
  (* x (my_sin_help (square x) accuracy)))


;;; tan
(defun my_tan (x &optional (accuracy 100000))
  (/ (my_sin x accuracy) (my_cos x accuracy)))


;;; sin-cos
(defun my_sin_cos (x &optional (accuracy 100000))
  (cons (my_sin x accuracy) (my_cos x accuracy)))


;;; sec
(defun my_sec (x &optional (accuracy 100000))
  (/ 1 (my_cos x accuracy)))


;;; csc
(defun my_csc (x &optional (accuracy 100000))
  (/ 1 (my_sin x accuracy)))


;;; cot
(defun my_cot (x &optional (accuracy 100000))
  (/ (my_cos x accuracy) (my_sin x accuracy)))


;;; acos
(defun my_acos_help (x accuracy &optional (current 0) (result 1))
  (cond ((= accuracy current) result)
	(T (let ((sqrt_x (sqrt (+ 2 x))))
	     (my_acos_help sqrt_x accuracy (inc current) (* result (/ sqrt_x 2)))))))

(defun my_acos (x &optional (accuracy 100000))
  (/ (sqrt (- 1 (square x))) (my_acos_help (* 2 x) accuracy)))


;;; asin
(defun my_asin (x &optional (accuracy 100000))
  (- (/ pi 2) (my_acos x accuracy)))


;;; atan
(defun my_atan (x &optional (accuracy 100000))
  (* (my_acos (/ 1 (sqrt (+ 1 (square x)))) accuracy)
     (if (>= x 0) 1 -1)))


;;; tanh
(defun my_tanh (x &optional (accuracy 100000))
  (/ (my_sinh x accuracy) (my_cosh x accuracy)))


;;; sinh-cosh
(defun my_sinh_cosh (x &optional (accuracy 100000))
  (cons (my_sinh x accuracy) (my_cosh x accuracy)))


;;; sech
(defun my_sech (x &optional (accuracy 100000))
  (/ 1 (my_cosh x accuracy)))


;;; csch
(defun my_csch (x &optional (accuracy 100000))
  (/ 1 (my_sinh x accuracy)))


;;; coth
(defun my_coth (x &optional (accuracy 100000))
  (/ (my_cosh x accuracy) (my_sinh x accuracy)))


;;; acosh
(defun my_acosh (x &optional (accuracy 100000))
  (my_log (+ x (sqrt (- (square x) 1))) accuracy))


;;; asinh
(defun my_asinh (x &optional (accuracy 100000))
  (my_log (+ x (sqrt (+ (square x) 1))) accuracy))


;;; atanh
(defun my_atanh (x &optional (accuracy 100000))
  (* 0.5 (my_log (/ (+ 1 x) (- 1 x)) accuracy)))



; testing
(fiveam:test log_test_1
  (fiveam:is (< (abs (- (log 1) (my_log 1))) 1e-5)))

(fiveam:test log_test_2
  (fiveam:is (< (abs (- (log 4.5) (my_log 4.5))) 1e-5)))

(fiveam:test log_test_3
  (fiveam:is (< (abs (- (log 0.4) (my_log 0.4))) 1e-5)))

(fiveam:test log2_test_1
  (fiveam:is (< (abs (- (log 1 2) (my_log2 1))) 1e-5)))

(fiveam:test log2_test_2
  (fiveam:is (< (abs (- (log 5 2) (my_log2 5))) 1e-5)))

(fiveam:test log2_test_3
  (fiveam:is (< (abs (- (log 0.2 2) (my_log2 0.2))) 1e-5)))

(fiveam:test log10_test_1
  (fiveam:is (< (abs (- (log 1 10) (my_log10 1))) 1e-5)))

(fiveam:test log10_test_2
  (fiveam:is (< (abs (- (log 6.5 10) (my_log10 6.5))) 1e-5)))

(fiveam:test log10_test_3
  (fiveam:is (< (abs (- (log 0.15 10) (my_log10 0.15))) 1e-5)))

(fiveam:test exp_test_1
  (fiveam:is (< (abs (- (exp 0) (my_exp 0))) 1e-5)))

(fiveam:test exp_test_2
  (fiveam:is (< (abs (- (exp -2) (my_exp -2))) 1e-5)))

(fiveam:test exp_test_3
  (fiveam:is (< (abs (- (exp 3.5) (my_exp 3.5))) 1e-3)))

(fiveam:test exp2_test_1
  (fiveam:is (< (abs (- 1 (my_exp2 0))) 1e-5)))

(fiveam:test exp2_test_2
  (fiveam:is (< (abs (- 32 (my_exp2 5))) 1e-3)))

(fiveam:test exp2_test_3
  (fiveam:is (< (abs (- 0.25 (my_exp2 -2))) 1e-5)))

(fiveam:test exp10_test_1
  (fiveam:is (< (abs (- 1 (my_exp10 0))) 1e-5)))

(fiveam:test exp10_test_2
  (fiveam:is (< (abs (- 0.001 (my_exp10 -3))) 1e-5)))

(fiveam:test exp10_test_3
  (fiveam:is (< (abs (- 1000 (my_exp10 3 1000000))) 1e-2)))

(fiveam:test cos_test_1
  (fiveam:is (< (abs (- (cos 0) (my_cos 0))) 1e-5)))

(fiveam:test cos_test_2
  (fiveam:is (< (abs (- (cos -4) (my_cos -4))) 1e-4)))

(fiveam:test cos_test_3
  (fiveam:is (< (abs (- (cos 4) (my_cos 4))) 1e-4)))

(fiveam:test sin_test_1
  (fiveam:is (< (abs (- (sin 0) (my_sin 0))) 1e-5)))

(fiveam:test sin_test_2
  (fiveam:is (< (abs (- (sin -5) (my_sin -5))) 1e-4)))

(fiveam:test sin_test_3
  (fiveam:is (< (abs (- (sin 5) (my_sin 5))) 1e-4)))

(fiveam:test tan_test_1
  (fiveam:is (< (abs (- (tan 0) (my_tan 0))) 1e-5)))

(fiveam:test tan_test_2
  (fiveam:is (< (abs (- (tan -6) (my_tan -6))) 1e-4)))

(fiveam:test tan_test_3
  (fiveam:is (< (abs (- (tan 6) (my_tan 6))) 1e-4)))

(fiveam:test tan_test_1
  (fiveam:is (< (abs (- (tan 0) (my_tan 0))) 1e-5)))

(fiveam:test tan_test_2
  (fiveam:is (< (abs (- (tan -6) (my_tan -6))) 1e-4)))

(fiveam:test tan_test_3
  (fiveam:is (< (abs (- (tan 6) (my_tan 6))) 1e-4)))

(fiveam:test acos_test_1
  (fiveam:is (< (abs (- (acos 0) (my_acos 0))) 1e-5)))

(fiveam:test acos_test_2
  (fiveam:is (< (abs (- (acos -0.4) (my_acos -0.4))) 1e-5)))

(fiveam:test acos_test_3
  (fiveam:is (< (abs (- (acos 0.7) (my_acos 0.7))) 1e-5)))

(fiveam:test asin_test_1
  (fiveam:is (< (abs (- (asin 0) (my_asin 0))) 1e-5)))

(fiveam:test asin_test_2
  (fiveam:is (< (abs (- (asin -0.6) (my_asin -0.6))) 1e-5)))

(fiveam:test asin_test_3
  (fiveam:is (< (abs (- (asin 0.2) (my_asin 0.2))) 1e-5)))

(fiveam:test atan_test_1
  (fiveam:is (< (abs (- (atan 0) (my_atan 0))) 1e-5)))

(fiveam:test atan_test_2
  (fiveam:is (< (abs (- (atan -3) (my_atan -3))) 1e-5)))

(fiveam:test atan_test_3
  (fiveam:is (< (abs (- (atan 3) (my_atan 3))) 1e-5)))

(fiveam:test cosh_test_1
  (fiveam:is (< (abs (- (cosh 0) (my_cosh 0))) 1e-5)))

(fiveam:test cosh_test_2
  (fiveam:is (< (abs (- (cosh -2.5) (my_cosh -2.5))) 1e-4)))

(fiveam:test cosh_test_3
  (fiveam:is (< (abs (- (cosh 3.5) (my_cosh 3.5))) 1e-3)))

(fiveam:test sinh_test_1
  (fiveam:is (< (abs (- (sinh 0) (my_sinh 0))) 1e-5)))

(fiveam:test sinh_test_2
  (fiveam:is (< (abs (- (sinh -3) (my_sinh -3))) 1e-4)))

(fiveam:test sinh_test_3
  (fiveam:is (< (abs (- (sinh  2.5) (my_sinh 2.5))) 1e-4)))

(fiveam:test asinh_test_1
  (fiveam:is (< (abs (- (asinh 0) (my_asinh 0))) 1e-5)))

(fiveam:test asinh_test_2
  (fiveam:is (< (abs (- (asinh -3) (my_asinh -3))) 1e-4)))

(fiveam:test asinh_test_3
  (fiveam:is (< (abs (- (asinh 4) (my_asinh 4))) 1e-4)))

(fiveam:test acosh_test_1
  (fiveam:is (< (abs (- (acosh 0) (my_acosh 0))) 1e-5)))

(fiveam:test acosh_test_2
  (fiveam:is (< (abs (- (acosh -0.5) (my_acosh -0.5))) 1e-4)))

(fiveam:test acosh_test_3
  (fiveam:is (< (abs (- (acosh 3.5) (my_acosh 3.5))) 1e-4)))

(fiveam:test atanh_test_1
  (fiveam:is (< (abs (- (atanh 0) (my_atanh 0))) 1e-5)))

(fiveam:test atanh_test_2
  (fiveam:is (< (abs (- (atanh -0.4) (my_atanh -0.4))) 1e-4)))

(fiveam:test atanh_test_3
  (fiveam:is (< (abs (- (atanh 0.3) (my_atanh 0.3))) 1e-4)))

; running tests
(fiveam:run!)
