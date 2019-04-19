(in-package :cl_sample003-test)
(in-suite :cl_sample003-test)

(test test-sample1-foo
      (let ((s (make-instance 'cl_sample003::sample1)))
        (is (equal 3 (cl_sample003::foo s 1 2)))))

(test test-sample1-bar
      (let ((s (make-instance 'cl_sample003::sample1)))
        (is (equal 6 (cl_sample003::bar s 2 3)))))

(test test-sample1-bar-fail
      (let ((s (make-instance 'cl_sample003::sample1)))
        (is (equal 0 (cl_sample003::bar s 2 3)))))

(in-package :cl-user)

