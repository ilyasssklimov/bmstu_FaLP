; task 2
(defun hypotenuse (a b)
  (sqrt (+ (* a a) (* b b))))

; task 3
(defun volume (a b c)
  (* a b c))

; task 5
(defun longer_than (a b)
  (if (> (length a) (length b)) T NIL))

; task 7
(defun mystery (x)
  (list (second x) (first x)))

; task 8
(defun f_to_c (temp)
  (* (/ 5 9) (- temp 32.0)))

; extra 1
(defun cathetus (hyp cat)
  (sqrt (- (* hyp hyp) (* cat cat))))

; extra 2
(defun trapezoid (a b h)
  (* 0.5 (+ a b) h))
