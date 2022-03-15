; task 3
(defun last_v1 (x)
  (if (listp x)
      (last x)
      NIL))

(defun last_v2 (x)
  (cond ((null (listp x)) NIL)
	((null (cdr x)) (car x))
	(T (last_v2 (cdr x)))))

(defun last_v3 (x)
  (if (or (null (listp x)) (null x))
      NIL
      (nth (- (length x) 1) x)))

(defun last_v4 (x)
  (if (listp x)
      (car (reverse x))
      NIL))

(defun last_v5 (x)
  (if (listp x)
      (let ((last_elem NIL))
	(mapcar #'(lambda (element) (setf last_elem element)) x)
	(list last_elem))
      NIL))

; task 4
(defun except_last_v1 (x)
  (if (null (and (listp x) (cdr x)))
      NIL
      (cons (car x) (except_last_v1 (cdr x)))))

(defun except_last_v2 (x)
  (if (listp x)
      (reverse (cdr (reverse x)))))

(defun except_last_v3 (x)
  (if (listp x)
      (butlast x)
      NIL))


; task 5
(defun roll_dice (edges) 
  (let ((dice_1 (random edges))
	(dice_2 (random edges)))
    (let ((sum (+ dice_1 dice_2)))
      (or (format T "Dropped dice = (~a ~a), sum = ~a~%" dice_1 dice_2 sum)
	  (cond ((or (= sum 7) (= sum 11))
		 (or (format T "~%") T))
	        ((or (= 1 dice_1 dice_2) (= 6 dice_1 dice_2))
	         (or (format T "Player rolls the dice again~%")
		     (setq sum (+ sum (roll_dice edges)))))
	        (T (or (format T "~%") sum)))))))

(defun roll_player_dice (player)
  (or (format T "Player ~a rolls dice~%" player)
      (roll_dice 6)))

(defun get_winner (player_1 player_2)
  (cond ((equal player_1 T) 1)
	((equal player_2 T) 2)
	((> player_1 player_2) 1)
	((> player_2 player_1) 2)
	(T 0)))
  
(defun play_dice ()
  (let ((winner (get_winner (roll_player_dice 1) (roll_player_dice 2))))
    (if (= winner 0)
	(format T "The result of the game is draw~%")
	(format T "The winner is player ~a~%" winner))))
