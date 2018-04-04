;; http://www.codeadventurer.com/2014/12/21/sicp-and-emacs-for-the-vim-user
;; to use: get mit-scheme from package manager (on osx, use brew):
;; $ brew update && brew install mit-scheme
;; after this, M-x `run-scheme'
;;
(use-package sicp
  :ensure t)

(defun ek-scheme-time ()
  (interactive)
  (progn
    (info "(SICP) Top")
    (run-scheme)))

