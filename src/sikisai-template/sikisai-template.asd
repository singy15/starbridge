
(in-package :cl-user)
(defpackage sikisai-template-asd
  (:use :cl :asdf))
(in-package :sikisai-template-asd)

(defsystem sikisai-template
  :depends-on (:sikisai)
  :components (
    (:module "src"
			:around-compile
				(lambda (thunk)
          ; dev
          (declaim (optimize (speed 0) (debug 3) (safety 3)))
          ; release
          ; (declaim (optimize (speed 3) (debug 0) (safety 0)))
					(funcall thunk))
      :components (
        (:file "sikisai-template")))))

