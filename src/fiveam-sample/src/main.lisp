(defpackage fiveam-sample
  (:use :cl)
  (:export foo))
(in-package :fiveam-sample)

(defun foo (x y)
  (+ x y))

