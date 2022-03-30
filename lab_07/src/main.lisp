;;; task 1 (1)
(defun move_to (lst result)
  (cond ((null lst) result)
	(T (move_to (cdr lst) (cons (car lst) result)))))

(defun my_reverse (lst)
  (move_to lst ()))


;;; task 2 (3)
(defun find_list (lst element)
  (cond ((or (null lst) element) element)
	((and (listp (car lst)) (> (length lst) 0))
	 (find_list (cdr lst) (car lst)))
	(T (find_list (cdr lst) element))))
  
(defun find_first_list (lst)
  (find_list lst NIL))


;;; task 3 (4)
(defun between (lst result left right)
  (cond ((null lst) result)
	((and (> (car lst) left) (< (car lst) right))
	 (between (cdr lst) (append result (list (car lst))) left right))
	(T (between (cdr lst) result left right))))

(defun between_1_and_10 (lst)
  (between lst () 1 10))


;;; task 4 (7)
(defun mul_by_number_v1 (lst num &optional (result NIL))
  (cond ((null lst) result)
	(T (mul_by_number_v1 (cdr lst) num (append result (list (* (car lst) num)))))))

(defun mul_by_number_v2 (lst num &optional (result NIL))
  (cond ((null lst) result)
	((numberp (car lst))
	 (mul_by_number_v2 (cdr lst) num (append result (list (* (car lst) num)))))
	(T (mul_by_number_v2 (cdr lst) num (append result (list (car lst)))))))


;;; task 5 (8)
(defun my_remove (x lst &optional (deleted 0) (result NIL))
  (cond ((null lst) result)
	((and (= deleted 0) (equal x (car lst)))
	 (my_remove x (cdr lst) 1 result))
	(T (my_remove x (cdr lst) deleted (append result (list (car lst)))))))


(defun my_max (lst &optional (max NIL))
  (cond ((null lst) max)
	((or (null max) (> (car lst) max)) (my_max (cdr lst) (car lst)))
	(T (my_max (cdr lst) max))))

(defun my_sort (lst &optional result)
  (cond ((null lst) result)
	(T (my_sort (my_remove (my_max lst) lst)
		    (cons (my_max lst) result)))))

(defun select_between (lst left right)
  (cond ((> left right) (select_between lst right left))
	(T (select_between lst left right))))


;;; task 6 (8)
;;; one level
(defun rec_add_v1 (lst &optional (sum 0))
  (cond ((null lst) sum)
	 ((numberp (car lst)) (rec_add_v1 (cdr lst) (+ sum (car lst))))
	 (T (rec_add_v1 (cdr lst) sum))))

;;; many levels
(defun rec_add_v2 (lst)
  (cond	((numberp lst) lst)
	((atom lst) 0)
	(T (+ (rec_add_v2 (car lst)) (rec_add_v2 (cdr lst))))))


;;; task 7 (9)
(defun recnth (n lst)
  (cond ((= n 0) (car lst))
	(T (recnth (- n 1) (cdr lst)))))


;;; task 8 (10)
(defun my_oddp (x)
  (and (numberp x) (= (mod x 2) 1)))

(defun all_odd (lst)
  (cond ((null lst) T)
	((my_oddp (car lst)) (all_odd (cdr lst)))
	(T NIL)))


;;; task 9 (11)
(defun first_odd (lst)
  (cond ((my_oddp lst) lst)
	((atom lst) NIL)
	(T (or (first_odd (car lst)) (first_odd (cdr lst))))))


;;; task 10 (12)
(defun square_list (lst)
  (cond ((null lst) NIL)
	(T (cons (* (car lst) (car lst)) (square_list (cdr lst))))))
