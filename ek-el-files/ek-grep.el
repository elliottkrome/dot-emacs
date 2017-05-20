(require 'grep)

(eval-after-load "grep"
  '(progn
    (add-to-list 'grep-find-ignored-files "*.pdf")
    (add-to-list 'grep-find-ignored-directories "elpa/archives")
    (add-to-list 'grep-find-ignored-directories "elpa/pkg-info*")))


;; editable grep buffer (!)
(use-package wgrep
  :commands (wgrep-change-to-wgrep-mode)
  :ensure t)
