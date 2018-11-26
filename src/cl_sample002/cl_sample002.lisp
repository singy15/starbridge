
(defun foo (x)
	(format t "~A" x))

;; #'foo throws exception if foo is not exist.
(if (fboundp 'foo)
	(print "exist")
	(print "NOT exist"))

