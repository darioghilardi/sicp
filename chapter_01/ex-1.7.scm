(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (square x) (* x x))

(sqrt 0.00004)
;;; Returns 0.009448885098120396 instead of 0.02.
;;; The result is wrong, this happens because the the difference
;;; between the square of the guess and the x value is way lower
;;; than 0.0001, because x itself is smaller than 0.0001
;;; so no iterations will be done.

(sqrt 125632359530625)
;;; The program hangs because of the floating point numbers
;;; inaccuracy. Large floating numbers are not precise, so the
;;; tolerance value is never reached.
;;; For example suppose that a floating point number on your
;;; computer can accurately represent 7 decimal digits.
;;; Then you can add 1897482.0 to 2973225.0 and get a completely
;;; accurate answer. But if you try to add 1897482.0 to 0.2973225,
;;; the accurate answer has fourteen digits, while your computer
;;; will answer with 1897482.0.


;;; New implementation of good-enough?
(define (good-enough? guess previous-guess)
  (< (abs (- guess previous-guess)) 0.0001))

(define (sqrt-iter guess previous-guess x)
  (if (good-enough? guess previous-guess)
    guess
    (sqrt-iter (improve guess x) guess x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 0 x))

(define (square x) (* x x))

(sqrt 0.00004)
(sqrt 125632359530625)
