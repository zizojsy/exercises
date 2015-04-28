Exercise 1.1
10
12
8
3
6
;nothing
;nothing
19
#f
4
16
6
16

Exercise 1.2
(/ (+ 5 4 
      (- 2 
         (- 3 
            (+ 6 
               (/ 4 5)))))
   (* 3 
      (- 6 2) 
      (- 2 7)))
      
Exercise 1.3
(define (square x)
  (* x x))

(define (min2 x y)
  (if (> x y)
      y
      x))

(define (min3 x y z)
  (min2 (min2 x y) z))

(define (f x y z)
  (- (+ (square x)
        (square y)
        (square z))
     (square (min3 x y z))))

Exercise 1.4
a plus the absolute value of b

Exercise 1.5
1. applicative-order evaluation
(test 0 (p))
(test 0 (p))
.
.
.
death loop
2. normal-order evaluation
(test 0 (p))
(if (= 0 0) 0 (p))
0

Exercise 1.6
death loop
new-if is a procedure which needs to evaluate every arguments so it can't stop even it meet the terminal condition. 

Exercise 1.7
small number .0000001
large number 1000000000000
yes(?)

Exercise 1.8
deduction
f(x)=x^3-y
f'(x)=3x^2
X(n+1)=X(n)-f(X(n))/f'(X(n))=(2X(n)+y/X(n)^2)/3

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (* 2 guess)
        (/ x (square guess)))
     3))

(define (good-enough? guess x)
  (< (abs (- x (cube guess))) .0001))

(define (cube-root x)
  (cube-root-iter 1.0 x))
