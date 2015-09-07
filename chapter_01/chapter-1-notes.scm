;;; Normal expression
(+ 2.7 10)

;;; Pretty printing on a composition
(+ (* 3
   (+ (* 2 4)
      (+ 3 5 )))
   (+ (- 10 7)
      6))

;;; Associate size with 2
(define size 2)
size

;;; Procedure definition (compound procedure)
(define (square x) (* x x))
(square 3)

(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4)

;;; Case analysis
(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(abs -3)
(abs 3)
(abs 0)

(define (abs2 x)
  (cond ((< x 0) (- x))
        (else x)))
(abs2 -4)

;;; sqrt
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

(sqrt 9)
