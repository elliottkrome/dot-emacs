
;; for some unknown reason, iedit seems to depend on rainbow-delimiters.
;; also, I couldn't get rainbow-delimiters to play nicely with use-package.
;;
;; -- to deal with these problems, this file ensures that rainbow-delimiters
;;    is installed, and then uses use-package with iedit.

(unless (package-installed-p 'rainbow-delimiters)
    (package-refresh-contents)
    (package-install 'rainbow-delimiters))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(use-package iedit
  :ensure t
  :bind (("C-c ;" . iedit-mode)))
