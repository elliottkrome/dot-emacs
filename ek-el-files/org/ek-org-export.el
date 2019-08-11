;;; package -- summary
;;; Commentary:
;;; Code:

(require 'org)

;; preserve line breaks in export
;;
(setq org-export-preserve-breaks t)

; (setq org-latex-packages-alist '(("margin=2.5cm" "geometry" nil "minted")))

;; http://pages.sachachua.com/.emacs.d/Sacha.html
(setq org-export-backends '(org latex icalendar html ascii))



(eval-after-load "ox-latex"

  ;; beamer - update the list of LaTeX classes and associated header (encoding, etc.)
  ;; and structure
  ;;
  '(add-to-list 'org-latex-classes
                `("beamer"
                  ,(concat "\\documentclass[presentation]{beamer}\n"
                           "[DEFAULT-PACKAGES]"
                           "[PACKAGES]"
                           "[EXTRA]\n")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))


(add-to-list 'org-src-lang-modes '("latex-macros" . latex))
(defvar org-babel-default-header-args:latex-macros
  '((:results . "raw")
    (:exports . "results")))

(defun org-babel-execute:latex-macros (body _params)
  (concat
   (ek/prefix-all-lines "#+LATEX_HEADER: " body)
   "\n#+HTML_HEAD_EXTRA: <div style=\"display: none\"> \\(\n"
   (ek/prefix-all-lines "#+HTML_HEAD_EXTRA: " body)
   "\n#+HTML_HEAD_EXTRA: \\)</div>\n"))

;; https://emacs.stackexchange.com/questions/20839/exporting-code-blocks-to-pdf-via-latex
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted) 
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

 (setq org-latex-minted-options
       '(("linenos=false")
	 ("fontsize" "\\scriptsize")))

(use-package htmlize
  :ensure t
  :init
  ;; there seems to be some bug in htmlize on OSX such that the
  ;; background is not rendered correctly when exporting
  ;; FIXME: why does this not work with `twbs'?
  (when (eq system-type 'darwin)
    (defun ek/org-inline-css-hook (exporter)
      "Insert inline css to set code background to the default ackground."
      (when (eq exporter 'html)
	(setq org-html-head-extra
	      (concat
	       org-html-head-extra
	       (format (concat "<style type=\"text/css\">"
			       "pre.src {background-color: %s; color: %s;}"
			       "</style>\n")
		       (face-background 'default)
		       (face-foreground 'default))))))
    (add-hook 'org-export-before-processing-hook 'ek/org-inline-css-hook)))

(use-package ox-twbs
  :ensure t
  :config
  (progn
    (setq org-twbs-with-latex 'mathjax)))
	  ; org-twbs-toplevel-hlevel 3)))

(provide 'ek/org-export)
;;; ek/org-export ends here
