
(defpackage sikisai-template
  (:use cl cl-user)
  (:export main))
(in-package :sikisai-template)

(defclass window (sik:window) ())

(defmethod sik:user-display ((this window))
	(sik:clear)
  (sik:textb "Hello world!" 100.0 100.0))

(defun main ()
  (sik:display-window
		(make-instance 'window 
									 :title "sikisai-template" 
									 :width 400
									 :height 400
									 :keys (list #\w #\s #\a #\d)
									 :mode '(:double :rgb :depth :multisample)
									 :fps 60)))

(in-package :cl-user)

