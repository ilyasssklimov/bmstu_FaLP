;;; task 1
(defun apply_opr_to_numbers (lst opr num)
  (mapcar #'(lambda (x) (if (numberp x) (eval `(,opr ,x ,num)) x)) lst))

(defun reduce_by_10 (lst)
  (apply_opr_to_numbers lst '- 10))


;;; task 2
(defun mul_by_number_v1 (lst num)
  (mapcar #'(lambda (x) (* x num)) lst))

(defun mul_by_number_v2 (lst num)
  (apply_opr_to_numbers lst '* num))


;;; task 3
(defun my_reverse (lst)
  (let ((reverse_list NIL))
    (mapcar #'(lambda (x) (setf reverse_list (append (list x) reverse_list))) lst)
    reverse_list))

(defun palindrome (lst)
  (cond ((null (listp lst)) NIL)
	(T (equal lst (my_reverse lst)))))


;;; task 4
(defun and_list (lst)
  (eval `(and ,@lst)))

(defun or_list (lst)
  (eval `(or ,@lst)))

(defun my_member (element lst)
  (or_list (mapcar #'(lambda (x) (equal x element)) lst)))

(defun my_subsetp (lst1 lst2)
  (and_list (mapcar #'(lambda (x) (my_member x lst2)) lst1)))

(defun set_equal (lst1 lst2)
  (and (listp lst1) (listp lst2)
       (my_subsetp lst1 lst2) (my_subsetp lst2 lst1)))


;;; task 5
(defun get_squares (lst)
  (mapcar #'(lambda (x) (* x x)) lst))


; task 6
(defun my_max (lst &optional (max NIL))
  (mapcar #'(lambda (x) (if (or (null max) (> x max))
			    (setq max x))) lst)
  max)

(defun my_length (lst)
  (apply #'+ (mapcar #'(lambda (x) (declare (ignore x)) 1) lst)))

(defun butfirst (lst num)
  (car (remove NIL (maplist #'(lambda (x)
				(if (= (my_length x) (- (my_length lst) num))
				    x NIL)) lst))))

(defun my_remove (x lst)
  (cond ((or (null x) (null lst)) NIL)
	((null (my_member x lst)) lst)
	(T (append (butlast lst (- (my_length lst) (position x lst)))
		   (butfirst lst (+ (position x lst) 1))))))

(defun my_sort_help (lst result copied_lst)
  (mapcar #'(lambda (x)
	      (declare (ignore x))
	      (setq result (cons (my_max copied_lst) result))
	      (setq copied_lst (my_remove (my_max copied_lst) copied_lst))) lst)
  result)

(defun my_sort (lst)
  (my_sort_help lst () lst))

(defun select_between_help (lst left right)
  (my_sort (remove NIL  (mapcar #'(lambda (num)
		       (if (and (> num left) (< num right)) num)) lst))))

(defun select_between (lst left right)
  (cond ((> left right) (select_between_help lst right left))
	(T (select_between_help lst left right))))


; task 7
(defun decart (lst1 lst2)
  (mapcan #'(lambda (x)
	      (mapcar #'(lambda (y)
			  (list x y)) lst2)) lst1))


; task 9
; ((1 2) (3 4)) -> 4
(defun len_list_of_list (lst)
  (apply #'+ (mapcar #'length lst)))
