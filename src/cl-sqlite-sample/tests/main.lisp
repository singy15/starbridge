(defpackage cl-sqlite-sample/tests/main
  (:use :cl
        :sqlite
        :cl-sqlite-sample
        :rove))
(in-package :cl-sqlite-sample/tests/main)

(defmacro with-in-memory (dbsym &body body)
  `(let ((,dbsym (connect ":memory:")))
      (progn
        ,@body)))

(defun create-db (db)
  (execute-non-query db "create table item (id integer primary key, name text not null)"))

(deftest test-create-db
  (testing "create db"
    (with-in-memory db
      (create-db db)
      (ok (equal 0 (length (execute-to-list db "select * from item")))))))

(deftest test-insert
  (testing "insert"
    (with-in-memory db
      (create-db db)
      (execute-non-query db "insert into item (id,name) values ('1','foo')"))
    (ok t)))

(deftest test-select
  (testing "select"
    (with-in-memory db
      (create-db db)
      (execute-non-query db "insert into item (id,name) values ('1','foo')")
      (ok (equal 1 (length (execute-to-list db "select * from item")))))))

(deftest test-update
  (testing "update"
    (with-in-memory db
      (create-db db)
      (execute-non-query db "insert into item (id,name) values ('1','foo')")
      (execute-non-query db "insert into item (id,name) values ('2','bar')")
      (execute-non-query db "update item set name = 'fiz' where id = '1'")
      (ok (equal "fiz" (cadar (execute-to-list db "select * from item where id = '1'")))))))

(deftest test-delete
  (testing "delete"
    (with-in-memory db
      (create-db db)
      (execute-non-query db "insert into item (id,name) values ('1','foo')")
      (execute-non-query db "insert into item (id,name) values ('2','bar')")
      (execute-non-query db "delete from item where id = '1'")
      (ok (equal 1 (length (execute-to-list db "select * from item")))))))

