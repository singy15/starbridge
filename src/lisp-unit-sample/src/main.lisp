(defpackage lisp-unit-sample
  (:use :cl)
  (:export foo))
(in-package :lisp-unit-sample)

(defun foo (x y)
  (+ x y))

