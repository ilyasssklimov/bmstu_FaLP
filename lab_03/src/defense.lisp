; solving
(defun solve_quadratic (a b c)
  (cond ((= a b c 0) `(Корень может быть любым))
	((= a b 0) `(Уравнение не имеет решений))
	((= a 0) `(Уравнение имеет единственное решение = ,(/ (- c) b)))
	(T (let* ((D (- (* b b) (* 4 a c)))
		  (x1 (/ (- (- b) (sqrt D)) (* 2 a)))
		  (x2 (/ (+ (- b) (sqrt D)) (* 2 a))))
	     (cond
	       ((< D 0) `(Решением являются комплексные корни.  x1 = (,(realpart x1) ,(imagpart x1)) и x2 = (,(realpart x2) ,(imagpart x2))))
	       ((= D 0) `(Решением являются два совпадающих корня. x1 = x2 = ,x1))
	       (T `(Решением являются два корня. x1 = ,x1 и x2 = ,x2)))))))

(defun convert_to_stream (stream data)
  (cond ((null data) stream)
	(T (format stream "~a " (car data))
	   (convert_to_stream stream (cdr data)))))

; :supersede - заменить существубщий файл
; :direction :output - для выходного потока
(defun print_into_file (data)
  (with-open-file (stream "lab_03.txt" :direction :output :if-exists :supersede :if-does-not-exist :create)
    (convert_to_stream stream data)))

(defun write_to_file_solving (a b c)
  (print_into_file (solve_quadratic a b c)))


; testing
(fiveam:test all_zeros
  (fiveam:is (equal `(Корень может быть любым) (solve_quadratic 0 0 0))))

(fiveam:test a_b_zeros
  (fiveam:is (equal `(Уравнение не имеет решений) (solve_quadratic 0 0 5))))

(fiveam:test a_zero
  (fiveam:is (equal `(Уравнение имеет единственное решение = -4) (solve_quadratic 0 2 8))))

(fiveam:test D_less_zero
  (fiveam:is (equal `(Решением являются комплексные корни. x1 = (-1.0 -2.0) и x2 = (-1.0 2.0)) (solve_quadratic 1 2 5))))

(fiveam:test D_equal_zero
  (fiveam:is (equal `(Решением являются два совпадающих корня. x1 = x2 = 4.0) (solve_quadratic 1 -8 16))))

(fiveam:test D_more_zero
  (fiveam:is (equal `(Решением являются два корня. x1 = 2.0 и x2 = 4.0) (solve_quadratic 2 -12 16))))

(fiveam:run!)
