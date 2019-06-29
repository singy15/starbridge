(defsystem "sxql-sample"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("sxql")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "sxql-sample/tests"))))

(defsystem "sxql-sample/tests"
  :author ""
  :license ""
  :depends-on ("sxql-sample"
               "fiveam")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for sxql-sample"
  :perform (test-op (op c) (symbol-call :fiveam :run! :sxql-sample/tests)))
