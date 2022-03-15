; task 1
(defun apply_opr_to_numbers (lst opr num)
  (let ((reducing_lst (mapcar #'(lambda (x) (if (numberp x)
						(eval `(,opr ,x ,num))
						x)) lst)))
    (setf (car lst) (car reducing_lst))
    (setf (cdr lst) (cdr reducing_lst))
    lst))

(defun reduce_by_10 (lst)
  (apply_opr_to_numbers lst '- 10))


; task 2
(defun mul_by_number_v1 (lst num)
  (let ((i 0))
    (mapcar #'(lambda (x)
		(setf (nth i lst) (* x num))
	        (setf i (+ i 1)))
	    lst))
  lst)

(defun mul_by_number_v2 (lst num)
  (apply_opr_to_numbers lst '* num))


; task 3
(defun my_reverse (lst)
  (let ((reverse_list NIL))
    (mapcar #'(lambda (x) (setf reverse_list (append (list x) reverse_list))) lst)
    reverse_list))

(defun palindrome (lst)
  (cond ((null (listp lst)) NIL)
	(T (equal lst (my_reverse lst)))))

; task 4
(defun and_list (lst)
  (eval `(and ,@lst)))

(defun my_member (element lst)
  (let ((result NIL))
    (mapcar #'(lambda (x) (if (equal x element) (setf result T))) lst)
    result))  

(defun my_subsetp (lst1 lst2)
  (and_list (mapcar #'(lambda (x) (my_member x lst2)) lst1)))

(defun set_equal (lst1 lst2)
  (and (listp lst1) (listp lst2)
       (my_subsetp lst1 lst2) (my_subsetp lst2 lst1)))


; task 5
(defun get_squares (lst)
  (mapcar #'(lambda (x) (* x x)) lst))


; task 6
(defun my_remove (x lst)
  (let ((deleted 0))
    (remove NIL (mapcar #'(lambda (num) (if (and (= deleted 0) (equal x num))
					    (and (setf deleted 1) NIL)
					    num)) lst))))

(defun my_max (lst)
  (let ((max NIL))
    (mapcar #'(lambda (x)
		(if (or (null max) (> x max))
		    (setf max x)))
	    lst)
    max))

(defun my_sort (lst)
  (let ((copied_lst (copy-list lst))
	(result NIL))
    (mapcar #'(lambda (x)
		(declare (ignore x))
		(setf result (append (list (my_max copied_lst)) result))
		(setf copied_lst (my_remove (my_max copied_lst) copied_lst))) lst)
    result))

(defun select_between (lst left right)
  (cond ((or (null (listp lst))
	     (null (numberp left)) (null (numberp right))) NIL)
	(T (if (> left right) (let ((tmp left))
				(setf left right)
				(setf right tmp)))
	   (my_sort (remove NIL (mapcar #'(lambda (num)
					    (if (and (> num left) (< num right))
						num))
					lst))))))


; task 7
(defun decart (lst1 lst2)
  (mapcan #'(lambda (x)
	      (mapcar #'(lambda (y)
			  (list x y)) lst2)) lst1))


; task 9
; ((1 2) (3 4)) -> 4
(defun len_list_of_list (lst)
  (let ((len 0))
    (mapcar #'(lambda (x) (if (listp x)
			      (setf len (+ len (length x)))
			      (setf len (+ len 1)))) lst)
    len))
