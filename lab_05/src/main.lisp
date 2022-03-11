; task 1
(defun move_to (lst result)
  (cond ((null lst) result)
	(T (move_to (cdr lst) (cons (car lst) result)))))

(defun my_reverse (lst)
  (move_to lst ()))

(defun my_equal (lst1 lst2)
  (and (= (length lst1) (length lst2)) (every #'equal lst1 lst2)))

(defun palindrome (lst)
  (cond ((null (listp lst)) NIL)
	(T (my_equal lst (my_reverse lst)))))


; task 2
(defun and_list (lst)
  (eval `(and ,@lst)))

(defun my_member (element lst)
  (cond ((equal element (car lst)) T)
	((null lst) NIL)
	(T (my_member element (cdr lst)))))

(defun is_belong (lst1 lst2)
  (my_member (car lst1) lst2))

(defun my_subsetp (lst1 lst2)
  (and_list (maplist #'(lambda (lst) (is_belong lst lst2)) lst1)))

(defun set_equal (lst1 lst2)
  (and (listp lst1) (listp lst2)
       (my_subsetp lst1 lst2) (my_subsetp lst2 lst1)))


; task 3
(defun capital_by_country (table country)
  (cond ((null table) NIL)
	((equal (caar table) country) (cdar table))
	(T (capital_by_country (cdr table) country))))

(defun country_by_capital (table capital)
  (cond ((null table) NIL)
	((equal (cdar table) capital) (caar table))
	(T (country_by_capital (cdr table) capital))))


; task 4
(defun swap_first_last (lst)
  (if (null (listp lst)) NIL)
  (let ((first_elem (car lst))
	(last_elem (car (last lst))))
    (setf (car lst) last_elem)
    (setf (car (last lst)) first_elem)
    lst))
