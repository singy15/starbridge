(defpackage cl-charms-sample
  (:use 
    :cl
    :cl-charms)
  (:export
    main))
(in-package :cl-charms-sample)

(defun init ()
  (defparameter *t* 0))

(defun main ()
  (init)

  (charms:with-curses ()
    (charms:disable-echoing)
    (charms:enable-raw-input :interpret-control-characters t)
    ; (charms:enable-non-blocking-mode charms:*standard-window*)

    (charms:clear-window charms:*standard-window*)
    (charms:refresh-window charms:*standard-window*)

    (draw-welcome)
    (draw-cnt)

    (loop :named driver-loop
          :for c := (charms:get-char charms:*standard-window* :ignore-error t)
          :do (progn
                (case c
                  ((#\a) (incf *t*))
                  ((#\q #\Q) 
                    (return-from driver-loop)))

                (draw-cnt)))))

(defun draw-welcome ()
  (charms:write-string-at-point charms:*standard-window* 
    "Hello cl-charms!" 5 5)
  (charms:write-string-at-point charms:*standard-window* 
    "Press a to increment" 5 6)
  (charms:write-string-at-point charms:*standard-window* 
    "Press q to quit" 5 7))

(defun draw-cnt ()
  (charms:write-string-at-point charms:*standard-window* 
    (format nil "cnt : ~A" *t*) 5 8))

(in-package :cl-user)

