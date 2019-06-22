(defsystem "lisp-unit-sample"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "lisp-unit-sample/tests"))))

(defsystem "lisp-unit-sample/tests"
  :author ""
  :license ""
  :depends-on ("lisp-unit-sample"
               "lisp-unit")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for lisp-unit-sample"
  :perform (test-op (op c) (symbol-call :lisp-unit :run-tests :all :lisp-unit-sample/tests)))
