; task 1
(defun palindrome (lst)
  (cond ((null (listp lst)) NIL)
	(T (equal lst (reverse lst)))))


; task 2
(defun set_equal (lst1 lst2)
  (and (listp lst1) (listp lst2)
       (subsetp lst1 lst2) (subsetp lst2 lst1)))


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
  (let ((first_elem (car lst)))
    (setf (car lst) (car (last lst)))
    (setf (car (last lst)) first_elem)
    lst))


; task 5
(defun swap_two_elements (lst i j)
  (if (null (listp lst)) NIL)
  (let ((i_elem (nth i lst)))
    (setf (nth i lst) (nth j lst))
    (setf (nth j lst) i_elem)
    lst))


; task 6
; 1 2 3 4 5 -> 2 3 4 5 1
(defun swap_to_left (lst)
  (cond ((null (listp lst)) NIL)
	((< (length lst) 2) lst)
	(T (let ((first_elem (first lst)))
	     (setf (car lst) (second lst))
	     (setf (cdr lst) (append (nthcdr 2 lst) (list first_elem)))
	     lst))))

; 1 2 3 4 5 -> 5 1 2 3 4
(defun swap_to_right (lst)
  (cond ((null (listp lst)) NIL)
	((< (length lst) 2) lst)
	(T (let ((last_elem (car (last lst))))
	     (setf (cdr lst) (butlast lst))
	     (setf (car lst) last_elem)
	     lst))))


; task 7
(defun add_two_element_list (lst new_pair)
  (cond ((null (listp lst)) NIL)
	((null (notany #'(lambda (pair) (equal pair new_pair)) lst)) NIL)
	(T (nconc lst (list new_pair)))))


; task 8
; all elements are numbers
(defun mul_first_number_v1 (lst k)
  (cond ((or (null (listp lst)) (null (numberp k))) NIL)
	(T (setf (car lst) (* (car lst) k))))
  lst)

; all elements are objects
(defun mul_first_number_v2 (lst k)
  (cond ((or (null (listp lst)) (null (numberp k))) NIL)
	(T (let ((stop 0)
		 (i 0))
	     (mapcar #'(lambda (element) (if (and (numberp element) (= stop 0))
					    (setf stop 1
						  (nth i lst) (* element k))
					    (setf i (+ i 1)))) lst))
	   lst)))


; task 9
(defun select_between (lst left right)
  (cond ((or (null (listp lst))
	     (null (numberp left)) (null (numberp right))) NIL)
	(T (if (> left right) (let ((tmp left))
				(setf left right)
				(setf right tmp)))
	   (sort (remove NIL (mapcar #'(lambda (num)
					 (if (and (> num left) (< num right)) num))
				     lst))
		 #'<))))

