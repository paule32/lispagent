#!/usr/local/bin/clisp
;; -------------------------------------------------
;; (c) 2017 Jens Kallup
;; non-profit
;; -------------------------------------------------

(defparameter wordtable '(
  ("Auto"                ("s" 1))
  ("Haus"                ("s" 2))
  ("Maus"                ("s" 3) ("Säugetier") )
  ("Person"              ("s" 4))
  ("Säugetier"           ("s" 5) ("Lebewesen") )
  ("Unternehmen"         ("s" 6)))
)

(print (second (first wordtable)))
(print (second (list (quote("Maus" 10)) (quote("Tweety" 22)))))

(defun main()
  (format T "~%Bitte stellen Sie ihre Frage:~%")
  (force-output)
  (let ((txt (read-line)))
    (loop for key in wordtable do
      (setq txts (string-equal (first key) txt))
      (if (string= txts T) (progn
          (print "OK")
          (return T))
      )
    )
  )
)

(main)
(exit)
