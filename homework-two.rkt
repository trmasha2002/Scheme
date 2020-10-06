(define (count x xs) 
  (if (null? xs) 
      0 
      (if (= (car xs) x) 
          (+ 1 (count x (cdr xs))) 
          (count x (cdr xs)))))

(count 1 (list 1 2 1 4))

(define (delete pred? xs)
  (if (null? xs) xs
      (cond
        ((pred? (car xs)) (delete pred? (cdr xs)))
        (list(cons (car xs) (delete pred? (cdr xs)))))))

(delete even? '(0 1 2 3))

(define (iterate f x n)
  (cond ( (= n 0)
          (if (pair? x) (reverse x ) 0))
        (else
         (iterate f
                  (if (pair? x) (cons (* 2 (car x)) x) (cons x '()))
                  (- n 1)))))

(iterate (lambda (x) (* 2 x)) 1 6)

(define (intersperse e xs)
  (cond
    ((null? xs) '())
    ((null? (cdr xs)) (cons (car xs) '()))
    ((pair? xs) 
     (cons (car xs) (cons e (intersperse e (cdr xs)))))))

(intersperse 'x '(1 2 3 4))

(define (all? pred? xs)
  (or
   (null? xs)
   (and (pred? (car xs)) (all? pred? (cdr xs)))))

(define (any? pred? xs)
  (and
   (not(null? xs))
   (or (pred? (car xs)) (any? pred? (cdr xs)))))

(any? odd? '(1 3 5 7))
(all? odd? '(1 3 5 7))

(define (o . f)
  (cond
    ((null? f)(lambda (x) x))
    ((and
      (null? (car f))
      (null? (cdr f))) x)
    ((null? (cdr f)) (lambda (x) ((car f) x)))
    (else(lambda (x) ((car f) ((apply o (cdr f)) x))))))

(define (f x) (* x 2))
(define (g x) (* x 3)) 
(define (h x) (- x))

((o f g h) 1)
((o f g) 1)   
((o h) 1)     
((o) 1)       
