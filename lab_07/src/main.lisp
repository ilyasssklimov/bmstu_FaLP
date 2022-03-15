; task 1
(defun move_to (lst result)
  (cond ((null lst) result)
	(T (move_to (cdr lst) (cons (car lst) result)))))

(defun my_reverse (lst)
  (move_to lst ()))


; task 2
(defun find_list (lst element)
  (cond ((or (null lst) element) element)
	((and (listp (car lst)) (> (length lst) 0))
	 (find_list (cdr lst) (car lst)))
	(T (find_list (cdr lst) element))))
  
(defun find_first_list (lst)
  (find_list lst NIL))


; task 3
(defun between (lst result left right)
  (cond ((null lst) result)
	((and (> (car lst) left) (< (car lst) right))
	 (between (cdr lst) (append result (list (car lst))) left right))
	(T (between (cdr lst) result left right))))

(defun between_1_and_10 (lst)
  (between lst () 1 10))
