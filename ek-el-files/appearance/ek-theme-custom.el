


(set-face-background 'isearch "coral4")

(set-face-attribute 'font-lock-comment-face nil :slant 'normal)

(set-face-attribute 'org-level-1 nil :height 1)
(set-face-attribute 'org-level-2 nil :height 1)
(set-face-attribute 'org-level-3 nil :height 1)
(set-face-attribute 'org-level-4 nil :height 1)
(set-face-attribute 'org-level-5 nil :height 1)
 
(defun font-exists-p (font)
  "Check if font exists."
  (if (null (x-list-fonts font)) nil t))

(defvar ek-default-font "Source Code Pro")
(if (font-exists-p ek-default-font)
     (set-face-attribute 'default nil :font ek-default-font))




