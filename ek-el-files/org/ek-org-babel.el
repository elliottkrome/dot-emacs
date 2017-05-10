; (require 'ob-tcl)
;; source code languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . true)
   (python . true)
   (emacs-lisp . true)
   (calc . true)
;   (tcl . true)
   (C . true)
   (clojure . true)
;   (dot . true)
;   (R . true)
;   (ruby . true)
   (gnuplot . true)
   (octave . true)
;   (clojure . true)
;   (ledger . true)
   (latex . t)))

;; VERY IMPORTANT FOR PYTHON IN BABEL
(setq org-src-preserve-indentation t)


(defun display-inline-images ()
  "Display images in buffer."
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(add-hook 'org-babel-after-execute-hook 'display-inline-images 'append)