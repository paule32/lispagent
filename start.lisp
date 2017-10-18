#!/usr/local/bin/clisp
;; -------------------------------------------------
;; (c) 2017 Jens Kallup
;; non-profit
;; -------------------------------------------------

(defvar false 0)
(defvar true  1)
(defvar found false)

(defparameter kann-table '(
  ("gehen")
))

(defparameter ist-table '(
  ("säugetier" ("vogel"))
))

(defparameter word-table '(
  ("vogel" (ist kann hat))
  ("maus"  (koennte))
))

;(print (second (first word-table)))
;(print (second (list (quote("Maus" 10)) (quote("Tweety" 22)))))

;; -----------------------------------------------------------
;; Returns a list of substrings of string
;; divided by ONE space each.
;; Note: Two consecutive spaces will be seen as
;; if there were an empty string between them.
;; -----------------------------------------------------------
(defun split-by-one-space (string)
    (loop for i = 0 then (1+ j)
          as j = (position #\Space string :start i)
          collect (subseq string i j)
          while j))

(defun mashup-symbol (&rest objects)
  (intern
  (format nil "~{~a~}"  objects)))

(defun list-to-string (lst)
    (format nil "~{~A~}" lst))

(defun main()
  (format T "~%Bitte stellen Sie ihre Frage:~%")
  (force-output)
  (let ((input-text (read-line)))
    (setf input-text (split-by-one-space input-text))
    (loop for x in word-table
      do (progn
        (setq found (string-equal (first x) (first input-text)))
      )))
      (cond (found nil
        (progn
            (print "ok")
            (return-from main 1)
        )   ))
)

(print (mashup-symbol "bird " (symbol-name 'KANN) '-TABLE))

(main)
(exit)
