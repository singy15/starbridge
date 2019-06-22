(defpackage rove-sample
  (:use :cl)
  (:export foo))
(in-package :rove-sample)

(defun foo (x y)
  (+ x y))

