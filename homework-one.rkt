(define (day_of_week d m y)
  (if (> m 2) 
    (remainder (- (+ (+ (+ (+ d (quotient (* 31 (- m 2)) 12)) y) (quotient y 4)) (quotient y 400)) (quotient y 100)) 7)
    (remainder (- (+ (+ (+ (+ d (quotient (* 31 (+ m 10)) 12)) (- y 1)) (quotient (- y 1) 4)) (quotient (- y 1) 400)) (quotient (- y 1) 100)) 7)))
(day_of_week 1 1 2020)
(day_of_week 1 2 2016)
(day_of_week 04 12 1975)
(day_of_week 04 12 2006)



(define (sqrt_solution a b c)
  (if (and (= a 0) (= b 0) (= c 0)) (list 1e18)
  (if (and (= a 0) (= b 0)) (list)
  (if (= a 0) (list (/ (- c) b))
  (if (= b 0) (list (/ (- c) (* a a)))
  (if (= (discriminant a b c) 0) (list (get_first_root a b c))
  (if (> (discriminant a b c) 0)
      (list (get_first_root a b c) (get_second_root a b c))
      (list))))))))
(define (discriminant a b c)
  (- (* b b) (* 4 a c)))

(define (get_first_root a b c)
   (/ (+ (- b) (sqrt (discriminant a b c))) (* 2 a)))

(define (get_second_root a b c)
  (/ (- (- b) (sqrt (discriminant a b c))) (* 2 a)))
(sqrt_solution 2 4 2)



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
