Exercise 1.9
1. (+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5))))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9
linear recursive

2. (+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9
iterative

Exercise 1.10
1024
65536
65536
f = 2n
g = 2^n
h = 2^2^…^2(n times)

Exercise 1.11
recursive version
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

iteration version
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))


Exercise 1.12
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

Exercise 1.13
prove:
let a=(1+sqrt(5))/2, b=(1-sqrt(5))/2
basic case:
f(0)=(1-1)/sqrt(5)=0
f(1)=(a-b)/sqrt(5)1
inductive:
f(n) = f(n-1)+f(n-2)
     = (a^(n-1)+b^(n-1))/sqrt(5) + (a^(n-2)+b^(n-2))/sqrt(5)
     = ((1+a)a^(n-2)+(1+b)a^(n-2))/sqrt(5)
     = ((a^2)(a^(n-2))+(b^2)(b^(n-2)))/sqrt(5)
     = (a^n+b^n)/sqrt(5)
when n approach to infinite, f(n) close to a^n/sqrt(5)

Exercise 1.14
;; ToDo

Exercise 1.15
(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine .45))))
(p (p (p (p (sine .15)))))
(p (p (p (p (p .05)))))
five times
space O(n)
time O(log(n))

Exercise 1.16
(define (square x)
  (* x x))

(define (even? x)
  (= (remainder x 2) 0))

;; This is an interesting algorithm.
;; Present n as binary number e[0](2^0)+e[1](2^1)+…+e[k](2^k)
;; where k=floor(lgn)+1
;; so b^n=b^(e[0](2^0)+e[1](2^1)+…+e[k][2^k])=PI(t)((b^2)^e[t]),
;; where t makes e[t]=1
;;
;; following is java method reperesents this algorithm
;; int expt(int b, int n) {
;;              int a = 1;
;;              
;;              while (n > 0) {
;;                      if (n % 2 == 1) {
;;                              a *= b;
;;                      }
;;                      b *= b;
;;                      n /= 2;
;;              }
;;              
;;              return a;
;; }
(define (fast-expt b n)
  (define (iter b n a)
    (cond ((= n 0) a)
          ((even? n) (iter (square b) (/ n 2) a))
          (else (iter (square b) (/ (- n 1) 2) (* a b)))))
  (iter b n 1))

Exercise 1.17
(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? x)
  (= (remainder x 2) 0))

;; recursive version
(define (* a b)
  (cond ((= b 0) 0)
        ((even? b) 
         (double (* a (halve b))))
        (else (+ a (* a (- b 1))))))

Exercise 1.18
;; iterative version
(define (* a b)
  (define (iter a b m)
    (cond ((= b 0) m)
          ((even? b) (iter (double a) (halve b) m))
          (else (iter (double a) (halve (- b 1)) (+ m a)))))
  (iter a b 0))

Exercise 1.19
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* q q) (* p p))
                   (+ (* q q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

Exercise 1.20
(gcd 206 40)
;; normal-order-evaluation
(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0)	;; +1
	40
	(gcd (remainder 206 40)
		 (remainder 40 (remainder 206 40))))

(if (= (remainder 40 (remainder 206 40)) 0)	;; +2
	(remainder 206 40)
	(gcd (remainder 40 (remainder 206 40))
		 (remainder (remainder 206 40)
		 			(remainder 40 (reaminder 206 40)))))

(if (= (remainder (remainder 206 40)
				  (remainder 40 (remainder 206 40))) 0) ;; +4
	(gcd (remainder 40 (remainder 206 40)))
	(gcd (remainder (reminader 206 40)
					(remainder 40 (remainder 206 40)))
		 (remainder (remainder 40 (remainder 206 40))
					(remainder (remainder 206 40)
							   (remainder 40 (remainder 206 40))))))

(if (= (remainder (remainder 40 (remainder 206 40))
				  (remainder (remainder 206 40)
				  			 (remainder 40 (remainder 206 40))))) ;;+7
	(gcd (remainder (remainder 206 40)
			(remainder 40 (remainder 206 40))))
	...)

(remainder 6 (remainder 40 6)) ;;+2
(remainder 6 4)		;; +1
2					;; +1
;; total 18 times

;; applicative-order
(gcd 40 (remainder 206 40)) ;; +1
(gcd 6 (remainder 40 6))	;; +1
(gcd 4 (remainder 6 4))		;; +1
(gcd 2 (remainder 4 2))		;; +1
(gcd 2 0)
2							;; total 4 times

Exercise 1.21
199
1999
7

Exercise 1.22
(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  ;(newline)
  ;(display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= (smallest-divisor n 2) n))

(define (square x) (* x x))

(define (smallest-divisor n d)
  (cond ((> (square d) n) n)
        ((= (remainder n d) 0) d)
        (else (smallest-divisor n (+ d 1)))))

(define (search-for-primes start count)
  (cond ((= count 0) 
         (display "\nend search"))
        ((timed-prime-test start)
         (if (even? start)
             (search-for-primes (+ start 1) (- count 1))
             (search-for-primes (+ start 2) (- count 1))))
        (else 
         (if (even? start)
             (search-for-primes (+ start 1) count)
             (search-for-primes (+ start 2) count)))))

Exercise 1.23
(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  ;(newline)
  ;(display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= (smallest-divisor n 2) n))

(define (square x) (* x x))

(define (smallest-divisor n d)
  (cond ((> (square d) n) n)
        ((= (remainder n d) 0) d)
        (else (smallest-divisor n (next d)))))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (search-for-primes start count)
  (cond ((= count 0) 
         (display "\nend search"))
        ((timed-prime-test start)
         (if (even? start)
             (search-for-primes (+ start 1) (- count 1))
             (search-for-primes (+ start 2) (- count 1))))
        (else 
         (if (even? start)
             (search-for-primes (+ start 1) count)
             (search-for-primes (+ start 2) count)))))

radio less than 2, because procedure needs extra if test.

Exercise 1.24
trivial

Exercise 1.25
This procedure will product so huge inter result.

Exercise 1.26
Because it call expmod twice when exp is even.

Exercise 1.27
(define (square x) (* x x))
(define (expmod base n m)
  (cond ((= n 0) 1)
        ((even? n)
         (remainder (square (expmod base (/ n 2) m)) m))
        (else (remainder (* base (expmod base (- n 1) m)) m))))
(define (fermat-test n times)
  (define (try-it a)
    (= (expmod a n n) a))
  (cond ((< times 2) true)
        ((try-it times) (fermat-test n (- times)))
        (else false)))
(define (fast-prime? n)
  (fermat-test n (- n 1)))

Exercise 1.28
