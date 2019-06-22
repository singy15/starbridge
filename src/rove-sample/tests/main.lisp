(defpackage rove-sample/tests/main
  (:use :cl
        :rove-sample
        :rove))
(in-package :rove-sample/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :rove-sample)' in your Lisp.

(deftest test-foo-1
  (testing "test-foo-1"
    (ok (= 3 (foo 1 2)))))

(deftest test-foo-2
  (testing "test-foo-2"
    (ng (= 5 (foo 1 2)))))

(deftest test-foo-fail
  (testing "test-foo-fail"
    (ok (= 1 (foo 1 2)))))

(deftest test-foo-skip
  (testing "test-foo-skip"
    (skip "skip")
    ; not work?
    (ok (= 1 (foo 1 2)))))

