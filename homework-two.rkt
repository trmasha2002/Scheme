(define (count x xs) 
(if (null? xs) 
0 
(if (= (car xs) x) 
(+ 1 (count x (cdr xs))) 
(count x (cdr xs)))))
