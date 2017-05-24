(use-package eziam-theme
  :ensure t
  :defer t
  :init
  (load-theme 'eziam-dark t))

; (load-theme 'leuven t)   

(set-face-background 'isearch "coral4")
(set-face-attribute 'font-lock-comment-face nil :slant 'normal)

(set-face-attribute 'org-level-1 nil :height 1.3)
(set-face-attribute 'org-level-2 nil :height 1.15)
 
(defun font-exists-p (font)
  "Check if font exists."
  (if (null (x-list-fonts font)) nil t))

(defvar ek-default-font "Source Code Pro")
(if (font-exists-p ek-default-font)
     (set-face-attribute 'default nil :font ek-default-font))





