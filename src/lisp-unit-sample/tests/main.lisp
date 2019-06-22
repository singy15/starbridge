(defpackage lisp-unit-sample/tests
  (:use :cl
        :lisp-unit-sample
        :lisp-unit))
(in-package :lisp-unit-sample/tests)

(define-test test-foo 
  (assert-eql 3 (foo 1 2)))

