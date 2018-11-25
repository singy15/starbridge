
(defun read-file-string (path)
  (with-open-file (s path :direction :input)
    (let ((buf (make-string (file-length s))))
      (read-sequence buf s)
      buf)))

(defun read-file-vector (path)
  (with-open-file (s path :direction :input :element-type '(unsigned-byte 8))
    (let ((buf (make-array (file-length s) :element-type '(unsigned-byte 8))))
      (read-sequence buf s)
      buf)))

(format t (read-file-string "./sample.txt"))
; (format t (read-file-vector "./sample.txt"))

