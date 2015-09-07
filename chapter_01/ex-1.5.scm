(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

(test 0 (p))

;;; With applicative order evaluation each formal parameter is replaced with its value immediately.
;;; So the program hangs trying to replace the call to (p) with (p) itself indefinitely
;;; With normal order evaluation instead the program won't evaluate arguments immediately so
;;; the result is returned as 0.
