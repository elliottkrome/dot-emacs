
(eval-after-load "company"
  '(add-to-list 'company-backends '(company-anaconda :with company-capf)))
(defun run-python-once ()
  (remove-hook 'python-mode-hook 'run-python-once)
  (run-python (python-shell-parse-command)))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode-start)

(use-package company-anaconda
  :ensure t
  :init (add-to-list 'company-backends 'company-anaconda))

; allows pdb to work
;
(setenv "PYTHONPATH" "/Users/elliottkrome/anaconda/lib/python2.7/site-packages:")

; this gets PATH-vars (such as python path) from a shell.
; if it is not defined and called, python-path is usr/bin, rather than Users...
; http://stackoverflow.com/questions/8606954/path-and-exec-path-set-but-emacs-does-not-find-executable
; more tweakable method is exec-path-from-shell package,
; ----see https://github.com/purcell/exec-path-from-shell
(defun set-exec-path-from-shell-PATH ()
"Set up Emacs' `exec-path' and PATH environment variable\
to match that used by the user's shell.
This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
    (interactive)
    (let ((path-from-shell
	   (replace-regexp-in-string "[ \t\n]*$" ""
	   (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
      (setenv "PATH" path-from-shell)
      (setq exec-path (split-string path-from-shell path-separator))))
(set-exec-path-from-shell-PATH)


(defun ek-show-python-tags ()
  (interactive)
  (occur "^\\s-*\\\(def \\\|class \\\|def \\\if \\\)"))
