(defsystem "mito-sample"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("mito")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "mito-sample/tests"))))

(defsystem "mito-sample/tests"
  :author ""
  :license ""
  :depends-on ("mito-sample"
               "fiveam")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for mito-sample"
  :perform (test-op (op c) (symbol-call :fiveam :run! :mito-sample/tests)))

