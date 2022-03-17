; task 1
(defun nearest_even (x)
  (if (evenp x)
      x
      (+ x 1)))


; task 2
(defun more_than_abs (x)
  (+ x (if (< x 0) -1 1)))


; task 3
(defun nums_to_list (a b)
  (if (< a b)
      (list a b)
      (list b a)))


; task 4
(defun first_between_two (a b c)
  (or (> b a c) (> c a b)))


; task 6
(defun more_or_equal (a b)
  (>= a b))


; tasl 7
(defun pred1 (x)
  (and (numberp x) (plusp x)))

(defun pred2 (x)
  (and (plusp x) (numberp x)))


; task 8
(defun first_between_two_if (a b c)
  (if (> a b)
      (< a c)
      (if (> a c)
	  (< a b))))

(defun first_between_two_cond (a b c)
  (cond ((> a b) (< a c))
	((> a c) (< a b))))

(defun first_between_two (a b c)
  (or (> b a c) (> c a b)))


; task 9
(defun how_alike (x y)
  (if (or (= x y) (equal x y))
      'the_same
      (if (and (oddp x) (oddp y))
	  'both_odd
	  (if (and (evenp x) (evenp y))
	      'both_even
	      'difference))))
