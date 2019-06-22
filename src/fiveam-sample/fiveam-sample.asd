(defsystem "fiveam-sample"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "fiveam-sample/tests"))))

(defsystem "fiveam-sample/tests"
  :author ""
  :license ""
  :depends-on ("fiveam-sample"
               "fiveam")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for fiveam-sample"
  :perform (test-op (op c) (symbol-call :fiveam :run! :fiveam-sample/tests)))

