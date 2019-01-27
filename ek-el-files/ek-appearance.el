(load "~/.emacs.d/ek-el-files/appearance/ek-mode-line.el")
(load "~/.emacs.d/ek-el-files/appearance/ek-window-behavior.el")
(load "~/.emacs.d/ek-el-files/appearance/ek-font-lock.el")
(load "~/.emacs.d/ek-el-files/appearance/ek-comment-tags.el")
(load "~/.emacs.d/ek-el-files/appearance/ek-hideshow.el")
(load "~/.emacs.d/ek-el-files/appearance/ek-icons.el")
(load "~/.emacs.d/ek-el-files/appearance/ek-font-general.el")
(load "~/.emacs.d/ek-el-files/appearance/miscellany.el")


(defadvice load-theme (before clear-previous-themes activate)
  "Clear existing theme settings instead of layering them"
  (mapc #'disable-theme custom-enabled-themes))

; (load "~/.emacs.d/ek-el-files/appearance/theme/leuven.el")
(load "~/.emacs.d/ek-el-files/appearance/theme/jazz.el")
; (load "~/.emacs.d/ek-el-files/appearance/ek-theme-custom.el")
; (load "~/.emacs.d/ek-el-files/appearance/theme/rebecca.el")
; (load "~/.emacs.d/ek-el-files/appearance/theme/material.el")
; (load "~/.emacs.d/ek-el-files/appearance/theme/ek-material.el")
