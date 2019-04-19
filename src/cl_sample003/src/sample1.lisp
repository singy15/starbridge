(in-package :cl_sample003)

; Class sample1
(defclass sample1 () ())

; foo
(defmethod foo ((this sample1) x y)
  (+ x y))

; bar
(defmethod bar ((this sample1) x y)
  (* x y))

(in-package :cl-user)

