(defpackage fiveam-sample/tests/main
  (:use :cl
        :fiveam-sample
        :fiveam))
(in-package :fiveam-sample/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :fiveam-sample)' in your Lisp.

; Define test-suite fiveam-sample
(def-suite :fiveam-sample/tests)

(in-suite :fiveam-sample/tests)

; Simple test
(test test-simple
      (is (= 1 1)))

; Test foo
(test test-foo
      (is (= 3 (foo 1 2))))

