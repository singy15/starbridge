(defsystem "cl-sqlite-sample"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("sqlite")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "cl-sqlite-sample/tests"))))

(defsystem "cl-sqlite-sample/tests"
  :author ""
  :license ""
  :depends-on ("cl-sqlite-sample"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-sqlite-sample"
  :perform (test-op (op c) (symbol-call :rove :run c)))
