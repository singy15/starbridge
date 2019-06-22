(defsystem "rove-sample"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "rove-sample/tests"))))

(defsystem "rove-sample/tests"
  :author ""
  :license ""
  :depends-on ("rove-sample"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for rove-sample"
  :perform (test-op (op c) (symbol-call :rove :run c)))
