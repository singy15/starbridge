(defpackage sxql-sample/tests/main
  (:use :cl
        :sxql
        :sxql-sample
        :fiveam))
(in-package :sxql-sample/tests/main)

; Define test-suite sxql-sample
(def-suite :sxql-sample/tests)

(in-suite :sxql-sample/tests)

(test test-select
  (is (equal (yield 
        (select (:id :name) (from :item)))
        "SELECT id, name FROM item")))

(test test-select-all
  (is (equal (yield 
        (select :* (from :item)))
        "SELECT * FROM item")))

(test test-insert
  (multiple-value-bind 
    (sql param) 
    (yield 
      (insert-into :item 
        (set= :id "1"
              :name "foo")))

    (is (equal sql "INSERT INTO item (id, name) VALUES (?, ?)"))
    (is (equal param (list "1" "foo")))))

(test test-update
  (multiple-value-bind 
    (sql param) 
    (yield 
      (update :item 
        (set= :name "fiz")
        (where (:= :name "foo"))))

    (is (equal sql "UPDATE item SET name = ? WHERE (name = ?)"))
    (is (equal param (list "fiz" "foo")))))

(test test-delete
  (multiple-value-bind 
    (sql param) 
    (yield 
      (delete-from :item 
        (where (:= :name "foo"))))

    (is (equal sql "DELETE FROM item WHERE (name = ?)"))
    (is (equal param (list "foo")))))

