;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)

;; source code languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh         . true)
   (python     . true)
   (emacs-lisp . true)
   (lisp       . true)
   (calc       . true)
   (C          . true)
   (clojure    . true)
   (gnuplot    . true)
   (octave     . true)
   (dot        . true)
   (latex      . true)
   ; (R          . true)
   ; (ruby       . true)
   ; (ledger     . true)
   ; (tcl        . true)
   )
 )

;; VERY IMPORTANT FOR PYTHON IN BABEL
(setq org-src-preserve-indentation t)


(defun display-inline-images ()
  "Display images in buffer."
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(add-hook 'org-babel-after-execute-hook 'display-inline-images 'append)

(add-to-list 'org-babel-tangle-lang-exts '("octave" . "m"))

(add-to-list 'org-babel-default-header-args:octave
             '(:session . "*Oct*"))

(provide 'ek-org-babel)
;;; ek-org-babel.el ends here
