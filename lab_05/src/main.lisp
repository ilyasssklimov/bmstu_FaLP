;;; task 1
(defun palindrome (lst)
  (cond ((null (listp lst)) NIL)
	(T (equal lst (reverse lst)))))


;;; task 2
(defun set_equal (lst1 lst2)
  (and (listp lst1) (listp lst2)
       (subsetp lst1 lst2) (subsetp lst2 lst1)))


;;; task 3
(defun capital_by_country (table country)
  (cond ((null table) NIL)
	((equal (caar table) country) (cdar table))
	(T (capital_by_country (cdr table) country))))

(defun country_by_capital (table capital)
  (cond ((null table) NIL)
	((equal (cdar table) capital) (caar table))
	(T (country_by_capital (cdr table) capital))))


;;; task 4
(defun swap_first_last (lst)
  (cond ((< (length lst) 2) lst)
	(T (append (last lst) (butlast (cdr lst)) (list (car lst))))))


;;; task 5
(defun butfirst (lst num)
  (car (remove NIL (maplist #'(lambda (x)
				(if (= (length x) (- (length lst) num))
				    x NIL)) lst))))

(defun swap_two_elements_help (lst i j)
  (cond ((or (< (length lst) 2) (= i j)) lst)
	(T (append (butlast lst (- (length lst) i))
		   (list (nth j lst))
		   (butlast (butfirst lst (+ i 1)) (- (length lst) j))
		   (list (nth i lst))
		   (butfirst lst (+ j 1))))))

(defun swap_two_elements (lst i j)
  (cond ((< j i) (swap_two_elements_help lst j i))
	(T (swap_two_elements_help lst i j))))


;;; task 6
;;; 1 2 3 4 5 -> 2 3 4 5 1
(defun swap_to_left (lst)
  (cond ((< (length lst) 2) lst)
	(T (append (butfirst lst 1) (list (car lst))))))

;;; 1 2 3 4 5 -> 5 1 2 3 4
(defun swap_to_right (lst)
  (cond ((< (length lst) 2) lst)
	(T (append (last lst) (butlast lst)))))


;;; task 7
(defun add_two_element_list (lst new_pair)
  (cond ((null (listp lst)) NIL)
	((null (notany #'(lambda (pair) (equal pair new_pair)) lst)) NIL)
	(T (nconc lst (list new_pair)))))


;;; task 8
;;; all elements are numbers
(defun mul_first_number_v1 (lst k)
  (append (list (* (car lst) k)) (cdr lst)))

;;; all elements are objects
(defun mul_first_number_v2 (lst k)
  (let ((stop 0))
    (mapcar #'(lambda (x) (if (and (= stop 0) (numberp x))
			      (and (setf stop 1) (* x k))
			      x)) lst)))


;;; task 9
(defun select_between_help (lst left right)
  (sort (remove NIL (mapcar #'(lambda (num)
				(if (and (> num left) (< num right)) num))
			    lst)) #'<))

(defun select_between (lst left right)
  (cond ((< right left) (select_between_help lst right left))
	(T (select_between_help lst left right))))

