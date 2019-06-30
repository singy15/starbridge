(defsystem "datafly-sample"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("datafly")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "datafly-sample/tests"))))

(defsystem "datafly-sample/tests"
  :author ""
  :license ""
  :depends-on ("datafly-sample"
               "fiveam")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for datafly-sample"
  :perform (test-op (op c) (symbol-call :fiveam :run! :datafly-sample/tests)))

