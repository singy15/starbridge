(defpackage mito-sample/tests/main
  (:use :cl
        :mito
        :mito-sample
        :fiveam))
(in-package :mito-sample/tests/main)

; Define test-suite mito-sample
(def-suite :mito-sample/tests)

(in-suite :mito-sample/tests)

(defun connect ()
  (mito:connect-toplevel :sqlite3 :database-name ":memory:"))

(defun define-tables ()
  (mito:deftable item ()
    ((name 
        :col-type (:text)
        :accessor name)
     (price 
        :col-type (:integer)
        :accessor price)))
  (mito:ensure-table-exists 'item))

(defun prepare-db ()
  (connect)
  (define-tables))

(test test-connect
  (connect)
  (pass))

(test test-define-table
  (connect)
  (define-tables)
  (pass))

(test test-prepare-db
  (prepare-db)
  (pass))

(test test-create-dao
  (prepare-db)
  (let ((i (make-instance 'item :name "foo" :price 123)))
    (is (equal (name i) "foo"))
    (is (equal (price i) 123))))

(test test-insert
  (prepare-db)
  (let ((i (make-instance 'item :name "foo" :price 123)))
    (mito:insert-dao i)
    (is (equal 1 (length (mito:retrieve-dao 'item))))
    (pass)))

(test test-update
  (prepare-db)
  (let ((i (make-instance 'item :name "foo" :price 123)))
    (mito:insert-dao i)
    (setf (name i) "fiz")
    (mito:save-dao i)
    (is (equal (name (car (mito:retrieve-dao 'item))) "fiz"))
    (pass)))

(test test-delete
  (prepare-db)
  (let ((i (make-instance 'item :name "foo" :price 123)))
    (mito:insert-dao i)
    (mito:delete-dao i)
    (is (equal (length (mito:retrieve-dao 'item)) 0))
    (pass)))

(test test-select
  (prepare-db)
  (let ((i1 (make-instance 'item :name "foo" :price 123))
        (i2 (make-instance 'item :name "bar" :price 321)))
    (mito:insert-dao i1)
    (mito:insert-dao i2)
    (is (equal (length (mito:retrieve-dao 'item :name "foo")) 1))
    (is (equal (name (car (mito:retrieve-dao 'item :name "foo"))) "foo"))
    (is (mito:find-dao 'item :name "foo"))
    (is (equal (name (mito:find-dao 'item :name "foo")) "foo"))
    (pass)))

