(defsystem "cl_sample003"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components (
                  (:file "package")
                  (:file "sample1"))))
  :description ""
  :in-order-to ((test-op (test-op cl_sample003-test))))

