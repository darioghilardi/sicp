;;; New if
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
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

;;; The program hangs because the new-if is not a special form like the standard if, where
;;; an argument is evaluated only when the predicate is true.
;;; Being a procedure, the new if is subjected to applicative order evaluation therefore evaluates
;;; all arguments immediately, included the call to sqrt-iter inside the else.
