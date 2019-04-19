(defsystem "cl_sample003-test"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("fiveam" "cl_sample003")
  :components ((:module "test"
                :components (
                  (:file "package")
                  (:file "sample1-test"))))
  :description ""
  :perform (test-op (o s)
            (symbol-call :fiveam :run! :cl_sample003-test)))

