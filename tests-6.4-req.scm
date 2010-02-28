(add-tests-with-string-output "byte string"
  [(string-size (make-byte-string 0)) => "0\n"]
  [(string-size (make-byte-string 1)) => "1\n"]
  [(string-size (make-byte-string 1000)) => "1000\n"]
  [(let ([v (make-byte-string 1)])
     (string-byte-set! v 0 12)
     (string-byte-ref v 0)) => "12\n"]
  [(let ([v (make-byte-string 1)])
     (string-byte-set! v 0 12)
     (string-byte-set! v 0 13)
     (string-byte-set! v 0 (string-byte-ref v 0))
     (string-byte-ref v 0)) => "13\n"]
  [(let ([v (make-byte-string 2)])
     (string-byte-set! v 1 13)
     (string-byte-set! v 0 12)
     (string-byte-ref v 1)) => "13\n"]
  [(let ([v (make-byte-string 2)])
     (string-byte-set! v 0 12)
     (string-byte-set! v 1 13)
     (string-byte-ref v 0)) => "12\n"]
  [(let ([v (make-byte-string 1)])
     (string-byte-set! v 0 255)
     (string-byte-ref v 0)) => "255\n"]
  [(let ([v (make-byte-string 1000)])
     (string-byte-set! v 500 12)
     (string-byte-ref v 500)) => "12\n"]
  [(string->sz "abc") => "\"abc\\0\"\n"]
)

(add-tests-with-string-output "let*"
  [(let* ([a 100] [b a] [c (cons a b)]) c) => "(100 . 100)\n"]
)