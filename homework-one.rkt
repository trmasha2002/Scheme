(define (my-gcd a b)
   (if (= b 0) a
   (my-gcd b (remainder a b))))

(define (my-lcm a b)
  (/ (* a b) (my-gcd a b)))

(define (prime? a)
   (if (< a 2) #f
   (if (= a 2) #t
   (check-prime a (+ (integer-sqrt a) 1)))))
(define (check-prime a  n)
      (if (= n 1) #t
      (if (= (remainder a n) 0) #f (check-prime a (- n 1)))))

(prime? 8)
