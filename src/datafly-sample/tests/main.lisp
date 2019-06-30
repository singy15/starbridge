(defpackage datafly-sample/tests/main
  (:use :cl
        :datafly
        :sxql
        :datafly-sample
        :fiveam))
(in-package :datafly-sample/tests/main)

; Define test-suite datafly-sample
(def-suite :datafly-sample/tests)

(in-suite :datafly-sample/tests)

(defun connect ()
  (disconnect-toplevel)
  (connect-toplevel :sqlite3 :database-name ":memory:"))

(defun create-tables ()
  (create-table :item
    ((id
        :type 'integer
        :primary-key t)
     (name 
        :type 'string
        :not-null t))))

(defmodel (item)
  id
  name)

(test test-connect
  (connect)
  (pass))

(test test-create-tables
  (connect)
  (execute (create-tables))
  (pass))

(test test-insert
  (connect)
  (execute (create-tables))
  (execute
    (insert-into :item 
      (set= :id "1"
            :name "foo")))
  (is (equal 
        (length 
          (retrieve-all
            (select :* (from :item))
            :as 'item))
        1)))

(test test-retrieve
  (connect)
  (execute (create-tables))
  (execute
    (insert-into :item 
      (set= :id "1"
            :name "foo")))
  (execute
    (insert-into :item 
      (set= :id "2"
            :name "bar")))
  (is (equal 
        (length 
          (retrieve-all
            (select :* (from :item)
              (where (:= :name "foo")))
            :as 'item))
        1)))

(test test-update
  (connect)
  (execute (create-tables))
  (execute
    (insert-into :item 
      (set= :id "1"
            :name "foo")))
  (execute
    (insert-into :item 
      (set= :id "2"
            :name "bar")))

  (execute 
    (update :item 
      (set= :name "fiz")
      (where (:= :id 1))))

  (is (equal 
        (item-name 
          (retrieve-one
            (select :* (from :item)
              (where (:= :id 1)))
            :as 'item))
        "fiz")))

(test test-delete
  (connect)
  (execute (create-tables))
  (execute
    (insert-into :item 
      (set= :id "1"
            :name "foo")))
  (execute
    (insert-into :item 
      (set= :id "2"
            :name "bar")))

  (execute
    (delete-from :item 
          (where (:= :name "foo"))))

  (is (equal 
        (length
          (retrieve-all
            (select :* (from :item))
            :as 'item))
        1)))

