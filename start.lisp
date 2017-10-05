#!/usr/local/bin/clisp
;; -------------------------------------------------
;; (c) 2017 Jens Kallup
;; non-profit
;; -------------------------------------------------

(defparameter wordtable '(
  ("Auto"                ("s" 1) () )
  ("Haus"                ("s" 2) () )
  ("Maus"                ("s" 3) ("Säugetier") )
  ("Vogel"               ("s" 7) ("Lebewesen") )  
  ("Person"              ("s" 4) () )
  ("Säugetier"           ("s" 5) ("Lebewesen") )
  ("Unternehmen"         ("s" 6) () ))
)

(print (second (first wordtable)))
(print (second (list (quote("Maus" 10)) (quote("Tweety" 22)))))

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

(defun main()
  (format T "~%Bitte stellen Sie ihre Frage:~%")
  (force-output)
  (let ((input-text (read-line)))
    (setf input-text (split-by-one-space input-text))
    (print input-text)
    (setf txt1 (first  input-text)) ;; "was"
    (setf txt2 (second input-text)) ;; "ist"
    (setf txt3 (third  input-text)) ;; key = maus
    (if (string= txt1 "was")(progn
      (if (string= txt2 "ist")(progn
      (loop for key in wordtable do
      (setf src1 (string-equal (first key) txt3))
      (if (string= src1 T) (progn
        (print "gefunden: ")
        (princ (first key))
        (princ " ist ")
        (princ (third key))
        (setf src2 (third key)))))
      (loop for key2 in wordtable do
(setf src3 (first key2))
(setf src4 (first src2))
(if (string-equal src3 src4) (progn
(print "OK"))
            )))))))
  (print "end.")
)

(main)
(exit)
