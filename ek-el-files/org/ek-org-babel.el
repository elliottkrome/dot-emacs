;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)

;; source code languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell      . true)
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
   (spice      . true)
   ; (R          . true)
   ; (ruby       . true)
   ; (ledger     . true)
   ; (tcl        . true)
   )
 )

(add-to-list 'org-src-lang-modes (quote ("gnuplot" . gnuplot)))
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

(add-to-list 'org-babel-default-header-args:octave
             '(:eval . "never-export"))
(add-to-list 'org-babel-default-header-args:octave
             '(:results . "none"))

(defun ek-org-babel-tangle-file ()
  "Tangle the currently open file. Avoid the prompt."
  (interactive)
  (org-babel-tangle-file
   (buffer-file-name (current-buffer))))


(provide 'ek-org-babel)
;;; ek-org-babel.el ends here
