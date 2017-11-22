;; get the snippet-dirs ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(require 'cl)
(setq ek-snippet-dirs '("~/.emacs.d/submodules/snippets"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; much taken from
;; https://github.com/AndreaCrotti/Emacs-configuration/blob/master/modules/ca-yas.el
;;

(use-package yasnippet
  :diminish yas-minor-mode
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'after-save-hook
              (lambda ()
                (when (eql major-mode 'snippet-mode)
                  (yas-reload-all))))
    (setq
     yas-snippet-dirs ek-snippet-dirs
     yas-prompt-functions '(yas/ido-prompt)
     yas-indent-line 'auto)

    ;; don't run yasnippet in terminals
    ;;
    (add-hook 'term-mode-hook (lambda()
                                (yas-minor-mode -1)))

    (yas-global-mode 1)

    (message "loading all the snippets")
    (mapc 'yas-load-directory yas-snippet-dirs))

  :mode ("\\.yasnippet" . snippet-mode))

;; EVERYTHING BELOW THIS IS TAKEN FROM ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; https://github.com/AndreaCrotti/Emacs-configuration/blob/master/modules/ca-yas.el



;; TODO: how do we check if we can check for the existing snippets?
;; TODO: make it smarter, it would be good to accept also a function,
;; in this way it can be made more generic
;;
(defcustom ek-auto-header-conses
      '(
        ("setup.py" . "setup")
        ("\.sh$" . "bash")
        ("\.h$"  . "once")
        ("\.hpp$" . "once"))
      "snippets to expand per file extension"
      :group 'ca
      :type 'list)



;; simple function to create a .yas-parents
;;
(defun ek-make-yas-parents-file (path)
  (interactive "DPath: ")
  (find-file (concat path ".yas-parents"))
  (insert "text-mode"))

(defun ek-find-matching-snippet (filename)
  (assoc-if
   (lambda (x) (string-match x filename))
   ek-auto-header-conses))

(defun ek-insert-at-startup (snippet)
  "try to expand a snippet at startup"
  (if
      (yes-or-no-p (format "expand snippet %s?" snippet))
      (progn
        (insert snippet)
        ;; add checking
        (yas-expand))))
